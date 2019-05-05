<?php
namespace app\common\service\Product;

use app\common\entity\Log;
use app\common\entity\Product;
use app\common\entity\User;
use app\common\entity\UserJewel;
use app\common\entity\UserMagicLog;
use app\common\entity\UserProduct;
use think\Db;
use app\common\entity\Config;

class Compute
{
    private $product = null;

    //产生收益
    public function income($userProduct)
    {
        $product = $this->getProduct()[$userProduct->product_id];
        //判断上次计算时间 如果上次计算时间为0，且计算天数为0，那么都是第一次结算
        if ($userProduct->last_time == 0 && $userProduct->balance_day == 0) {
            if((strtotime(date('Y-m-d', time()))) > $userProduct->buy_time){
            //获取购买时间 通过购买时间和当前时间差来计算收益
            $second = strtotime(date('Y-m-d', time())) - $userProduct->buy_time;
            }else{
             $second = time() - $userProduct->buy_time;
            }
            $second = abs($second);
            $yield = $this->getYieldByHour($product['min'], $product['max'], $second);
            $this->updateInfo($userProduct, $yield);
            return true;
        }

        if (strtotime(date('Y-m-d',time())) - strtotime(date('Y-m-d',$userProduct->last_time)) < 24 * 3600) {
            return false;
        }

        if ($userProduct->total_day - $userProduct->balance_day > 1) {
            //计算一天的
            $yield = $this->getYield($product['min'], $product['max']);
            $this->updateInfo($userProduct, $yield);
            return true;
        }

        if ($userProduct->total_day - $userProduct->balance_day == 1) {
            //计算最后一天的
            $second = $userProduct->end_time - strtotime(date('Y-m-d', $userProduct->end_time));
            $second = abs($second);
            $yield = $this->getYieldByHour($product['min'], $product['max'], $second);
            $this->updateInfo($userProduct, $yield);
            return true;
        }

    }

    protected function updateInfo($userProduct, $yield)
    {
        Db::startTrans();
        try {
            $userId = $userProduct->user_id;
            $user = User::where('id', $userId)->find();
            
            if($user['everyday'] >= $user['everyday_conf'] || $user['sum_lucre'] >= $user['sum_lucre_conf']){
                $yield = 0;
            }else{
                //总封顶
                $sum_total = bcadd($user['sum_lucre'], $yield,8);
                //日封顶
                $sum_day = bcadd($user['everyday'], $yield,8);
                //总封顶 大于等于 日封顶
                if(($user['sum_lucre_conf'] - $sum_total) >= ($user['everyday_conf'] - $sum_day)){
                    //如果日封顶总和大于配置
                    if($sum_day > $user['everyday_conf']){
                        //产币量就等于 配置的日封顶 减去 用户现有的日封顶
                        $yield = bcsub($user['everyday_conf'],$user['everyday'],8);
                    }
                }else{
                    //如果总封顶和 大于 总封顶配置
                    if($sum_total > $user['sum_lucre_conf']){
                        //产币量就等于 配置的总封顶 减去 用户的总封顶
                        $yield = bcsub($user['sum_lucre_conf'],$user['sum_lucre'],8);
                    }
                }
                
            }
            
            
            $day = $userProduct->balance_day + 1;
            

            //如果是最后一天收益，修改矿机状态
            if ($day >= $userProduct->total_day) {
                //获取开采率
                $rate = $this->getProduct()[$userProduct->product_id]['rate'];
                $userProduct->status = UserProduct::STATUS_STOP;
                $user->product_rate = bcsub($user->product_rate, $rate, 8);
            }

            //计算宝石
            $jewel = $this->getJewel($yield);
            if ($jewel) {
                $jewelOld = $user->jewel;
                $jewelNew = bcadd($jewel, $jewelOld, 8);
                $user->jewel = $jewelNew;

                //写日志
                $result = UserJewel::addInfo($userId, "矿机[{$userProduct->product_number}]收益{$day}天", $jewel, $jewelOld, $jewelNew);
                if (!$result) {
                    throw new \Exception('宝石计算错误');
                }
            }

            $old = $user->magic;
            $shop_old = $user->shop_magic;
            $bili = Config::getValue('output_bl');
            $yield_zy = bcmul($yield,$bili,8);
            $yield_shop = bcsub($yield,$yield_zy,8);
            //自由余额
            $new = sprintf('%.8f', bcadd($old, $yield_zy, 8));
            $shop_new = sprintf('%.8f', bcadd($shop_old, $yield_shop, 8));
            //商城余额
            $user->magic = $new;
            
            $user->shop_magic = $shop_new;
            $user->sum_lucre= ($user->sum_lucre + $yield);
            $user->everyday= ($user->everyday + $yield);
            if (!$user->save()) {
                throw new \Exception('修改会员魔石数量失败');
            }

            //填写日志
            $result = UserMagicLog::addInfo($userId, "矿机[{$userProduct->product_number}]收益{$day}天", $yield, $old, $new, UserMagicLog::TYPE_INCOME);

            if (!$result) {
                throw new \Exception('写入矿机日志失败');
            }

            //更新矿机信息
            $userProduct->balance_day = $day;
            $userProduct->last_time = time();
            $userProduct->yestoday = $yield;
            $userProduct->total = $userProduct->total + $yield;

            if (!$userProduct->save()) {
                throw new \Exception('修改矿机信息失败');
            }

            Db::commit();

        } catch (\Exception $e) {
            Db::rollback();

            Log::addLog(Log::TYPE_INCOME, $e->getMessage(), [
                'user_id' => $userProduct->user_id,
                'product_number' => $userProduct->product_number,
                'magic' => $yield
            ]);
        }
    }

    //计算宝石
    protected function getJewel($magic)
    {
        $rate = \app\common\entity\Config::getValue('rules_jewel_rate');
        if ($rate) {
            return round(bcmul($magic, $rate, 8) / 100, 8);
        }
        return 0;
    }

    //计算产量的魔石
    protected function getProduct()
    {
        if (is_null($this->product)) {
            $product = Product::all();
            $data = [];
            foreach ($product as $item) {
                $data[$item->id] = [
                    'min' => $item->yield_min,
                    'max' => $item->yield_max,
                    'rate' => $item->getRate()
                ];
            }
            $this->product = $data;
        }

        return $this->product;
    }

    protected function getYield($min, $max)
    {
        $yield = bcdiv(bcadd($min, $max, 8), 2, 3);
        //产生随机数
        $rand = $yield . mt_rand(1000, 9999);

        return sprintf('%.8f', $rand);
    }

    protected function getYieldByHour($min, $max, $second)
    {
        $rand = $this->getYield($min, $max);

        return sprintf('%.8f', bcmul(bcdiv($second, 24 * 3600, 8), $rand, 8));
    }
}