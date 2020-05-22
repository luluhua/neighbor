<script type="text/javascript" src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/base/js/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/base/js/jquery.magnify.js"></script>
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=GMGAvOCI4vHHUdYINMC54wp9"></script>
<script type="text/javascript" src="${ctx}/base/js/x-layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/base/js/upload.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/base/js/main.js"></script>
<script type="text/javascript" src="${ctx}/base/js/xform.js"></script>



<script type="text/javascript">
    layui.config({
        version: true,
        debug: true,
        base: '${ctx}/base/modules/'
    }).use('xform'); //加载入口
    layui.use('element', function () {
        var element = layui.element;
    });

</script>