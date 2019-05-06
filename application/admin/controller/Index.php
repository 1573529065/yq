<?php

namespace app\admin\controller;

use app\admin\exception\AdminException;
use app\admin\service\rbac\Users\Service;
use app\common\entity\ManageUser;
use app\common\entity\Orders;
use app\common\entity\UserProduct;
use think\Db;
use think\facade\Session;
use think\Request;
use app\common\entity\Recharge;
use app\common\entity\UserYueLog;
use app\common\entity\RechargeList;

class Index extends Admin
{
    public function index()
    {
        $config = [
            '操作系统' => PHP_OS,
            '服务器时间' => date("Y-n-j H:i:s"),
            'PHP版本号' => PHP_VERSION,
            '运行环境' => $_SERVER["SERVER_SOFTWARE"],
            'PHP运行方式' => php_sapi_name(),
            '上传附件限制' => ini_get('upload_max_filesize'),
            '执行时间限制' => ini_get('max_execution_time') . '秒',
        ];

        return $this->render('index', ['config' => $config]);
    }

    /**
     * 系统配置-网站配置
     * @param Request $request
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function edit(Request $request)
    {
        if (request()->isPost()) {
            $data = input('post.');
            $file = $request->file();
            if (!empty($file['logo'])) { // logo
                $logo = $request->file('logo');
                $info = $logo->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads');
                !$info && $this->error($file->getError(), '', '', 1);
                $data['logo'] = '/uploads/' . $info->getSaveName();
            }

            if (!empty($file['wx'])) {//图片存在
                $file1 = $request->file('wx');
                $info1 = $file1->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads');
                !$info1 && $this->error($file->getError(), '', '', 1);

                $data['wx'] = '/uploads/' . $info->getSaveName();
            }
            \app\common\entity\Config::delCache();
            foreach ($data as $key => $v) {
                \app\common\entity\Config::where("key", $key)->update(['value' => $v]);
            }

            $this->success('修改成功', 'config/index', '', 1);
        }
    }

    //修改密码
    public function updateInfo(Request $request)
    {
        if ($request->isPost()) {
//            $validate = $this->validate($request->post(), '\app\admin\validate\ChangePassword');
//
//            if ($validate !== true) {
//                throw new AdminException($validate);
//            }

            //判断原密码是否相等
            $model = new Service();
            $user = ManageUser::where('id', $model->getManageId())->find();
            $oldPassword = $model->checkPassword($request->post('old_password'), $user);
            if (!$oldPassword) {
                throw new AdminException('原密码错误');
            }

            $user->password = $model->getPassword($request->post('password'), $user->getPasswordSalt());

            if ($user->save() === false) {
                throw new AdminException('修改失败');
            }

            return json(['code' => 0, 'message' => '修改成功', 'toUrl' => url('login/index')]);
        }
        return $this->render('change');
    }

    //获取交易数据
    protected function getOrders()
    {
        $match = Orders::where('status', Orders::STATUS_DEFAULT)->sum('number');
        $pay = Orders::where('status', Orders::STATUS_PAY)->sum('number');
        $confirm = Orders::where('status', Orders::STATUS_CONFIRM)->sum('number');
        $finish = Orders::where('status', Orders::STATUS_FINISH)->sum('number');

        return [
            'match' => $match,
            'pay' => $pay,
            'confirm' => $confirm,
            'finish' => $finish
        ];

    }

    //统计功能 会员等级处理
    protected function getLevel()
    {
        $model = new User();
        $userTable = $model->getTable();
        $sql = <<<SQL
SELECT count(*) as total,`level` FROM {$userTable} GROUP BY `level`
SQL;
        $userLevel = Db::query($sql);
        $data = [];
        foreach ($userLevel as $item) {
            $data[$item['level']] = $item['total'];
        }
        return $data;
    }

    //魔盒统计
    protected function getMagic()
    {
        $running = UserProduct::where('status', UserProduct::STATUS_RUNNING)->count();
        $stop = UserProduct::where('status', UserProduct::STATUS_STOP)->count();

        return [
            'running' => $running,
            'stop' => $stop
        ];
    }

    //退出系统
    public function logout()
    {
        $service = new Service();
        $service->logout();

        $this->redirect('admin/login');
    }

    public function clear()
    {
        //清除所有session
        Session::destroy();
    }

    public function recharge(Request $request)
    {

        $entity = Recharge::get_all()->alias('r')->field('r.*,u.mobile,u.nick_name');
        if ($level = $request->get('status')) {
            $entity->where('r.status', $level);
            $map['status'] = $level;
        }
        if ($keyword = $request->get('keyword')) {
            $entity->where("u.mobile = {$keyword} or u.id = {$keyword} or u.nick_name = {$keyword}");
            $map['keyword'] = $keyword;
        }
        $list = $entity->leftJoin("user u", 'u.id = r.user_id')
            ->order('r.id', 'desc')
            ->paginate(15, false, [
                'query' => isset($map) ? $map : []
            ]);

        return $this->render('recharge', [
            'list' => $list
        ]);
    }

    //充值-审核通过
    public function recharge_via()
    {
        $id = input('get.id');
        $num = Recharge::get_all()
            ->where("id=:id and status=:status", ['id' => [$id, \PDO::PARAM_INT], 'status' => Recharge::STATUS_ONE])
            ->field('id,user_id,num')
            ->find();
        if (!$num) {
            return json(['code' => 1, 'message' => 'error']);
        }
        $result = Recharge::where('id', $num['id'])
            ->update(['status' => Recharge::STATUS_TWO, 'update_time' => time()]);
        if (!$result) {
            return json(['code' => 1, 'message' => '更新失败']);
        }
        User::where('id', $num['user_id'])->inc('yue', $num['num'])->update();
//        if(!$user){
//            return json(['code' => 1, 'message' => '用户余额更新失败,请手动添加']);
//        }
        UserYueLog::insert([
            'user_id' => $num['user_id'],
            'yue' => $num['num'],
            'remark' => '系统充值',
            'types' => UserYueLog::TYPE_SYSTEM,
            'create_time' => date('Y-m-d'),
            'just_yue' => $num['num']
        ]);
        return json(['code' => 0, 'message' => '审核通过']);
    }

    //充值-驳回
    public function recharge_reject()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $result = Recharge::where('id=:id', ['id' => [$data['id'], \PDO::PARAM_INT]])
                ->update(['remark' => $data['remark'], 'update_time' => time(), 'status' => Recharge::STATUS_THREE]);
            if (!$result) {
                return json(['code' => 500, 'msg' => '驳回失败']);
            }
            return json(['code' => 200, 'msg' => '驳回成功']);
        }
    }

    //充值--删除
    public function recharge_del()
    {
        $id = input('id');
        $result = Recharge::where('id =:id', ['id' => [$id, \PDO::PARAM_INT]])->update(['is_del' => 0]);
        if ($result === false) {
            return json(['code' => 1, 'message' => '删除失败']);
        }
        return json(['code' => 0, 'message' => '删除成功']);
    }

    /**
     * 二维码管理
     */
    public function recharge_list()
    {

        $list = RechargeList::order('create_time desc')
            ->paginate(15);
        return $this->render('recharge_list', [
            'list' => $list
        ]);
    }


