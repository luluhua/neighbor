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
    <link href="${ctx}/base/js/layui/css/layui.css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/wholesalestore/js/common.js"></script>
    <script src="${ctx}/base/js/upload.js" type="text/javascript"></script>
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
            <li><a href="${ctx}/resource/info" class="menu_a">个人资料</a></li>

            <li><a href="javascript:void">我的收藏</a></li>

            <li><a href="javascript:void">我的消息</a></li>

            <li><a href="javascript:void">修改密码</a></li>

            <li><a href="javascript:void">认证信息</a></li>

        </ul>
    </div>

    <div class="right">
        <dl>
            <dd>
                <a href="javascript:void" id="avatarUpload"><img id="avatar_"
                                                                 src="${(info.avatarUrl)!}"
                                                                 onerror="this.src='${ctx}/base/images/default.jpg'"
                                                                 title="修改头像"></a>
                <p>
                    <span><b> ${(me.userName)!}</b></span>
                    <span class="spana">有效期:2019-2020</span>
                </p>
            </dd>
            <dt>
                <a href="javascript:void">评分<b>${(score)!}</b></a>
            </dt>

            <dt>
                <a href="javascript:void">积分<b>0</b></a>
            </dt>
        </dl>

        <div class="common_border layui-form">

            <h3 id="h3">
                <p>个人资料</p>
            </h3>

            <ol class="data_ol">

                <li>

                    <div class="common_fl name">
                        <p>昵称：</p>

                        <span id="nickname_">${(info.nickname)!"您还没有填写昵称!"}</span>

                        <a href="javascript:xiugaininc();">修改</a>
                    </div>

                    <div class="common_fl name_hidden">
                        <p>昵称：</p>

                        <input type="text" id="nickname" placeholder="输入昵称" class="text" value="${(info.nickname)!}">

                        <a href="javascript:name_hidden()" class="name_qx">取消</a>

                        <a href="javascript:void" class="setNickname">确定</a>
                    </div>
                </li>
                <li>
                    <div class="common_fl gender">
                        <p>性别：</p>
                        <span id="gender_sex">
                        <#if (info.gender)??>
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

                        <input class="nav" type="radio" name="gender"
                               value="1"  <#if (info.gender)?? && info.gender==1>checked</#if>
                               title="男">
                        <input class="nav" type="radio" name="gender"
                               value="2" <#if (info.gender)?? && info.gender==2>checked</#if>
                               title="女">

                        <a href="javascript:gender_qx()" class="gender_qx">取消</a>
                        <a href="javascript:void" class="setGender">确定</a>
                    </div>

                </li>

                <li>
                    <div class="common_fl email">
                        <p>邮箱：</p>

                        <span id="email"></span>

                        <a href="javascript:email()">修改</a>
                    </div>

                    <div class="common_fl email_hidden">
                        <#if  (info.email)??>
                            <b>邮箱: ${(info.email)!}</b>
                        <h4>
                            <p>原邮箱：</p>
                            <input type="text" id="jEmail" placeholder="输入邮箱" class="text">
                        </h4>
                        </#if>
                        <h4>
                            <p>新邮箱：</p>
                            <input type="text" id="newEmail" placeholder="输入邮箱" class="text">
                        </h4>
                        <h4>
                            <p>验证码：</p>
                            <input type="text" id="emailCode" placeholder="输入验证码" class="text text_phone">

                            <button id="emailVerificationCode">获取验证码</button>
                            <button id="qx" style="display: none"></button>
                        </h4>
                        <a href="javascript:email_qx()" class="email_qx">取消</a>

                        <a href="javascript:void" class="setEmail">确定</a>
                    </div>
                </li>
            </ol>
        </div>
    </div>

    <!--end-->
</div>


<<#include "../base/footerHtml.ftl">
<!--end-->
<script>
    $(".setGender").click(function () {
        var gender = $("input[name='gender']:checked").val();
        var title = $("input[name='gender']:checked").attr('title');
        if (activity.isNotBlank(gender)) {
            $.post('${ctx}/resource/setGender?_dc=' + new Date().getTime(), {gender: gender}, function (response) {
                if (response.code == 200) {
                    $("#gender_sex").html(title);
                    layer.msg(response.msg, {
                        time: 1000,
                        end: function () {
                            gender_qx();
                        }
                    })
                } else {
                    layer.msg("系统异常，请稍后重试！", {
                        time: 1000,
                        end: function () {
                        }
                    })
                }
            });
        } else {
            layer.msg('请选择性别', {
                time: 1000,
                end: function () {
                }
            })
        }
    })

    $(".setNickname").click(function () {
        var nickname = $("#nickname").val();
        if (activity.isNotBlank(nickname)) {
            $.post('${ctx}/resource/setNickname?_dc=' + new Date().getTime(), {nickname: nickname}, function (response) {
                if (response.code == 200) {
                    $("#nickname_").html(nickname);
                    layer.msg(response.msg, {
                        time: 1000,
                        end: function () {
                            name_hidden();
                        }
                    })
                } else {
                    layer.msg("系统异常，请稍后重试！", {
                        time: 1000,
                        end: function () {
                        }
                    })
                }
            })
        } else {
            layer.msg('请填写昵称！', {
                time: 1000,
                end: function () {
                }
            })
        }
    })
    $("#emailVerificationCode").click(function () {
        var mail = $("#newEmail").val();
        var jEmail = $("#jEmail").val();
        if (activity.isNotBlank(mail)) {
            $.post('${ctx}/resource/sendMail?_dc=' + new Date().getTime(), {
                mail: mail,
                jEmail: jEmail
            }, function (response) {
                if (response.code == 200) {
                    countDown();
                    layer.msg(response.msg, {
                        time: 1000,
                        end: function () {
                            $("#emailVerificationCode").hide();
                            $("#qx").show();
                        }
                    })
                } else {
                    layer.msg(response.msg, {
                        time: 1000,
                        end: function () {
                        }
                    })
                }
            })
        } else {
            layer.msg('请填写邮箱！', {
                time: 1000,
                end: function () {
                }
            })
        }

    })
    var flag = 1;
    var i = 60;

    function countDown() {
        i = i - 1;
        $("#qx").html(i + "秒后重发");
        if (i == 0) {
            $("#emailVerificationCode").show();
            $("#emailVerificationCode").html("重新发送");
            $("#qx").hide();
            flag = 1;
            i = 60;
            return;
        }
        setTimeout('countDown()', 1000);
    }

</script>
<script>
    layui.use('form', function () {
        var form = layui.form;
    })
</script>


</body>
</html>
