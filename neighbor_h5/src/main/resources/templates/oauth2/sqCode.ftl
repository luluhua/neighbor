<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>手上青秀</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/ssqx_introduce.css"/>
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/base/css/layui.css" rel="stylesheet" type="text/css" >
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
        }


    </script>
    <link href="${ctx}/base/layui_new/css/layui.css" rel="stylesheet"/>
</head>
<body>
<div class="r">
</div>
<script>
    mui.init({
        statusBarBackground: '#f7f7f7',
        gestureConfig: {
            longtap: true, //默认为false
            release: false //默认为false，不监听
        }
    });

    //<#if isDemo> 测试
    $(function () {
        var url = '${getCodeUrl!}&token=${token!}&demo=1';
        alert('测试用例-1：' + url)
        window.location.href=url;
    });
    //<#else > 正式
    //获取token
    var _gToken ='';
    $(function () {
        //是否手上青秀app环境下
        var ua = navigator.userAgent.toLowerCase();
        function isSsqx(ua) {
            return (ua.match(/ssqxapp/i) == "ssqxapp") ? true : false;
        }
        if(isSsqx(ua) == false){
            //考虑跳转到提示下载页面
            window.location.href='${ctx}/code/tips';
        }
        nativeWeb.getToken();
    });

    function  getTokenCallback(_token) {
        _gToken = _token;
        //mui.toast(_gToken, {duration: '3500ms', type: 'div'});
        if (_gToken == ''||_gToken=='(null)'||_gToken==null) {
            nativeWeb.gotoLogin();
        }else{
            //跳转授权
            window.location.href = '${getCodeUrl!}&token=' + _token;
        }
    }


    //</#if>
</script>
</body>
</html>