<?php

namespace app\common\entity;

use think\Db;
use think\Model;

class YueOrders extends Model {

    protected $table = 'yue_orders';
    public $autoWriteTimestamp = false;

    const TYPE_BUY = 1; //买入订单
    const TYPE_SALE = 2; //卖出订单
    const STATUS_DEFAULT = 1; //加入订单
    const STATUS_PAY = 2; //等待付款
    const STATUS_CONFIRM = 3; //等待确认付款
    const STATUS_FINISH = 4; //订单完成


    /**
     * 判断用户是否存在 正在交易中的订单
     */
    static public function isExist($user_id) {
        return YueOrders::field('id')->where([
                    'user_id' => $user_id,
                    'is_del' => 0
                ])->where('status <> 4')->find();
    }



}
