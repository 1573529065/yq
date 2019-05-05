<?php

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
// 应用公共文件
function alert($message, $jumpUrl = '') {
    if ($jumpUrl) {
        $js = "function(){ window.location.href = '{$jumpUrl}'}";
    } else {
        $js = "";
    }
    $html = <<<EOF
<html>
    <head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>温馨提示</title>
		<link href="/static/css/mui.min.css" rel="stylesheet" />
		<link href="/static/css/public.css" rel="stylesheet" />
		<script src="/static/js/mui.min.js"></script>
		<script type="text/javascript" charset="utf-8">
		    mui.init();
		</script>
	</head>
	<body>
	    <script>
            window.onload = function(){
                mui.alert('{$message}','温馨提示',$js)
	        }
	    </script>
	</body>
</html>
EOF;
    echo $html;
}

/**
 * 获得订单状态
 */
function get_shop_order_status($type) {
    switch ($type) {
        case '1':
            echo "<span style='color:blue'>未发货</span>";
            break;
        case '2':
            echo "<span style='color:green'>已发货</span>";
            break;
        case '3':
            echo "<span style='color:red'>已收货</span>";
            break;
    }
}

/**
 * 短信接口
 */
function send_msg($mobile, $code) {
    header('content-type:text/html;charset=utf-8');
//创蓝接口参数
    $postArr = array(
//        'account' => 'N454652_N6604213',
//        'password' => 'W01juvCU5Db06a',
//        'msg' => "【RCRC】this is test,Your validation code is {$code}",
//        'mobile' => $mobile,
        'account' => 'N454652_N6604213',
        'password' => 'W01juvCU5Db06a',
        'msg' => urlencode("【RCRC】尊敬的用户,您的验证码为 {$code}。此验证码5分钟内有效。"),
        'phone' => $mobile,
        'report' => true
    );
    $result = curlPost('https://smssh1.253.com/msg/send/json', $postArr);
    if (!is_null(json_decode($result))) {
        $output = json_decode($result, true);
        if (isset($output['code']) && $output['code'] == '0') {
//            echo '短信发送成功！';
            return true;
        } else {
//            echo $output['error'];
            return false;
        }
    } else {
//        echo $result;
        return false;
    }
}

/**
 * 通过CURL发送HTTP请求
 * @param string $url  //请求URL
 * @param array $postFields //请求参数 
 * @return mixed
 */
function curlPost($url, $postFields) {
    $postFields = json_encode($postFields);
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json; charset=utf-8'
            )
    );
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    $ret = curl_exec($ch);
    if (false == $ret) {
        $result = curl_error($ch);
    } else {
        $rsp = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if (200 !== $rsp) {
            $result = "请求状态 " . $rsp . " " . curl_error($ch);
        } else {
            $result = $ret;
        }
    }
    curl_close($ch);
    return $result;
}

/**
 * 将数据格式转换成树形结构数组
 * @param array $items 要进行转换的数组
 * return array $items 转换完成的数组
 */
function generateTree($array) {
//第一步 构造数据 
    $items = array();
    foreach ($array as $value) {
        $items[$value['id']] = $value;
    }
//第二部 遍历数据 生成树状结构 
    $tree = array();
    foreach ($items as $key => $item) {
        if (isset($items[$item['pid']])) {
            $items[$item['pid']]['son'][] = &$items[$key];
        } else {
            $tree[] = &$items[$key];
        }
    }
    return $tree;
}

/**
 * 将树形结构数组输出
 * @param array $items 要输出的数组
 * @param number $deep 顶级父节点id
 */
function exportTree($items, $deep = 0){
    $arr = [];
    foreach ($items as $k => $item) {
         echo "<option value='{$item['id']}'>".str_repeat('|—', $deep).$item['name']."</option>";
//        printf("%s%s", str_repeat('|—', $deep), $item['name']);
        if (!empty($item['son'])) {
            exportTree($item['son'], $deep + 1);
        }
    }
}

/**
 * 将树形结构数组输出
 * @param array $items 要输出的数组
 * @param number $deep 顶级父节点id
 */
