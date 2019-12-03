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
    <link href="${ctx}/bmfw/css/conveniencelist.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
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
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <form action="${ctx}/bmfw/list/${(claid)!}" method="post"
                          class="form-inline">
                        <div class="search_info">
                            <span class="mui-icon  mui-icon-search"></span>
                            <input type="text" name="search" value="${(search)!}" placeholder="搜索"/>
                            <button type="submit">查询</button>
                        </div>
                    </form>
                    <div class="jhgsja">
                        <#if (list?size>0)>
                            <ul>
                            <#list list as list>
                                <li name="${(list.id)!}">
                                    <div>
                                        <a href="${ctx}/bmfw/etails/${(list.id)!}">
                                            ${(list.title)!}
                                        </a>
                                        <span class="mui-icon mui-icon-arrowright"></span>
                                    </div>
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
</body>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });
    mui('.jhgsja').on('tap', 'li', function () {
        var id = $(this).attr('name')
        window.top.location.href = "${ctx}/bmfw/etails/" + id;
    });


</script>
</html>