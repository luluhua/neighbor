<!DOCTYPE html>
<#include "../../common/base.ftl">
<html>

<head>
    <meta charset="utf-8">
    <title>中小学创意大赛投票</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!--标准mui.css-->
    <link href="${ctx}/activity/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${ctx}/activity/css/vote/creativity.css">
    <script src="${ctx}/activity/js/jquery.min.js"></script>
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
    <link href="${ctx}/activity/css/vote/video-js.min.css" rel="stylesheet">


</head>

<body>
<div class="maskDiv">
    <img id="maskDivImg" src="${ctx}/download/images/layer.29ffce19.png">
</div>
<div>
    <!-- 类型 -->
    <div class="area_table">
        <input type="hidden" id="yjldkwae" value="${(pageNumber)!}">
        <div class="table_li">
            <a class="<#if workgrouptype==0>pitch_on</#if>"
               href="${ctx}/activity/creativityvote?workgroup=A组（小学组）">A组（小学组）</a>
            <a class="<#if workgrouptype==1>pitch_on</#if>"
               href="${ctx}/activity/creativityvote?workgroup=B组（中学组）">B组（中学组）</a>
        </div>
    </div>
    <div class="data_search">
        <div class="mui-input-row mui-search">
            <input type="search" name="search" id="search"
                   class="mui-input-clear" data-input-clear="1"
                   data-input-search="1" value="<#if (search)??>${(search)!}</#if>"
                   placeholder="输入学生姓名或作品名称或编码进行搜索">
            <button class="btn btn-success" id="search_from">搜索</button>
        </div>
    </div>

    <!-- 数据列表 -->
    <div class="datashea" id="datashea">
        <div>
            <div class="data-list" id="data1">
            <#if  enrollList?? && (enrollList?size == 0)>
                <ul id="noDataId" style="text-align: center;"><span
                        style="color: #fff;text-align: center;">暂未搜索到相关作品</span></ul></#if>
                <ul id="datalist">
                <#list enrollList as renroll>
                    <li>
                        <a class="pop_up" id="${(renroll.id)!}" title="${(renroll.n)}">
                            <span class=" ranks">${(renroll.n)!}</span>
                       <#if "${(renroll.workPath)!}"?index_of(".mp4")!=-1
                       ||"${(renroll.workPath)!}"?index_of(".MP4")!=-1
                       ||"${(renroll.workPath)!}"?index_of(".mov")!=-1
                       ||"${(renroll.workPath)!}"?index_of(".MOV")!=-1>
                       <video poster=""
                              src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(renroll.smimg)!}"></video>
                       <img class="fawe" title="${(renroll.id)}"
                            src="${ctx}/activity/images/activity/vote/play-btn.png">
                       <#else >
                        <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(renroll.smimg)!}"/>
                       </#if>
                            <b class="title">${(renroll.workName)!}</b>
                            <b class="poll">${(renroll.sum)!}票</b>
                        <#--<span class="buttons">投票</span>-->
                            <span class="buttons">查看</span>
                        </a>
                    </li>
                </#list>
                </ul>
            </div>

        </div>
    </div>
    <div id="middlePopover" class="mui-popover">
        <div class="popup_content">
            <div class="contet_info">
                <div class="img_info">
                    <span class="ranks details" id="ranking"></span>
                    <div id="img_slider" class="mui-slider">
                        <div class="mui-slider-group" id="imglist">
                            <div class="mui-slider-item"><a href="#"><img src=""/></a></div>

                        </div>

                    </div>
                    <video id="video" class="video-js " controls preload="none">
                        <source id="video_f" src="" type='video/mp4'/>
                    </video>


                    <span class="ing_index" id="ing_index"></span>
                </div>

                <div class="ingfo_details" style="position: relative;">
                    <div style="position: absolute; left: 0; top: 0; right: 0; bottom: 0;">
                        <b class="title_details" id="workName"></b>
                        <div class="fnlase">
                            <b>学校/机构：<span id="affilia"></span></b>
                            <b>指导老师：<span id="instruc"></span></b>
                        </div>
                        <div class="user_info">
                            <b>姓名：<span id="username"></span></b>
                            <b>年龄：<span id="age"></span></b>
                        </div>

                        <div id="workDescription">

                        </div>
                    </div>

                </div>


            </div>
            <div class="info_operation">
                <input type="hidden" id="craid">
                <a class="oper_qux" href="#" href="javascript:;">取消</a>
            <#--<a class="oper_inp" id="form_vier" href="javascript:;" onclick="fsklr()">投票</a>-->
            <#--<a class="yitou" id="yitoule" href="javascript:;">已投票</a>-->
                <a class="yitou" id="tpjzId" href="javascript:;">投票截止</a>
            </div>

        </div>
    </div>