function exportTreeEdit($items, $deep = 0,$pid = null){
    $arr = [];
    foreach ($items as $k => $item) {
        if($pid == $item['id']){
            echo "<option selected value='{$item['id']}'>".str_repeat('|—', $deep).$item['name']."</option>";
        }else{
            echo "<option value='{$item['id']}'>".str_repeat('|—', $deep).$item['name']."</option>";
        }
         
//        printf("%s%s", str_repeat('|—', $deep), $item['name']);
        if (!empty($item['son'])) {
            exportTree($item['son'], $deep + 1);
        }
    }
}



    /**
     * 获得需要补差价的矿机和
     * @param type $user 下级用户ID
     * @param type $num  循环几代
     * @param type $con  每代 奖励 比例
     * @param type $sum  总和
     * @param type $dai 代数(向上)
     * @return type
     */
 function get_lower_sum($user,$num,$con,$sum = 0,$diff=0,$product_id,$dai = 0){
        if($num <= 0) return $sum;
        $redis = new \think\cache\driver\Redis();
        $userId = explode(',',$user);
        $users = '';
        foreach ($userId as $k => $v) {
         if($redis->hexists('PID',$v)) $users .= $redis->hget('PID',$v).',';
        }
        $users = trim($users,',');
        $ps = 0;
        if($users){
            $ps = \app\common\entity\UserProduct::where('user_id','in',$users)
                    ->where('product_id','>=',$product_id)
                    ->count();
        }
        $sum_num = $ps*$diff;
        $sum = $sum + bcmul($sum_num,$con[$dai],8);
        $num = $num -1;
        if($num == 0){ 
            return $sum; 
        }
        $dai++;
       return get_lower_sum($users,$num,$con,$sum,$diff,$product_id,$dai);
    }
   
function arrayToXml($arr)
{
    $xml = "<xml>";
    foreach ($arr as $key => $val) {

        $xml .= "<" . $key . ">" . $val . "</" . $key . ">";

    }
    $xml .= "</xml>";
    return $xml;
}
function xmlToArray($xml)
{
    libxml_disable_entity_loader(true);
    $values = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
    return $values;
}
function qst($arr)
{
    $str = '';
    $i = 1;
    $all = count($arr);
    foreach ($arr as $key => $value) {
        $str .= $key;
        $str .= "=$value";
        if ($i < $all) {
            $str .= "&";
        }
        $i++;
    }
    return $str;

}

function sendKj($nonce_str,$number,$bank,$total_fee){
    $now = date("YmdHis");
    $base = [
        'api_type' => 'YLFAST',
        'nonce_str' => $nonce_str,//随机串
        'sign_type' => 'MD5',
        'mch_id' => '015521019376',
        'mch_create_ip' => '47.52.206.120',//改成服务器ip
        'mch_trade_no' => $number,//你的订单号
        'total_fee' => $total_fee,//金额
        'product_name' => '充值',//商品名称
        'return_url' => 'http://www.boss.top/', //支付成功后跳转到哪里？
        'notify_url' => 'http://www.boss.top/index/publics/huidiao', 
        //支付成功后 ，结果以post的形式访问这个页面，这个网址的页面写逻辑处理
        'account_code' => $bank,//银行卡
        'time_start' => $now
    ];

    $sendkey = ['mch_create_ip', 'mch_trade_no', 'total_fee', 'product_id', 'product_name', 'product_desc', 'goods_tag', 'attach_info', 'time_start', 'notify_url', 'return_url', 'time_start','bank_channel_code','account_code'];
    sort($sendkey);
    foreach ($sendkey as $value) {
        if (!empty($base[$value])) {
            $newsend[$value] = $base[$value];
        }
    }

    $key2 = ["api_type", "data_type", "mch_id", "nonce_str", "sign_type", "ver_no"];
    sort($key2);
    foreach ($key2 as $value) {
        if (!empty($base[$value])) {
            $new[$value] = $base[$value];
        }
    }

    $new['data'] = arrayToXml($newsend);

    ksort($new);
    $str = qst($new);
    $datasign = md5($str . '5q6o2ru5ahdvt3uob7nfarf0jed23au5');//key从这里换
    $post_data = array_merge($new, $newsend);
    $post_data['data_sign'] = $datasign;
    $curl = curl_init();

    curl_setopt($curl, CURLOPT_URL, 'https://bozoyoo.co:20830/pospay/payYLFast');
    curl_setopt($curl, CURLOPT_HEADER, 0);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
    $data = curl_exec($curl);
    curl_close($curl);
    $data = xmlToArray($data);
    
    if(empty($data['pay_url'])){
        $pay_url = false;
    }else{
        $pay_url = $data['pay_url'];
    }
    
    return $pay_url;
   // header("location:$pay_url");
}


function check_bankCard($card_number){
        $arr_no = str_split($card_number);
        $last_n = $arr_no[count($arr_no)-1];
        krsort($arr_no);
        $i = 1;
        $total = 0;
        foreach ($arr_no as $n){
            if($i%2==0){
                $ix = $n*2;
                if($ix>=10){
                    $nx = 1 + ($ix % 10);
                    $total += $nx;
                }else{
                    $total += $ix;
                }
            }else{
                $total += $n;
            }
            $i++;
        }
        $total -= $last_n;
        $x = 10 - ($total % 10);
        if($x == $last_n){
            return 'true';
        }else{
            return 'false';
        }
    }