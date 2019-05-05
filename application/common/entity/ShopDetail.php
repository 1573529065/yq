<?php
namespace app\common\entity;

use app\common\service\Users\Cache;
use think\Db;
use think\Model;

class ShopDetail extends Model
{
    const SOURCE_ONE = 0; //后台
    const SOURCE_TWO = 1; //用户
    //来源
    public function getSource($source){
        switch ($source) {
            case self::SOURCE_ONE:
                return '后台';
            case self::SOURCE_TWO:
                return '用户';
        }
    }
}