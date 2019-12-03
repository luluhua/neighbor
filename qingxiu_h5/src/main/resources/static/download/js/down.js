$(function () {

    var SW = window.screen.width;//屏幕高度
    var SH = window.screen.height;//屏幕高度
    var CODE;
    var requestObject = GetRequest();
    var requestJson;
    if (requestObject != null && requestObject != '') {
        var requestStr = JSON.stringify(requestObject)
        requestJson = JSON.parse(requestStr);
    }
    window.CODE = requestJson['code'];
    if(window.CODE!=''&&window.CODE!=null&&typeof (window.CODE) !='undefined') {
        //写入剪切板
        if (ClipboardJS.isSupported()) {
            var clipboard = new ClipboardJS('[data-clipboard-demo]', {
                text: function (trigger) {
                    return "@[手上青秀]@手上青秀APP是一款专门用于市民、企业在线办理行政审批事项、社区街道事项的政务服务APP。￥" + window.CODE+"￥";
                }
            });
            clipboard.on('success', function (e) {
                console.log(JSON.stringify(e));
            });
            clipboard.on('error', function (e) {
                console.log(JSON.stringify(e));
            });
        }
        //获取webgl
        var data = getContext();
        data.screen_height = SH;
        data.screen_width = SW;
        if (requestJson != null) {
            data.code = window.CODE;
        }
        if (data != null) {
            // alert(JSON.stringify(data));
            $.ajax({
                //请求方式
                type: "POST",
                //请求的媒体类型
                contentType: "application/json;charset=UTF-8",
                //请求地址
                url: "/m/common/doAddShareLogDetail",
                //数据，json字符串
                data: JSON.stringify(data),
                dataType: "json",
                //请求成功
                success: function (result) {
                    console.log(JSON.stringify(result));
                    if (result.code == 0) {
                        console.log(result.msg);
                    }
                },
                //请求失败，包含具体的错误信息
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        }
    }
})
//获取 webgl
function getContext() {
    var cvs = document.createElement('canvas')
    if (cvs && 'function' == typeof cvs.getContext) {
        var strArr = ['webgl', 'webgl2', 'experimental-webgl2', 'experimental-webgl']
        for (var ii = 0; ii < strArr.length; ii++) {
            var str = strArr[ii]
            var ctx = cvs.getContext(str)
            if (ctx) {
                var obj = {}
                obj.context = str
                obj.version = ctx.getParameter(ctx.VERSION)
                obj.vendor = ctx.getParameter(ctx.VENDOR)
                obj.sl_version = ctx.getParameter(ctx.SHADING_LANGUAGE_VERSION)
                obj.max_texture_size = ctx.getParameter(ctx.MAX_TEXTURE_SIZE)
                var ext = ctx.getExtension('WEBGL_debug_renderer_info')
                if (ext) {
                    obj.vendor = ctx.getParameter(ext.UNMASKED_VENDOR_WEBGL)
                    obj.renderer = ctx.getParameter(ext.UNMASKED_RENDERER_WEBGL)
                }
                return obj
            }
        }
    }
    return {}
}

//获取请求参数
function GetRequest() {
    var url = location.search; //获取url中含"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}