    /**
     * 添加二维码
     */
    public function recharge_add()
    {
        $rl = new RechargeList();
        if (request()->isPost()) {
            $data = input('post.');
            if (empty($data['id'])) {
                // 获取表单上传文件 例如上传了001.jpg
                $file = request()->file('zfb');
                $file2 = request()->file('wx');
                if (empty($file) || empty($file2)) {
                    $this->error('缺少图片', '', '', 1);
                }
                // 移动到框架应用根目录/uploads/ 目录下
                $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads/shop');
                // 移动到框架应用根目录/uploads/ 目录下
                $info2 = $file2->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads/shop');
                if (!$info)
                    $this->error($file->getError(), '', '', 1);
                if (!$info2)
                    $this->error($file2->getError(), '', '', 1);
                $data['zfb'] = '/uploads/shop/' . $info->getSaveName();
                $data['wx'] = '/uploads/shop/' . $info2->getSaveName();
            }
            if (empty($data['id'])) {
                $result = $rl->save($data);
            } else {
                $result = $rl->isUpdate(true)->save($data);
            }
            if ($result) {
                $this->success('成功', 'recharge_list', '', 1);
            }
            $this->error('失败', '', '', 1);

        }
        $list = [];
        $id = input('id');
        if (!empty($id)) {
            $list = $rl->where("id = :id", ['id' => [$id, \PDO::PARAM_INT]])->find();
        }
        return $this->render('recharge_add', ['list' => $list]);
    }


}