</div>
<script src="${ctx}/activity/js/video.min.js"></script>
<script src="${ctx}/base/js/mui.min.js"></script>
<script src="${ctx}/base/js/mui.zoom.js"></script>
<script src="${ctx}/base/js/mui.previewimage.js"></script>
<script src="${ctx}/activity/js/vote.js"></script>
<link href="${ctx}/activity/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet"/>
<script src="${ctx}/activity/perfect-scrollbar/dist/perfect-scrollbar.js"></script>

<script>
    $(function () {
        vote.verApp();
    });


    $('.ingfo_details').each(function (i, ele) {
        new PerfectScrollbar(ele, {
            wheelPropagation: false,
            minScrollbarLength: 20,
            scrollYMarginOffset: 10
        });
    });

    //投票--开始
    function fsklr() {
        var openUrl = '${(DownloadUrl)!}';
        var androidDownUrl = '${(AndroidDownloadUrl)!}';
        var iosOpenDownUrl = '${(IOSDownloadUrl)!}';
        vote.voteApp(openUrl, androidDownUrl, iosOpenDownUrl, '${ctx}');
    }

    //投票结束
    //详情
    mui('body').on('tap', '.pop_up', function () {
        var id = $(this).attr('id');
        var title = $(this).attr('title');
        $("#craid").val(id);
        $.ajax({
            async: true,
            type: "POST",
            url: '${ctx}/activity/microvideo/' + id,
            headers: {token: window._gToken},
            dataType: "json",
            success: function (json) {
                $("#workName").html(json.workName);
                $("#workDescription").html(json.workDescription);
                $("#ranking").html(title);
                $("#age").html(json.age);
                $("#username").html(json.username);
                $("#affilia").html(json.affiliation);
                $("#instruc").html(json.instructor);
                // if (json.isvote == 0) {
                //     $("#form_vier").show();
                //     $("#yitoule").hide();
                // } else {
                //     $("#form_vier").hide();
                //     $("#yitoule").show();
                // }
                //投票截止
                $("#form_vier").hide();
                $("#tpjzId").show();

                var imglist = "";
                if (json.fileType == 0) {
                    $("#ing_index").html("共" + json.workPath.length + "张图片");
                    for (var i = 0; i < json.workPath.length; i++) {
                        imglist += '<div class="mui-slider-item"><a href="#"><img data-preview-src="" data-preview-group="1" src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>' + json.workPath[i] + '"/></a></div>'
                    }
                    $("#imglist").html(imglist);
                    $("#video_f").hide();
                    $("#img_slider").show();
                } else {
                    $("#video_f").attr("src", "<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>" + json.workPath);
                    $("#img_slider").hide();
                    $("#video_f").show();

                    var story_sources = [{
                        type: "video/mp4",
                        src: "<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>" + json.workPath
                    }];
                    var story_player = videojs('video');
                    story_player.ready(function () {
                        var obj = this;
                        obj.src(story_sources);
                        obj.load();
                        obj.controls(true);
                        obj.autoplay(true);
                    });
                }
                $("#middlePopover").addClass("mui-active");
                $("#middlePopover").show();
                $(".mui-popover-arrow").show();
                $("#form_vier").attr("href", "${ctx}/activity/form_video/" + id)
                mui.init();
                $(".ingfo_details").scrollTop(1);
                ;
            }
        })

    });


    /* 点击视频时 暂停/开始 */
    mui('.mui-popover').on('tap', 'video', function () {
        var video1 = document.getElementById("video_html5_api");
        if (video1.paused) {
            this.play();
        } else {
            this.pause()
        }
    });
    /* 点击图标后视频 暂停/开始 */
    mui('.mui-popover').on('tap', '.vjs-play-control', function () {
        var video3 = document.getElementById("video_html5_api");
        if (video3.paused) {
            video3.play();
        } else {
            video3.pause()
        }
    });

