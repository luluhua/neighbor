<#macro header>
<!DOCTYPE html>
<html>
<head>

  <#include "base.ftl">
  <#nested>
</head>
</#macro>
<#macro js>
    <#include "js.ftl">
    <#nested>
</#macro>
<!-- /header -->
<#macro body>
    <#nested>
</#macro>
<!-- /body -->
<#macro footer>
    <#nested>
</body>
</html>
</#macro>