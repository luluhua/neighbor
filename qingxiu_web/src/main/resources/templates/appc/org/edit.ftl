<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tGovProjectOrg/doEdit"
    <#else>
      action="/appc/tGovProjectOrg/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="projectId" class="col-sm-2 control-label">projectId</label>
            <div class="col-sm-10">
                <input type="number" id="projectId" name="projectId"
                       value="${(entity.projectId)!}" class="form-control" placeholder="请输入projectId"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="orgId" class="col-sm-2 control-label">orgId</label>
            <div class="col-sm-10">
                <input type="number" id="orgId" name="orgId"
                       value="${(entity.orgId)!}" class="form-control" placeholder="请输入orgId"
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