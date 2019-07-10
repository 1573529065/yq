<?php
/**
 * Created by PhpStorm.
 * User: zhw
 * Date: 2019/7/7
 * Time: 下午7:04
 */

namespace app\admin\controller;


use think\Db;
use think\Error;

class Train extends Admin
{

    /**
     * 培训课程管理
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $list = Db::table('train')->where("status!=:status")->bind(['status'=>[-1,\PDO::PARAM_INT]])->paginate(10);

        return $this->render('index', ['list' => $list]);
    }

    /**
     * 添加培训课程
     */
    public function add()
    {
        if ($this->request->isPost()){
            $title = input('post.title');
            $content = input('post.content');
            $status = input('post.status');

            $file = request()->file('img');
            // 移动到框架应用根目录/uploads/ 目录下
            $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads/train');
            if (!$info){
                $this->error($file->getError(), '', '', 1);
            }

            $img = '/uploads/train/' . $info->getSaveName();
            $data = [
                'title' => $title,
                'content' => $content,
                'img' => $img,
                'status' => $status,
                'created_at' => date('Y-m-d H:i:s')
            ];

            $res = Db::table('train')->insert($data);
            if ($res) {
                $this->success('添加成功', 'index', '', 1);
            }
            $this->error('添加失败', '', '', 1);
        }

        return $this->render('add');
    }

    /**
     * 编辑课程
     */
    public function edit()
    {
        if ($this->request->isPost()){

        }

        $id = intval($this->request->get('id'));
        if (empty($id)){
            $this->error('缺少参数');
        }
        $info = Db::table('train')->where("id=:id", ['id' => [$id, \PDO::PARAM_INT]])->find();


        return $this->render('edit', ['info' => $info]);
    }

    /**
     * 删除课程
     */
    public function delete()
    {
        
    }

}