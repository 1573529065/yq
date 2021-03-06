<?php
namespace app\common\command;

use app\common\entity\UserProduct;
use app\common\service\Product\Compute;
use think\console\Command;
use think\console\Input;
use think\console\Output;

class Income extends Command
{


    protected function configure()
    {
        $this->setName('product-income')
            ->setDescription('矿机收益');
    }

    protected function execute(Input $input, Output $output)
    {
        set_time_limit(7200);
        //获取在运行中的全部魔盒,每次处理一千条数据，以防数据太多，内存溢出
        $total = UserProduct::where('status', UserProduct::STATUS_RUNNING)->count();
        $limit = 1000;
        $page = ceil($total / $limit);
        $model = new Compute();
        for ($i = 0; $i < $page; $i++) {
            $offset = $i * $limit;
            $list = UserProduct::where('status', UserProduct::STATUS_RUNNING)->limit($offset, $limit)
                ->select();
            foreach ($list as $userProduct) {
                if(in_array($userProduct['user_id'], [263,264,274,275])){
                    continue;   
                }
                $model->income($userProduct);
            }
        }
    }


}