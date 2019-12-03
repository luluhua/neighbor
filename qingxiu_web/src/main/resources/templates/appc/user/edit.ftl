<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tAppUser/doEdit"
    <#else>
      action="/appc/tAppUser/doAdd"
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
                        <td>${(entity.username)!'--'}</td>
                        <td style="text-align: right; background: #ebf5ff">昵称</td>
                        <td>${(entity.nickname)!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">GUID编号</td>
                        <td>${(entity.gid)!'--'}</td>
                        <td style="text-align: right; background: #ebf5ff">用户头像</td>
                        <td>
                            <img onclick="previewImg(this)"
                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.avatar)!'--'}"
                                 onerror="this.src='../../../images/default.png'"
                                 style="width: 30px;
                                    height: 30px;
                                    border-radius: 15px;">
                        </td>
                    </tr>
                    <tr>
                    <#if entity.userType==2>
                        <td style="text-align: right; background: #ebf5ff">统一社会信用代码</td>
                        <td>
                            ${(entity.socialCreditCode)!}
                        </td>
                    </#if>
                     <#if entity.userType==1>
                        <td style="text-align: right; background: #ebf5ff">身份证号码</td>
                        <td>
                         <@commonTags method="getDecrypt3DEs" type="1" value="${(entity.idCard)!}">${(getDecrypt3DEs)!}</@commonTags>
                        </td>
                     </#if>
                        <td style="text-align: right; background: #ebf5ff">手机号码</td>
                        <td>
                         <@commonTags method="getDecrypt3DEs" type="1" value="${(entity.mobile)!}">${(getDecrypt3DEs)!}</@commonTags>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">用户类型</td>
                        <td><#if entity.userType==1>个人<#else >法人</#if></td>
                        <td style="text-align: right; background: #ebf5ff">用户状态</td>
                        <td><#if entity.status==0>新用户<#elseif entity.status==1 >使用中<#elseif entity.status==2>
                            禁用</#if>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">性别</td>
                        <td><#if entity.gender==0>未填写<#elseif entity.gender==1 >男<#elseif entity.gender==2>女</#if></td>
                        <td style="text-align: right; background: #ebf5ff">认证状态</td>
                        <td><#if entity.authStatus==1>已认证<#else >未认证</#if></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">登录次数</td>
                        <td>${(entity.loginCount)!'--'}</td>
                        <td style="text-align: right; background: #ebf5ff">最后一次登录时间</td>
                        <td>${(entity.lastLoginDate?string('yyyy-MM-dd'))!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">注册时间</td>
                        <td>${(entity.dtCreate?string('yyyy-MM-dd'))!}</td>
                        <td style="text-align: right; background: #ebf5ff">分享码</td>
                        <td>${(entity.shareCode)!}</td>
                    </tr>


                    </tbody>
                </table>
            </div>
        </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>