<!DOCTYPE html>
<#include "../common/base.ftl">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <link href="${ctx}/activity/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/activity/css/activity.css" rel="stylesheet"/>
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
<!-- 主页面内容容器 -->
<div class="yirtj">
    <div class="jfoiwjer">
        <div class="top_huihewr">
            <img src="${ctx}/activity/images/icon/huoq2.png"/>
            <div class="huotose_lir">
                <b>青少年粤剧基础培训</b>
                <div class="hfasr fsru">
                    <span class="didian"></span>
                    <p>青秀区文化馆民族宫分馆（南宁市民族大道49—2广西民族艺术宫5楼音乐厅东南角）</p>
                    <br style='clear:both'/>
                </div>
                <div class="hfasr rews">
                    <span class="shijian"></span>
                    <p>9月28日-11月2日每周六</p>
                    <br style='clear:both'/>
                </div>
                <div class="hfasr rew">
                    <span class="fufeis"></span>
                    <p class="fhw">免费</p>
                    <br style='clear:both'/>
                </div>

            </div>
        </div>
        <div class="zhuifher">
            <img src="${ctx}/activity/images/icon/zbf.png"/>
            <div class="tyueir">
                <b class="zubaf">主办方</b>
                <span class="bitoti">南宁青秀区文化馆</span>
                <p class="hfoaihwr">推动全民艺术普及，提供免费艺术培训，开展公益性的文化演出活动，满足辖区居民的文化需求！</p>
            </div>

        </div>

        <div class="conuter">
            <span class="fksakr">活动详情</span>
            <div class="congksjer">
                <span class="fhiuawhe freas">【活动简介】</span>
                <img class="fowimg" src="${ctx}/activity/images/icon/hodnogxq.jpg" data-preview-src=""
                     data-preview-group="1"/>
                <p class="fjioaw">
                    粤剧是糅合唱念做打、乐师配乐、戏台服饰、抽象形体的表演艺术。本次培训以粤剧基础性知识为主，包括粤剧的来源及发展知识、唱腔知识、击乐基础知识、舞台表演知识等。通过普及广东戏曲文化，扩大粤剧这一优秀传统文化的传播范围和影响力，让更多的青少年认识粤剧、了解粤剧、喜欢粤剧，进一步促进粤剧艺术的薪火相传。</p>
                <span class="fhiuawhe">【活动内容】</span>
                <span class="fhiuawhe safsdf">（1）活动安排</span>
                <p>课程名称：青少年粤剧基础培训</p>
                <p>时间：9月28日-11月2日每周六上午10：00-12：00、下午3：00-5：00（一周两期、共10期）（节假日除外）</p>
                <p>地点：青秀区文化馆民族宫分馆（南宁市民族大道49—2广西民族艺术宫5楼音乐厅东南角）</p>
                <p>对象：6岁-15岁</p>
                <p>名额：25人</p>
                <p>主讲：姚艳</p>
                <span class="fhiuawhe safsdf">（2）名师简介</span>
                <img class="fowimg" src="${ctx}/activity/images/icon/mingshijij1.jpg" data-preview-src=""
                     data-preview-group="1">
                <p class="fiwtest">
                    姚艳，国家一级演员，南宁市第六批青年优秀专业技术人才，南宁市优秀文艺家，邕剧、粤剧南派技艺清晰自然。她扮相俏丽，嗓音圆润甜美，舞台造型清新自然，表演风格细腻，戏路宽广，常把高难度的技艺融入人物形象的塑造之中，增强了舞台艺术表现力和戏剧观赏的美感，深受广大粤(邕)剧观众喜爱。多次代表南宁市参加全国、全区的各类文艺赛事，共夺取国家级2次，自治区级奖5次。并多次代表南宁市赴欧美、东南亚国家及港澳地区演出，被评为“南宁市优秀文艺家”。</p>

                <span class="fhiuawhe freas">【活动时间】</span>
                <p>9月28日-11月2日每周六上午10：00-12：00、下午3：00-5：00（一周两期、共10期）</p>
                <p>（节假日除外）</p>

                <span class="fhiuawhe freas">【参与方式】</span>
                <p class="fjioa">扫描关注青秀区文化馆微信公众号</p>
                <img class="erwema" src="${ctx}/activity/images/icon/erweima.jpg" data-preview-src=""
                     data-preview-group="1">
                <p class="fjioa">找到培训报名推文页面</p>
                <p class="fjioa">点击文末“阅读原文”进入报名页面，点击“我要报名”</p>
                <p class="fjioa">（活动咨询电话：5354185）</p>
                <span class="fhiuawhe freas">【交通路线】</span>
                <img class="fowimg" src="${ctx}/activity/images/icon/luoxiantu1.jpg" data-preview-src=""
                     data-preview-group="1">
            </div>

        </div>

        <div class="fjioawhroewe"></div>


    </div>
</div>

</body>
<script src="${ctx}/base/js/mui.js"></script>
<script src="${ctx}/base/js/mui.zoom.js"></script>
<script src="${ctx}/base/js/mui.previewimage.js"></script>
<script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
<script>
    mui.previewImage();
</script>
</html>