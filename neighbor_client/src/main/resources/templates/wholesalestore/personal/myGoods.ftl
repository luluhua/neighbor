<#include "../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/style.css"/>
    <link href="${ctx}/base/js/layui/css/layui.css" rel="stylesheet"/>
</@header>
<@js>
</@js>
<@body>


<!--联系我们-->
    <#include "../base/contact.ftl">

<!--顶部-->
    <#include "../base/topHtml.ftl">

<!--会员中心-头部-->
    <#include "../base/personalTop.ftl">

<!--会员中心-内容-->
<div class="member_cent">
     <#include "../base/personalLeft.ftl">

    <div class="right">
 <#include "../base/userInfo.ftl">
        <div class="common_border  layui-form">
            <h3 id="h3">
                <p>我的资源</p>
                <p class="p">共 <b id="collectProduct">${(resource?size)!}</b> 件</p>
            </h3>

            <!--没有产品时的页面-->
            <#if (resource?size) ==0>
            <div class="order_none">
                <p>您没有发布资源，<a href="${ctx}/resource/form">去发布　！＞＞</a></p>
            </div>
            <#else >
            <ol id="collections" class="collection">
                <#list resource as resource>
                    <li>
                         <#if resource.isDeleted==1 || resource.status==1>
                            <span class="de_sign"></span>
                         </#if>
                        <div class="coll_div">
                            <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(resource.images)!'--'}"
                                 onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                        </div>
                        <div class="re-name">
                            <h3>${(resource.name)!}</h3>
                        </div>
                        <div class="re-operation">
                            <a href="${ctx}/resource/re_edit/${(resource.id)!}" class="bjit">编辑</a>
                            <#if resource.status==0>
                                <a data-toggle="tooltip" title="删除" data-placement="bottom"
                                   data-tiggle="ajax"
                                   data-submit-url="${ctx}/resource/operation/${(resource.id)!}?status=1"
                                   data-confirm="您确定要下架该条资源吗?" class="caoz">下架</a>
                            <#else >
                            <a data-toggle="tooltip" title="删除" data-placement="bottom"
                               data-tiggle="ajax"
                               data-submit-url="${ctx}/resource/operation/${(resource.id)!}?status=0"
                               data-confirm="您确定要上架该条资源吗?" class="caoz">上架</a>
                            </#if>

                        </div>
                        <a class="delete-re" data-toggle="tooltip" title="删除" data-placement="bottom"
                           data-tiggle="ajax"
                           data-submit-url="${ctx}/resource/doDelete/${(resource.id)!}"
                           data-confirm="您确定要删除该条资源吗?"></a>
                    </li>
                </#list>
            </ol>
            </#if>
        </div>
    </div>
    <!--end-->
</div>
<!--底部-->
    <#include "../base/footerHtml.ftl">
<!--end-->

</@body>
<@footer>
<script src="${ctx}/base/js/init.js" type="text/javascript"></script>
</@footer>
