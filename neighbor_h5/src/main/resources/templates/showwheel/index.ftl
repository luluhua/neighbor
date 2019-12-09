<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>通知公告</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/layui.css">
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <link href="${ctx}/qxt/css/qxt.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
            mui.previewImage();
        }


    </script>
    <link href="${ctx}/base/layui_new/css/layui.css" rel="stylesheet"/>
    <script src="${ctx}/base/layui_new/layui.js"></script>

    <link href="${ctx}/qxt/css/my.previewimage.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.previewimage.js"></script>
    <script src="${ctx}/base/js/mui.zoom.js"></script>
    <style>
        .p11{ line-height:30px;
            color: #000;padding: 0 5px;text-indent:30px;}
        img{
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
            margin: 0 auto;
            padding: 5px;
        }
        .imgdiv{
            width: 350px;
            margin: 0px auto;
            text-align: center;
        }
    </style>
</head>
<body style="background-color: #FFFFFF">

<!-- 主界面菜单同时移动 -->
<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <form class="form-horizontal" id="form-recird" action="#"
                          method="post">
                        <div class="layui-row divcss5-b" style="border-top: 10px solid #FFFFFF;">
                           <p style="text-align: center;color: #000;font-size: 15px;font-weight: bold;padding-bottom: 10px;">青秀区政务中心微循环专线<br/>9月3日起正式开通啦！</p>
                            <p class="p11">
                                为进一步完善茅桥片区公交配套服务，解决青秀区政务服务中心公共交通出行不便的问题，方便市民出行，从2019年9月3日起，新开W2路青秀区政务中心微循环专线(单循环线路)，具体情况如下：
                            </p>
                            <p class="p11">
                                线路由清厢茅桥路口始发，经清厢快速路、厢竹大道、长湖路、清厢快速路至清厢茅桥路口终点。线路线长约为8公里，沿途按照现有公交站点设置情况，共设置1对往返停靠站点和7个单边停靠站点，具体站名为：
                            </p>
                            <p class="p11">
                                清厢茅桥路口(青秀区政务中心)、竹岭立交、广西水利电业集团、长湖厢竹路口、长湖金湖路口、长湖滨湖路口、长湖茶花园路口、长湖东葛路口、清厢茅桥路口(青秀区政务中心)。
                            </p>
                            <p class="p11">
                                线路计划配置4辆空调车，营运时间暂定为7：00—19：00(仅在工作日开行)，计划发班间隔10—15分钟，实行一票制，票价为1元/人次。
                            </p>
                            <div class="imgdiv">
                            <img src="${ctx}/showwheel/showwheel_dt.png"
                                 data-preview-src="${ctx}/showwheel/showwheel_dt.png"
                                 data-preview-group="1">
                            <img src="${ctx}/showwheel/showwheel_cl.jpg"
                                 data-preview-src="${ctx}/showwheel/showwheel_cl.jpg"
                                 data-preview-group="1">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${ctx}/base/js/mui.previewimage.js"></script>
<script src="${ctx}/base/js/mui.zoom.js"></script>
<script type="text/javascript">
    mui.init({
        statusBarBackground: '#f7f7f7',
        gestureConfig: {
            release: false //默认为false，不监听
        }
    });
    mui.previewImage();

</script>
</html>