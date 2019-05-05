<?php

namespace app\admin\controller;

use app\admin\exception\AdminException;
use app\common\entity\Orders;
use app\common\entity\User;
use app\index\model\Market;
use think\Request;
use \app\common\entity\YueOrders;
use think\Db;
class Order extends Admin {

    /**
     * @power 交易市场|求购订单
     * @rank 4
     */
    public function index(Request $request) {
        $list = $this->search($request, Orders::TYPE_BUY);
        return $this->render('list', [
                    'list' => $list,
                    'type' => Orders::TYPE_BUY
        ]);
    }

    /**
     * @power 交易市场|出售订单
     */
    public function show(Request $request) {
        $list = $this->search($request, Orders::TYPE_SALE);
        return $this->render('list', [
                    'list' => $list,
                    'type' => Orders::TYPE_SALE
        ]);
    }

    /**
     * @power 交易市场|出售订单@订单详细
     * @method GET
     */
    public function detail(Request $request) {
        $id = $request->get('id');
        $order = Orders::where('id', $id)->find();
        if (!$order) {
            $this->error('对象不存在');
        }
        $userInfo = User::where('id', $order->user_id)->find();
        if ($order->status > 1) {
            $targetUser = User::where('id', $order->target_user_id)->find();
        }
        return $this->render('detail', [
                    'order' => $order,
                    'userInfo' => $userInfo,
                    'targetUser' => isset($targetUser) ? $targetUser : ''
        ]);
    }

    /**
     * @power 交易市场|出售订单@取消订单
     */
    public function delete(Request $request) {
        if ($request->isPost()) {
            $id = $request->request('id');
            $order = Orders::where('id', $id)->find();
            if (!$order) {
                throw new AdminException('订单不存在');
            }
            if ($order->status > Orders::STATUS_CONFIRM) {
                throw new AdminException('订单已完成了， 不能取消');
            }

            $result = false;
            if ($order->status == 1) {
                $service = new Market();
                if ($order->types == Orders::TYPE_BUY) {
                    $result = $service->cancelBuy($order);
                } elseif ($order->types == Orders::TYPE_SALE) {
                    $result = $service->cancelSale($order);
                }
//                if ($order->status == 2) 
            } else {
                $result = $order->cancel();
            }

            if (!$result) {
                throw new AdminException('取消失败');
            }

            return json(['code' => 0, 'message' => '取消成功']);
        }
    }

    /**
     * @power 交易市场|出售订单@确认收款
     */
    public function update(Request $request) {
        if ($request->isPost()) {
            $id = $request->request('id');
            $order = Orders::where('id', $id)->find();
            if (!$order) {
                throw new AdminException('订单不存在');
            }
            if ($order->status != Orders::STATUS_CONFIRM) {
                throw new AdminException('订单还没付款，不能操作');
            }

            $result = $order->confirm();
            if (!$result) {
                throw new AdminException('操作失败');
            }

            return json(['code' => 0, 'message' => '取消成功']);
        }
    }

    protected function search($request, $type) {
        $query = Orders::alias('o')->field('o.*,u.nick_name,u.mobile')
                ->where('o.types', $type);
        if ($status = $request->get('status')) {
            $query->where('o.status', $status);
            $map['status'] = $status;
        }
        if ($keyword = $request->get('keyword')) {
            $type = $request->get('type');
            switch ($type) {
                case 'mobile':
                    $query->where('u.mobile', $keyword);
                    break;
                case 'number':
                    $query->where('o.order_number', $keyword);
                    break;
            }
            $map['type'] = $type;
            $map['keyword'] = $keyword;
        }

        $userTable = (new User())->getTable();
        $list = $query->leftJoin("$userTable u", 'u.id = o.user_id')
                ->order('create_time', 'desc')
                ->paginate(15, false, [
            'query' => isset($map) ? $map : []
        ]);
        return $list;
    }

    /**
     * 余额出售列表
     */
    public function yue_sell_list() {
        $type = 2;
        $get = input('get.');
        $entity = YueOrders::field('o.*,u.nick_name,u.mobile')->alias('o');
        //默认条件
        $entity->where(['is_del' => 0, 'types' => $type]);
        $list = $entity->leftjoin('user u', 'u.id = o.user_id')
                ->order('o.id desc')
                ->paginate(10, false, [
            'query' => isset($get) ? $get : ''
        ]);
        $yue_orders_status = config('yue_orders_status');
        return $this->render('yue_list', ['type' => $type, 'list' => $list, 'yue_orders_status' => $yue_orders_status]);
    }

