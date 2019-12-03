<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
      action="/system/tSysOrgRole/doAdd">
    <div class="box-body">
        <div class="form-group">
            <input type="hidden" name="orgId" value="${(org.id)!}">
            <label for="orgId" class="col-sm-2 control-label">部门</label>
            <div class="col-sm-10">
                <input class="input-detail" value="${(org.name)!}">
            </div>
        </div>
        <div class="form-group">
            <label for="roleId" class="col-sm-2 control-label">选择角色</label>
            <div class="col-sm-10">
                 <#list roleList as role>
                     <label>
                         <input type="checkbox" name="roleId" class="minimal"
                                value="${(role.id)!}" ${(myRolds?seq_contains('${role.id}')?string('checked',''))}
                                lay-ignore>
                         ${(role.name)!}
                     </label>
                     &nbsp;
                 </#list>
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