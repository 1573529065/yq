<?php

namespace app\common\command;

use think\console\Command;
use think\console\Input;
use think\console\Output;
/**
 * Description of UpdateEveryDay
 *
 * @author Administrator
 */
class UpdateEveryDay extends Command{
    
   protected function configure()
    {
        $this->setName('everyDay')
            ->setDescription('初始化每日收益');
    }

    protected function execute(Input $input, Output $output)
    {
       $result =  \app\common\entity\User::where('1=1')->update(['everyday'=>0]);
        if($result !== false){
            echo '更新成功'.date('Y-m-d H:i:s').'<br/>';
        }else{
            echo '更新失败'.date('Y-m-d H:i:s').'<br/>';
        }
        
        
    }
}
