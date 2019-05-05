<?php

namespace app\common\entity;

use think\Db;
use think\Model;

class Recharge extends Model {

    public $autoWriteTimestamp = true;

    const STATUS_ONE = 1; //审核中
    const STATUS_TWO = 2; //通过
    const STATUS_THREE = 3; //驳回
    
    const DEL_ONE = 1; //未删除
    const DEL_TWO = 0; //删除
    
    const TYPE_ONE = 1; //快捷
    const TYPE_TWO = 2; //支付宝
    
    
    static public function get_all(){
        return self::where('is_del', self::DEL_ONE);
    }
    
    public function getStatus($status){
        switch ($status) {
            case self::STATUS_ONE:
                return '审核中';
            case self::STATUS_TWO:
                return '通过';
            case self::STATUS_THREE:
                return '驳回';
            default:
                return '未知';
        }
    }



}
