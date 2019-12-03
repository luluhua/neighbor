<#ftl strip_text=true  auto_esc=true  output_format="HTML">
<#--<#assign spr=JspTaglibs["http://www.springframework.org/tags"]/>
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]/>
<#assign fmt=JspTaglibs["http://java.sun.com/jsp/jstl/fmt"]/>
<#assign fn=JspTaglibs["http://java.sun.com/jsp/jstl/functions"]/>
<#assign shi=JspTaglibs["http://shiro.apache.org/tags"]/>
<#assign log=JspTaglibs["http://logging.apache.org/log4j/tld/log"]/>-->

<#assign base=springMacroRequestContext.contextPath/>
<#assign ctxPath=base/>
<#assign session=Session/>
<#assign request=Request/>
<#assign params=RequestParameters/>


<#--<#list .data_model?keys as key>--${key}:
    <#if .data_model[key]?is_string>string<br>
    <#elseif .data_model[key]?is_enumerable>enumerable<br>
        <#list .data_model[key] as i><#if i_index<=20&&i?length<25><#if i?is_string>--${i_index}:${i}<#else>--not string</#if>
        <br></#if></#list>
    <#elseif .data_model[key]?is_hash_ex>hash_ex<br>
        <#list .data_model[key] as i,j><#if i_index<=20&&i?length<25>--${i_index}:${i}=<#if j?is_string>${j}<#else>--not string</#if>
        <br></#if></#list>
    <#elseif .data_model[key]?is_hash>hash<br>
    <#else>other<br>
    </#if><br>
</#list>-->
<#--<@shi.guest>guest</@shi.guest>
<@shi.user>user</@shi.user>
${shiro.guest}<br>
${shiro.user}
${TreePermissionOut(0)}-->

