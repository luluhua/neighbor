<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/dj/tDjDgwUnit/doEdit"
    <#else>
      action="/dj/tDjDgwUnit/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <input type="hidden" value="${(entity.id)!}" name="id"/>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="name" name="name"
                       value="${(entity.name)!}" class="form-control" placeholder="请输入名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="pid" class="col-sm-2 control-label">所属<span class="xing_red"> *</span></label>
            <select name="pid" class="form-control select2" lay-verify="required" style="width: 100%;">
                <option value="">--选择大工委/大党委--</option>
            <#list dgwList as dgw>
                <option value="${(dgw.id)!}"
                <#if "${(dgw.id)!}"=="${(entity.pid)!}">selected</#if>><#if "${(dgw.pid)!}"!="0">${(dgw.pname)!} > </#if>${(dgw.name)!}</option>
            </#list>
            </select>
        </div>
        <div class="form-group">
            <label for="operationSystem" class="col-sm-2 control-label">运行制度</label>
            <div class="col-sm-10">
                <textarea name="operationSystem" style="padding: 6px 12px;" class="textar-remark"
                          placeholder="请输入运行制度">${(entity.operationSystem)!}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="sort" class="col-sm-2 control-label">排序</label>
            <div class="col-sm-10">
                <input type="text" id="sort" name="sort"
                       value="${(entity.sort)!}" class="form-control" placeholder="请输入排序"
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