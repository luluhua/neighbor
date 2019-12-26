<!doctype html>
<html>
<head>
            <#include "../../common/base.ftl">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/style.css"/>
    <script type="text/javascript" src="${ctx}/wholesalestore/js/jquery-1.8.3.min.js"></script>
</head>


<body class="body_bg">
<!--产品评价-->
<#if (pageData.getRecords()?size>0)>
<ul id="comments">
    <#list pageData.getRecords() as entity>
        <li class="fhjuse">
            <div class="comments_left">
                <p>${(entity.explains)!}</p>
                <h3>
                    <span>${(entity.dtCreate?string('yyyy/MM/dd HH:mm:ss'))!}</span>
                </h3>
                <h4>
                       <#list entity.files?split(",") as fi>
                           <img data-magnify="gallery" data-group="${(entity.id)!}"
                                data-src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${fi}"
                                src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${fi}">
                       </#list>
                </h4>
            </div>
            <div id="${(entity.id)!}"></div>
            <script>
                //渲染
                layui.use('rate', function () {
                    var rate = layui.rate;
                    var ins1 = rate.render({
                        elem: '#${(entity.id)!}',  //绑定元素
                        length: 5,
                        value:${(entity.score)!0},
                        theme: '#ed6e37',
                        readonly: true
                    });
                });
            </script>
            <div class="comments_right">


                <p>${(entity.serName)!'匿名'}</p>
            </div>
        </li>
    </#list>
</ul>

<div class="page pageA" style="display:" id="pages">
    <#include "../base/paginate.ftl" />
 			<@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/grade/list/" urlParas="?goodsId=${goodsId!}"  />

</div>
<#else >
<b class="zupl">暂无评论！</b>
</#if>
<script>

</script>
</body>
</html>
