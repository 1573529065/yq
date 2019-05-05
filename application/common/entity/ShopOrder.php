<?php

namespace app\common\entity;

use app\common\service\Users\Cache;
use think\Db;
use think\Model;

class ShopOrder extends Model {

    protected $table = 'shop_order';
    public $autoWriteTimestamp = false;

    const STATUS_ONE = 1; //未发货
    const STATUS_TWO = 2; //已发货
    const STATUS_THREE = 3; //已收货
    
    const payment_xuni = 1; //RCRC
    const payment_yue = 2; //余额
    const payment_shop = 3; //商城RCRC
    

    
    //发货状态
    public function getStatus($type) {
        switch ($type) {
            case self::STATUS_ONE:
                return '未发货';
            case self::STATUS_TWO:
                return '已发货';
            case self::STATUS_THREE:
                return '已收货';
        }
    }
    

    
    //支付类型
    public function getPayment($type){
         switch ($type) {
            case self::payment_xuni:
                return 'RCRC';
            case self::payment_yue:
                return '余额';
            case self::payment_xuni:
                return '商城RCRC';
        }
    }
}
