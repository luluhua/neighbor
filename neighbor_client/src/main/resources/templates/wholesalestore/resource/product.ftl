<!doctype html>
<html>
<head>
	 <#include "../../common/base.ftl">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>产品中心</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/style.css"/>
</head>

<script language="javascript" type="text/javascript">
    function showSubLevel(Obj) {
        Obj.className = "hover";
    }

    function hideSubLevel(Obj) {
        Obj.className = "";
    }
</script>

<body class="body_bg">

<!--联系我们-->
<#include "../base/contact.ftl">

<!--顶部-->
<#include "../base/topHtml.ftl">

<!--头部-->
<!--头部-->
<#include "../base/head.ftl">

<!--导航-->
<nav></nav>
<!--end-->

<!--产品-->
<div class="product" id="product">
    <!--筛选-->
    <div class="screening">
        <dl>
            <div class="menu">
                <ul>
                    <#list navigation as mun>
                        <li onmouseover="showSubLevel(this)" onmouseout="hideSubLevel(this)">
                            <a class="h-links" href="${ctx}/list/1?code=${(mun.code)!}">${(mun.navigationName)!}</a>
                            <ul>
                             <#list mun.tagList as tag>
                                 <li><a href="${ctx}/list/1?tag=${(tag.id)!}">${(tag.tagName)!}</a></li>
                             </#list>
                            </ul>
                        </li>
                    </#list>
                </ul>
            </div>
        </dl>
        <p class="total">共有 <b id="amount">${(pageData.total)!}</b> 个商品</p>
    </div>

    <div class="productA">
        <div class="left">
            <#if (pageData.getRecords()?size>0)>
            <ul id="prolist">
                <#list pageData.getRecords() as entity>
                    <li>
                        <a href="${ctx}/resource/particulars/${(entity.id)!}">
                            <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.images)!'--'}"
                                 onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                        </a>
                        <div class="fhhse">
                            <h3 class="h3">${(entity.name)!}</h3>
                            <h3>规格：${(entity.specification)!'--'}</h3>
                            <div class="bott">
                                <div class="lefts">
                                    <p>购买价：<#if entity.sellStale==0>不出售<#else >
                                        ￥<span> ${(entity.sellPrice)!'--'}</span></#if></p>
                                    <p>租借价：￥<span>${(entity.price)!}</span></p>
                                </div>

                                <div class="rights">
                                    <p class="p">收藏</p>
                                    <p>数量<span>${(entity.quantity)!}</span>件</p>
                                </div>
                            </div>
                        </div>
                    </li>
                </#list>
            </ul>
            <#else >
            <div class="fhae">
                <h1>暂无商品!<a href="${ctx}/resource/form">我要上传资源</h1>
            </div>
            </#if>

            <!--翻页-->
            <div class="page" style="display: ">
            <#include "../base/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="${ctx}/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&code=${code!}&tag=${tag!}"  />
            </div>
        </div>
        <div class="right_recomm">
            <h4>广告位</h4>
        </div>
    </div>
    <!--end-->
</div>

<!--底部-->
<#include "../base/footerHtml.ftl">
<!--end-->


</body>
</html>
