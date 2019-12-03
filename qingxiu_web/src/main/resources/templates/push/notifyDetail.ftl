<#include "../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <div style="margin: auto; float: none">
            <table class="layui-table">
                <colgroup>
                    <col width="15%">
                    <col width="35%">
                    <col width="15%">
                    <col width="35%">
                </colgroup>
                <tbody>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">标号</td>
                    <td>${(entity.id)!'--'}</td>
                    <td style="text-align: right; background: #ebf5ff">类型</td>
                    <td><#if entity.typeFlag == 0>自定义
                    <#elseif entity.typeFlag == 1>全部的
                    <#elseif entity.typeFlag == 2>在线的
                    <#elseif entity.typeFlag == 3>批量的</#if></td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">来源</td>
                    <td>${(entity.source)!'--'}</td>
                    <td style="text-align: right; background: #ebf5ff">状态</td>
                    <td><#if entity.statusFlag == 0>待推送
                    <#else>已推送</#if></td>
                </tr>
                <#if entity.typeFlag == 0>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">GID</td>
                    <td colspan="3" style="word-break:break-all; width:500px;">
                        ${(entity.gids)!'--'}
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">UID</td>
                    <td colspan="3" style="word-break:break-all; width:500px;">
                        ${(entity.uids)!'--'}
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">安卓设备</td>
                    <td colspan="3" style="word-break:break-all; width:500px;">
                        ${(entity.androidRegistrId)!'--'}
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">苹果设备</td>
                    <td colspan="3" style="word-break:break-all; width:500px;">
                        ${(entity.iosRegistrId)!'--'}
                    </td>
                </tr>
                </#if>
                <#if entity.typeFlag == 3>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">GID</td>
                    <td colspan="3" style="word-break:break-all; width:500px;">
                        ${(entity.gids)!'--'}
                    </td>
                </tr>
                </#if>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">标题</td>
                    <td colspan="3" style="word-break: normal;">${(entity.title)!}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">内容</td>
                    <td colspan="3" style="word-break: normal;">${(entity.content)!}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">参数</td>
                    <td colspan="3" style="word-break: normal;">${(entity.extrasJson)!}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">创建时间</td>
                    <td colspan="3">${(entity.createTime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                </tr>
                <#if entity.statusFlag == 1>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">推送时间</td>
                    <td>${(entity.beginTime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                    <td style="text-align: right; background: #ebf5ff">推送设备数</td>
                    <td>${(entity.totalCount)!} 台
                    </td>
                </tr>
                </#if>


                </tbody>
            </table>
        </div>
    </div><!-- /.box-body -->
</@body>
<@footer>
</@footer>