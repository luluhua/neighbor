<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tGovProjectTssphj/doEdit"
    <#else>
      action="/appc/tGovProjectTssphj/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
        <#if (entity.projectId)??>
            <input type="hidden" name="projectId" value="${(entity.projectId)}"/>
        <#else>
            <input type="hidden" name="projectId" value="${projectId!}"/>
        </#if>
    <div class="box-body">
        <div class="form-group">
            <label for="sortIndex" class="col-sm-2 control-label">序号</label>
            <div class="col-sm-10">
                  <#if (entity.id)??>
                    <input type="hidden" name="sortIndex" value="${(entity.sortIndex)!}"/>
                    <p class="form-control no-border">${(entity.sortIndex)!}</p>
                  <#else>
                    <input type="hidden" name="sortIndex" value="${sortIndex!}"/>
                    <p class="form-control no-border">${sortIndex!}</p>
                  </#if>
            </div>
        </div>
        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">环节名称</label>
            <div class="col-sm-10">
                <input type="text" id="title" name="title"
                       value="${(entity.title)!}" class="form-control input-title-500" placeholder="请输入环节名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="rule" class="col-sm-2 control-label">实施依据</label>
            <div class="col-sm-10">
                <textarea type="text" id="rule" name="rule"
                       value="${(entity.rule)!}" class="form-control textar-remark" placeholder="请输入实施依据">${(entity.rule)!}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="deadline" class="col-sm-2 control-label">办结时限</label>
            <div class="col-sm-10">
                <input type="text" id="deadline" name="deadline"
                       value="${(entity.deadline)!}" class="form-control input-select-200" placeholder="请输入办结时限"
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