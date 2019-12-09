<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${ctx}/download/css/down.css?v=4"/>
</head>
<body>

<div class="down_box">
    <div id="androidId" style="display: none;">
        <div class="adro_but">
            <a id="androidBtn" data-clipboard-demo="" data-clipboard-action="copy"
               href="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(androidVersion.vDownloadUrl)!}"><img
                    src="${ctx}/download/images/adr@3x.png"></a>
        </div>
        <p>安卓当前版本号${(androidVersion.vName)!}</p>
    </div>
    <div id="isiOSId" style="display: none;">
        <div class="iph_but">
            <a id="iosBtn" data-clipboard-demo="" data-clipboard-action="copy" href="${ctx}/common/downloadIos"><img
                    src="${ctx}/download/images/iph2.png"></a>
            <!--<a id="iosBtn"  data-clipboard-demo=""  data-clipboard-action="copy" href="https://itunes.apple.com/cn/app/id1472462104"><img src="${ctx}/download/images/iph2.png" ></a>-->
        </div>
        <p>IOS当前版本号v${(iosVersion.vName)!}</p>
    </div>
</div>
<div class="maskDiv"><img id="maskDivImg" src="${ctx}/download/images/layer.29ffce19.png"></div>

<#--<button id="btnType" data-clipboard-demo=""  data-clipboard-action="copy"  style="display: none;">Copy</button>-->
</body>
<script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    var u = navigator.userAgent;
    // alert(u);
    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
    var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
    if (isAndroid) {
        $("#androidId").show();
    }
    if (isiOS) {
        $("#isiOSId").show();
    } else {
        $("#androidId").show();
    }

    $("#androidBtn").click(function () {
        var ua = navigator.userAgent.toLowerCase();
        if (ua.match(/MicroMessenger/i) == "micromessenger" ||
                ua.match(/AlipayDefined/i) == "alipaydefined") {
            $("#androidBtn").attr("href", "javascript:void(0);");
            $(".down_box").css({"z-index": "-1"});
            $(".maskDiv").show();
            $(".maskDiv img").show();
        }
    })

    $("#iosBtn").click(function () {
        var ua = navigator.userAgent.toLowerCase();
        if (ua.match(/AlipayDefined/i) == "alipaydefined") {
            $("#iosBtn").attr("href", "javascript:void(0);");
            // $(".down_box").css("z-index", "-1");
            $(".down_box").css({"z-index": "-1"});
            $(".maskDiv").show();
            $(".maskDiv img").show();
        }
    })

    $("#maskDivImg").click(function () {
        $(".down_box").css("z-index", "0");
        $(".maskDiv").hide();
        $(this).hide();
    })
</script>

<script src="${ctx}/download/js/clipboard.min.js?v=1"></script>
<script src="${ctx}/download/js/down.js?v=32"></script>
</html>
