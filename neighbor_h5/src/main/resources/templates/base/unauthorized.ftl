<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>${projectName}</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/layui.css">
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <script src="${ctx}/base/js/nativeWeb.js"></script>
    <script src="${ctx}/base/js/mui.min.js"></script>

</head>
<body>
<div class="mui-off-canvas-wrap mui-draggable">
</div>
</body>
<script type="text/javascript">
    mui.init();
    nativeWeb.gotoLogin();
</script>
</html>