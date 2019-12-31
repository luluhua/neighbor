<!doctype html>
<html>
<head>
    <#include "../../common/base.ftl">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>个人资料</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/style.css"/>
    <script type="text/javascript" src="${ctx}/wholesalestore/js/common.js"></script>
</head>


<body class="body_bg">

<!--联系我们-->
<#include "../base/contact.ftl">

<!--顶部-->
<#include "../base/topHtml.ftl">

<!--会员中心-头部-->
<#include "../base/personalTop.ftl">

<!--会员中心-内容-->
<div class="member_cent">
    <div class="left">
        <p>个人中心</p>
        <ul class="menu_ul">
            <li><a href="member_data.html" class="menu_a">个人资料</a></li>

            <li><a href="member_add.html">收货地址</a></li>

            <li><a href="member_collection.html">我的收藏</a></li>

            <li><a href="member_Goid.html">我的金币</a></li>

            <li><a href="member_coupons.html">我的优惠券</a></li>

            <li><a href="member_message.html">我的消息</a></li>

            <li><a href="member_password.html">修改密码</a></li>

            <li><a href="member_store.html">认证信息</a></li>

            <li><a href="member_return.html">退货/退款</a></li>
        </ul>
    </div>

    <div class="right">
        <dl>
            <dd>
                <a href="member_picture.html"><img
                        src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(info.avatarUrl)!}"
                        onerror="this.src='${ctx}/base/images/default.jpg'" title="修改头像"></a>
                <p>
                    <span><b> ${(me.userName)!}</b></span>
                </p>
            </dd>
            <dt>
                <a href="member_Allorders.html">未完成订单<b>0</b></a>
            </dt>

            <dt>
                <a href="member_collection.html">收藏的产品<b>0</b></a>
            </dt>
        </dl>

        <div class="common_border">

            <h3 id="h3">
                <p>个人资料</p>
            </h3>

            <ol class="data_ol">

                <li>

                    <div class="common_fl name">
                        <p>昵称：</p>

                        <span>${(info.nickname)!"您还没有填写昵称!"}</span>

                        <a href="javascript:xiugaininc();">修改</a>
                    </div>

                    <div class="common_fl name_hidden">
                        <p>昵称：</p>

                        <input type="text" id="modifyNickname" placeholder="输入昵称" class="text">

                        <a href="javascript:name_hidden()" class="name_qx">取消</a>

                        <a href="javascript:void" onclick="modifyNickname()">确定</a>
                    </div>
                </li>

                <li>
                    <div class="common_fl gender">
                        <p>性别：</p>
                        <span id="gender_sex">
                        <#if info??>
                        <#if info.gender==1>男<#elseif info.gender==2>
                            女</#if>
                        <#else >
                             未填写
                        </#if>
                        </span>
                        <a href="javascript:gender()">修改</a>
                    </div>

                    <div class="common_fl gender_hidden">
                        <p>性别：</p>

                        <fieldset>
                            <input type="radio" name="sex" value="1"/>男

                            <input type="radio" name="sex" value="2"/>女

                        </fieldset>

                        <a href="javascript:gender_qx()" class="gender_qx">取消</a>

                        <a href="javascript:void" onclick="modifyGender()">确定</a>
                    </div>

                </li>

                <li>
                    <div class="common_fl email">
                        <p>邮箱：</p>

                        <span id="email"></span>

                        <a href="javascript:email()">修改</a>
                    </div>

                    <div class="common_fl email_hidden">
                        <h4>
                            <p>邮箱：</p>

                            <input type="text" id="newEmail" placeholder="输入邮箱" class="text">
                        </h4>
                        <h4>
                            <p>验证码：</p>
                            <input type="text" id="emailCode" placeholder="输入验证码" class="text text_phone">

                            <button id="emailVerificationCode" onclick="emailVerificationCode()">获取验证码</button>
                        </h4>
                        <a href="javascript:email_qx()" class="email_qx">取消</a>

                        <a href="javascript:void" onclick="modifyEmail()">确定</a>
                    </div>
                </li>
            </ol>
        </div>
    </div>

    <!--end-->
</div>


<<#include "../base/footerHtml.ftl">
<!--end-->


</body>
</html>
