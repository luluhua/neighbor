layui.use('form', function () {
    var form = layui.form;
})

if (typeof (activity) == 'undefined') {
    window.activity = {
        location: function () {
            window.location.href = document.referrer;
        },
        isNotBlank: function (e) {
            if (e != "" && e.length != 0) {
                return true;
            } else {
                return false;
            }
        },
        //文字提示
        textTooltip: function (msg) {
            layer.msg(msg);
        },
        //文字+成功提示
        iconYesTooltip: function (msg) {
            layer.msg(msg, {icon: 1});
        },
        //文字+失败提示
        iconNoTooltip: function (msg) {
            layer.msg(msg, {icon: 2});
        },
        //文字抖动提示
        shakeTooltip: function (msg) {
            layer.msg(msg, function () {
            });
        },
        //加载提示
        loadTooltip: function () {
            layer.load(2);
            // setTimeout(function () {
            //     layer.closeAll('loading');
            // }, 2000);
        },
        //时间内加载
        timeJump: function (msg, time, func) {
            layer.msg(msg, {icon: 1, time: time}, function () {
                window.location.href = func;
            });

        },
        post: function (url, data, funcSucc, funcFailed, funcComplete) {
            var token = mainNet.getToken();
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                dataType: "json",
                complete: function () {
                    if (funcComplete) funcComplete();
                },
                success: function (result) {
                    if (!mainNet.processResult(result)) {
                        return;
                    }
                    if (funcSucc) funcSucc(result);
                },
                error: function (msg) {
                    if (funcFailed) funcFailed(msg);
                }
            });
        },

    }
}
$(document).ready(function () {
    var url = document.location.toString();
    var arrUrl = url.split("//");

    var start = arrUrl[1].indexOf("/");
    var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符

    if (relUrl.indexOf("?") != -1) {
        relUrl = relUrl.split("?")[0];
    }
    $('[name="header"]').val(relUrl);
});

