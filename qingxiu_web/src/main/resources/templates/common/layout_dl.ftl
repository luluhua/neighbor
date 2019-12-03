<#macro header>
<!DOCTYPE html>
<html>
<head>
  <#include "head.ftl">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
  <#nested>
</head>
</#macro>
<!-- /header -->
<#macro body>
    <#nested>
</#macro>
<!-- /body -->
<#macro footer>
    <#include "js.ftl">
    <#nested>
</body>
</html>
</#macro>