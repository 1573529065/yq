<?php /*a:4:{s:56:"D:\phpStudy\WWW\yq\application\admin\view\home\give.html";i:1556466548;s:58:"D:\phpStudy\WWW\yq\application\admin\view\layout\main.html";i:1523246924;s:60:"D:\phpStudy\WWW\yq\application\admin\view\layout\header.html";i:1523413308;s:58:"D:\phpStudy\WWW\yq\application\admin\view\layout\left.html";i:1523246924;}*/ ?>
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta name="description" content="Flat, Clean, Responsive, admin template built with bootstrap 3">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <title>后台管理</title>
    <link rel="stylesheet" href="/admin/vendor/offline/theme.css">
    <link rel="stylesheet" href="/admin/vendor/pace/theme.css">

    <link rel="stylesheet" href="/admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/admin/css/font-awesome.min.css">
    <link rel="stylesheet" href="/admin/css/animate.min.css">

    <link rel="stylesheet" href="/admin/css/panel.css">

    <link rel="stylesheet" href="/admin/css/skins/palette.1.css" id="skin">
    <link rel="stylesheet" href="/admin/css/fonts/style.1.css" id="font">
    <link rel="stylesheet" href="/admin/css/jquery.confirm.css">
    <link rel="stylesheet" href="/admin/css/main.css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="/admin/vendor/jquery-1.11.1.min.js"></script>
    <script src="/admin/vendor/modernizr.js"></script>
    


</head>

<body>
<div class="app">
    <header class="header header-fixed navbar">
    <div class="brand" style="background-color: #535A7C">
        <a href="javascript:;" class="fa fa-bars off-left visible-xs" data-toggle="off-canvas" data-move="ltr"></a>
        <a href="<?php echo url('admin/index/index'); ?>" class="navbar-brand">
            <i class="fa fa-stop mg-r-sm"></i>
            <span class="heading-font">后台管理系统</span>
        </a>
    </div>

    <ul class="nav navbar-nav navbar-right off-right">
        <li class="quickmenu">
            <a href="javascript:;" data-toggle="dropdown">
                <?php echo htmlentities($manage['name']); ?>
                <i class="caret mg-l-xs hidden-xs no-margin"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-right mg-r-xs">
                <li>
                    <a href="<?php echo url('index/updateInfo'); ?>">修改密码</a>
                </li>
                <li>
                    <a onclick="logoutSys(this)" data-href="<?php echo url('index/logout'); ?>">退出</a>
                </li>
            </ul>
        </li>
    </ul>
</header>
<script>
    function logoutSys(event) {
        var url = $(event).attr('data-href');
        $.confirm({
            title: '<strong style="color: #c7254e;font-size: 16px">温馨提示</strong>',
            content: '<div class="text-center" style="border-top:1px solid #eee;padding-top: 20px">你确定要退出系统吗?</div>',
            confirmButton: '确定',
            confirmButtonClass: 'btn btn-info',
            cancelButton: '取消',
            cancelButtonClass: 'btn btn-danger',
            animation: 'scaleY',
            theme: 'material',
            confirm: function () {
                window.location.href = url;
            }
        })
    }
</script>

    <section class="layout" style="padding-top: 50px">

        <aside class="sidebar collapsible canvas-left">
    <div class="scroll-menu">

        <nav class="main-navigation slimscroll" data-height="auto" data-size="4px" data-color="#ddd" data-distance="0">
            <ul id="left-menu">
                <li><a href="<?php echo url('index/index'); ?>"><i class="fa fa-home"></i><span>后台首页</span></a></li>
                <?php foreach($menus as $menu): if($menu->getLevel() == 1): ?>
                        <li class="dropdown">
                            <a href="javascript:;" data-toggle="dropdown">
                                <i class="<?php echo config('app.menu_icon')[$menu->getShrotName()] ?? ''; ?>"></i><span><?php echo htmlentities($menu->getShrotName()); ?></span><i
                                    class="toggle-accordion"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <?php foreach($menus as $child): if($child->getParentId() == $menu->getId()): ?>

                                        <li <?php echo htmlentities($child->checkPathActive()); if($child->checkPathActive()): ?> class="active" <?php endif; ?>><a
                                                href="<?php echo htmlentities($child->getUrl()); ?>"><span><?php echo htmlentities($child->getShrotName()); ?></span></a>
                                        </li>
                                    <?php endif; endforeach; ?>
                            </ul>
                        </li>
                    <?php endif; endforeach; ?>
            </ul>
        </nav>
    </div>
    <footer>
        <div class="footer-toolbar pull-left">
            <a href="javascript:;" class="toggle-sidebar pull-right hidden-xs">
                <i class="fa fa-angle-left"></i>
            </a>
        </div>
    </footer>
    <script>
        $(function () {
            $("#left-menu").find('.dropdown').each(function () {
                if ($(this).find('li').hasClass('active')) {
                    $(this).addClass('collapse-open open');
                }else{
                    $(this).removeClass('collapse-open open');
                }
            })
        })
    </script>
