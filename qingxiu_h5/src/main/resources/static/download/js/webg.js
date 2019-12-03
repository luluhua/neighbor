getContext = function  () {
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