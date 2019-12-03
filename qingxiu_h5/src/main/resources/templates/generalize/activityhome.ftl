<!DOCTYPE html>
<#include "../common/base.ftl">

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>手上青秀下载注册活动</title>
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/generalize/css/activityhome.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="mui-content">
    <div class="img_ino">
        <img src="${ctx}/generalize/images/home1.png"/>
    </div>
    <div class="box_ingdex">
        <a href="${ctx}/apptg/apply">立即参与</a>
    </div>
    <div class="img_ino">
        <img src="${ctx}/generalize/images/home2.png"/>
    </div>
</div>

<script type="text/javascript">

    mui.init({});
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });
    //判断客户端类型
    $(document).ready(function () {
        $(".box_ingdex a").css({"display": "none"});
        var ua = navigator.userAgent.toLowerCase();
        if (ua.match(/MicroMessenger/i) == "micromessenger") {
            var sta = ${(sta)!};
            if (sta == 1) {
                var btnArray = ['马上下载'];
                mui.confirm("你已经参加过本次活动，马上安装手上青秀app进行注册吧", '提示', btnArray, function (e) {
                            var u = navigator.userAgent;
                            var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
                            var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
                            if (isAndroid) {
                                window.location.href = '${ctx}/common/download';
                            } else if (isiOS) {
                                window.location.href = 'https://itunes.apple.com/cn/app/id1472462104';
                            }
                        }
                )
            }
            $(".box_ingdex a").css({"display": "block"});
            return true;
        } else {
            mui.toast("请在微信公众号中打开！", {duration: '3500ms', type: 'div'});
        }
    });
</script>
</body>
</html>