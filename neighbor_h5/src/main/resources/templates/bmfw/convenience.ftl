<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>${projectName}</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/bmfw/css/convenience.css" rel="stylesheet"/>


    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" charset="utf-8">
    </script>
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
<body style="max-height: 100%">

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
                    <div class="adas">
                    <div id="slider" class="mui-slider">
                            <#if (taaalist?size>1) >
                                <div class="mui-slider-group mui-slider-loop">
                                    <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->

                                    <div class="mui-slider-item mui-slider-item-duplicate">
                                        <a href="#">
                                            <img data-preview-src=""
                                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(taaalist[0].name)!'--'}"
                                                 onerror="this.src='${ctx}/base/images/default.png'">
                                        </a>
                                    </div>
                                      <#list taaalist as atlist>
                                <!-- 第一张 -->
                                        <div class="mui-slider-item">
                                            <a href="#">
                                                <img data-preview-src=""
                                                     data-preview-group="1"
                                                     src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(atlist.name)!'--'}"
                                                     onerror="this.src='${ctx}/base/images/default.png'">
                                            </a>
                                        </div>
                                      </#list>
                                    <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
                                    <div class="mui-slider-item mui-slider-item-duplicate">
                                        <a href="#">
                                            <img data-preview-src=""
                                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(taaalist[0].name)!'--'}"
                                                 onerror="this.src='${ctx}/base/images/default.png'">
                                        </a>
                                    </div>
                                </div>
                                <div class="mui-slider-indicator">
                                    <#list taaalist as atlist>
                                        <div class="mui-indicator "></div>
                                    </#list>
                                </div>
                        </div>
                            <#else >
                            <div class="top_img">
                                <img data-preview-src=""
                                     src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.articleImages)!'--'}"
                                     onerror="this.src='${ctx}/base/images/default.png'">
                            </div>
                            </#if>

                        <div class="com_info">
                            <div class="introduce">
                                <div class="tytielse">
                                    <span></span>
                                    <h2>${(entity.title)!}</h2>
                                </div>
                                <#if entity.classifyId==70>
                                    <div class="com_detiils">
                                        <p id="p1">
                                            ${(entity.articleBrief?replace(' ','&nbsp' )?replace('\n','<br/>')?replace('\t','&nbsp;&nbsp;&nbsp;&nbsp;'))!}
                                        </p>
                                    </div>
                                <#else >
                                <div class="com_detiils">
                                    <p class="p1" id="p1">
                                        ${(entity.articleBrief?replace(' ','&nbsp' )?replace('\n','<br/>')?replace('\t','&nbsp;&nbsp;&nbsp;&nbsp;'))!}
                                    </p>
                                    <a style="display: <#if surt==0>none</#if>" id="a1"
                                       href="javascript:void(0)">查看更多<span
                                            class="mui-icon mui-icon-arrowdown"></span></a>
                                    <a id="scrollToTop" href="javascript:void(0)" style="display: none;">收起<span
                                            class="mui-icon mui-icon-arrowup"></span></a>
                                </div>
                                </#if>
                            </div>
                        </div>
                    </div>

                    <div class="saoiase">
                    ${(entity.articleContent)!}
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/base/js/mui.min.js"></script>
<script src="${ctx}/base/js/mui.zoom.js"></script>
<script src="${ctx}/base/js/mui.previewimage.js"></script>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });
    // mui('body').on('tap', 'a', function () {
    //     if ($(this).attr("href") != '#') {
    //         window.top.location.href = this.href;
    //     }
    // });
    mui('.com_detiils').on('tap', 'a', function () {
        if ($(this).index() == 1) {
            $("#p1").removeClass("p1");
            $("#scrollToTop").css({'display': 'block'});
            $("#a1").css({'display': 'none'});
        } else {
            $("#p1").addClass("p1");
            $("#a1").css({'display': 'block'});
            $("#scrollToTop").css({'display': 'none'});
        }
    });

    mui('.com_detiils').on('tap', '#scrollToTop', function () {
        mui('.mui-scroll-wrapper').scroll().scrollTo(0, 0, 100);//100毫秒滚动到顶
    });
    window.onload = function () {
        mui('.mui-scroll-wrapper').scroll({
            deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
        });
    }

    mui('.saoiase').on('tap', 'a', function () {
        var phone = $(this).text();
        window.location.href = 'tel:' + phone;
    });
</script>

<script>
    mui.previewImage();

</script>
</html>