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
            <label for="username" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" id="username" name="username"
                       value="${(entity.username)!}" class="form-control" placeholder="请输入用户名"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="text" id="password" name="password"
                       value="${(entity.password)!}" class="form-control" placeholder="请输入密码"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="mobile" class="col-sm-2 control-label">mobile</label>
            <div class="col-sm-10">
                <input type="text" id="mobile" name="mobile"
                       value="${(entity.mobile)!}" class="form-control" placeholder="请输入mobile"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="status" class="col-sm-2 control-label">0:正在使用中 1 禁用</label>
            <div class="col-sm-10">
                <input type="number" id="status" name="status"
                       value="${(entity.status)!}" class="form-control" placeholder="请输入0:正在使用中 1 禁用"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="guid" class="col-sm-2 control-label">GUID</label>
            <div class="col-sm-10">
                <input type="text" id="guid" name="guid"
                       value="${(entity.guid)!}" class="form-control" placeholder="请输入GUID"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>
                    提 交
                </button>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>