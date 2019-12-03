<#include "../../common/base.ftl">
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
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <link href="${ctx}/dsflnterface/certificate/css/search.css" rel="stylesheet"/>
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
        <!--<nav class="mui-bar mui-bar-tab" id="nav">
            <div>
                 <input type="" placeholder="Aa"/>
                 <a href="javascript:;">发送</a>
                 </div>
             </nav>
 -->
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <form class="form-horizontal" id="form-recird" action="${ctx}/qingxiuh5/qcc/doSearchCertificate"
                          method="post"  onsubmit="return verification()">
                        <div class="search_info">
                            <span >公司名称<font color="red">*</font></span>
                            <input name="searchKey"  type="text" placeholder="输入全部公司名称查询" />
                            <input name="dtype" value="json" type="hidden">
                            <div style="color: red;margin-left: 20px;">
                                <#if (bindingResult)??>${(bindingResult)!}</#if>
                            </div>
                        </div>
                        <div class="search_submit">
                            <button type="submit">查询</button>
                            <div style="color: #b6b6b6;font-size: 13px;margin-top: 10px">查询条件提示：<br>
                                查询关键字（公司名称）
                                例如：小米科技有限责任公司
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div style="font-size: 13px;margin-left: 10px;margin-right: 10px;position:absolute;top:95%;color: #b6b6b6;text-align: center;width: 90%">
                数据来源【企查查-接口平台】
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

    function verification() {
        var info = $("#searchKey").val();
        if (info == "") {
            mui.toast('请填写公司名称', {duration: '3500ms', type: 'div'})
            return false;
        } else {
            return true;
        }
    }


</script>
</html>