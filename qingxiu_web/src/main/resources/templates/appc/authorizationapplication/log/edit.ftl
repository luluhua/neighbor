<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tAppAuthorizationApplicationLog/doEdit"
    <#else>
      action="/appc/tAppAuthorizationApplicationLog/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
<div class="box-body">
                                                                                    <div class="form-group">
                    <label for="appUserId" class="col-sm-2 control-label">登录用户id</label>
                    <div class="col-sm-10">
                        <input type="number" id="appUserId" name="appUserId"
                               value="${(entity.appUserId)!}" class="form-control" placeholder="请输入登录用户id"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                        <div class="form-group">
                    <label for="appUserGid" class="col-sm-2 control-label">appUserGid</label>
                    <div class="col-sm-10">
                        <input type="text" id="appUserGid" name="appUserGid"
                               value="${(entity.appUserGid)!}" class="form-control" placeholder="请输入appUserGid"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                                <div class="form-group">
                    <label for="appId" class="col-sm-2 control-label">授权应用ID</label>
                    <div class="col-sm-10">
                        <input type="number" id="appId" name="appId"
                               value="${(entity.appId)!}" class="form-control" placeholder="请输入授权应用ID"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                                <div class="form-group">
                    <label for="authorizationTime" class="col-sm-2 control-label">授权时间</label>
                    <input type="text" name="authorizationTime" class="form-control date"
                           value="${(entity.authorizationTime)!}" id="authorizationTime" placeholder="开始日期  - 结束日期"
                           style="width: 228px;">
                </div>
                                                                                                        <div class="form-group">
                    <label for="authorizationResult" class="col-sm-2 control-label">用户授权操作 0 不同意 1不同意</label>
                    <div class="col-sm-10">
                        <input type="number" id="authorizationResult" name="authorizationResult"
                               value="${(entity.authorizationResult)!}" class="form-control" placeholder="请输入用户授权操作 0 不同意 1不同意"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                        <div class="form-group">
                    <label for="authorizationRoles" class="col-sm-2 control-label">授权内容</label>
                    <div class="col-sm-10">
                        <input type="text" id="authorizationRoles" name="authorizationRoles"
                               value="${(entity.authorizationRoles)!}" class="form-control" placeholder="请输入授权内容"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="requestIp" class="col-sm-2 control-label">请求授权IP</label>
                    <div class="col-sm-10">
                        <input type="text" id="requestIp" name="requestIp"
                               value="${(entity.requestIp)!}" class="form-control" placeholder="请输入请求授权IP"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                                                    <div class="form-group">
                    <label for="state" class="col-sm-2 control-label">本次授权结果 0 成功授权 1用户不同意授权 2授权失败</label>
                    <div class="col-sm-10">
                        <input type="number" id="state" name="state"
                               value="${(entity.state)!}" class="form-control" placeholder="请输入本次授权结果 0 成功授权 1用户不同意授权 2授权失败"
                               lay-verify="required"/>
                    </div>
                </div>
                                        <div class="form-group">
        <label class="col-sm-2 control-label">&nbsp;</label>
        <div class="col-sm-10">
            <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i> 提 交
            </button>
        </div>
    </div>
</div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>