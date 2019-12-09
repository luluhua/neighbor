/**
 * 活动H5  拉新相关 逻辑js
 * 2019-09-19
 * liuguicheng
 */
window._gToken = '';
if (typeof (activity) == 'undefined') {
    window.activity = {
        verApp: function () {
            // 获取 userAgent
            var ua = navigator.userAgent.toLowerCase();
            if (isWeixinBrowser(ua) || isZfbOrQq(ua)) {
                //在微信、qq、支付宝环境下，提示浏览器打开
                $(".maskDiv").show();
                $(".maskDiv img").show();
            } else {
                //判断是否手上青秀app环境
                if (isSsqx(ua)) {
                    //获取登录用户
                    nativeWeb.getToken();
                }
            }
        },
        openApp: function (openUrl, androidDownUrl, iosOpenDownUrl) {
            //马上去报名，事件
            // 获取 userAgent
            var ua = navigator.userAgent;
            if (isSsqx(ua)) {
                // nativeWeb.toast("手上青秀");
                window.location.href = "/m/activity/toEnroll";
            } else {
                /**
                 * 打开手上青秀app，未安装则跳转安装地址
                 */
                $(".info_fsa").remove();
                $(".hfousahdf").css({'display': 'block'});
                var isAndroid = ua.indexOf('Android') > -1 || ua.indexOf('Adr') > -1; //android终端
                var isiOS = !!(ua.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/)); //ios终端
                if (isAndroid) {
                    //打开app
                    window.location.href = "ssqxapp://h5/openwith?nav=h5&url=" + openUrl;
                    setTimeout(function () {
                        //500毫秒后还未打开，则下载app
                        window.location.href = androidDownUrl;
                    }, 500);
                } else if (isiOS) {
                    //打开app
                    var _url = "ssqxTest://?nav=h5&url=" + openUrl;
                    window.location.href = _url;

                    setTimeout(function () {
                        //500毫秒后还未打开，则下载app
                        window.location.href = iosOpenDownUrl;
                    }, 500);

                }
            }
        }
    }
}

function getTokenCallback(_token) {
    window._gToken = _token;
    // nativeWeb.toast(window._gToken);
    if (_token != "") {
        //获取是否报名
        isVerifyEnroll();
    } else {
        $("#bodyDivId").hide();
        //跳转app登录
        nativeWeb.gotoLogin();

    }
}

//判断是否是微信
function isWeixinBrowser(ua) {
    return (/micromessenger/.test(ua)) ? true : false;
}

//是否手上青秀app环境下
function isSsqx(ua) {
    return (ua.match(/ssqxapp/i) == "ssqxapp") ? true : false;
}

//是否是支付宝或qq环境
function isZfbOrQq(ua) {
    return (ua.match(/QQ/i) == "qq" || ua.match(/AlipayDefined/i) == "alipaydefined") ? true : false;
}

/**
 * 验证是否报名
 */
function isVerifyEnroll() {

    $.ajax({
        //请求方式
        type: "POST",
        //请求的媒体类型
        contentType: "application/json;charset=UTF-8",
        //请求地址
        url: "/m/activity/doVerifyEnroll",
        //数据，json字符串
        data: "",
        headers: {token: window._gToken},
        //请求成功
        success: function (result) {
            if (result.code == 0) {
                $("#bodyDivId").hide();
                $("#tsDiv").show()
            } else if (result.code == 505) {
                // window.location.href="/m/activity/gjacti";
            } else if (result.code == 110201) {
                nativeWeb.gotoLogin();
            }
        },
        //请求失败，包含具体的错误信息
        error: function (e) {
        }
    });
}