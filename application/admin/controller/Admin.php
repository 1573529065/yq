<?php

namespace app\admin\controller;

use app\admin\exception\AdminException;
use app\admin\service\rbac\Users\Service;
use think\Controller;
use think\facade\Request;

class Admin extends Controller
{

    protected function initialize()
    {
        if (php_sapi_name() != 'cli') {
            //判断用户是否登录
            $service = new Service();
            if (!$service->getManageId()) {
                $this->redirect('login/index');
            }

            //判断权限
            if (!$service->checkAuth()) {
                if (Request::isAjax()) {
                    throw new AdminException('没有权限操作，请联系管理员');
                } else {
                    $this->error('没有权限操作，请联系管理员');
                }
            }
        }

    }

    public function render($template, $data = [])
    {
        $service = new Service();
        $data['manage'] = $service->getManageInfo();
        $data['menus'] = $this->baseParams();
        return $this->fetch($template, $data);
    }

    private function baseParams()
    {
        $service = new \app\admin\service\rbac\Power\Service();
        $menus = $service->getMenus();
        return $menus;
    }

}