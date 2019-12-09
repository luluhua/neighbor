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
    <link href="${ctx}/bmfw/css/recreation.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
    </script>
</head>
<body>

<!-- 主界面菜单同时移动 -->
<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 页眉导航 -->
         <#if (tagslist?size>0)>
        <header class="mui-bar mui-bar-nav">
            <div class="saixuan">
                <a href="#popover" id="openPopover" class="">筛选<span
                        class="mui-icon mui-icon-arrowdown"></span></a>
            </div>
        </header>
         </#if>

        <!-- 主页面内容容器 -->

        <div id="kjfhaser" class="mui-content mui-scroll-wrapper">
            <input type="hidden" id="yjldkwae" value="${(pageNumber)!}">
            <div class="mui-scroll">
                <div class="box">
                    <div class="rec_info">
                         <#if (list.getRecords()?size>0)>
                             <ul class="fuser_ul" id="sdajk">
                              <#list list.getRecords() as list>
                                  <li>
                                      <a href="${ctx}/bmfw/etails/${(list.id)!}">
                                          <div class="img_vessel">
                                              <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(list.image1)!'--'}"
                                                   onerror="this.src='${ctx}/base/images/default.png'">
                                          </div>
                                          <div class="klaskle">
                                              <b> ${(list.title)!}</b>
                                              <p>
                                                <#if list.classifyId==70>
                                                    ${(list.titleSub)!}
                                                <#else >
                                                    ${(list.articleBrief)!}
                                                </#if>
                                              </p>
                                          </div>
                                          <div class="bfuihawre">
                                              <text>地址:</text>
                                              <span>${(list.location)!}</span>
                                          </div>
                                          <br style=" clear:both"/>
                                      </a>
                                          <#if (list.source)??>
                                          <div class="ydjaw">
                                              <div class="khfhwe">
                                                  <text>电话:</text>
                                                  <span class="phone_ye">${(list.source)!'暂无'}</span>
                                              </div>
                                          </div>
                                            <br style='clear:both'/>
                                          </#if>
                                  </li>
                              </#list>

                             </ul>
                         <#else >
                        <div class="zhanwu">
                            <img src="${ctx}/base/images/zhanwushuj.png">
                        </div>
                         </#if>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="popover" class="mui-popover">
    <form class="form-horizontal" id="form-recird" action="${ctx}/bmfw/recreationlist/${(claid)!}" method="post"
          onsubmit="return banduan()">
        <input type="hidden" id="search" name="search">
        <div class="fyuaiwre">


    <#list tagslist as tag>
        <#if tag.articleTags!="">
            <span class="<#if taglist?seq_contains("${(tag.articleTags)}")>bu2</#if>">${(tag.articleTags)}</span>
        </#if>
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
    mui('body').on('tap', 'a', function () {
        if ($(this).attr("href") != '#popover') {
            window.top.location.href = this.href;
        }
    });
    mui('.fyuaiwre').on('tap', 'span', function () {
        var er = $(this).attr('class');
        if (er == "" || er == null) {
            $(this).addClass("bu2");
        } else {
            $(this).removeClass("bu2");
        }
    });
    mui('.hfase').on('tap', '.bu1', function () {
        $(".fyuaiwre span").removeClass("bu2");
    });

    function banduan() {
        var ht = "";
        var a = $(".fyuaiwre .bu2");
        for (var i = 0; i < a.length; i++) {
            var ase = a[i].innerText;
            ht += ase + ",";
        }
        $("#search").val(ht);
    }

    mui.init({
        pullRefresh: {
            container: "#kjfhaser",
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
        pageNumber++;
        mui.ajax("/m/bmfw/recreationlists/${(claid)}?search=${(search)!}&pageNumber=" + pageNumber, {
            type: "post",
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.list.length; i++) {
                    var p_html = '';
                    if (data.list[i].classifyId == 70) {
                        p_html = data.list[i].titleSub == null ? "" : data.list[i].titleSub;
                    } else {
                        p_html = data.list[i].articleBrief == null ? "" : data.list[i].articleBrief;
                    }
                    if (data.list[i].source != "" && data.list[i].source != null) {
                        var html = '<li><a href="${ctx}/bmfw/etails/' + data.list[i].id + '">' +
                                ' <div class="img_vessel">' +
                                '<img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>' + data.list[i].image1 + '"onerror=this.src="${ctx}/base/images/default.png">' +
                                '</div>' +
                                '<div class="klaskle">' +
                                '<b>' + data.list[i].title + '</b>' +
                                '<p>' + p_html + '</p>' +
                                '</div>' +
                                '<div class="bfuihawre">' +
                                '<text>地址:</text>' +
                                '<span>' + data.list[i].location + '</span>' +
                                '</div>' +
                                '<div class="khfhwe">' +
                                '</a>' +
                                '<text>电话:</text>' +
                                '<span class="phone_ye">' + data.list[i].source + '</span>' +
                                '</div>' +
                                '<br style=" clear:both"/>' +
                                '</li>'
                    } else {
                        var html = '<li><a href="${ctx}/bmfw/etails/' + data.list[i].id + '">' +
                                ' <div class="img_vessel">' +
                                '<img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>' + data.list[i].image1 + '"onerror=this.src="${ctx}/base/images/default.png">' +
                                '</div>' +
                                '<div class="klaskle">' +
                                '<b>' + data.list[i].title + '</b>' +
                                '<p>' + p_html + '</p>' +
                                '</div>' +
                                '<div class="bfuihawre">' +
                                '<text>地址:</text>' +
                                '<span>' + data.list[i].location + '</span>' +
                                '</div>' +
                                '<br style=" clear:both"/>' +
                                '</a>' +
                                '</li>'
                    }
                    $("#sdajk").append(html);
                }

                $("#yjldkwae").val(data.pageNumber);
                if (data.list.length > 0) {
                    mui('#kjfhaser').pullRefresh().endPullupToRefresh(false);
                } else {
                    mui('#kjfhaser').pullRefresh().endPullupToRefresh(true);
                }
            }
        });
    }


    mui('#sdajk').on('tap', '.phone_ye', function () {
        var phone = $(this).text();
        window.location.href = 'tel:' + phone;
    });

</script>
</html>