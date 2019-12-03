<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tAppFeedbackMsg/doEdit"
    <#else>
      action="/appc/tAppFeedbackMsg/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="feedbackId" class="col-sm-2 control-label">意见反馈记录id</label>
            <div class="col-sm-10">
                <input type="number" id="feedbackId" name="feedbackId"
                       value="${(entity.feedbackId)!}" class="form-control" placeholder="请输入意见反馈记录id"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">信息内容</label>
            <div class="col-sm-10">
                <input type="text" id="content" name="content"
                       value="${(entity.content)!}" class="form-control" placeholder="请输入信息内容"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="userid" class="col-sm-2 control-label">用户id</label>
            <div class="col-sm-10">
                <input type="number" id="userid" name="userid"
                       value="${(entity.userid)!}" class="form-control" placeholder="请输入用户id"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="userName" class="col-sm-2 control-label">用户名称</label>
            <div class="col-sm-10">
                <input type="text" id="userName" name="userName"
                       value="${(entity.userName)!}" class="form-control" placeholder="请输入用户名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="userType" class="col-sm-2 control-label">用户类型 0 注册用户 1 系统用户</label>
            <div class="col-sm-10">
                <input type="text" id="userType" name="userType"
                       value="${(entity.userType)!}" class="form-control" placeholder="请输入用户类型 0 注册用户 1 系统用户"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="avatarUrl" class="col-sm-2 control-label">用户头像</label>
            <div class="col-sm-10">
                <input type="text" id="avatarUrl" name="avatarUrl"
                       value="${(entity.avatarUrl)!}" class="form-control" placeholder="请输入用户头像"
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