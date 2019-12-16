<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tLjUser/doEdit"
    <#else>
      action="/appc/tLjUser/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">

        <div class="form-group">
            <div class="col-sm-10" style="margin: auto; float: none">
                <table class="layui-table">
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="35%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">用户名</td>
                        <td><@commonTags method="getDecrypt3DEs" type="1" value="${(entity.username)!}">${(getDecrypt3DEs)!}</@commonTags></td>
                        <td style="text-align: right; background: #ebf5ff">昵称</td>
                        <td>${(info.nickname)!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">手机号码</td>
                        <td><@commonTags method="getDecrypt3DEs" type="1" value="${(entity.mobile)!}">${(getDecrypt3DEs)!}</@commonTags></td>
                        <td style="text-align: right; background: #ebf5ff">GUID</td>
                        <td>${(entity.guid)!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">邮箱</td>
                        <td>${(info.email)!'--'}</td>
                        <td style="text-align: right; background: #ebf5ff">性别</td>
                        <td>${(info.gender)!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">注册时间</td>
                        <td>${(entity.dtCreate?string('yyyy-MM-dd hh:mm:ss'))!'--'}</td>
                        <td style="text-align: right; background: #ebf5ff">状态</td>
                        <td><#if entity.status==0>
                            正在使用中
                        <#else >
                禁用
                        </#if></td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-10" style="margin: auto; float: none">
                <table class="layui-table">
                    <colgroup>
                        <col width="15%">
                        <col width="85%">
                    </colgroup>
                    <tbody>
                    <#list address as address>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">地址</td>
                        <td>${(address.province)!}${(address.city)!}${(address.region)!}
                            -${(address.detailedAddress)!}</td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>