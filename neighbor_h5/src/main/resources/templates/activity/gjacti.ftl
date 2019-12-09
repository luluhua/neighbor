<!DOCTYPE html>
<#include "../common/base.ftl">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui"/>
    <title>手上青秀</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <script src="${ctx}/activity/js/jquery.min.js"></script>
    <link href="${ctx}/activity/fullpage/dist/fullpage.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/layui.css">
    <link href="${ctx}/activity/css/activity1.css" rel="stylesheet"/>

    <script src="${ctx}/activity/fullpage/vendors/scrolloverflow.js"></script>
    <script src="${ctx}/activity/fullpage/dist/fullpage.js"></script>
    <script src="${ctx}/activity/fullpage/dist/fullpage.extensions.min.js"></script>
    <link href="${ctx}/activity/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet"/>
    <script src="${ctx}/activity/perfect-scrollbar/dist/perfect-scrollbar.js"></script>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/mui.zoom.js"></script>
    <script type="text/javascript" src="${ctx}/base/js/mui.picker.min.js"></script>
    <script src="${ctx}/base/js/mui.dtpicker.js"></script>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
    <script src="${ctx}/activity/js/activity.js?v=26"></script>
    <style>

        @media screen and (max-width: 1135px) {
            .fp-tableCell {
                font-size: .9em
            }
        }

        @media screen and (max-width: 1050px) {
            .fp-tableCell {
                font-size: .85em
            }
        }

        @media screen and (max-width: 700px), screen and (max-height: 500px) {
            .fp-tableCell {
                font-size: .8em
            }
        }

        .jdiowa b, .jdiowa span {
            display: block;
        }


    </style>
</head>
<body>
<div class="maskDiv" >
    <img id="maskDivImg" src="${ctx}/download/images/layer.29ffce19.png">
</div>
<div id="fullpage">
    <div class="section"><#include "activity_section1.ftl"></div>
    <div class="section"><#include "activity_section2.ftl"></div>
    <div class="section"><#include "activity_section3.ftl"></div>
    <div class="section"><#include "activity_section4.ftl"></div>
    <div class="section"><#include "activity_section7.ftl"></div>
</div>

</body>
<script type="text/javascript">
    var box = document.getElementById("box");
    var aImgs = box.getElementsByTagName("img");
    $(function () {
        //第一页，动画
        for (var i = 0; i < aImgs.length; i++) {
            aImgs[i].className = "on";
        }
        // 判断运行环境
        activity.verApp();
    })
</script>
<script>
    //页面切换--开始
    new fullpage('#fullpage', {
        //options here
        // sectionsColor: ['#f2f2f2', '#4BBFC3', '#7BAABE', 'whitesmoke', '#000'],
        navigationTooltips: ['fullPage', 'Open', 'Easy', 'Touch'],
        autoScrolling: true,
        scrollHorizontally: true,
        css3: true,
        scrollingSpeed: 1000,
        slidesNavigation: true,
        responsiveHeight: 330,
        normalScrollElements: '.fjioaj'
        // moveTo(wection,4){
        //
        // }
    });

    fullpage_api.setAllowScrolling(true);

    $('.fjioaj').each(function (i, ele) {
        new PerfectScrollbar(ele, {
            wheelPropagation: false,
            minScrollbarLength: 20,
            scrollYMarginOffset: 10
        });
    });
    //页面切换--结束
</script>
</html>