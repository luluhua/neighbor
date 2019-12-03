<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="gid" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-10">
            ${(entity.username)!}
        </div>
    </div>
    <div class="form-group">
        <label for="gid" class="col-sm-2 control-label">昵称</label>
        <div class="col-sm-10">
            ${(entity.nickname)!}
        </div>
    </div>
    <div class="form-group">
        <label for="gid" class="col-sm-2 control-label">用户的GUID编号</label>
        <div class="col-sm-10">
            ${(entity.gid)!}
        </div>
    </div>
    <div class="form-group">
        <label for="idCard" class="col-sm-2 control-label">（个人）身份证号码/（企业）社会信用代码</label>
        <div class="col-sm-10">
             <@commonTags method="getDecrypt3DEs" type="1" value="${(entity.idCard)!}">${(getDecrypt3DEs)!}</@commonTags>
        </div>
    </div>
    <div class="form-group">
        <label for="mobile" class="col-sm-2 control-label">手机号码</label>
        <div class="col-sm-10">
            <@commonTags method="getDecrypt3DEs" type="1" value="${(entity.mobile)!}">${(getDecrypt3DEs)!}</@commonTags>
        </div>
    </div>
    <div class="form-group">
        <label for="userType" class="col-sm-2 control-label">用户类型</label>
        <div class="col-sm-10">
            <@dictTag method="dictValueByType" type="user_type" value="${(entity.userType)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="avatar" class="col-sm-2 control-label">用户头像路径</label>
        <div class="col-sm-10">
            <img src="${(entity.avatar)!}">
        </div>
    </div>
    <div class="form-group">
        <label for="gender" class="col-sm-2 control-label">性别</label>
        <div class="col-sm-10">
            <@dictTag method="dictValueByType" type="gender_type" value="${(entity.gender)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="status" class="col-sm-2 control-label">用户状态</label>
        <div class="col-sm-10">
            <@dictTag method="dictValueByType" type="app_user_status" value="${(entity.status)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="authStatus" class="col-sm-2 control-label">认证状态</label>
        <div class="col-sm-10">
              <@dictTag method="dictValueByType" type="auth_status" value="${(entity.authStatus)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="loginCount" class="col-sm-2 control-label">登录次数</label>
        <div class="col-sm-10">
            <input type="number" disabled id="loginCount" name="loginCount" value="${(entity.loginCount)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="lastLoginDate" class="col-sm-2 control-label">最后一次登录时间</label>
        <input type="text" disabled name="lastLoginDate" class="form-control"
               value="${(entity.lastLoginDate?string('yyyy-MM-dd'))!}" id="lastLoginDate">
    </div>
    <div class="form-group">
        <label for="lastLoginDate" class="col-sm-2 control-label">注册时间</label>
        <input type="text" disabled name="lastLoginDate" class="form-control"
               value="${(entity.dtCreate?string('yyyy-MM-dd'))!}" id="lastLoginDate">
    </div>
</div>
</@body>
<@footer>
</@footer>