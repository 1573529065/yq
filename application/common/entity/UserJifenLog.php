<?php
namespace app\common\entity;

use think\Db;
use think\Model;

class UserJifenLog extends Model
{
    protected $table = 'user_jifen_log';

    public $autoWriteTimestamp = false;

    
    const TYPE_SYSTEM = 1; //积分兑换
    const TYPE_PRODUCT = 2; //转出奖励
    const TYPE_ORDER = 3; //转入奖励
    const TYPE_REWARD = 4; //积分释放
    const TYPE_SHOP = 5; //购买商品
    const TYPE_CHANGE = 6; //积分兑换
    const TYPE_LEVEL = 7; //升级奖励
    public function getType($type)
    {
        switch ($type) {
            case self::TYPE_SYSTEM:
                return '积分兑换';
            case self::TYPE_PRODUCT:
                return '转出奖励';
            case self::TYPE_ORDER:
                return '转入奖励';
            case self::TYPE_REWARD:
                return '积分释放';
            case self::TYPE_SHOP;
                return '购买商品';
            case self::TYPE_CHANGE;
                return '兑换积分';
        }
    }
        //返回原有数据  不自动进行时间转换
    public function getCreateTimeAttr($time) {
        return $time;
    }




}