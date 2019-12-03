<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/appc/tAppUserShareChannel/doEdit">
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
            <div class="form-group">
                <label for="name" class="col-sm-3 control-label" style="white-space: nowrap;">渠道名称<span
                        class="xing_red">*</span></label>
                <div class="col-sm-9">
                    <input type="text" id="name" name="name"
                           value="${(entity.name)!}" class="form-control" placeholder="请输入渠道名称"
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