<?php
namespace app\admin\validate;

use think\Request;
use think\Validate;

class Shop extends Validate
{

    protected $rule = [
        'name' => 'require',
        'price' => 'require|number',
        'price_xuni' => 'require|number',
        'stock' => 'require|number',
        'yue_price'=>'require|number',
        'type' => 'require',
    ];

    protected $message = [
        'name.require' => '商品名不能为空',
        'price.require' => '价格不能为空',
        'price.number' => '价格只能为数字',
        'price_xuni.require' => '虚拟币价格不能为空',
        'price_xuni.number' => '虚拟币价格只能为数字',
        'stock.require' => '库存不能为空',
        'stock.number' => '库存只能为数字',
        'type.require' => '类型不能为空',
        'yue_price.require' =>'余额价格不能为空' ,
        'yue_price.number' => '余额价格只能是数字'
    ];


}