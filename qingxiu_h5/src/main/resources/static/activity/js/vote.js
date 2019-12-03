window._gToken = '';
if (typeof (vote) == 'undefined') {
    window.vote = {
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
        voteApp: function (openUrl, androidDownUrl, iosOpenDownUrl, url) {
            //马上去报名，事件
            // 获取 userAgent
            var ua = navigator.userAgent;
            if (isSsqx(ua)) {
                var id = $("#craid").val();
                $.ajax({
                    async: true,
                    type: "POST",
                    url: url + '/activity/form_video/' + id,
                    headers: {token: window._gToken},
                    dataType: "json",
                    success: function (json) {
                        if (json.code = 0) {
                            $("#" + id).find('.buttons').attr("class", "dsyitou");
                            $("#form_vier").hide();
                            $("#yitoule").show();
                        }
                        nativeWeb.toast(json.msg);
                    }
                })
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
    } else {
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

//取消详情弹出层
$(".oper_qux").click(function () {
    $("#middlePopover").removeClass("mui-active");
    $("#middlePopover").hide();
    $(".mui-popover-arrow").hide();
    //
    var video3 = document.getElementById("video_html5_api");
    video3.pause()
})


//视频截取封面图--开始
$(function () {
    "use strict";//严格模式
    var video;//video标签
    var scale = 0.8;//第一帧图片与源视频的比例
    video = $("video").get(0);//赋值标签
    video.addEventListener("loadeddata", function () {//加载完成事件，调用函数
        var canvas = document.createElement("canvas");//canvas画布
        canvas.width = video.videoWidth * scale;
        canvas.height = video.videoHeight * scale;
        canvas.getContext('2d').drawImage(video, 0, 0, canvas.width, canvas.height);//画图

    })
}());

//视频截取封面图--结束
document.body.addEventListener('touchmove', function (e) {
    e.preventDefault();
}, {passive: false});


//判断文件是否视频格式
function isvideo(ob) {
    var index = ob.indexOf(".");
    var result = ob.substr(index + 1, ob.length);
    if (result == "mp4" || result == "MP4" || result == "mov" || result == "MOV") {
        return true;
    }
    return false;
}


