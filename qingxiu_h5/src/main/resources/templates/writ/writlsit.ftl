﻿<#include "../common/base.ftl">
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
    <link href="${ctx}/writ/css/writlsit.css" rel="stylesheet"/>
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
            <div class="mui-scroll">
                <div class="box">
                    <div class="saixuan">
                        <a href="#popover" id="openPopover" class="">筛选<span class="mui-icon mui-icon-arrowdown"></span></a>
                    </div>
                    <div class="rec_info">
                        <ul class="fuser_ul">
								<#list template as list>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <b>
                                                ${(list.filename)!}
                                            </b>
                                            <span name="<@commonTags method="getFileimgrul" type="1" value="1">${(getFileimgrul)!}</@commonTags>${(list.url)}">下载</span>
                                            <br style='clear:both'/>
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


<div id="popover" class="mui-popover">
    <form class="form-horizontal" id="form-recird" action="${ctx}/bmfw/recreationlist/${(claid)!}" method="post"
          onsubmit="return banduan()">
        <input type="" id="search" name="search">
        <div class="fyuaiwre">
            <#list cllist as cl>
                <span id="${(cl.id)}">${(cl.name)}</span>
            </#list>
        </div>
        <div class="hfase">
            <button class="bu1">重置</button>
            <button type="submit" class="bu2">确定</button>
        </div>
    </form>
</div>


</body>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });
    mui('.fyuaiwre').on('tap', 'span', function () {
        $(this).addClass("bu2").siblings().removeClass("bu2");
        var sre = $(this).attr('id');
        $("#search").val(sre);
    });
    mui('.hfase').on('tap', '.bu1', function () {
        $(".fyuaiwre span").removeClass("bu2");
    });


</script>
</html>