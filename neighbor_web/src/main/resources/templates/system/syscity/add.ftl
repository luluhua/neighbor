<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/sysCity/doAdd">
    <div class="box-body">
        <input type="hidden" id="pid" name="pid" class="form-control" value="#{(city.id)}"/>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称:<span class="xing_red">*</span></label>
            <div class="col-sm-10">
                <input type="text" id="name" name="name" class="form-control input-select-200" placeholder="请输入名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="abbreviation" class="col-sm-2 control-label">简称</label>
            <div class="col-sm-10">
                <input type="text" id="abbreviation" name="abbreviation" class="form-control input-select-200" lay-verify="required"
                       placeholder="请输入简称">
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">编码:<span class="xing_red">*</span></label>
            <div class="col-sm-10">
                <input type="text" id="code" name="code" class="form-control input-select-200" placeholder="请输入编码"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="status" class="col-sm-2 control-label">是否启用:<span class="xing_red">*</span></label>
            <div class="col-sm-10">
                <label>
                    <input name="enabled" type="radio" class="minimal" checked value="1" lay-ignore> 启用
                </label>
                <label>
                    <input name="enabled" type="radio" class="minimal" value="0" lay-ignore> 禁用
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="sortIndex" class="col-sm-2 control-label">排序:<span class="xing_red">*</span></label>
            <div class="col-sm-10">
                <input type="number" id="sortIndex" name="sortIndex" class="form-control input-number-100 "
                       placeholder="输入排序" lay-verify="required|number"/>
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