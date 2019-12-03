<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tGovProjForm/doEdit"
    <#else>
      action="/appc/tGovProjForm/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <input type="hidden" name="projectId" value="${(entity.projectId)!}"/>
        <div class="form-group">
            <label for="formName" class="col-sm-2 control-label">表单名称</label>
            <div class="col-sm-10">
                <input type="text" id="formName" name="formName"
                       value="${(entity.formName)!}" class="form-control" placeholder="请输入表单名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="formName" class="col-sm-2 control-label">关联材料</label>
            <div class="col-sm-10">
                <input type="hidden" name="sqclName" id="sqclName" value="${(entity.sqclName)!}"/>
                <select id="sqclId" name="sqclId" class="form-control select2"
                        lay-ignore
                        style="width: 100%;"
                        lay-verify="required">
                    <option value="">--关联申请材料--</option>
                    <#list sqclList as m>
                        <#if entity.sqclId??>
                            <option value="${(m.id?c)!}"
                                <#if (entity.id)??&&(m.id?c)==(entity.sqclId?c)>selected</#if>>${(m.title)!}
                            </option>
                        <#else>
                            <option value="${(m.id?c)!}">${(m.title)!}</option>
                        </#if>

                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="deptName" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="number" id="sortIndex" name="sortIndex" class="form-control input-select-200" lay-verify="required"
                       value="${(entity.sortIndex)!}"
                       placeholder="请输入排序编号">
            </div>
        </div>
        <div class="form-group">
            <label for="isEnable" class="col-sm-2 control-label">是否启用:</label>
            <div class="col-sm-10">
                 <@dictTag method="getDictListByType" type="is_enabled" >
                     <#list getDictListByType as m>
                         <label>
                             <input name="isEnable" type="radio" class="minimal"
                                    <#if "${(m.value)!}"=="${(entity.isEnable)!}">checked</#if> value="${(m.value)!}"
                                    lay-ignore> ${(m.label)!}
                         </label>
                     </#list>
                 </@dictTag>
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
<script>
    $("#sqclId").on("change",function () {
        var selected=$(this).children('option:selected').text();
        $("#sqclName").val(selected);
    })
</script>
</@footer>