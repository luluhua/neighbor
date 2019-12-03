<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form role="form" class="layui-form layui-form-pane pd10" method="post" action="/appc/tProjectClassify/doEdit">
    <div class="box-body">
        <input type="hidden" value="${(entity.id)!}" name="id"/>
        <div class="form-group">
            <label for="deptName">分类名称</label>
            <input type="text" id="classifyName" name="classifyName" class="form-control"
                   value="${(entity.classifyName)!}" lay-verify="required" placeholder="请输入分类名称">
        </div>
        <div class="form-group">
            <label>排序</label>
            <input class="form-control" name="sortIndex" id="sortIndex" placeholder="" type="number"
                   value="${(entity.sortIndex)!}">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i> 提 交
            </button>
        </div>
    </div>
</form>
</@body>
<@footer>
</@footer>