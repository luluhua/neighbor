<#macro header>
<!DOCTYPE html>
<html>
<head>
  <#include "head.ftl">
  <#nested>
</head>
</#macro>
<!-- /header -->
<#macro body>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#--<#include "header.ftl">-->
<#--<#include "menu.ftl">-->
<#nested>
<#--<#include "footer.ftl">-->
    <div class="control-sidebar-bg"></div>
</div>
</#macro>
<!-- /body -->
<#macro footer>
    <#include "js.ftl">
    <#nested>
</body>
</html>
</#macro>