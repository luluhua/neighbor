<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tGovProjectBllc/doEdit"
    <#else>
      action="/appc/tGovProjectBllc/doAdd"
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
            <label for="name" class="col-sm-2 control-label">环节<span
                    class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="name" name="name"
                       value="${(entity.name)!}" class="form-control input-title-500" placeholder="请输入环节"
                       lay-verify="required"/>
                <p class="help-block"
                   class="ts-color">输入该事项办理环节的名称,如“受理”、“审批”等</p>
            </div>
        </div>
        <div class="form-group">
            <label for="step" class="col-sm-2 control-label">步骤</label>
            <div class="col-sm-10">
                <input type="text" id="step" name="step"
                       value="${(entity.step)!}" class="form-control input-title-500" placeholder="请输入步骤"
                       />
            </div>
        </div>
        <div class="form-group">
            <label for="user" class="col-sm-2 control-label">办理人</label>
            <div class="col-sm-10">
                <input type="text" id="user" name="user"
                       value="${(entity.user)!}" class="form-control input-select-200" placeholder="请输入办理人"
                      />
            </div>
        </div>
        <div class="form-group">
            <label for="deadline" class="col-sm-2 control-label">办理时限</label>
            <div class="col-sm-10">
                <input type="number"  id="deadline" name="deadline"
                       value="${(entity.deadline)!}" class="form-control input-number-100" placeholder="请输入办理时限"
                       />
            </div>
        </div>
        <div class="form-group">
            <label for="remark" class="col-sm-2 control-label">办理时限说明</label>
            <div class="col-sm-10">
                <input type="text" id="remark" name="remark"
                       value="${(entity.remark)!}" class="form-control input-title-500" placeholder="请输入办理时限说明"
                       />
            </div>
        </div>
        <div class="form-group">
            <label for="detail" class="col-sm-2 control-label">办理内容</label>
            <div class="col-sm-10">
                <textarea type="text" id="detail" name="detail"
                       value="${(entity.detail)!}" class="form-control textar-remark" placeholder="请输入办理内容"
                       >${(entity.detail)!}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="result" class="col-sm-2 control-label">办理结果</label>
            <div class="col-sm-10">
                <textarea type="text" id="result" name="result"
                       value="${(entity.result)!}" class="form-control textar-remark" placeholder="请输入办理结果"
                       ></textarea>
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