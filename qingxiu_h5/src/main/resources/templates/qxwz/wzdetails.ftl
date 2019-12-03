<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>${projectName}</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/qxwz/css/wzdetails.css" rel="stylesheet"/>
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
<body>

<!-- 主界面菜单同时移动 -->
<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 页眉导航 -->

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <div class="title">
                        <h4>${(entity.title)!''}</h4>
                    </div>
                    <div class="detaile_info">
                        <div>
                            <span>状态：</span>
                            <span>${(entity.statusText)!}</span>
                        </div>
                        <div>
                            <span>浏览：</span>
                            <span>${(entity.viewsCount1)!}</span>
                        </div>
                        <div>
                            <span>提问时间：</span>
                            <span>${(entity.postDatetime?string('yyyy-MM-dd'))!'--'}</span>
                        </div>
                        <div>
                            <span>承诺办结时间：</span>
                            <span>${(entity.postDatetime?string('yyyy-MM-dd'))!'--'}</span>
                        </div>
                        <br style="clear:both">
                    </div>
                    <div class="deta_content">
                        <p>${(entity.postContent)!}</p>
                        <div class="wz-img-vido-s">
                            <#if (caseImglist)??>
                            <#list caseImglist as caseImglist>
                                <#if caseImglist.classify="mp4">
                                            <video src="${(caseImglist.name)}" controls="controls"></video>
                                <#else >
                                            <img data-preview-src="" data-preview-group="1" src="${(caseImglist.name)}">
                                </#if>

                            </#list>
                            </#if>
                        </div>

                    </div>
                    <div class="wz_reply">
                        <div class="reply_list">
                            <ul>
                              <#list replyList as replylist>
                                  <li>
                                      <div class="reply_natime">
                                          <b>${(replylist.rpUsername)!'--'}</b>
                                          <span>${(replylist.rpDatetime?string('yyyy-MM-dd'))!'--'}</span>
                                      </div>
                                      <div class="reply_com">
                                          <p>
                                              ${(replylist.rpContent)}
                                          </p>
                                        <#if (replylist.files)??>
                                            <#list replylist.files as fils>

                                                 <img data-preview-src="" data-preview-group="1" src="${(fils.name)!}"/>

                                            </#list>
                                        </#if>
                                      </div>
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
<script src="${ctx}/base/js/mui.min.js"></script>
<script src="${ctx}/base/js/mui.zoom.js"></script>
<script src="${ctx}/base/js/mui.previewimage.js"></script>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });

    window.onload = function () {
        mui('.mui-scroll-wrapper').scroll({
            deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
        });
    }
</script>
<script>
    mui.previewImage();

</script>
</html>