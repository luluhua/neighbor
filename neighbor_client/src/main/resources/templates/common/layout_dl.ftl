<#macro header>
<!DOCTYPE html>
<html>
<head>

  <#include "base.ftl">
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