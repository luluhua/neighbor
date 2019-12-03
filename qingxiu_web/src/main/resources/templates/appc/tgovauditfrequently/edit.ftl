<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tGovAuditFrequently/doEdit"
    <#else>
      action="/appc/tGovAuditFrequently/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="deptId" class="col-sm-2 control-label">选择部门</label>
            <div class="col-sm-5">
                <select name="orgId" class="form-control select2 input-select-200" lay-ignore style="width: 100%;"
                        lay-verify="required">
                    <option value="">--部门查询--</option>
                                            <#list orgList as org>
                                        <option value="${(org.id)!}"
                                                <#if "${(org.id)!}"=="${(entity.orgId)!}">selected</#if>
                                        >${(org.name)!}</option>
                                            </#list>
                </select>
            </div>
        </div>


        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">内容</label>
            <div class="col-sm-10">
                <textarea class="textar-remark" id="content" name="content"
                          lay-verify="required">${(entity.content)!}</textarea>
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