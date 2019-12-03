<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <link href="${ctx}/zhdj/css/estudy.css" rel="stylesheet"/>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
        }
    </script>
    <!--<script type="text/javascript" src="https://lib.webfont.com/fastjs.min.js"></script>-->
    <!--<script type="text/javascript">
    $webfont.load("h1", "f879db5a58be4fa38a424c27930776d4", "LiDeBiao-Xing3");
    /*$webfont.load("#id1,.class1,h1", "14f77ca036594bcba23dca961ed52e92", "LiDeBiao-Xing3");*/
    $webfont.draw();
    </script>-->
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
                    <div class="conmuse_info">
                        <h2>${(entity.title)!}</h2>
                        <p>${(entity.articleContent)!}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="doeimg">
    <#if (entity.gotoUrl)??>
        <#if (entity.gotoUrl)!=''>
            <img onclick="ondownload();" src="${ctx}/zhdj/images/zhdjdownload.png"/>
       </#if>
    </#if>
</div>
</body>
<script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });

    $(function () {

    });
    // mui('body').on('tap', 'a', function () {
    //     window.top.location.href = this.href;
    // });
    function ondownload(){
        var downHref = {
            ios: 'https://itunes.apple.com/cn/app/id1193443741/',
            android: 'http://f21.tianyuimg.com/nae/app/p1299/android/dysex.apk?v2.3.22&amp;timestamp=1614'
        }
        var ua = navigator.userAgent;
        var what = (function(u) {
            if (/iPhone|iPod/i.test(u))
                return "ios";
            if (/Android/i.test(u))
                return "android";
        }(ua));
        var url = downHref[what];
        if (!url){
            return;
        }
        // mui.toast(what+"-"+url, {duration: '3500ms', type: 'div'});
        var iosDownUrl='https://itunes.apple.com/cn/app/id1193443741/';
        var iosJumpUrl='comndhyeducloudp1299://';
        var androidJumpUrl='com.nd.hy.android.educloud.p1299';
        var androidDownUrl="http://f21.tianyuimg.com/nae/app/p1299/android/dysex.apk?v2.3.22&amp;timestamp=1614'";

        if(what=="android"){
            nativeWeb.gotoAppDownUrlOrAppJumpUrl(androidDownUrl,androidJumpUrl)
        }else{
            nativeWeb.gotoAppDownUrlOrAppJumpUrl(iosDownUrl,iosJumpUrl)
        }
    }
</script>
</html>