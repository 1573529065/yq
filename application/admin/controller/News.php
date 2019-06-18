<?php

namespace app\admin\controller;

use app\admin\exception\AdminException;
use think\Db;
use think\Request;

class News extends Admin
{

    /**
     * 新闻动态列表
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $list = Db::table('news')->paginate(15);

        return $this->render('index', ['list' => $list]);
    }

    /**
     * 新闻动态添加
     * @param Request $request
     * @return mixed
     */
    public function add(Request $request)
    {
        if (request()->isPost()) {
            $title = input('post.title');
            $content = input('post.content');
            $show = input('post.show');
            $data = [
                'title' => $title,
                'content' => $content,
                'show' => $show,
                'admin_id' => 9999,
                'created_at' => date('Y-m-d H:i:s')
            ];

            $res = Db::table('news')->insert($data);
            if ($res) {
                $this->success('添加成功', 'index', '', 1);
            }
            $this->error('添加失败', '', '', 1);

        }
        return $this->render('add');
    }

    /**
     * 新闻动态 编辑
     * @return mixed
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function edit()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $file = request()->file('img');
            if ($file) {
                // 移动到框架应用根目录/uploads/ 目录下
                $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads');
                if (!$info)
                    $this->error($file->getError(), '', '', 1);
                $img = '/uploads/' . $info->getSaveName();
                $data['img'] = $img;
            }
            $data['introduce'] = str_replace(" ", " ", str_replace("\n", "<br/>", $data['introduce']));
            $result = Db::table('certificate')->where("id=:id", ['id' => [$data['id'], \PDO::PARAM_INT]])->update($data);
            if ($result === false) {
                $this->error('修改失败', '', '', 1);
            }
            $this->success('修改成功', 'certificate', '', 1);
        }
        $id = input('get.id');
        $res = Db::table('certificate')->where("id=:id", ['id' => [$id, \PDO::PARAM_INT]])->find();
        $res['introduce'] = str_replace('<br/>', '', $res['introduce']);
        return $this->render('c_edit', ['res' => $res]);
    }

    /**
     * 新闻动态 删除
     * @return \think\response\Json|void
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function delete()
    {
        $id = input('get.id');
        if (empty($id)) {
            return json(['code' => 0, 'message' => '缺少参数']);
        }

        $res = Db::table('news')
            ->where("id=:id", ['id' => [$id, \PDO::PARAM_INT]])
            ->update([
                'status' => -1
            ]);

        if ($res) {
            return json(['code' => 0, 'message' => 'success']);
        }
        return json(['code' => 1, 'message' => '删除失败!']);
    }

}
