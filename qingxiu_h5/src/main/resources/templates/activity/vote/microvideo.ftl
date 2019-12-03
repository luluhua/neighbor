<!DOCTYPE html>
<#include "../../common/base.ftl">
<html>

<head>
    <meta charset="utf-8">
    <title>微视频投票</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!--标准mui.css-->
    <link href="${ctx}/activity/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${ctx}/activity/css/vote/microvideo.css">
    <script src="${ctx}/activity/js/jquery.min.js"></script>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/mui.zoom.js"></script>
    <script src="${ctx}/base/js/mui.previewimage.js"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.datashea').scroll({
                bounce: false,
                indicators: false,
                deceleration: 0.0005
            });
        }
    </script>
</head>

<body>

<div class="tousae">
    <img src="${ctx}/activity/images/activity/vote/weishipin.png"/>
</div>
<!-- 数据列表 -->
<div class="datashea">
    <div class="con_infolist">

        <div class="jfioae">
            <div class="info_search">
                <input type="text"/>
                <a class="mui-icon mui-icon-search"></a>
            </div>
            <b class="titlese">参赛作品</b>
            <div class="data-list" id="data1">
                <ul>
                    <li>
                        <a class="pop_up">
                            <span class="ranks">1</span>
                            <img src="${ctx}/activity/images/activity/vote/tupian.jpg"/>
                            <b class="title">创意机器人</b>
                            <b class="poll">12345票</b>
                            <a href="#" class="buttons">投票</a>
                        </a>
                    </li>
                    <li>
                        <a class="pop_up">
                            <span class="ranks">2</span>
                            <!--<img src="../images/activity/vote/tupian.jpg"/>-->
                            <video poster="${ctx}/activity/images/activity/vote/play-btn.png"
                                   src="${ctx}/activity/images/activity/vote/shipin.mp4"></video>
                            <b class="title">创意机器人</b>
                            <b class="poll">12345票</b>
                            <a href="#" class="buttons">投票</a>
                        </a>
                    </li>
                    <li>
                        <a class="pop_up">
                            <span class="ranks">3</span>
                            <img src="${ctx}/activity/images/activity/vote/cas.png"/>
                            <b class="title">创意机器人</b>
                            <b class="poll">12345票</b>
                            <a href="#" class="buttons">投票</a>
                        </a>
                    </li>
                    <li>
                        <a class="pop_up">
                            <span class="ranks">4</span>
                            <img src="${ctx}/activity/images/activity/vote/tupian.jpg"/>
                            <b class="title">创意机器人</b>
                            <b class="poll">12345票</b>
                            <a href="#" class="buttons">投票</a>
                        </a>
                    </li>
                    <li>
                        <a class="pop_up">
                            <span class="ranks">5</span>
                            <img src="${ctx}/activity/images/activity/vote/tupian.jpg"/>
                            <b class="title">创意机器人</b>
                            <b class="poll">12345票</b>
                            <a href="#" class="buttons">投票</a>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- 弹出层---开始  -->
<div id="middlePopover" class="mui-popover">
    <div class="popup_content">
        <div class="contet_info">
            <div class="img_info">
                <span class="ranks details">4</span>
                <div id="slider" class="mui-slider">
                    <div class="mui-slider-group mui-slider-loop">
                        <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
                        <div class="mui-slider-item mui-slider-item-duplicate">
                            <a href="#">
                                <img data-preview-src="" data-preview-group="1"
                                     src="${ctx}/activity/images/activity/vote/tupian.jpg">
                            </a>
                        </div>
                        <!-- 第一张 -->
                        <div class="mui-slider-item">
                            <a href="#">
                                <img data-preview-src="" data-preview-group="1"
                                     src="${ctx}/activity/images/activity/vote/tupian.jpg">
                            </a>
                        </div>
                        <!-- 第二张 -->
                        <div class="mui-slider-item">
                            <a href="#">
                                <img data-preview-src="" data-preview-group="1"
                                     src="${ctx}/activity/images/activity/vote/cas.png">
                            </a>
                        </div>
                        <!-- 第三张 -->
                        <div class="mui-slider-item">
                            <a href="#">
                                <img data-preview-src="" data-preview-group="1"
                                     src="${ctx}/activity/images/activity/vote/tupian.jpg">
                            </a>
                        </div>
                        <!-- 第四张 -->
                        <div class="mui-slider-item">
                            <a href="#">
                                <img data-preview-src="" data-preview-group="1"
                                     src="${ctx}/activity/images/activity/vote/tupian.jpg">
                            </a>
                        </div>
                        <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
                        <div class="mui-slider-item mui-slider-item-duplicate">
                            <a href="#">
                                <img data-preview-src="" data-preview-group="1"
                                     src="${ctx}/activity/mages/activity/vote/tupian.jpg">
                            </a>
                        </div>
                    </div>
                    <div class="mui-slider-indicator">
                        <div class="mui-indicator mui-active"></div>
                        <div class="mui-indicator"></div>
                        <div class="mui-indicator"></div>
                        <div class="mui-indicator"></div>
                    </div>
                </div>

                <!--<video controls poster="../images/activity/vote/play-btn.png" src="../images/activity/vote/shipin.mp4"></video>-->
            </div>
            <div class="ingfo_details">
                <b class="title_details">舞蹈献礼撒大苏打</b>
                <p>这是内容沙拉很疯狂哈桑的看法和十大发上来大家发乐山大佛和四大皆空符合实际扩大回复可就是大法撒旦
                    这是内容沙拉很疯狂哈桑的看法和十大发上来大家发乐山大佛和四大皆空符合实际扩大回复可就是大法撒旦
                    这是内容沙拉很疯狂哈桑的看法和十大发上来大家发乐山大佛和四大皆空符合实际扩大回复可就是大法撒旦
                </p>
            </div>
        </div>
        <div class="info_operation">
            <a class="oper_qux">取消</a>
            <a class="oper_inp">投票</a>
            <a class="yitou">已投票</a>
        </div>

    </div>
</div>
<!-- 弹出层---结束 -->
</body>

<script>
    //选项卡-- 开始
    $(".table_li b").click(function () {
        $(this).addClass("pitch_on").siblings().removeClass("pitch_on");
        var index = $(this).index();
        if (index == 0) {
            $("#data1").show();
            $("#data2").hide();
        } else {
            $("#data2").show();
            $("#data1").hide();
        }
        mui.init();
    })
    //选项卡-- 结束

    //弹出层-开始
    $(".buttons").click(function () {
        $("#middlePopover").addClass("mui-active");
        $("#middlePopover").show();
        $(".mui-popover-arrow").show();
    })
    // 关闭弹出层
    $(".oper_qux").click(function () {
        $("#middlePopover").removeClass("mui-active");
        $("#middlePopover").hide();
        $(".mui-popover-arrow").hide();
    })
    //弹出层-结束

</script>
<script>
    mui.previewImage();
</script>
</html>