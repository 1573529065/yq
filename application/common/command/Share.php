<?php
namespace app\common\command;

use app\common\entity\User;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use app\common\entity\Config;
class Share extends Command
{
    protected function configure()
    {
        $this->setName('share')
            ->setDescription('全球加权分红');
    }

    protected function execute(Input $input, Output $output)
    {
        set_time_limit(7200);
        $bonus = explode('@',(Config::getValue('bonus')));
        $conf_ob = Config::getValue('output_bl');
        $time = strtotime(date('Y-m-d',time()));
        $sum = \app\common\entity\UserMagicLog::where('types', 5)
                ->where('create_time','>',$time)
                ->sum('magic');
        $users[0] = User::alias('u')
                ->join('user_product p','u.id = p.user_id')
                ->where('p.status',1)
                ->where('u.total','>=','3000000')
                ->where('u.total','<','5000000')
                ->group('u.id')
                ->field('u.id')
                ->select();
        $users[1] = User::alias('u')
                ->join('user_product p','u.id = p.user_id')
                ->where('p.status',1)
                ->where('u.total','>=','5000000')
                ->where('u.total','<','10000000')
                ->group('u.id')
                ->field('u.id')
                ->select();
        $users[2] = User::alias('u')
                ->join('user_product p','u.id = p.user_id')
                ->where('p.status',1)
                ->where('u.total','>=','10000000')
                ->where('u.total','<','30000000')
                ->group('u.id')
                ->field('u.id')
                ->select();
        $users[3] = User::alias('u')
                ->join('user_product p','u.id = p.user_id')
                ->where('p.status',1)
                ->where('u.total','>=','30000000')
                ->group('u.id')
                ->field('u.id')
                ->select();
        foreach ($users as $k => $v) {
            $user_sum = bcmul($bonus[$k],$sum,8);
            $margic = bcadd($user_sum, $conf_ob,8);
            $shop_magic = bcsub($user_sum,$margic,8);
            if(!$v)                continue;
            foreach($v as $k1 => $v1){
                User::where('id',$v1['id'])
                        ->inc('magic',$margic)
                        ->inc('shop_magic',$shop_magic)
                        ->inc('sum_lucre',$user_sum)
                        ->update();
                \app\common\entity\UserMagicLog::insert([
                    'user_id'=>$v1['id'],
                    'magic'=>$user_sum,
                    'old'=>0,
                    'new'=>0,
                    'remark'=>'全网总算力分红',
                    'types'=>12,
                    'create_time'=>time()
                ]);
            }
        }
        
        
    }
    
    
}