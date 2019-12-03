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
            <img src="${ctx}/activity/images/icon/huoq1.png"/>
            <div class="huotose_lir">
                <b>二胡演奏培训</b>
                <div class="hfasr fsru">
                    <span class="didian"></span>
                    <p> 青秀区文化馆邕州书院分馆亲自书房</p>
                    <p>（南牛是凤岭南路1号邕州阁5楼）</p>
                    <br style="clear:both">
                </div>
                <div class="hfasr rews">
                    <span class="shijian"></span>
                    <p>9月8日-12月1日每周日</p>
                    <br style="clear:both">
                </div>
                <div class="hfasr rew">
                    <span class="fufeis"></span>
                    <p class="fhw">免费</p>
                    <br style="clear:both">
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
                <span class="fhiuawhe">【活动简介】</span>
                <p class="fjioaw">
                    本门培训主要从二胡构造和背景基本知识、专业演奏技巧、基础乐理知识等几个方面展开学习。通过趣味节奏、典型乐曲的欣赏对比正确理解与掌握二胡乐理知识，训练运指、运弓、连弓的准确性和灵活性，欣赏分析不同乐曲提升鉴赏能力、感受能力，从而提高二胡表现力。</p>
                <span class="fhiuawhe">【活动内容】</span>
                <span class="fhiuawhe safsdf">（1）活动安排</span>
                <p>课程名称：二胡演奏培训</p>
                <p>时间：9月8日-12月1日每周日下午3：00-5：00（共10期）（节假日除外</p>
                <p>地点：青秀区文化馆邕州书院分馆亲子书房（南宁市凤岭南路1号邕州阁5楼）​</p>
                <p>对象：16岁-45岁</p>
                <p>名额：25人</p>
                <p>主讲：百里耽</p>
                <p>（注：因二胡数量有限，仅能向部分无乐器的学员提供，请有乐器的学员参加培训时自行携带。）</p>
                <span class="fhiuawhe safsdf">（2）名师简介</span>
                <img class="fowimg" data-preview-src="" data-preview-group="1"
                     src="${ctx}/activity/images/icon/mingshi1.jpg">
                <p class="fiwtest">百里耽，解放军艺术学院硕士研究生毕业，中国林业文工团常任指挥、清华大学附属中学金帆乐团助理指挥。</p>
                <p class="fiwtest">2003获民族管弦乐学会“龙音杯”民族乐团邀请赛，特别奖。2010年第六届中华文化艺术节，金质奖。2015年作品《弦乐四重奏：英雄的影子》（《Die Schatten
                    der Helden》）获得第64届德国慕尼黑国际音乐比赛，作品银奖。2016年作品《马骨胡、二胡二重奏：柒仔搭歌》获得“金胡琴奖”，优秀作品奖、最佳人气奖，两项大奖。</p>
                <p class="fiwtest">创作的民族管弦乐曲作品有《森林跳跳》、《旧年》，室内乐作品有《九月》、《化妆》等。为民族管弦乐队编配数百首作品；为基层部队创作大量的“团歌”、“连歌”等歌曲。</p>
                <span class="fhiuawhe freas">【活动时间】</span>
                <p>9月8日-12月1日每周日下午3：00-5：00（共10期）</p>
                <p>（节假日除外）</p>
                <span class="fhiuawhe freas">【活动地点】</span>
                <p>青秀区文化馆邕州书院分馆亲自书房（南牛是凤岭南路1号邕州阁5楼）</p>
                <span class="fhiuawhe freas">【参与方式】</span>
                <p class="fjioa">扫描关注青秀区文化馆微信公众号</p>
                <img class="erwema" src="${ctx}/activity/images/icon/erweima.jpg" data-preview-src=""
                     data-preview-group="1">
                <p class="fjioa">找到培训报名推文页面</p>
                <p class="fjioa">点击文末“阅读原文”进入报名页面，点击“我要报名”</p>
                <p class="fjioa">（活动咨询电话：5354185）</p>
                <span class="fhiuawhe freas">【交通路线】</span>
                <img class="fowimg" src="${ctx}/activity/images/icon/jiaotong.jpg" data-preview-src=""
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