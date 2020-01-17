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
        <div class="common_border">
            <h3 id="h3">
			<span id="xings">
				<p class="spanxiang" onclick="myMessage()">收件箱</p>
				<p onclick="mysendmailbox()">发件箱</p>
				</span>
                <p class="p">共 <b id="totalCount">${(pageData.total)!}</b> 条消息</p>
            </h3>
            <#if (pageData.records?size>0) >
                    <ol class="massage_ol">
                        <#list pageData.getRecords() as list>
                            <li>
                                <h3>
                                      <#if list.status==0>
                                    <b></b>
                                      </#if>
                                    <p>系统消息</p>
                                    <p>${(list.userName)!}</p>
                                    <span>${(list.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</span>
                                </h3>
                                <h4>${(list.content)!}</h4>
                                <a class="dialog" href="javascript:;" data-title="与 ${(list.userName)!} 聊天"
                                   data-url="${ctx}/message/edit/${(list.sender)!}" data-width="770" data-height="700"
                                   data-toggle="tooltip" title="与 ${(list.userName)!} 聊天"
                                   data-placement="bottom">了解详情</a>
                            </li>
                        </#list>
                    </ol>
            <#else >
                      <div class="order_none coupons massage_none" id="noNews">
                          <p>您暂时还没有消息 !</p>
                      </div>
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
<script src="${ctx}/base/js/x-layui.js" type="text/javascript"></script>
</@footer>
