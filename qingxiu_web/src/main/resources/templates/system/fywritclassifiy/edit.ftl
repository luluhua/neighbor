<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/system/fyTemplateClassifiy/doEdit"
    <#else>
      action="/system/fyTemplateClassifiy/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="type" class="col-sm-2 control-label">分类：</label>
            <div class="col-sm-10">
                <select name="Type" class="form-control select2 input-select-200" lay-ignore
                        lay-verify="required">
                    <option value="">--选择模板--</option>
                         <@dictTag method="getDictListByType" type="doc_type" >
                             <#list getDictListByType as m>
                              <option value="${(m.value)!}">${(m.label)!}</option>
                             </#list>
                         </@dictTag>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">分类名称：</label>
            <div class="col-sm-10">
                <input type="text" id="name" name="name"
                       value="${(entity.name)!}" class="form-control input-select-200" placeholder="请输入分类名称"
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