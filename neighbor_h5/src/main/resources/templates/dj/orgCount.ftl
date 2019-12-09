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
    <script src="${ctx}/base/js/jquery-1.12.4.min.js"></script>
<#--
<link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
<script src="${ctx}/base/js/mui.min.js"></script>
-->
	<link href="${ctx}/dj/css/tj.css" rel="stylesheet" />
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
</head>
	<body>
		<div class="top">
			<span></span>
			<div style="padding-top: 20px;">${parent.name!'最高机构'}及其下属机构</div>
		</div>
		<div class="content">
			<table cellspacing="0" cellpadding="0" border="0">
				<tr class="table-fir">
				<th width="50%">组织机构</th>
				<th width="25%" class="te">党员人数</th>
				<th width="25%" class="te">会议次数</th>
				</tr>
				<#list countList as item>
				<tr>
					<td class="te-t">${item.name}</td>
					<td class="te">${item.memberCount}</td>
					<td class="te">${item.meetingCount}</td>
				</tr>
				</#list>
			</table>
			
		</div>
	</body>
</html>
