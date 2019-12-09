<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>手上青秀</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/ssqx_introduce.css"/>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
</head>
<body>
    <img src="${ctx}/base/images/downloadIos.png" width="100%"/>
    <div class="r">
        <a href="itms-services://?action=download-manifest&url=<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(iosVersion.vDownloadUrl)!}"><img src="${ctx}/base/images/downloadIosBtn.png" ></a>

    </div>
</body>
<script>
    $(function () {
        nativeWeb.setWebViewCanGoBack(false);
    });
</script>
</html>
