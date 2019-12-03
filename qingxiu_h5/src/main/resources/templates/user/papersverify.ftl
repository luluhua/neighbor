﻿<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>${projectName}</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/user/css/papersverify.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
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
        <!--<header class="mui-bar mui-bar-nav">
            <h1 class="mui-title">手上清秀</h1>
        </header>-->
        <nav class="mui-bar mui-bar-tab" id="nav">
            <div>
                <a>本服务在<span>@南宁市公安局</span>授权范围内使用</a>
                <a>本服务在<span>@南宁市公安局</span>提供</a>
            </div>

        </nav>

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <div class="img_background">
                        <div class="yserk">
                        <#--<span>有效期至2018-02-26</span>-->
                            <a>姓名</a>
                            <a>${(tAppUserIdcard.name)!}</a>
                        </div>
                        <div class="djiawe">
                            <a>身份证号</a>
                            <a>${(tAppUserIdcard.idcard)!}></a>
                        </div>
                    </div>
                    <span class="erweima_icon" id="qrcodeId"></span>

                <#--<div class="caozuo">-->
                <#--<div class="caoz_div">-->
                <#--<a>使用说明</a>-->
                <#--<span class="mui-icon mui-icon-arrowright"></span>-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="go_approve">-->
                <#--<button>认证</button>-->
                <#--</div>-->
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
    // mui('body').on('tap', 'a', function () {
    //     // window.top.location.href = this.href;
    // });
    mui(".box").on("tap", "span", foo_1);

    function foo_1() {
        mui.toast('升级中', {duration: '3500ms', type: 'div'});
    }

</script>
</html>