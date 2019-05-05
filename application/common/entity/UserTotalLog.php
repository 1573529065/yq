<?php
namespace app\common\entity;

use think\Db;
use think\Model;

class UserTotalLog extends Model
{
    protected $table = 'user_total_log';

    public $autoWriteTimestamp = false;
    
    const TYPE_SYSTEM = 1; //下级购买矿机
    const TYPE_UP = 2; //下级升级矿机
    public function getType($type)
    {
        switch ($type) {
            case self::TYPE_SYSTEM:
                return '下级购买矿机';
            case self::TYPE_UP:
                return '下级升级矿机';
        }
    }

}