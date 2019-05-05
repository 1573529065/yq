<?php
namespace app\common\entity;

use think\Db;
use think\Model;

class UserYueLog extends Model
{
    protected $table = 'user_yue_log';

    public $autoWriteTimestamp = false;
    
    const TYPE_SYSTEM = 1; //余额充值
    const TYPE_OUT = 2; //余额转出
    const TYPE_ORDER = 3; //签到余额
    const TYPE_REWARD = 4; //直推奖励
    const TYPE_SHOP = 5; //购买商品
    const TYPE_GET = 6; //余额转入
    const TYPE_CHANHE = 7; //兑换积分
    const TYPE_EIGHT = 8; //余额卖出
    const TYPE_NINE = 9; //余额买入
    const TYPE_KG = 10; //购买酒产品
    const TYPE_KG_UP = 11; //矿机升级
    public function getType($type)
    {
        switch ($type) {
            case self::TYPE_SYSTEM:
                return '充值';
            case self::TYPE_OUT:
                return '余额转出';
            case self::TYPE_ORDER:
                return '签到余额';
            case self::TYPE_REWARD:
                return '直推奖励';
            case self::TYPE_SHOP;
                return '购买商品';
            case self::TYPE_GET;
                return '余额转入'; 
           case self::TYPE_CHANHE;
                return '兑换积分';
           case self::TYPE_EIGHT;
                return '余额卖出'; 
           case self::TYPE_NINE;
                return '余额买入';
           case self::TYPE_KG;
             return '购买酒产品';
           case self::TYPE_KG_UP;
             return '矿机升级'; 
        }
    }
    
        //返回原有数据  不自动进行时间转换
    public function getCreateTimeAttr($time) {
        return $time;
    }




}