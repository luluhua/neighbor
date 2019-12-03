<html>
<head>
    <link rel="shortcut icon" href="/base/images/iPhone1024@2x.png">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="/plugins/mui/css/iconfont_mine.css">
    <title>我的</title>
</head>
<body style="background-color: #FFFFFF;padding: 0px">
<img src="/images/h5/top-bg_s.png" width="100%" height="200px">

<div class="layui-row"
     style="padding: 10px;background-color: #ffffff;margin-bottom: 15px;margin-top: -20px;margin-left: 10px;margin-right:10px;margin-bottom: 10px;box-shadow: 0px 20px 62px 0px #dfe8f4;border-radius: 6px;">
    <div class="layui-col-xs3"><img
            src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(sysUser.avatarUrl)!}"
            width="70px" height="70px"></div>
    <div class="layui-col-xs5">
        <div style="font-size: 20px;margin-top: 10px">${(sysUser.realname)!}</div>
        <div style="height: 5px"></div>
        ID：${(sysUser.id)!}
    </div>
    <div class="layui-col-xs4" style="margin-top: 13px;">
    <#--<img src="../../static/images/h5/turnBackToApp_s.png" width="90px" height="50px">-->
    </div>
</div>
<div class="row"
     style="background-color: #ffffff;margin-bottom: 15px;margin-top: 10px;margin-left: 10px;margin-right:10px;margin-bottom: 10px;box-shadow: 0px 20px 62px 0px #dfe8f4;border-radius: 6px;">
    <div style="padding: 10px;">
        <span class='mui-icon mine-icon icon-dianhua'></span>&nbsp;&nbsp;电话：<@commonTags method="getDecrypt3DEs" type="1" value="${(sysUser.mobile)!}">
        ${(getDecrypt3DEs)!}</@commonTags>
        <div style="margin-top: 10px;border-bottom: 1px dashed #E3E3E3;"></div>
    </div>
    <div style="margin-top: 0px;margin-left: 10px;margin-right: 10px">
        <span class='mui-icon mine-icon icon-bumen'></span>&nbsp;&nbsp;部门：${(sysOrg.name)!'--'}
        <div style="margin-top: 10px;border-bottom: 1px dashed #E3E3E3;"></div>
    </div>
    <div style="margin-top: 10px;margin-left: 10px;margin-right: 10px;height: 50px">
        <span class='mui-icon mine-icon icon-qiyeguanli_gangweiguanli'></span>&nbsp;&nbsp;岗位：${(sysRole)!}
        <div style="margin-top: 10px;border-bottom: 1px dashed #E3E3E3;"></div>
    </div>
</div>
</body>
</html>