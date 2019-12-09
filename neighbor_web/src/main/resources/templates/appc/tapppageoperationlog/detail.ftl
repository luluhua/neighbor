<#include "../../common/layout_dl.ftl">
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
                    <td style="text-align: right; background: #ebf5ff">模块</td>
                    <td>${(entity.model)!'--'}</td>
                    <td style="text-align: right; background: #ebf5ff">名称</td>
                    <td>${(entity.name)!'--'}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">页面地址</td>
                    <td>${(entity.url)!'--'}</td>
                    <td style="text-align: right; background: #ebf5ff">页面key</td>
                    <td>${(entity.key)!'--'}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">功能名称</td>
                    <td>${(entity.funName)!'--'}</td>
                    <td style="text-align: right; background: #ebf5ff">时长（秒）</td>
                    <td>${(entity.timeLength)!'--'}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">访问时间</td>
                    <td colspan="3">
                        ${(entity.dtStartTime?string('yyyy-MM-dd HH:mm:ss'))!} -
                        ${(entity.dtEndTime?string('yyyy-MM-dd HH:mm:ss'))!}
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">设备token</td>
                    <td colspan="3">${(entity.equipmentToken)!'--'}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">页面类型</td>
                    <td>${(entity.pageType)!'--'}</td>
                    <td style="text-align: right; background: #ebf5ff">设备类型</td>
                    <td style="word-break: normal;">${(entity.mobilePlatform)!}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">app版本</td>
                    <td style="word-break: normal;">${(entity.appVersion)!}</td>
                    <td style="text-align: right; background: #ebf5ff">APP包名</td>
                    <td style="word-break: normal;">${(entity.packageName)!}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">值</td>
                    <td colspan="3">${(entity.val)!}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">用户Gid</td>
                    <td style="word-break: normal;">${(entity.gid)!}</td>
                    <td style="text-align: right; background: #ebf5ff">访问IP</td>
                    <td style="word-break: normal;">${(entity.requestIp)!}</td>
                </tr>
                <tr>
                    <td style="text-align: right; background: #ebf5ff">客户端操作系统版本</td>
                    <td>${(entity.mobileSystemVersion)!}</td>
                    <td style="text-align: right; background: #ebf5ff">客户端手机型号</td>
                    <td>${(entity.mobileModel)!}
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
    </div><!-- /.box-body -->
</@body>
<@footer>
</@footer>