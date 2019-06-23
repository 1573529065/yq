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
        $list = Db::table('news')->where("status!=:status")->bind(['status'=>[-1,\PDO::PARAM_INT]])->paginate(15);

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
     */
    public function edit()
    {
        if (request()->isPost()) {
            $id = input('post.id');
            $title = input('post.title');
            $content = input('post.content');
            $show = input('post.show');
            $data = [
                'id' => $id,
                'title' => $title,
                'content' => $content,
                'show' => $show,
                'updated_at' => date('Y-m-d H:i:s')
            ];

            $res = Db::table('news')->update($data);
            if ($res) {
                $this->success('编辑成功', 'index', '', 1);
            }
            $this->error('编辑失败', '', '', 1);
        }

        $id = input('get.id');
        $res = Db::table('news')->where("id=:id", ['id' => [$id, \PDO::PARAM_INT]])->find();
        return $this->render('edit', ['res' => $res]);
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
                'status' => -1,
                'updated_at' => date('Y-m-d H:i:s')
            ]);

        if ($res) {
            return json(['code' => 0, 'message' => 'success']);
        }
        return json(['code' => 1, 'message' => '删除失败!']);
    }

}
