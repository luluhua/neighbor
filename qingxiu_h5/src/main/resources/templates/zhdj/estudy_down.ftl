<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
</head>
<body>
   <button id="j_app" data-href="${(entity.gotoUrl)!}" onclick="todown(); " style="display:none;" >立即下载</button>
  <a href="#" id="j_openApp" style="display:none">立即下载</a>
</body>
<script type="text/javascript">
    $(function(){
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
        if (!url)
            return;
        if(what=="android"){
            $('#j_app').trigger("click");
            nativeWeb.dowmLoadApp(url);
        }
        var app = document.getElementById('j_app');
        app.href = url;
        var itunes = url.replace(/^https?/i, "itms-apps");
        if (/^itms-apps:\/\/itunes\.apple\.com\/.*$/.test(itunes)) {
            var o = document.getElementById('j_openApp');
            o.href = itunes;
            var e = document.createEvent('Event');
            e.initEvent('click', false, false);
            o.dispatchEvent(e);
        }
    })
function todown() {
    window.location.href=$("#j_app").attr("data-href");
}
</script>
</html>