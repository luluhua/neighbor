<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/dj/tDjDgw/doEdit"
    <#else>
      action="/dj/tDjDgw/doAdd"
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
            <label for="name" class="col-sm-2 control-label">归属<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <select  id="pid" name="pid" class="form-control select2" style="width: 100%;"
                         lay-verify="required" lay-ignore >
                    <option value='0' <#if (entity.pid)??&&entity.pid==0>selected</#if>>大工委</option>
                    <#list parentList as item>
                        <option value="${(item.id)}" <#if (entity.pid)??&&entity.pid==item.id>selected</#if> >${(item.name)!}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="operationSystem" class="col-sm-2 control-label">运行制度<span class="xing_red">  </span></label>
            <div class="col-sm-10">

                <textarea name="operationSystem" style="padding: 6px 12px;" class="textar-remark" placeholder="请输入运行制度">${(entity.operationSystem)!}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="sort" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
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