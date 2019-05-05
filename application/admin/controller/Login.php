<?php
namespace app\admin\controller;

use think\Controller;
use think\Request;

class Login extends Controller
{
    public function index()
    {
        if($_SERVER['SERVER_PORT'] != '80') {
            die;
        }
//         $urls = explode('/',$_SERVER["REQUEST_URI"]);
//         if(empty($urls[4])){
//              $this->error('error', url('index/index/index'),'',1);
//         }
//        if($urls[4] != '6f0c41ca003b9a3f'){
//            $this->error('error', url('index/index/index'),'',1);
//        }
        return $this->fetch('index');
    }

    /**
     * 登录处理
     */
    public function login(Request $request)
    {
        $service = new \app\admin\service\rbac\Users\Service();
        $result = $this->validate($request->post(), 'app\admin\validate\LoginForm');

        if (true !== $result) {
            return json()->data(['code' => 1, 'message' => $result]);
        }

        if ($service->doLogin($request->post('username'), $request->post('password'))) {
            $power = new \app\admin\service\rbac\Power\Service();
            $power->delCache();
            return json()->data(['toUrl' => url('index/index')]);
        }
    }
}