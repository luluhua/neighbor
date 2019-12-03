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
    <link href="${ctx}/qxgk/css/qxgklist.css" rel="stylesheet"/>
    <style type="text/css">
        .mui-preview-image.mui-fullscreen {
            position: fixed;
            z-index: 20;
            background-color: #000;
        }

        .mui-preview-header,
        .mui-preview-footer {
            position: absolute;
            width: 100%;
            left: 0;
            z-index: 10;
        }

        .mui-preview-header {
            height: 44px;
            top: 0;
        }

        .mui-preview-footer {
            height: 50px;
            bottom: 0px;
        }

        .mui-preview-header .mui-preview-indicator {
            display: block;
            line-height: 25px;
            color: #fff;
            text-align: center;
            margin: 15px auto 4;
            width: 70px;
            background-color: rgba(0, 0, 0, 0.4);
            border-radius: 12px;
            font-size: 16px;
        }

        .mui-preview-image {
            display: none;
            -webkit-animation-duration: 0.5s;
            animation-duration: 0.5s;
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
        }

        .mui-preview-image.mui-preview-in {
            -webkit-animation-name: fadeIn;
            animation-name: fadeIn;
        }

        .mui-preview-image.mui-preview-out {
            background: none;
            -webkit-animation-name: fadeOut;
            animation-name: fadeOut;
        }

        .mui-preview-image.mui-preview-out .mui-preview-header,
        .mui-preview-image.mui-preview-out .mui-preview-footer {
            display: none;
        }

        .mui-zoom-scroller {
            position: absolute;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            left: 0;
            right: 0;
            bottom: 0;
            top: 0;
            width: 100%;
            height: 100%;
            margin: 0;
            -webkit-backface-visibility: hidden;
        }

        .mui-zoom {
            -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
        }

        .mui-android-4-1 .mui-slider .mui-slider-group .mui-slider-item img {
            width: 100%;
        }

        .mui-android-4-1 .mui-slider.mui-preview-image .mui-slider-group .mui-slider-item {
            display: inline-table;
        }

        .mui-android-4-1 .mui-slider.mui-preview-image .mui-zoom-scroller img {
            display: table-cell;
            vertical-align: middle;
        }

        .mui-preview-loading {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            display: none;
        }

        .mui-preview-loading.mui-active {
            display: block;
        }

        .mui-preview-loading .mui-spinner-white {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -25px;
            margin-top: -25px;
            height: 50px;
            width: 50px;
        }

        .mui-preview-image img.mui-transitioning {
            -webkit-transition: -webkit-transform 0.5s ease, opacity 0.5s ease;
            transition: transform 0.5s ease, opacity 0.5s ease;
        }

        @-webkit-keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeOut {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

        @keyframes fadeOut {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }
    </style>

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
                    <div class="ikfnkawe">
                        <div id="slider" class="mui-slider">
                            <div class="mui-slider-group mui-slider-loop">
                                <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
                                <div class="mui-slider-item mui-slider-item-duplicate">
                                    <a href="#">
                                        <img data-preview-src=""
                                             src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(filelist[0].name)!'--'}"
                                             onerror="this.src='${ctx}/base/images/default.png'">
                                    </a>
                                </div>
                                <#list filelist as img >
                                        <div class="mui-slider-item">
                                            <a href="#">
                                                <img data-preview-src="" data-preview-group="1"
                                                     src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(img.name)!'--'}"
                                                     onerror="this.src='${ctx}/base/images/default.png'">
                                            </a>
                                        </div>
                                </#list>

                                <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
                                <div class="mui-slider-item mui-slider-item-duplicate">
                                    <a href="#">
                                        <img data-preview-src=""
                                             src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(filelist[0].name)!'--'}"
                                             onerror="this.src='${ctx}/base/images/default.png'">
                                    </a>
                                </div>
                            </div>
                            <div class="mui-slider-indicator">
                                <#list filelist as img >
                                    <div class="mui-indicator"></div>
                                </#list>

                            </div>
                        </div>

                        <div class="img_uoe">
                            <div class="yfnwoe">
                                <div class="ykse">
                            <#list calslist as callist>
                                <a href="javascript:void(0)" class="
                                        <#if clasid??>
                                            <#if callist.id==clasid>buwe</#if>
                                        </#if>"
                                   id="${(callist.id)}">${(callist.classifyName)}</a>
                            </#list>
                                </div>
                            </div>

                        </div>

                        <div class="info_list">
                            <ul>
                            <#list artlsit as atrlist>
                                <li>
                                    <a href="javascript:void(0)">
                                        <div>
                                            <img data-preview-src="" data-preview-group="1"
                                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(atrlist.image2)!'--'}"
                                                 onerror="this.src='${ctx}/base/images/default.png'">
                                        </div>
                                        <text id="tile_Imgse" class="text_ ">${(atrlist.articleContent)}</text>
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
</div>
<span class="mui-icon mui-icon-arrowthinup ydkaw"></span>
</body>
<script src="${ctx}/base/js/mui.min.js"></script>
<script src="${ctx}/base/js/mui.zoom.js"></script>
<script src="${ctx}/base/js/mui.previewimage.js"></script>
<script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });
    mui('body').on('tap', 'a', function () {
        $(this).addClass("buwe").siblings().removeClass("buwe");
        if ($(this).attr('href') != "#") {
            var claid = $(this).attr('id');
            window.top.location.href = "/m/qingxiuh5/qxgk/list/${(claid)}?clasid=" + claid;
        }

    });

    mui('body').on('tap', '.ydkaw', function () {
        mui('.mui-scroll-wrapper').scroll().scrollTo(0, 0, 100);//100毫秒滚动到顶
    });
    window.onload = function () {
        mui('.mui-scroll-wrapper').scroll({
            deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
        });
    }
    $(document).ready(function () {
        $("#tile_Imgse img").attr('data-preview-src', '');
        $("#tile_Imgse img").attr('data-preview-group', '2');
    });
</script>
<script>
    mui.previewImage();
</script>
</html>