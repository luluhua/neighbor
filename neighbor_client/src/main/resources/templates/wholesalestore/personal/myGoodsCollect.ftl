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
                <p>我的收藏</p>
                <p class="p">共 <b id="collectProduct">${(list?size)!}</b> 件</p>
            </h3>

            <!--没有产品时的页面-->
            <#if (list?size) ==0>
            <div class="order_none">
                <p>您没有收藏任何资源！！</p>
            </div>
            <#else >
            <ol id="collections" class="collection">
                <#list list as list>
                    <li>
                        <#if list.isDeleted==1 || list.status==1>
                            <span class="de_sign"></span>
                        </#if>

                        <a <#if list.isDeleted==1 || list.status==1>href="javascript:;"
                           <#else>href="${ctx}/resource/particulars/${(list.goodsId)!}"</#if>>
                            <div class="coll_div">
                                <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(list.goodsImages)!'--'}"
                                     onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                            </div>
                            <div class="re-name">
                                <h3>${(list.goodsName)!}</h3>
                            </div>
                            <a class="delete-re" data-toggle="tooltip" title="删除" data-placement="bottom"
                               data-tiggle="ajax"
                               data-submit-url="${ctx}/goodsCollect/delete/${(list.id)!}"
                               data-confirm="您确定要取消收藏该条资源吗?"></a>
                        </a>
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