</script>

<script type="text/javascript" charset="utf-8">

    window.onload = function () {
        mui('.datashea').scroll({
            bounce: false,
            indicators: false,
            deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
        });
    }
    mui('.table_li').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });
    mui('.data_search').on('tap', 'a', function () {
        window.top.location.href = "";
    });

    $("#search_from").click(function () {
        var search = $("#search").val();
        window.top.location.href = "${ctx}/activity/creativityvote?workgroup=${(workgroup)!}&pageNumber=1&search=" + search;

    })


    //上拉加载-开始
    mui.init({
        pullRefresh: {
            container: "#datashea",
            up: {
                height: 50,
                auto: false,
                contentrefresh: "正在加载...",
                contentnomore: '没有更多数据了',
                callback: pulluploading,

            }
        }
    });

    function pulluploading() {
        var pageNumber = $("#yjldkwae").val();
        var search = $("#search").val();
        pageNumber++;

        mui.ajax("${ctx}/activity/nextpage?workgroup=${(workgroup)!}&pageNumber=" + pageNumber + "&search=" + search, {
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data.enrollList.length > 0) {
                    $("#noDataId").hide();
                }
                for (var i = 0; i < data.enrollList.length; i++) {
                    var liLength = $("#datalist").find('li').length + 1;
                    var vodeorimg = "";
                    var isvode = "";

                    var html = '<li>' +
                            '<a class="pop_up" id="' + data.enrollList[i].id + '" title="' + data.enrollList[i].n + '">' +
                            '<span class=" ranks">' + data.enrollList[i].n + '</span>';
                    if (isvideo(data.enrollList[i].smimg)) {
                        vodeorimg = '<video poster="" src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>' + data.enrollList[i].smimg + '"></video>'
                        '<img class="fawe" title="' + data.enrollList[i].id + '" src="${ctx}/activity/images/activity/vote/play-btn.png">';

                    } else {
                        vodeorimg = '<img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>' + data.enrollList[i].smimg + '"/>'
                    }
                    // var html1 = '<b class="title">' + data.enrollList[i].username + '</b>' +
                    // var html1 = '<b class="poll">' + data.enrollList[i].sum + '票</b>';
                    // if (data.vote.activityId == data.enrollList[i].id) {
                    //     isvode = '<span class="buttons yitou">投票</span>'
                    // } else {
                    //     isvode = '<span class="buttons">查看</span>'
                    // }
                    var html1 = '<b class="title">' + data.enrollList[i].workName + '</b>' + '<b class="poll">' + data.enrollList[i].sum + '票</b>';
                    isvode = '<span class="buttons">查看</span>'
                    var listhtml = html + vodeorimg + html1 + isvode;
                    $("#datalist").append(listhtml);

                }


                $("#yjldkwae").val(data.pageNumber);
                if (data.enrollList.length > 0) {
                    mui('#datashea').pullRefresh().endPullupToRefresh(false);
                } else {
                    mui('#datashea').pullRefresh().endPullupToRefresh(true);
                }
            }
        });
    }

    //上拉加载--结束

</script>


<script>
    mui.previewImage();
</script>
</body>

</html>