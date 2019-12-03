<#include "../../common/layout_dl.ftl">
<@header>
<link rel="stylesheet" href="/plugins/layui/css/layui.css">
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tAppMenuClassify/doEdit"
    <#else>
      action="/appc/tAppMenuClassify/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <input type="hidden" id="pid" name="pid"
               value="${(entity.pid)!"0"}" class="form-control" placeholder="请输入pid"
               lay-verify=""/>

        <div class="form-group">
            <label for="titile" class="col-sm-2 control-label">名称</label>
            <div class="col-sm-10">
                <input type="text" id="titile" name="titile"
                       value="${(entity.titile)!}" class="form-control input-select-200" placeholder="请输入名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="isEnabled" class="col-sm-2 control-label">是否启用</label>
            <div class="col-sm-10">
                <input type="radio" name="isEnabled" value="1"
                       title="启用"
                       checked>
                <input type="radio" name="isEnabled" value="0"
                       title="停用">
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">code</label>
            <div class="col-sm-10">
                <input type="text" id="code" name="code"
                       value="${(entity.code)!}" class="form-control input-select-200" placeholder="请输入code"
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