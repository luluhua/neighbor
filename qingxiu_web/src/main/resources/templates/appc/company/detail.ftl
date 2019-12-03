<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post">
    <div class="box-body">
        <div class="form-group">
            <div class="col-sm-10" style="margin: auto; float: none">
                <table class=" layui-table">
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="35%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">用户名</td>
                        <td>${(userlist.username)!'--'}</td>
                        <td style="text-align: right; background: #ebf5ff">昵称</td>
                        <td>${(userlist.nickname)!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">GUID编号</td>
                        <td>${(userlist.gid)!'--'}</td>
                        <td style="text-align: right; background: #ebf5ff">用户头像</td>
                        <td>
                            <img onclick="previewImg(this)"
                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(userlist.avatar)!'--'}"
                                 onerror="this.src='../../../images/default.png'"
                                 style="width: 30px;
                                    height: 30px;
                                    border-radius: 15px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">统一社会信用代码</td>
                        <td>${(userlist.socialCreditCode)!}</td>
                        <td style="text-align: right; background: #ebf5ff">手机号码</td>
                        <td><@commonTags method="getDecrypt3DEs" type="1" value="${(userlist.mobile)!}">${(getDecrypt3DEs)!}</@commonTags></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">用户类型</td>
                        <td><#if userlist.userType==1>个人<#else >法人</#if></td>
                        <td style="text-align: right; background: #ebf5ff">用户状态</td>
                        <td><#if userlist.status==0>新用户<#elseif userlist.status==1 >使用中<#elseif userlist.status==2>
                            禁用</#if>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">性别</td>
                        <td><#if userlist.gender==0>未填写<#elseif userlist.gender==1 >男<#elseif userlist.gender==2>
                            女</#if></td>
                        <td style="text-align: right; background: #ebf5ff">认证状态</td>
                        <td><#if userlist.authStatus==1>已认证<#else >未认证</#if></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">法人代表姓名</td>
                        <td>${(entity.corporationsName)!}</td>
                        <td style="text-align: right; background: #ebf5ff">法人代表身份证号码</td>
                        <td>
                            <@commonTags method="getDecrypt3DEs" type="1" value="${(entity.corporationsIdcard)!}">${(getDecrypt3DEs)!}</@commonTags>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">法人类型</td>
                        <td><#if entity.corporationsType==0>企业法人<#else >工商法人</#if></td>
                        <td style="text-align: right; background: #ebf5ff">单位名称</td>
                        <td>${(entity.companyName)!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">联系人姓名</td>
                        <td>${(entity.contacts)!'--'}</td>
                        <td style="text-align: right; background: #ebf5ff">联系人手机</td>
                        <td><@commonTags method="getDecrypt3DEs" type="1" value="${(entity.contactPhone)!}">${(getDecrypt3DEs)!}</@commonTags></td>
                    </tr>

                    <tr>
                        <td style="text-align: right; background: #ebf5ff">地址</td>
                        <td>${(entity.companyProvince)!} ${(entity.companyCity)!} ${(entity.companyArea)!} ${(entity.companyAddress)!'--'}</td>
                        <td style="text-align: right; background: #ebf5ff">认证图片</td>
                        <td>
                            <img onclick="previewImg(this)"
                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.socialCreditCodeImgurl)!'--'}"
                                 onerror="this.src='../../../images/default.png'"
                                 style="width: 30px;
                                    height: 30px;
                                    border-radius: 15px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">登录次数</td>
                        <td>${(userlist.loginCount)!}</td>
                        <td style="text-align: right; background: #ebf5ff">最后一次登录时间</td>
                        <td>${(userlist.lastLoginDate?string('yyyy-MM-dd'))!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">注册时间</td>
                        <td>${(userlist.dtCreate?string('yyyy-MM-dd'))!}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
</form>
</@body>
<@footer>
</@footer>