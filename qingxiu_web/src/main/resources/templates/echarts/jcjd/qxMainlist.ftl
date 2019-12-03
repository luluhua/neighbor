<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=yes"/>
    <title>list</title>
    <script src="/jcjd/libs/jquery/jquery-1.10.2.min.js"></script>
    <script src="/jcjd/libs/layer/layer.js"></script>
    <style>
        html, body {
            padding: 0;
            margin: 0;
        }
    </style>
    <script>
        var openWin = function (url, width, height) {
            layer.open({
                type: 2,
                title: '详情',
                area: ['700px', '500px'],
                content: url,
                shade: false
            });
        };
        var showDetail = function (id) {
            openWin('/jcjd/wsbs/qxMainDetail?id=');
        };
    </script>
</head>
<body>

</body>
</html>