<?php /*a:5:{s:53:"/home/code/yq/application/index/view/index/index.html";i:1556897676;s:53:"/home/code/yq/application/index/view/layout/head.html";i:1556897676;s:55:"/home/code/yq/application/index/view/layout/banner.html";i:1556897676;s:56:"/home/code/yq/application/index/view/layout/shutter.html";i:1556897676;s:55:"/home/code/yq/application/index/view/layout/footer.html";i:1556897676;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="renderer" content="webkit" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" />
<meta name="format-detection" content="telephone=no" />
<title><?php echo !empty($title) ? htmlentities($title) : htmlentities($cf['title']); ?></title>
<meta name="keywords" content="<?php echo htmlentities($cf['keyword']); ?>" />
<meta name="description" content="<?php echo htmlentities($cf['msg']); ?>" />
<link rel="stylesheet" href="/static/css/style.css" />
<link rel="stylesheet" type="text/css" href="/static/css/animate.min.css" />
<link rel="stylesheet" href="/static/css/shutter.css">
<style>
    .pagination li{
       display: inline;
    }
</style>
  <link rel="stylesheet" href="/static/css/liMarquee.css">
<style>
#dowebok { width: 50%; height: 300px; margin: 0 auto; font-size: 14px;}
#dowebok:hover {background-color: white}
#dowebok ul { margin: 0; line-height: 30px;}
#dowebok a { color: #333; text-decoration: none;}
#dowebok a:hover { text-decoration: underline;}
#dowebok1 { width: 50%; height: 300px; margin: 0 auto; font-size: 14px;}
#dowebok1 ul { margin: 0; line-height: 30px;}
#dowebok1 a { color: #333; text-decoration: none;}
#dowebok1:hover {background-color: white}
#dowebok1 a:hover { text-decoration: underline;}
#dowebok1 li{ border-bottom: 1px #333333 dotted; }
#dowebok li { border-bottom: 1px #333333 dotted; }
</style>
</head>

<body class="index">
    <div class="header fix  wow fadeInDown">
        <span class="menuBtn"></span>
        <div class="wp">
            <div class="logo">
                <a href="/"><img src="<?php echo htmlentities($cf['logo']); ?>" alt="" /></a>
            </div>
            <ul class="nav fix">
                <li class="<?php if($bs == '首页'): ?> on <?php endif; ?> animated fadeInLeft">
                    <a href="/" class="v1"><span>首页</span></a>
                </li>
                            


                <li class=" <?php if($bs == '证书展示'): ?> on <?php endif; ?> animated fadeInLeft delay1">
                    <a href="<?php echo url('certificate'); ?>" class="v1"><span>证书展示</span></a>
                </li></a></li>


                <li class="<?php if($bs == '培训课程'): ?> on <?php endif; ?> animated fadeInLeft delay2">
                    <a href="#" class="v1"><span>培训课程</span></a>
                </li></a></li>


                <li class="<?php if($bs == '学员生活'): ?> on <?php endif; ?> animated fadeInLeft delay3">
                    <a href="/" class="v1"><span>学员生活</span></a>
                </li></a></li>
                 <li class="<?php if($bs == '船队介绍'): ?> on <?php endif; ?> animated fadeInLeft delay4">
                    <a href="/" class="v1"><span>船队介绍</span></a>
                </li></a></li>
             <li class="<?php if($bs == '新闻动态'): ?> on <?php endif; ?> animated fadeInLeft delay5">
                    <a href="/" class="v1"><span>新闻动态</span></a>
                </li></a></li>

                <li class="<?php if($bs == '关于我们'): ?> on <?php endif; ?> animated fadeInLeft delay6">
                    <a href="/" class="v1"><span>关于我们</span></a>
                </li></a></li>
               

            </ul>
        </div>
    </div>    <!-- banner -->
       <div class="shutter">
        <div class="shutter-img">
          <?php foreach($ban as $b): ?>
          <a href="#" data-shutter-title="<?php echo htmlentities($b['title']); ?>"><img class="banc" src="<?php echo htmlentities($b['img']); ?>" alt="#"></a>
          <?php endforeach; ?>
        </div>
        <ul class="shutter-btn">
          <li class="prev"></li>
          <li class="next"></li>
        </ul>
        <div class="shutter-desc">
          <p><?php echo htmlentities($cf['name']); ?></p>
        </div>
        </div>

 
    <!-- banner end -->   
    <div class="main">
        <!-- row-f01 -->
        <div class="row-f01">
            <div class="wp">
                <!-- m-fq01 -->
                <div class="m-fq01">
                    <ul class="ul-fq01">
                        <?php foreach($jianjie as $k => $j): ?>
                        <li class="s<?php echo htmlentities($k+1); ?> wow fadeInUp" data-wow-delay=".<?php echo htmlentities($k*3); ?>s">
                            <h3><?php echo htmlentities($j['title']); ?></h3>
                            <div class="desc">
                                <p><?php echo htmlentities($j['content']); ?></p>
                            </div>
                        </li>
                        <?php endforeach; ?>
                        
                    </ul>
                </div>
                <!-- m-fq01 end -->
            </div>
        </div>
        <!-- row-f01 end -->
        <!-- row-f02 -->
        <div class="row-f02">
            <div class="wp">
                <!-- g-tit01 -->
                <div class="g-tit01 wow fadeInDown">
                    <h2>招聘公告</h2>
                </div>
                <!-- g-tit01 end -->
                <!-- ban-f02 -->
 
                <div class="ban-f02">
                    <div class="slider">
                                                    <div class="item wow fadeInUp" data-wow-delay=".0s">
                   <h3 style='margin-left:35%'>船员招聘中介担保</h3>
                    <div id="dowebok">
                        
                    <ul>
                        <?php foreach($inter as $i): ?>
                            <li>
                                   <?php echo htmlentities($i['content']); ?>
                            </li>
                           
                            <?php endforeach; ?>
                    </ul>
                            </div>
                        </div>
                      <div class="item wow fadeInUp" data-wow-delay=".3s">
                          <h3 style='margin-left:35%'>船员招聘公告</h3>
                            <div class="inner">
                                 <div id="dowebok1">
                    <ul>
                        <?php foreach($give as $g): ?>
                            <li>
                                <a href="<?php echo url('give_details',['id'=>$g['id']]); ?>"><?php echo htmlentities($g['title']); ?></a>
                            </li>
                            <?php endforeach; ?>
                    </ul>
                            </div>
                            </div>
                        </div>
                                                   

                    </div>
                </div>
                <!-- ban-f02 end -->
            </div>
        </div>
        <!-- row-f02 end -->
    </div>

      <script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
    <!--<script type="text/javascript" src="/static/js/jquery.min.js"></script>-->
    <script src="/static/js/lib.js"></script>
    <script src="/static/js/wow.min.js"></script>
     <script type="text/javascript" src="/static/js/jquery-1.8.3.min.js"></script>
   <script type="text/javascript" src="/static/js/jquery.liMarquee.js"></script>
    <script>
    $(function(){
            $('#dowebok').liMarquee({
                    direction: 'up',
                     runshort: false
            });
    });
        $(function(){
            $('#dowebok1').liMarquee({
                    direction: 'up',
                     runshort: false
            });
    });
    </script>
    <script type="text/javascript">
        // wow
        var w_win = $(window).width();
        if (w_win >= 1199) {
            if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
                new WOW().init();
            };
        }
    </script>
    <link rel="stylesheet" type="text/css" href="/static/css/slick.css" />
    <script type="text/javascript" src="/static/js/slick.min.js"></script>
   
    <script type="text/javascript" src="/static/js/velocity.js"></script>
    <script type="text/javascript" src="/static/js/shutter.js"></script>
    <script type="text/javascript">
        $('.ban-f02 .slider').slick({
            dots: false,
            arrows: false,
            slidesToShow: 2,
            autoplay: true,
            autoplaySpeed: 2000,
            responsive: [{
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    dots: true
                }
            }]
        });
      $('.shutter').shutter({
            shutterW: '100%', // 容器宽度
            shutterH: 450, // 容器高度
            isAutoPlay: true, // 是否自动播放
            playInterval: 3000, // 自动播放时间
            curDisplay: 3, // 当前显示页
            fullPage: false // 是否全屏展示
      });
    </script>    
<div class="footer">
        <div class="wp">
            <div class="fd-left">
                <div class="fd-logo">
                    <a href="javascript:;"><img src="<?php echo htmlentities($cf['logo']); ?>" alt="" /></a>
                </div>
                <p class="copyright">© <?php echo htmlentities($cf['record']); ?></p>
            </div>
            <div class="fd-contact">
                <div class="item">
                    <h3>联系来访</h3>
                    <p><a href="#">电话：<?php echo htmlentities($cf['mobile']); ?></a></p>
                    <p><a href="mailto:Email：<?php echo htmlentities($cf['email']); ?>">Email：<?php echo htmlentities($cf['email']); ?></a></p>
                </div>
                <div class="item">
                    <h3>地址</h3>
                    <p><?php echo htmlentities($cf['address']); ?></p>
                </div>
            </div>
           <div class="fd-qr">
                <div class="con">
                   
                    <div class="item" style="width:100%">
                        <div class="pic">
                            <img src="<?php echo htmlentities($cf['wx']); ?>" alt="">
                        </div>
                        <h3>微信公众号<br><?php echo htmlentities($cf['name']); ?></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
   

