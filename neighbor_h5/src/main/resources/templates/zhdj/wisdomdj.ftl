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
    <link href="${ctx}/zhdj/css/wisdomdj.css" rel="stylesheet"/>
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

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <div class="wisd_type">
                        <ul>
                            <#list entry as list>
                                <li>
                                    <a href="${(list.actionPage1)!'javascript:void(0)'}">
                                        <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(list.icon)!'--'}"
                                             onerror="this.src='${ctx}/base/images/default.png'">
                                        <b>${(list.titile)!}</b>
                                    </a>
                                </li>
                            </#list>
                        </ul>


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
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });


</script>
</html>