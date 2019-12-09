<!DOCTYPE html>
<#include "../common/base.ftl">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>手上青秀</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
</head>
<style type="text/css">
    body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, textarea, select, optgroup, option, fieldset, legend, p, blockquote, th, td {
        margin:0;
        padding:0
    }
    .my-body {
        background-color:#ffffff;
        padding-top: 3rem;
    }
    #img-box{
        margin: 0 auto;
        width: 120px;
        height: 129px;
        background: url(${ctx}/base/images/shouquantubiao@3x.png) no-repeat  center;
        -moz-background-size:100% 100%;
        background-size:100% 100%;
    }
    .tips-box{
        margin: 0 auto;
        text-align: center;
        font-size: 1.2rem;
        padding-top: 1.2rem;
    }
</style>
<body class="my-body">
<div id="img-box"></div>
<div class="tips-box">正在跳转认证···</div>
<script>
    mui.init({
        statusBarBackground: '#f7f7f7',
        gestureConfig: {
            longtap: true, //默认为false
            release: false //默认为false，不监听
        }
    });

    $(function () {
        mui('.mui-scroll-wrapper').scroll({
            deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
        });
        var ua = navigator.userAgent.toLowerCase();
        function isSsqx(ua) {
            return (ua.match(/ssqxapp/i) == "ssqxapp") ? true : false;
        }
        if(isSsqx(ua) == false){
            window.location.href='${ctx}/code/tips';
        }
        //添加打开认证js
        nativeWeb.gotoRealNameAuthentication();
    });
</script>
</body>
</html>
