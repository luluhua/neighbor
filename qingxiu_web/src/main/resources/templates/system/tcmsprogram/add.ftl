<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/cms/tCmsProgram/doAdd">
    <div class="box-body">

        <div class="form-group">
            <label for="title" class="col-sm-3 control-label">栏目名称：<span
                    class="xing_red ">*</span></label>
            <div class="col-sm-5">
                <input type="text" id="title" name="title" class="form-control input-select-200"
                       placeholder="请输入栏目名称" lay-verify="required"/>
            </div>
        </div>

        <div class="form-group">
            <label for="code" class="col-sm-3 control-label">栏目编号：<span
                    class="xing_red ">*</span></label>
            <div class="col-sm-5">
                <input type="text" id="code" name="code" class="form-control input-select-200"
                       placeholder="请输入栏目编号" lay-verify="required"/>
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-3 control-label">&nbsp;</label>
            <div class="col-sm-5">
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