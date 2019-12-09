<!DOCTYPE html>
<#include "../common/base.ftl">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>温馨提示</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
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
        width: 300px;
        height: 300px;
        background: url(${ctx}/base/images/qrcode.png) no-repeat  center;
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
</head>
<body class="my-body">
<div id="img-box">
    <img src="${ctx}/base/images/qrcode.png">
</div>
<div class="tips-box">请在手上青秀app打开链接</div>
</body>
</html>