<?php

namespace app\index\controller;

use app\common\entity\Config;
use think\App;
use think\Request;
use think\Db;

class Index extends Base
{

    public function index()
    {
//        echo App::VERSION;
        $jianjie = Db::table('jianjie')->order('sort')->select();
        $inter = Db::table('inter')->select();
        $give = Db::table('give')->field('id,title')->select();
        return $this->fetch('index', [
            'jianjie' => $jianjie,
            'inter' => $inter,
            'give' => $give,
            'bs' => '首页'
        ]);
    }

    public function give_details()
    {
        $id = input('get.id');
        if (empty($id)) {
            $this->redirect('index');
        }
        $data = Db::table('give')->where('id = :id', ['id' => [$id, \PDO::PARAM_INT]])->find();
        $data['qq'] = explode('@', $data['qq']);
        $this->assign('data', $data);
        $this->assign('title', '【招聘公告】' . $data['title']);
        return $this->fetch('give_details', ['bs' => '首页']);
    }

    //证书展示
    public function certificate()
    {
        $list = Db::table('certificate')->paginate(5);
        return $this->fetch('certificate', [
            'bs' => '证书展示',
            'list' => $list
        ]);
    }


}
