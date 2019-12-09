<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <style>
        ul {
            padding-left: 0px;
        }

        ul li {
            list-style-type: none;
        }

        a {
            color: #000000;
        }

        .box {
            width: 100%;
            margin: auto;
            padding: 0 0 150px 0;
        }

        .conmuse_info {
            width: 90%;
            margin: 30px auto;
        }

        .conmuse_info h2 {
            display: block;
            color: #0C0C0C;
            text-align: center;
            font-size: 16px;
        }

        .conmuse_info p {
            margin-top: 20px;
            color: #000000;
            line-height: 26px;
            font-size: 16px;
        }

        .conmuse_info p img {
            display: block;
            width: 80%;
            margin: auto;
        }
    </style>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
        }
    </script>
</head>
<body>
<!-- 主界面菜单同时移动 -->
<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 页眉导航 -->

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper" style="background-color: #FFF !important">
            <div class="mui-scroll">
                <div class="box">
                    <div class="conmuse_info">
                        <h2>${(entity.title)!}？</h2>
                        <p>答：</p>
                        <p>${(entity.content)!}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });


</script>
</html>