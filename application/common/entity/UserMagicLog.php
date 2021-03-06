<?php
namespace app\common\entity;

use think\Db;
use think\Model;

class UserMagicLog extends Model
{
    protected $table = 'user_magic_log';

    public $autoWriteTimestamp = false;

    const TYPE_SYSTEM = 1; //后台充值
    const TYPE_PRODUCT = 2; //购买魔盒
    const TYPE_ORDER = 3; //交易市场
    const TYPE_REWARD = 4; //推荐奖励
    const TYPE_INCOME = 5; //矿机收益
    const TYPE_SHARE = 6; //联盟分红
    const TYPE_SHOP = 8; //购买商品
    const TYPE_OUT = 9; //转出
    const TYPE_GET = 10; //转入
    const TYPE_KG_FH = 11; //推荐矿机奖励
    const TYPE_QW_FH = 12; //全网矿机奖
    const TYPE_SHOP_M = 13; //商城RCRC
    const TYPE_SHOP_B = 15; //推荐奖励补算
    
    public function getType($type)
    {
        switch ($type) {
            case self::TYPE_SYSTEM:
                return '充值';
            case self::TYPE_PRODUCT:
                return '购买矿机';
            case self::TYPE_ORDER:
                return '交易市场';
            case self::TYPE_REWARD:
                return '推荐奖励';
            case self::TYPE_INCOME;
                return '矿机收益';
            case self::TYPE_SHARE;
                return '联盟分红';
            case self::TYPE_SHOP;
                return '自由RCRC购买商品';
            case self::TYPE_OUT;
                return '转出';
            case self::TYPE_GET;
                return '转入';
           case self::TYPE_KG_FH;
                return '推荐矿机奖励';
          case self::TYPE_QW_FH;
                return '全网矿机奖';
          case self::TYPE_QW_FH;
                return '商城RCRC购买商品';
          case self::TYPE_SHOP_B;
                return '推荐奖励补算';
        }
    }


    public static function addInfo($userId, $remark, $magic, $old, $new, $type = self::TYPE_SYSTEM)
    {
        $entity = new self();

        $entity->user_id = $userId;
        $entity->remark = $remark;
        $entity->magic = $magic;
        $entity->old = $old;
        $entity->new = $new;
        $entity->create_time = time();
        $entity->types = $type;

        return $entity->save();
    }

    /**
     * @param User $user
     * @param $data
     * @param int $type 1:添加 -1:减少
     * @return bool
     */
    public function changeUserMagic(\app\common\entity\User $user, $data, $type = 1)
    {
        Db::startTrans();
        try {

            $old = $user->magic;
            if ($type == 1) {
                $user->magic = bcadd($old, $data['magic'], 8);
                $magic = $data['magic'];
            }

            if ($type == -1) {
                $user->magic = bcsub($old, $data['magic'], 8);
                $magic = -1 * $data['magic'];
            }

            if ($user->save() === false) {
                throw new \Exception('保存失败');
            }

            $result = self::addInfo($user->getId(), $data['remark'], $magic, $old, $user->magic, $data['type']);

            if (!$result) {
                throw new \Exception('保存失败');
            }

            Db::commit();

            return true;
        } catch (\Exception $e) {
            Db::rollBack();

            return false;
        }
    }

    //查询账单
    public function magicloglist($type = '', $userId = '', $page = 1, $limit = 20)
    {
        $offset = ($page - 1) * $limit;
        $query = self::where('user_id', $userId)->field('*');
        if ($type == 1) {
            $query->where("magic", "GT", 0);
        } else {
            $query->where("magic", "LT", 0);
        }

        $list = $query->order("create_time desc")->limit($offset, $limit)->select();

        foreach ($list as $key => &$value) {
            $value['types'] = self::getType($value['types']);
        }

        return $list;
    }
}