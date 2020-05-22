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
                <p>修改登录密码</p>
            </h3>
            <ol class="password_ol">
                <li>
                    <span id="original_Password"></span>
                    <p>原来密码：</p>
                    <input type="password" autocomplete="off" id="originalPassword" value="" placeholder="输入原来密码">
                </li>

                <li>
                    <span id="new_Password"></span>
                    <p>新改密码：</p>
                    <input type="password" autocomplete="off" id="newPassword" value="" placeholder="由字母和数字组成，不少于6位字符">
                </li>

                <li>
                    <span id="confir_Password"></span>
                    <p>确认密码：</p>
                    <input type="password" autocomplete="off" id="confirPassword" value="" placeholder="再次输入密码">
                </li>

                <li>
                    <a href="javascript:void" class="mpas" id="mpas">提交</a>
                </li>
            </ol>


        </div>
    </div>
    <!--end-->
</div>


<!--底部-->
    <#include "../base/footerHtml.ftl">

<!--end-->
</@body>
<@footer>
<script>
    $("#mpas").click(function () {
        var originalPassword = $("#originalPassword").val();
        var newPassword = $("#newPassword").val();
        var confirPassword = $("#confirPassword").val();
        if (activity.isBlank(originalPassword)) {
            activity.shakeTooltip('请填原密码');
            return false;
        }
        if (activity.isBlank(newPassword) || newPassword.length < 6) {
            activity.shakeTooltip('新密码输入格式不正确！');
            return false;
        }
        if (newPassword != confirPassword) {
            activity.shakeTooltip('两次密码输入不一致');
            return false;
        }
        activity.post('${ctx}/resource/alterPass',
                {
                    password: originalPassword,
                    newPassword: newPassword
                },
                function (result) {
                    if (result.code == 200) {
                        activity.iconYesTooltip(result.msg);
                    } else {
                        activity.iconNoTooltip(result.msg);
                    }
                });
    });
</script>
</@footer>