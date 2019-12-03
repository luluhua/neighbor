<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/tCmsAdvpos/doAdd">
    <div class="box-body">

        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称：<span
                    class="xing_red">*</span></label>
            <div class="col-sm-5">
                <input type="text" name="name" class="form-control input-select-200 "
                       placeholder="请输入广告位名称"
                       lay-verify="required">
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">代码：<span
                    class="xing_red">*</span></label>
            <div class="col-sm-5">
                <input type="text" name="code" class="form-control input-select-200 "
                       placeholder="请输入广告位代码"
                       lay-verify="required">
            </div>
        </div>
    <#--<div class="form-group">-->
    <#--<label for="sortIndex" class="col-sm-2 control-label">排序</label>-->
    <#--<div class="col-sm-10">-->
    <#--<span>*</span>-->
    <#--<input type="text" name="sortIndex" style="width: 100px;float: left" class="form-control"-->
    <#--value="${(SortIndex)}"-->
    <#--placeholder="请输入排序"-->
    <#--lay-verify="required|number">-->
    <#--<text> 排序越大越靠前</text>-->
    <#--</div>-->
    <#--</div>-->
        <div class="form-group">
            <label for="remark" class="col-sm-2 control-label">备注：</label>
            <div class="col-sm-5">
                <textarea name="remark" class="form-control textar-remark"
                          placeholder="请输入备注"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
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