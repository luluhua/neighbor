<#include "../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/style.css"/>
    <link href="${ctx}/base/js/layui/css/layui.css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/wholesalestore/js/common.js"></script>

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

                        <span id="email">${(info.email)!}</span>

                        <a href="javascript:email()">修改</a>
                    </div>

                    <div class="common_fl email_hidden">
                        <#if  (info.email)??>
                        <h4>
                            <p>已绑定邮箱: ${(info.email)!}</p>
                        </h4>
                        <h4>
                            <p>原邮箱：</p>
                            <input type="text" id="jEmail" placeholder="输入完整的原邮箱" class="text">
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


    <#include "../base/footerHtml.ftl">
<!--end-->

</@body>
<@footer>

<script>
    $(".setGender").click(function () {
        var gender = $("input[name='gender']:checked").val();
        var title = $("input[name='gender']:checked").attr('title');
        if (activity.isNotBlank(gender)) {
            activity.post('${ctx}/resource/setGender',
                    {
                        gender: gender
                    },
                    function (result) {
                        if (result.code == 200) {
                            $("#gender_sex").html(title);
                            layer.msg(result.msg, {
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
                    }, function () {
                        activity.iconNoTooltip("系统异常！请稍后重试")
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
            activity.post('${ctx}/resource/setNickname',
                    {
                        nickname: nickname
                    },
                    function (result) {
                        if (result.code == 200) {
                            $("#nickname_").html(nickname);
                            layer.msg(result.msg, {
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
                    }, function () {
                        activity.iconNoTooltip("系统异常！请稍后重试")
                    });
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
            activity.post('${ctx}/resource/sendMail',
                    {
                        mail: mail,
                        jEmail: jEmail
                    },
                    function (result) {
                        if (result.code == 200) {
                            countDown();
                            layer.msg(result.msg, {
                                time: 1000,
                                end: function () {
                                    $("#emailVerificationCode").hide();
                                    $("#qx").show();
                                }
                            })
                        } else {
                            activity.iconNoTooltip("系统异常！请稍后重试")
                        }
                    }, function () {
                        activity.iconNoTooltip("系统异常！请稍后重试")
                    });
        } else {
            activity.shakeTooltip('请填写邮箱！');
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

    $(".setEmail").click(function () {
        var email = $("#newEmail").val();
        var code = $("#emailCode").val();
        if (activity.isNotBlank(nickname)) {
            activity.post('${ctx}/resource/setEmail',
                    {
                        email: email,
                        code: code
                    },
                    function (result) {
                        if (result.code == 200) {
                            $("#email").html(email);
                            layer.msg(result.msg, {
                                time: 1000,
                                end: function () {
                                    email_qx();
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
            layer.msg('请填写昵称！', {
                time: 1000,
                end: function () {
                }
            })
        }
    })

</script>
<script>
    layui.use('form', function () {
        var form = layui.form;
    })
</script>


</@footer>