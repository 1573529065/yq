$(document).ready(function($) {
    // 手机导航
    $('.menuBtn').append('<b></b><b></b><b></b>');
    $('.menuBtn').click(function(event) {
        $(this).stop().toggleClass('open');
        $('.nav').stop().fadeToggle();
    });

    var _winw = $(window).width();
    if (_winw > 959) {
        $('.nav li').hover(function() {
            $(this).find('.sub').stop().slideDown();
            if ($(this).find('.sub').length) {
                $(this).addClass('ok');
                $('.header').addClass('on');
            } else {
                $('.header').removeClass('on');
            }
        }, function() {
            $(this).removeClass('ok');
            $(this).find('.sub').stop().slideUp();
        });
        $('.nav').mouseleave(function(event) {
            if ($('.header').hasClass('on')) {
                $('.header').removeClass('on');
            };
        });
    } else {
        $('.nav .v1').click(function() {
            if ($(this).siblings('.sub').length) {
                $(this).parents('li').siblings('li').find('.sub').stop().slideUp();
                $(this).siblings('.sub').stop().slideToggle();
                return false;
            }
        });
    }


    // 选项卡 鼠标点击
    $(".TAB_CLICK li").click(function() {
        var tab = $(this).parent(".TAB_CLICK");
        var con = tab.attr("id");
        var on = tab.find("li").index(this);
        $(this).addClass('on').siblings(tab.find("li")).removeClass('on');
        $(con).eq(on).show().siblings(con).hide();
    });
    $('.TAB_CLICK').each(function(index, el) {
        if ($(this).find('li.on').length) {
            $(this).find("li.on").trigger('click');
        } else {
            $(this).find("li").filter(':first').trigger('click');
        }
    });

});

$(function() {
    var closeWindow = function(obj) {
        obj.length && obj.hide();
        $('.js-popmask').hide();
    };
    $('.js-pop').on('click', function(e) {
		var tid = $(this).data('id');
		var tit = $(this).data('tit');
		$("#tid").val(tid);
		$("#tit").val(tit);
        var $window = $('[data-window="' + $(this).data('windowname') + '"]');
        var $mask = $('.js-popmask');
        $mask.show();
        $window.show();
    });
    $('.js-popwindow').on('click', '.js-close', function(e) {
        closeWindow($(this).parents('.m-pop'));
    });
    $('.js-popwindow').on('click', '.js-confirm', function(e) {
        closeWindow($(this).parents('.m-pop'));
        // 这里可以放点击确定后执行的操作
    });
    // 如果不需要点击遮罩关闭弹窗，则把本段删掉
    $('.js-popmask').on('click', function(e) {
        closeWindow($('.js-popwindow'));
    });
});