<!DOCTYPE html>
<#include "../common/base.ftl">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/generalize/css/activityapply.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/layui.css">
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
        }
    </script>
</head>
<body>

<!-- 主页面内容容器 -->
<div class="mui-content mui-scroll-wrapper" id="honeme_yer">
    <div class="mui-scroll">
        <img src="${ctx}/generalize/images/apply.jpg"/>
        <div class="ykjoe">
            <div class="yrdse">
                <input type="text" maxlength="11" id="phone" placeholder="请输入手机号码"/>
                <div class="khsauit">
                    <input type="text" class="phone_inpu" id="code" placeholder="请输入验证码"/>
                    <button id="hqyzm" class="hfiosr">获取验证码</button>
                </div>
                <div class="box_ingdex">
                    <button id="form_info">马上参与</button>
                </div>
            </div>

        </div>
    </div>
</div>


<script type="text/javascript">
    $("#form_info").attr('disabled', true);

    $("#hqyzm").click(function () {
        var phone = $("#phone").val();
        if (phone.length != 11) {
            mui.toast("请输入正确的手机号码!", {duration: '3500ms', type: 'div'})
            return false;
        } else {
            $(this).attr('disabled', 'disabled');
            $.post('${ctx}/apptg/send_sms?phone=' + phone, function (response) {
                if (response.code == 0) {
                    mui.toast("发送成功!", {duration: '3500ms', type: 'div'})
                    getRandomCode();
                } else if (response.code == 2) {
                    $(this).attr('disabled', '');
                    var btnArray = ['马上下载'];
                    mui.confirm(response.msg, '提示', btnArray, function (e) {
                        var u = navigator.userAgent;
                        var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
                        var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
                        if (isAndroid) {
                            window.location.href = '${ctx}/common/download';
                        } else if (isiOS) {
                            window.location.href = 'https://itunes.apple.com/cn/app/id1472462104';
                        }
                    })
                } else {
                    $('.hfiosr').attr('disabled', false);
                    mui.toast(response.msg, {duration: '3500ms', type: 'div'})
                }
            })
        }
    });

    $("#form_info").click(function () {
        var phone = $("#phone").val();
        var code = $("#code").val();
        if (phone.length != 11) {
            mui.toast("请输入正确的手机号码!", {duration: '3500ms', type: 'div'})
            return false
        }
        if (code.length != 6) {
            mui.toast("验证码不正确!", {duration: '3500ms', type: 'div'})
            return false
        }
        var header = document.referrer;
        $.post('${ctx}/apptg/verificationPhone?phone=' + phone + "&code=" + code + "&header=" + header, function (response) {
            if (response.code == 0) {
                var btnArray = ['马上下载'];
                mui.confirm(response.msg, '提示', btnArray, function (e) {
                    var u = navigator.userAgent;
                    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
                    var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
                    if (isAndroid) {
                        window.location.href = '${ctx}/common/download';
                    } else if (isiOS) {
                        window.location.href = 'https://itunes.apple.com/cn/app/id1472462104';
                    }
                })
            } else {
                mui.toast(response.msg, {duration: '3500ms', type: 'div'})
            }
        })
    });

    // });
    var time = 60;

    //倒计时
    function getRandomCode() {
        if (time === 0) {
            time = 60;
            $('.hfiosr').text("重新获取")
            $('.hfiosr').css({"background-color": "#FA764B"})
            $('.hfiosr').attr('disabled', false);
            return;
        } else {
            time--;
            $('.hfiosr').text(time);
            $('.hfiosr').attr('disabled', 'disabled');
            $('.hfiosr').css({"background-color": "#BFBFBF"})
        }
        setTimeout(function () {
            getRandomCode();
        }, 1000);
    }

    $('#code').bind('input propertychange', function () {
        if ($(this).val().length != 6) {
            $("#form_info").attr('disabled', true);
        } else {
            $("#form_info").attr('disabled', false);
        }
    })


</script>
</body>
</html>