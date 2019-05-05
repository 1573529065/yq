<?php

namespace app\common\command;

use think\console\Command;
use think\console\Input;
use think\console\Output;
use app\common\entity\UserProduct;
use app\common\entity\Config;
use think\cache\driver\Redis;
use app\common\entity\UserMagicLog;
use app\common\entity\User;
/**
 * Description of UpdateEveryDay
 *
 * @author Administrator
 */
class Reward extends Command{
    
   protected function configure()
    {
        $this->setName('reward')
            ->setDescription('计算奖励');
    }

    protected function execute(Input $input, Output $output)
    {
        set_time_limit(7200);
        $up = new UserProduct();
        $user_ids = $up->alias('up')->join('user u','u.id = up.user_id')
                        ->field('up.user_id,u.level,u.sum_lucre,u.everyday,u.sum_lucre_conf,u.everyday_conf,u.kg,u.kg_conf,sum(up.yestoday) as sum')
                        ->group('up.user_id')
                        ->select()
                        ->toArray();
        //没有矿机 就不执行
        if(!$user_ids){
            die('stop');
        }
        
        //分割成1000
        $users = array_chunk($user_ids, 1000);
        $time = strtotime(date('Y-m-d',time()));
        $conf_ob = Config::getValue('output_bl');
        //代数奖励比例
        $conf_dsbl  = explode('@',(Config::getValue('ds_bl')));
        foreach ($users as $k => $v) {
            foreach ($v as $k1 => $v1) {
                $conf_lc = Config::getValue('level_config_'.$v1['level']);
                if($conf_lc == 0){
                    continue;
                }
                $sum = $this->get_lower_sum($v1['user_id'],$conf_lc,$conf_dsbl,$time,$v1['sum']);
                
                if($sum <= 0){
                    continue;
                }
                if(($v1['sum_lucre'] >= $v1['sum_lucre_conf']) || ($v1['everyday'] >= $v1['everyday_conf']) || ($v1['kg'] >= $v1['kg_conf'])){
                    continue;
                }
                //总封顶
                $sum_total = bcadd($v1['sum_lucre'],$sum,8);
                if(($v1['kg_conf']-$v1['kg']) < ($v1['everyday_conf']-$v1['everyday'])){
                    $field_conf = 'kg_conf';
                    $field = 'kg';
                }else{
                    $field_conf = 'everyday_conf';
                    $field = 'everyday';
                }
                //日封顶
                $sum_day = bcadd($v1[$field],$sum,8);
                    //总封顶 大于等于 日封顶
                if(($v1['sum_lucre_conf'] - $sum_total) >= ($v1[$field_conf] - $sum_day)){
                    //如果日封顶总和大于配置
                    if($sum_day > $v1[$field_conf]){
                        //产币量就等于 配置的日封顶 减去 用户现有的日封顶
                        $diff = bcsub($v1[$field_conf],$v1[$field],8);
                    }
                }else{
                    //如果总封顶和 大于 总封顶配置
                    if($sum_total > $v1['sum_lucre_conf']){
                        //产币量就等于 配置的总封顶 减去 用户的总封顶
                        $diff = bcsub($v1['sum_lucre_conf'],$v1['sum_lucre'],8);
                    }
                }
//                if( ($user['sum_lucre_conf'] - $sum_total) >= $sum){
//                    //配置每日封顶 减去 用户每日封顶 大于奖励
//                    if(($user['everyday_conf'] - $sum_day) >= $sum){
//                        $user['sum_lucre'] = $sum_total;
//                        $user['everyday'] = $sum_day;
//                    }else{
//                        $diff = bcsub($user['everyday_conf'],$v1['everyday'],8);
//                        $user['sum_lucre'] = bcadd($v1['sum_lucre'], $diff,8);
//                        $user['everyday'] = $user['everyday_conf'];
//                    }
//                }else{
//                        //总封顶 大于等于 日封顶
//                        if(($user['sum_lucre_conf'] - $sum_total) >= ($user['everyday_conf'] - $sum_day)){
//                            $diff = bcsub($user['everyday_conf'],$v1['everyday'],8);
//                            $user['sum_lucre'] = bcadd($v1['sum_lucre'],$diff,8);
//                            $user['everyday'] = $user['everyday_conf'];
//                        }else{
//                           //日封顶 大于等于 总封顶
//                            $diff = bcsub($user['sum_lucre_conf'],$v1['sum_lucre'],8);
//                            $user['sum_lucre'] = $user['sum_lucre_conf'];
//                            $user['everyday'] = bcadd($v1['everyday'],$diff,8);
//                        }
//                }
                if(empty($diff)){
                $ziyou = bcmul($sum,$conf_ob,8);
                $shop = bcsub($sum,$ziyou,8);
                }else{
                    $sum = $diff;
                    $ziyou = bcmul($diff,$conf_ob,8);
                    $shop = bcsub($diff,$ziyou,8);
                }
                $user['sum_lucre'] = bcadd($v1['sum_lucre'],$sum,8);
                $user['everyday'] = bcadd($v1['everyday'],$sum,8);
                $user['kg'] = bcadd($v1['kg'],$sum,8);
                User::where('id',$v1['user_id'])
                        ->inc('magic',$ziyou)
                        ->inc('shop_magic',$shop)
                        ->update($user);
                UserMagicLog::insert([
                    'user_id'=>$v1['user_id'],
                    'magic'=>$sum,
                    'old'=>0,
                    'new'=>0,
                    'remark'=>"推荐矿机奖励",
                    'types'=>UserMagicLog::TYPE_KG_FH,
                    'create_time'=>time(),
                ]);
            }
        }
        
        
    }
    
    /**
     * 
     * @param type $user 下级用户ID
     * @param type $num  循环几代
     * @param type $con  每代 奖励 比例
     * @param type $time 今天0点时间
     * @param type $sum  总和
     * @param type $dai 代数(向上)
     * @return type
     */
    protected function get_lower_sum($user,$num,$con,$time,$u_sum,$sum = 0,$dai = 0){
        if($num <= 0) return $sum;
        $redis = new Redis();
        $userId = explode(',',$user);
        $users = '';
        foreach ($userId as $k => $v) {
         if($redis->hexists('PID',$v)) $users .= $redis->hget('PID',$v).',';
        }
        $users = trim($users,',');
        $total = 0;
        if($users){
            $log = UserMagicLog::where('user_id','in',$users)
                    ->where('types', UserMagicLog::TYPE_INCOME)
                    ->where('create_time','>',$time)
                    ->field('sum(magic) as sum_m')
                    ->group('user_id')
                    ->select();
            foreach ($log as $key => $value) {
                if($u_sum < $value['sum_m']){
                     $total += $u_sum;
                }else{
                    $total += $value['sum_m'];
                }
               
            }
        }
        $sum = $sum + bcmul($total,$con[$dai],8);
        $num = $num -1;
        if($num == 0){
            return $sum; 
        }
        $dai++;
       return $this->get_lower_sum($users,$num,$con,$time,$u_sum,$sum,$dai);
    }
}
