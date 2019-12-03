<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<title></title>
		<link rel="stylesheet" type="text/css" href="/app/css/down.css"/>
	</head>
	<body>
		<div class="down_box">
			
			<div class="adro_but">
				<a href="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(androidVersion.vDownloadUrl)!}"><img src="../images/download/adr@3x.png" ></a>
			</div>
			<p>安卓当前版本号v${(androidVersion.vName)!}</p>
			<div class="iph_but">
				<img src="../images/download/iph@3x.png" onclick="alrt();" >
			</div>
						
			
		</div>
	<script type="application/javascript">

		function alrt() {
			alert("暂未开放");
        }
	</script>
	</body>
</html>