</aside>

        <section class="main-content" >

            <div class="content-wrap ">
                
<section class="panel">
    <header class="panel-heading">
        <h4>船员招聘管理</h4>
    </header>
    <div class="panel-body" style="padding-bottom: 50px">
          <div class="row clearfix " style="margin-bottom: 15px">
            <a type="button" href="/admin/home/g_add" class="btn btn-info">添加船员招聘信息</a>
        </div>
        <table class="table table-bordered table-striped no-margin">
            <thead>
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">标题</th>
                    <th class="text-center">介绍</th>
                    <th class="text-center">公司名称</th>
                    <th class="text-center">联系信息</th>
                    <th class="text-center">公司地址</th>
                    <th class="text-center">公司性质</th>
                    <th class="text-center">操作</th>
                </tr>
            </thead>
            <tbody>
                <?php if(!empty($list)): foreach($list as $entity): ?>
                <tr>
                    <td class="text-center"><?php echo htmlentities($entity['id']); ?></td>
                    <td class="text-center"><?php echo htmlentities($entity['title']); ?></td>
                    <td class="text-center"> <a onclick="showContent(this)" data-content="<?php echo htmlentities($entity['content']); ?>" class="btn btn-xs btn-primary">查看</a></td>
                    <td class="text-center"><?php echo htmlentities($entity['name']); ?></td>
                    <td class="text-center">
                        联系人：<?php echo htmlentities($entity['ren']); ?><br>
                        QQ:<?php echo str_replace("@","&nbsp;",$entity['qq']);?><br>
                        电话：<?php echo htmlentities($entity['tel']); ?><br>
                        手机：<?php echo htmlentities($entity['mobile']); ?><br>
                        邮箱：<?php echo htmlentities($entity['email']); ?><br>
                        
                    </td>
                    <td class="text-center"><?php echo htmlentities($entity['address']); ?></td>
                    <td class="text-center"><?php echo htmlentities($entity['xz']); ?></td>
                    
                    <td class="text-center">
                   <a data-url="<?php echo url('home/g_del',['id'=>$entity['id']]); ?>" onclick="main.ajaxDelete(this)" data-msg="确定要删除吗？" class="btn btn-xs btn-danger">删除</a>
                    </td>
                </tr>
                <?php endforeach; else: ?>
                <tr class="text-center">
                    <td colspan="7">暂无数据</td>
                </tr>
                <?php endif; ?>
            </tbody>
        </table>
        <div class="page" style="text-align: center">
            <?php echo $list->render(); ?>
        </div>
    </div>
</section>

            </div>

            <div class="site-overlay"></div>
        </section>

    </section>
</div>

<script src="/admin/bootstrap/js/bootstrap.js"></script>
<script src="/admin/vendor/jquery.easing.min.js"></script>
<script src="/admin/vendor/jquery.placeholder.js"></script>
<script src="/admin/vendor/fastclick.js"></script>
<script src="/admin/vendor/jquery.slimscroll.js"></script>
<script src="/admin/vendor/offline/offline.min.js"></script>
<script src="/admin/vendor/pace/pace.min.js"></script>
<script src="/admin/js/off-canvas.js"></script>
<script src="/admin/js/jquery.confirm.js"></script>
<script src="/admin/js/main.js"></script>
<script src="/admin/js/panel.js"></script>


    <script>
        function showContent(e){
            $.dialog({
                title: '公司介绍',
                content: $(e).attr('data-content')
            });
        }
    </script>
<script>
    function down(tar){
        href = window.location.href;
        $(tar).attr("href",href+"&is_down=1");
    }
    function detailed(id) {
        $('.deta_'+id).css('display','none');
        $('.close_'+id).css('display','');
        $(".xiang_"+id).css('display','');
        $(".xiang1_"+id).css('display','');
    }
    function detailed_close(id){
        $('.deta_'+id).css('display','');
        $('.close_'+id).css('display','none');
        $(".xiang_"+id).css('display','none');
        $(".xiang1_"+id).css('display','none');
    }
    $('.send').click(function(){
        id = $(this).attr('data-id');
        num = $('#send_'+id).val();
        if(num == ''){
            return false;
        }
        
        $.ajax({
                    url: "<?php echo url('send'); ?>",
                    method: 'POST',
                    dataType: 'json',
                    data:{id:id,numbers:num},
                    success: function (response) {
                        console.log(response);
                         main.waringAlert(response.msg)
                        if(response.code == 200){
                             window.location.reload();
                         }
                    },
                })
    });
    
    
</script>

</body>
</html>