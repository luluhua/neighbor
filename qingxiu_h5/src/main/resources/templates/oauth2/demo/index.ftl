<#include "../../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>授权测试</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/ssqx_introduce.css"/>
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/base/css/layui.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
    <link href="${ctx}/base/layui_new/css/layui.css" rel="stylesheet"/>
</head>
<body>
<form method="get" action="/m/demo_code/getCode">
    测试参数：
    <p>codeUri：<input type="text" id="codeUri" name="codeUri" value="${(codeUri)!}" width="100%"
                      placeholder="code入口"/></p>
    <br/>
    <p>clientId：<input type="text" id="clientId" name="clientId" value="${(clientId)!}" width="100%"
                       placeholder="必填，应用编号"/></p>
    <br/>
    <p>redirectUri:<input type="text" id="redirectUri" name="redirectUri"
                               value="${(redirectUri)!}" width="100%"
                               placeholder="必填，接收code的回调地址"/></p>
    <br/>
    <p>state:<input type="text" id="state" name="state"
                          value="${(state)!}" width="100%"
                          placeholder="非必填，扩展参数"/></p>
    <br/>
    <p>token:<input type="text" id="token" name="token" value="${(token)!}" width="100%" placeholder="非必填，本地测试使用"/></p>
    <br/>
    <button id="btn" type="button">提交</button>
</form>
</body>
<script>
    mui.init({
        statusBarBackground: '#f7f7f7',
        gestureConfig: {
            longtap: true, //默认为false
            release: false //默认为false，不监听
        }
    });
    $(function () {
        $('#btn').on("click", function () {
            if ($('#codeUri').val() == '' || $('#redirectUri').val() == '' || $('#clientId').val() == '') {
                alert('参数不全');
                return;
            }
            var url = $('#codeUri').val();
            url = url + "?redirectUri=" + escape($('#redirectUri').val());
            url = url + "&clientId=" + escape($('#clientId').val());
            if ($('#token').val() != '') {
                url = url + "&token=" + escape($('#token').val());
            }
            alert('设置参数，示例-1：' + url)
            $('form').submit();
            //window.location.href = url;
        })


    });

</script>
</html>
