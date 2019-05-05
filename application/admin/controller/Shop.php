<?php

namespace app\admin\controller;

use app\admin\exception\AdminException;
use app\common\entity\ShopList;
use app\common\entity\ShopDetail;
use app\common\entity\ShopOrder;
use think\Request;

class Shop extends Admin {

    //商城列表
    public function index() {
        $pid = input('pid');
        $shopList = new ShopList();
        if(!empty($pid)){
            $entity = $shopList->where('pid = :pid',['pid'=>$pid]);
        }else{
            $entity = $shopList->where('pid = 0');
        }
        $list = $entity->select();
        return $this->render('index', compact(['list']));
    }

    //添加
    public function list_add() {
        if (!request()->isPost()){
             $list = ShopList::where('is_show','1')->field('id,name,pid')->select()->toArray();
             $list = generateTree($list);
             return $this->render('list_add',['list'=>$list]);
        }
           
        $data = input('post.');
        $data['add_time'] = date('Y-m-d');
        $result = ShopList::insert($data);
        if ($result)
            $this->success('添加成功!', 'index', '', 1);
        $this->error('添加失败!', '', '', 1);
    }

    //商城类型删除
    public function list_del() {
        $id = input('get.id');
        if (empty($id))
            return false;
        $re = ShopList::where('id=:id', ['id' => [$id, \PDO::PARAM_INT]])->delete();
        if ($re)
            return json(['code' => 0, 'message' => '删除成功！']);
        return json(['code' => 1, 'message' => '删除失败!']);
    }

    //商城类型 -- 编辑
    public function list_edit() {
        if (!request()->isPost()) {
            $id = input('get.id');
            if (empty($id))
                 die("<script>window.history.go(-1);</script>");;
            $list = ShopList::where('id=:id', ['id' => [$id, \PDO::PARAM_INT]])->find();
            if (!$list)
                 die("<script>window.history.go(-1);</script>");;
             $list_total = ShopList::where('is_show','1')->field('id,name,pid')->select()->toArray();
             $list_total = generateTree($list_total);
            return $this->render('list_edit', ['list' => $list,'list_total'=>$list_total]);
        }
        $data = input('post.');
        $re = ShopList::where('id=:id', ['id' => [$data['id'], \PDO::PARAM_INT]])
                ->update(['name' => $data['name'], 'is_show' => $data['is_show'],'pid'=>$data['pid']]);
        if ($re === false)
            return json(['code' => 400, 'msg' => '修改失败！']);
        return json(['code' => 200, 'msg' => '修改成功！', 'url' => url('shop/index')]);
    }

    //商品详情
    public function detail_list() {
        $get = input('get.');
        $entity = ShopDetail::field('d.*,l.name as lname')->alias('d');
        //判断搜索条件
        if (!empty($get['keyword'])) {
            switch ($get['type']) {
                case 'name':
                    $entity->where("d.name like :name", ['name' => '%' . $get['keyword'] . '%']);
                    break;
                default:
                    $entity->where("d.{$get['type']}=:{$get['type']}", [$get['type'] => $get['keyword']]);
                    break;
            }
        }
         if (!empty($get['level']))
                $entity->where("d.type =:type", ['type' => $get['level']]);

        //固定条件
        $entity->where('is_del', 1);
        $list = $entity->join('shop_list l', 'd.type = l.id')
                ->order('id desc')
                ->paginate(10, false, [
            'query' => isset($get) ? $get : ''
        ]);
        $page = input('page');
        $type = ShopList::field('id,name')->where('is_show=1')->select();
        return $this->render('detail_list', compact(['list', 'type','page']));
    }

    //添加商品
    public function detail_add() {
        if (request()->isPost()) {
            $shop = new ShopDetail();
            $data = request()->post();
            $res = $this->validate($data, 'app\admin\validate\Shop');
            if (true !== $res)
                $this->error($res, '', '', 1);
            // 获取表单上传文件 例如上传了001.jpg
            for($i = 0;$i<3;$i++) {
                if($i == 0){
                   $filed = 'img'; 
                }else{
                    $filed = 'img'.$i; 
                }
                $file = request()->file($filed);
                if(!$file){
                     $this->error('图片不完整', '', '', 1);
                }
                // 移动到框架应用根目录/uploads/ 目录下
                $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads/shop');
                if (!$info)
                    $this->error($v->getError(), '', '', 1);
                $data[$filed] = '/uploads/shop/' . $info->getSaveName();
            }
            $data['add_time'] = date('Y-m-d H:i:s');
            if(strlen($data['remark']) > 1000){
                $this->error('内容过长!', '', '', 1);
            }
            $result = $shop->isUpdate(false)->save($data);
            if ($result)
                $this->success('添加成功!', 'detail_list', '', 1);
            $this->error('添加失败!', '', '', 1);
        }
        $shopList = new ShopList();
        $cate = $shopList->field('id,name')->where(['is_show' => 1])->select()->toArray();
        return $this->render('detail_add', compact(['cate']));
    }

