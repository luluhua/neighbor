<!DOCTYPE html>
<html>
<head>
	<#include "../common/base.ftl">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>智慧党建</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
	<#--
	<link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
	<script src="${ctx}/base/js/mui.min.js"></script>
	-->
	<link href="${ctx}/dj/css/meeting.css" rel="stylesheet" />
	<#--
	<script type="text/javascript" charset="utf-8">
		mui.init();
		window.onload = function () {
			mui('.mui-scroll-wrapper').scroll({
				deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
			});
		}
	</script>
	-->
	<style type="text/css">
		.img-box{
            margin: 10px;
            padding: 5px;
            color: #C7C7CC;
		}

	</style>
</head>
	<body>
		<div class="top" style="height: 100px;">
            <div class="top_title">${entity.mtTheme!''}</div>
            <div class="top_left">
                时间：${entity.dtMeeting?string('yyyy-M-d HH:mm')!''}<br/>
                地址：${entity.address!''}<br/>
                类型：<@dictTag method="getChildValue" ptype="mt_classify" pvalue="${(entity.mtClassify)!}" value="${(entity.mtType)!}">${(getChildValue)!}</@dictTag>
            </div>
        </div>
		<#if entity.mtFile?? && entity.mtFile != ''>
		<#list entity.mtImgList as img>
		<div class="img-box">
			<img width="329px" src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${img!}">
		</div>
		</#list>
		</#if>
		<div class="content">
			${entity.mtContent!''}
		</div>
		
	</body>
</html>
