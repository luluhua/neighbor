<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/system/fyJudgeContact/doEdit"
    <#else>
      action="/system/fyJudgeContact/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">姓名：</label>
            <div class="col-sm-10">
                <input type="text" id="name" name="name"
                       value="${(entity.name)!}" class="form-control input-select-200" placeholder="请输入姓名"
                       lay-verify=""/>
            </div>
        </div>
        <div class="form-group">
            <label for="deptName" class="col-sm-2 control-label">部门名称：</label>
            <div class="col-sm-10">
                <input type="text" id="deptName" name="deptName"
                       value="${(entity.deptName)!}" class="form-control input-select-200" placeholder="请输入部门名称"
                       lay-verify=""/>
            </div>
        </div>
        <div class="form-group">
            <label for="mobile1" class="col-sm-2 control-label">电话1：</label>
            <div class="col-sm-10">
                <input type="text" id="mobile1" name="mobile1"
                       value="${(entity.mobile1)!}" class="form-control input-select-200" placeholder="请输入电话1"
                       lay-verify=""/>
            </div>
        </div>
        <div class="form-group">
            <label for="mobile2" class="col-sm-2 control-label">电话2：</label>
            <div class="col-sm-10">
                <input type="text" id="mobile2" name="mobile2"
                       value="${(entity.mobile2)!}" class="form-control input-select-200" placeholder="请输入电话2"
                       lay-verify=""/>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">邮箱地址：</label>
            <div class="col-sm-10">
                <input type="text" id="email" name="email"
                       value="${(entity.email)!}" class="form-control input-select-200" placeholder="请输入邮箱地址"
                       lay-verify=""/>
            </div>
        </div>
        <div class="form-group">
            <label for="remark" class="col-sm-2 control-label">备注：</label>
            <div class="col-sm-10">
                <textarea id="remark" name="remark" class="textar-remark" placeholder="请输入广告备注说明"
                >${(entity.remark)!}</textarea>
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