    /**
     * 余额购买列表
     */
    public function yue_buy_list() {
        $type = 1;
        $get = input('get.');
        $entity = YueOrders::field('o.*,u.nick_name,u.mobile')->alias('o');
        //默认条件
        $entity->where(['is_del' => 0, 'types' => $type]);
        $list = $entity->leftjoin('user u', 'u.id = o.user_id')
                ->order('o.id desc')
                ->paginate(10, false, [
            'query' => isset($get) ? $get : ''
        ]);
        $yue_orders_status = config('yue_orders_status');
        return $this->render('yue_list', ['type' => $type, 'list' => $list, 'yue_orders_status' => $yue_orders_status]);
    }

    /**
     * 余额订单详情
     */
    public function yue_detail() {
        $id = input('get.id');
        $order = YueOrders::where('id=:id and is_del=0', ['id' => [$id, \PDO::PARAM_INT]])->find();
        if (empty($order))
            return $this->redirect('yue_sell_list');
        $yue_orders_status = config('yue_orders_status');
        $userInfo = User::where('id', "{$order['user_id']}")->find();
        $targetUser = User::where('id', "{$order['target_user_id']}")->find();
        ;
        return $this->render('yue_detail', ['order' => $order, 'yue_orders_status' => $yue_orders_status, 'userInfo' => $userInfo, 'targetUser' => $targetUser]);
    }

    /**
     * 余额订单删除
     */
    public function yue_delete() {
        $id = input('get.id');
        if (!$id)
            return $this->redirect('yue_sell_list');
        $order = YueOrders::where('id = :id and is_del = 0', ['id' => [$id, \PDO::PARAM_INT]])->find();
        if (!$order)
            return json(['code' => 401, 'msg' => '订单不存在']);
        if (in_array($order['status'], [1, 4])) {
            $result = YueOrders::where('id', $order->id)->update(['is_del' => 1]);
        } else {
            switch ($order['types']) {
                case 1:
                    //买入
                    $user_id = $order['target_user_id'];

                    break;
                case 2:
                    //卖出
                    $user_id = $order['user_id'];
                    break;
            }
            //更新订单状态 并退回保证金 手续费
            Db::startTrans();
            try {
                $result = true;
                YueOrders::where('id', $order->id)->update(['is_del' => 1]);
                User::where('id', $user_id)->inc('yue', ($order['bond'] + $order['charge_number'] + $order['number']))->update();
                Db::commit();
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                $result = false;
            }
        }
        if ($result)
            return json(['code' => 200, 'msg' => '删除成功']);
        return json(['code' => 400, 'msg' => '删除失败']);
    }

    /**
     * 余额确认收款
     */
    public function collect() {
        $id = input('get.id');
        if (!$id)
            return $this->redirect('yue_sell_list');
        $order = YueOrders::where('id = :id and is_del = 0', ['id' => [$id, \PDO::PARAM_INT]])->find();
        if (!$order)
            return json(['code' => 500, 'msg' => '订单不存在']);
        if ($order['status'] != YueOrders::STATUS_CONFIRM)
            return json(['code' => 501, 'msg' => '订单状态发生变化！']);
        switch ($order['types']) {
            case 1:
                //买入
                $user_id = $order['target_user_id'];
                $user_id1 = $order['user_id'];
                break;
            case 2:
                //卖出
                $user_id = $order['user_id'];
                $user_id1 = $order['target_user_id'];
                break;
        }
        //更新订单状态 并退回保证金 手续费
        Db::startTrans();
        try {
            $result = true;
            YueOrders::where('id', $order->id)->update(['status' => 4, 'finish_time' => time()]);
            User::where('id', $user_id)->inc('yue', $order['bond'])->update();
            User::where('id', $user_id1)->inc('yue', $order['number'])->update();
            Db::commit();
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();
            $result = false;
        }
        if ($result)
            return json(['code' => 200, 'msg' => '确认成功']);
        return json(['code' => 400, 'msg' => '确认失败']);
    }

}
