<#assign ctx=request.contextPath />
<base id="ctx" href="${ctx}">
<#assign projectName="简单生活"/>
<base id="projectName" href="${projectName}">
<script type="text/javascript" src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/base/js/main.js"></script>
<script type="text/javascript" src="${ctx}/base/js/layui/layui.js"></script>
<link href="${ctx}/base/js/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">


<script type="text/javascript">
    layui.config({
        version: true,
        debug: true,
        base: '${ctx}/base/modules/'
    }).use('xform'); //加载入口

</script>