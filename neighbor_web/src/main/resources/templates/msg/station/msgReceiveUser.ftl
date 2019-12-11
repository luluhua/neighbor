<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <table class="table table-hover">
        <tr>
            <th>接收用户</th>
            <th>是否阅读</th>
            <th>阅读时间</th>
        </tr>
        <#list msgRecordContentList as msg>
            <tr>
                <td>${(msg.apuName)!}</td>
                <td><#if msg.isRead==0><font color="red">未阅读</font><#else><font color="green">已阅读</font></#if></td>
                <td>${(msg.readTime?string('yyyy/MM/dd HH:mm:ss'))!'--'}</td>

            </tr>
        </#list>
    </table>
</@body>
<@footer>
</@footer>
