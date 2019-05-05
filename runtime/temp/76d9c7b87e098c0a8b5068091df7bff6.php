<?php /*a:5:{s:64:"D:\phpStudy\WWW\yq\application\index\view\index\certificate.html";i:1556554413;s:58:"D:\phpStudy\WWW\yq\application\index\view\layout\head.html";i:1556554348;s:60:"D:\phpStudy\WWW\yq\application\index\view\layout\banner.html";i:1556545580;s:61:"D:\phpStudy\WWW\yq\application\index\view\layout\shutter.html";i:1556544996;s:60:"D:\phpStudy\WWW\yq\application\index\view\layout\footer.html";i:1556288359;}*/ ?>
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

</head>

<body class="">
    <div class="header fix  wow fadeInDown">
        <span class="menuBtn"></span>
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
    </div>
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
    <div class="main">
        <div class="wp">
            <div class="row-jg07">
                <?php foreach($list as $k => $l): ?>
                  <!--<a href="" target="_blank">-->
                <div class="img-txt <?php if($k%2 == 0): ?>img-txt-r <?php endif; ?>">
                    <div class="pic wow fadeInLeft">
                        <img src="<?php echo htmlentities($l['img']); ?>" alt="">
                    </div>
                    <div class="txt wow fadeInRight">
                        <h3><?php echo htmlentities($l['title']); ?></h3>
                        <p><?php echo htmlspecialchars_decode($l['introduce']); ?></p>
                    </div>
                </div>
                <!--</a>-->
                <?php endforeach; ?>
               
 
            </div>
         <div id="pages">
            <?php echo $list->render(); ?>
            </div>
        </div>
        
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