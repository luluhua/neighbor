<!DOCTYPE html>
<#include "../common/base.ftl">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/layui.css">
    <style type="text/css">

        html, body {
            width: 100%;
            /*height: 100%;*/
        }

        body {
            padding: 0;
            margin: 0;

        }

        .sto_con {
            font-size: 0
        }

        .sto_con img {
            width: 100%;
            padding: 0;
            margin: 0;
        }

        .dow_bmb {
            width: 100%;
            background-color: #CCF9E5;
            height: 140px;
            padding-top: 50px;
            display: none;
        }

        .dow_bmb a {
            display: block;
            text-align: center;
            padding: 10px 30px 0px 30px;
            width: 60%;
            margin: 10px auto;
            height: 40px;
            border-radius: 8px;
            background-color: #398070;
            color: #fff;
            box-shadow: 0 0 10px #2C4F95;
            border: 1px solid #FFE690;
            font-size: 22px !important;
            text-decoration: none;
        }

        .tit {
            color: red;
            font-size: 12px;
            width: 80%;
            width: 80%;
            margin: auto;
        }

        .maskDiv {
            position: absolute;
            display: none;
            width: 100%;
            height: 100%;
            z-index: 9999999;
            background: rgba(0, 0, 0, 0.5);
        }

        .maskDiv img {
            display: none;
            float: right;
            margin-right: 10px;
        }

    </style>

    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/clipboard.min.js"></script>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <script src="${ctx}/base/js/mui.min.js"></script>
</head>
<body>
<!-- 主页面内容容器 -->
<div class="maskDiv">
    <img id="maskDivImg" src="${ctx}/download/images/layer.29ffce19.png">
</div>
<div class="sto_con">
    <img src="${ctx}/activity/images/activity/story1.png"/>
    <img src="${ctx}/activity/images/activity/story2.png"/>
    <img src="${ctx}/activity/images/activity/story3.png"/>
    <img src="${ctx}/activity/images/activity/story4.png"/>
    <img src="${ctx}/activity/images/activity/story5.png"/>
<#--<img src="${ctx}/activity/images/activity/story6.jpg"/>-->
<#--<img src="${ctx}/activity/images/activity/story7.jpg"/>-->
<#--<div class="dow_bmb" id="isAndroid_dow">-->
<#--<a id="isAndroid_dow" href="${ctx}/activity/baomingbiao.docx">下载报名表</a>-->
<#--</div>-->
<#--<div class="dow_bmb" id="ios_dow">-->
<#--<p class="tit">* 由于IOS系统限制，请在PC端浏览器进行报名表下载。</p>-->
<#--<a id="ios_dow" class="btn btn-primary btn-xs " id="shareBtn" data-clipboard-demo=""-->
<#--data-clipboard-action="copy"-->
<#--data-clipboard-text="${(DownloadUrl)!}/activity/baomingbiao.docx" href="javascript:void(0);">复制链接</a>-->
<#--</div>-->
<#--<img src="${ctx}/activity/images/activity/story8.jpg"/>-->

</div>

</body>
<script>


    // document.addEventListener('touchstart',function(e){e.preventDefault();})


    var ua = navigator.userAgent;
    var cli = navigator.userAgent.toLowerCase();
    var isAndroid = ua.indexOf('Android') > -1 || ua.indexOf('Adr') > -1; //android终端
    var isiOS = !!(ua.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/)); //ios终端
    if (isAndroid) {
        $("#isAndroid_dow").show();
        $("#ios_dow").hide();
        if (isWeixinBrowser(cli) || isZfbOrQq(cli)) {
            //在微信、qq、支付宝环境下，提示浏览器打开
            $(".maskDiv").show();
            $(".maskDiv img").show();
            $('body').css('position', 'fixed');
        }
    } else if (isiOS) {
        $("#ios_dow").show();
        $("#isAndroid_dow").hide();
    }
    //写入剪切板
    if (ClipboardJS.isSupported()) {
        var clipboard = new ClipboardJS('[data-clipboard-demo]');
        clipboard.on('success', function (e) {
            layui.use('layer', function () {
                layer.alert("链接已复制");
            });
        });
        clipboard.on('error', function (e) {
            console.log(JSON.stringify(e));
        });
    }

    //判断是否是微信
    function isWeixinBrowser(ua) {
        return (/micromessenger/.test(ua)) ? true : false;
    }

    //是否是支付宝或qq环境
    function isZfbOrQq(ua) {
        return (ua.match(/QQ/i) == "qq" || ua.match(/AlipayDefined/i) == "alipaydefined") ? true : false;
    }


</script>

</html>