    //删除商品
    public function delete() {
        if (!request()->isPost())
            return json(['code' => 1, 'message' => 'error1']);
        $id = input('id');
        if (empty($id))
            return json(['code' => 1, 'message' => 'error2']);
        $shop = new ShopDetail();
        $result = $shop->where("id=:id", ['id' => [$id, \PDO::PARAM_INT]])->update(['is_del' => 0]);
        if ($result)
            return json(['code' => 0, 'message' => 'success']);
        return json(['code' => 1, 'message' => '删除失败!']);
    }

    //修改
    public function edit() {
        //修改提交
        if (request()->isPost()) {
            $data = request()->post();
            $result = $this->validate($data, 'app\admin\validate\Shop');
            if (true !== $result)
                $this->error($result, '', '', 1);
        for($i = 0;$i<3;$i++) {
         if($i == 0){
            $filed = 'img'; 
         }else{
             $filed = 'img'.$i; 
         }
            $file = request()->file($filed);
            if (!empty($file)) {//图片存在
                $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads/shop');
                if (!$info)
                    $this->error($file->getError(), '', '', 1);
                $data[$filed] = '/uploads/shop/' . $info->getSaveName();
            }
         }
            $shop = new ShopDetail();
            if(strlen($data['remark']) > 1000){
                $this->error('内容过长!', '', '', 1);
            }
            if ($shop->isUpdate(true)->save($data)){
                $page = input('page');
               $this->success('修改成功!', "detail_list?page={$page}", '', 1);
            }
                

            $this->error('修改失败!', '', '', 1);
        }
        $id = input('id');
        if (empty($id))
            die("<script>window.history.go(-1);</script>");
        $shop = new ShopDetail();
        $res = $shop->where("id=:id and is_del=1", ['id' => [$id, \PDO::PARAM_INT]])->find();
        if (!$res)
            die("<script>window.history.go(-1);</script>"); //不存在 返回上一页
        $page = input('page');
        $shopList = new ShopList();
        $list = $shopList->field('id,name')->where('is_show=1')->select();
        return $this->render('edit', compact(['list', 'res','page']));
    }

    //订单列表
    public function order_list() {
        $get = input('get.');
        $entity = ShopOrder::field('o.*,u.nick_name,u.mobile as u_mobile,d.is_back')->alias('o');
        
        //判断搜索条件
        if (!empty($get['keyword'])) {
            switch ($get['level']) {
                case 'nick_name':
                    $entity->where("u.nick_name like :nick_name", ['nick_name' => '%' . $get['keyword'] . '%']);
                    break;
                default:
                    $entity->where("u.mobile=:mobile", ['mobile' => $get['keyword']]);
                    break;
            }
        }
        if (!empty($get['payment_type'])) {
            $entity->where("o.payment_type =:payment_type", ['payment_type' => $get['payment_type']]);
        }
        if (!empty($get['status'])) {
            $entity->where("o.status =:status", ['status' => $get['status']]);
        }
        

        //默认条件
        $entity->where('o.is_del', '0');
        $entity->leftjoin('shop_detail d', 'd.id = o.shop_id');
        $payment_type = config('shop_order_payment_type');
        $status = config('shop_order_status');
        if(!empty($get['is_down'])){
          $list = $entity->leftjoin('user u', 'u.id = o.user_id')
                ->order('o.id desc')
                ->select();
          $time = time();
           header("Content-type: application/vnd.ms-excel; charset=utf8");
           header("Content-Disposition: attachment; filename={$time}.xls");
           return $this->render('order_list_down', compact(['list', 'payment_type', 'status', 'get']));
        }
          $list = $entity->leftjoin('user u', 'u.id = o.user_id')
                ->order('o.id desc')
                ->paginate(10, false, [
                'query' => isset($get) ? $get : ''
                ]);
        return $this->render('order_list', compact(['list', 'payment_type', 'status', 'get']));
    }

    /**
     * 删除订单
     */
    public function order_del() {
        $id = input('get.id');
        if (empty($id))
            return $this->redirect('order_list');
        $re = ShopOrder::where('id = :id', ['id' => [$id, \PDO::PARAM_INT]])->update(['is_del' => 1]);
        if ($re)
            return json(['code' => 200, 'message' => '删除成功！']);
        return json(['code' => 400, 'message' => '删除失败！']);
    }

    /**
     * 更新发货
     */
    public function send() {
        if (request()->isPost)
            return $this->redirect('order_list');
        $data = input('post.');
        if (empty($data['numbers']))
            return json(['code' => 500, 'msg' => '错误!']);
        $shopOrder = new ShopOrder();
        $data['send_time'] = date('Y-m-d H:i:s');
        $data['status'] = $shopOrder::STATUS_TWO;
        $re = $shopOrder->isUpdate(true)->save($data);
        if($re) return json(['code'=>200,'msg'=>'修改成功！']);
        return json(['code'=>501,'msg'=>'修改失败！']);
        
    }
    
    //清空详情
    public function remark_delete(){
        $id  = input('id');
        $result = ShopDetail::where('id',$id)->update(['remark'=>'']);
        if($result){
            return json(['code' => 0, 'message' => 'success']);
        }
        return json(['code' => 1, 'message' => '删除失败!']);
    }
    
   

}
