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