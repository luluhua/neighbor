<#include "../../common/base.ftl">
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

    $(function () {
        var url = '${getCodeUrl!}';
        alert('开始获取code，示例-2：' + url)
        window.location.href=url;
    });

</script>
</body>
</html>
