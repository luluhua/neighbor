<#assign ctx=request.contextPath />
<base id="ctx" href="${ctx}">
<#assign projectName="简单生活"/>
<base id="projectName" href="${projectName}">
<script type="text/javascript" src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/base/js/layui/layui.js"></script>
<script src="${ctx}/base/js/jquery.magnify.js"></script>
<script type="text/javascript" src="${ctx}/base/js/main.js"></script>
<link href="${ctx}/base/js/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">
<link href="${ctx}/base/css/my_base.css" rel="stylesheet">
<link href="${ctx}/base/js/layui/css/layui.css" rel="stylesheet">

<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx}/base/css/jquery.magnify.css">
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