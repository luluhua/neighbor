<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/eessage/tAppMessageBoard/doEdit"
    <#else>
      action="/eessage/tAppMessageBoard/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">标题</label>
            <div class="col-sm-10">
                <input type="text" id="title" name="title" disabled
                       value="${(entity.title)!}" class="form-control input-detail" placeholder=""
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="userId" class="col-sm-2 control-label">提问用户</label>
            <div class="col-sm-10">
                <input type="hidden" id="userId" name="userId"
                       value="${(entity.userId)!}" class="form-control input-detail" placeholder=""
                       lay-verify="required"/>
                <input type="" id="" name="" disabled
                       value="${(appuser.username)!}" class="form-control input-detail" placeholder=""
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="userId" class="col-sm-2 control-label">提问时间</label>
            <div class="col-sm-10">
                <input type="text" id="dtCreate" name=""
                       value="${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}"
                       class="form-control input-detail" disabled
                       placeholder=""
                       lay-verify=""/>
            </div>
        </div>
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">内容</label>
            <div class="col-sm-10">
                <textarea class="textarea-detail" id="content" name="content"
                          disabled>${(entity.content)!}</textarea>
            </div>
        </div>
        <hr style="width: 100%;height: 8px;border: #0d6aad">
        <div class="form-group">
            <label for="recoveryContent" class="col-sm-2 control-label">回复内容</label>
            <div class="col-sm-10">
                <textarea class="textar-remark" id="recoveryContent"
                          name="recoveryContent">${(entity.recoveryContent)!}</textarea>
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