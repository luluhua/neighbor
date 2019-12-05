<!doctype html>
<#include "../common/base.ftl">
<html>
<head>
    <meta charset="utf-8">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>login</title>
</head>
<link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/css.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/login.css"/>


<!--登陆-->

<body class="login_bg">
<header class="header_div">
    <div class="head">

        <div class="return">
            <p></p>
        </div>

        <!--导航-->
        <nav class="log_nav">
            <ul>
                <li><a href="/index.html" target="_Blank">简单生活网</a></li>

                <li><a href="javascript:void{0}" onclick="Classify('ALL')">论坛</a></li>
            </ul>
        </nav>
    </div>
    <div class="clear"></div>


</header>
<!--内容-->

<div class="common_con">

    <div class="content">

        <!--left-->
        <div class="left">
            <div class="top">
                <h1>登陆账号</h1>
                <p>没有账号，<a href="register.html">注册</a></p>
            </div>
            <div class="clear"></div>

            <h2>我们承诺尊重和保护您的隐私。您在此处提供的信息将帮助我们为您提供更好的服务。</h2>

            <div class="login">
                <dl>
                    <dt class="dt_curt">密码登陆</dt>

                    <dt>验证码登陆</dt>
                </dl>


                <div class="tab_1">
                    <form action="" class="form_login" method="">
                        <!--密码登陆-->
                        <ul class="ul_block">
                            <li>
                                <h6 class="error" id="us_hint"></h6>      <!--错误提示-->

                                <span>手机<b>*</b></span>

                                <input type="text" placeholder="手机" id="name">
                            </li>
                            <div class="clear"></div>

                            <li class="back_li">

                                <span>输入密码<b>*</b></span>

                                <input type="password" placeholder="请输入密码" id="psd">

                                <a href="password.html" class="back">忘记密码？找回密码</a>
                            </li>
                            <div class="clear"></div>

                            <li>
                                <button class="log_butt">登陆</button>
                            </li>
                            <div class="clear"></div>
                        </ul>
                    </form>
                    <!--验证码登陆-->
                    <form action="" class="pho_login" method="">
                        <ul>
                            <li>
                                <h6 class="error er_block" id="pho_hitn" style="display: none"></h6>

                                <span>手机号码<b>*</b></span>

                                <input type="text" placeholder="请输入手机号码" id="pho">
                            </li>
                            <div class="clear"></div>

                            <li>
                                <h6 class="error er_block" id="rxyzm" style="display: none"></h6>
                                <span>验证码<b>*</b></span>

                                <input type="text" id="verifyCode" placeholder="请输入验证码" class="yzm_input">

                                <img id="lg_img" src="" class="yzm" onclick="flushCheckIMG(1)">
                            </li>
                            <div class="clear"></div>

                            <li class="code_li back_li">
                                <h6 class="error" id="phoneVerificationCode" style="display: none"></h6>

                                <span>手机验证码<b>*</b></span>

                                <input type="text" placeholder="请输入手机验证码" class="code_input" id="phoneVerification">

                                <a href="javascript:void(0)" class="code_butt" id="enroll_bt" onclick="registers()">获取验证码</a>
                            </li>
                            <div class="clear"></div>

                            <li>
                                <button class="log_butt">登陆</button>
                            </li>
                            <div class="clear"></div>

                        </ul>
                    </form>
                </div>

            </div>
        </div>

        <!--right-->
        <div class="right">
            <h1>欢迎光临简单生活网，这里能为您解决。。。</h1>

            <h2>充分利用过剩产能！</h2>

            <dl class="yichu">
                <dd>闲置物品买来一年用不了几次，扔了可惜？</dd>

                <dd>光有一身好手艺和技术没能充分利用？</dd>

                <dd>休息在家无聊？</dd>

                <dd>出门只为一点小事不想动？</dd>
            </dl>

            <!--产品注册步骤-->
            <div class="steps">
                <h3>温馨提示：</h3>

                <dl class="steps_dl">
                    <dt>
                        <span>1</span>
                        <p>账号注册</p>
                    </dt>
                    <div class="clear"></div>
                    <dd>没有注册过账号的用户，使用验证登录后自动创建账号。</dd>
                    <dd>账号为您的手机号码，“个人中心-修改密码”设置登录密码</dd>
                </dl>

            </div>
        </div>
    </div>
    <div class="clear"></div>

</div>


<!--footer-->
<footer>
    <p>Copyright©南宁简单生活有限公司 <a href="http://www.miitbeian.gov.cn" target="_blank">桂ICP备17002166号</a></p>
</footer>

</body>
</html>



<script>
    $(function () {


//手机版导航     
        $(".menu").click(function () {
            $(".header_div .log_nav ul").slideToggle(100);
        });


//选项卡           
        $(".login dl dt").click(
                function (e) {
                    var i = $(this).index();
                    $('.login ul').removeClass('ul_block');
                    $('.login ul').eq(i).addClass('ul_block');
                })

        $(".login dl dt").click(
                function (e) {
                    $(".login dl .dt_curt").removeClass("dt_curt")
                    $(this).addClass("dt_curt")
                })

    });


</script>