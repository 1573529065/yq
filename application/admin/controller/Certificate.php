<?php

namespace app\admin\controller;

use app\admin\exception\AdminException;
use think\Db;
use think\Request;

class Certificate extends Admin
{

    //证书管理
    public function certificate()
    {
        $list = Db::table('certificate')->paginate(15);

        return $this->render('certificate', ['list' => $list]);
    }

    //添加证书
    public function certificate_add(Request $request)
    {
        if (request()->isPost()) {
            $data = input('post.');
            $file = $request->file();
            if (empty($file)) $this->error('图片不能为空','','', 1);

            $file = $file['img'];
            if (!$file) {
                $this->error('添加失败', '', '', 1);
            }
            // 移动到框架应用根目录/uploads/ 目录下
            $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads');
            if (!$info){
                $this->error($file->getError(), '', '', 1);
            }
            $img = '/uploads/' . $info->getSaveName();
            $data['img'] = $img;

            $data['introduce'] = str_replace(" ", " ", str_replace("\n", "<br/>", $data['introduce']));
            $res = Db::table('certificate')->insert($data);
            if ($res) {
                $this->success('添加成功', 'certificate', '', 1);
            }
            $this->error('添加失败', '', '', 1);

        }
        return $this->render('certificate_add');
    }


    public function c_del()
    {
        $id = input('get.id');
        if (!empty($id)) {
            $res = Db::table('certificate')->where("id=:id", ['id' => [$id, \PDO::PARAM_INT]])->delete();
            if ($res) {
                return json(['code' => 0, 'message' => 'success']);
            }
            return json(['code' => 1, 'message' => '删除失败!']);
        }
        return $this->redirect('certificate');
    }

    public function c_edit()
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
}
