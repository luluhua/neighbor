<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/appc/tAppEntry/doAddGroup">
    <div class="box-body">
        <div class="form-group">
            <label for="titile" class="col-sm-3 control-label">模块</label>
            <div class="col-sm-5">
                <select name="moduleId" class="form-control select2 input-select-200" lay-ignore
                >
                    <option value="0">无模块</option>
                    <@dictTag method="getDictListByType" type="app_entry_module_type" >
                        <#list getDictListByType as m>
                            <option value="${(m.value)!}">${(m.label)!}</option>
                        </#list>
                    </@dictTag>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="titile" class="col-sm-3 control-label">分组名称<span class="xing_red"> *</span></label>
            <div class="col-sm-5">
                <input type="text" id="titile" name="titile" class="form-control input-select-200" placeholder="请输入标题"
                       lay-verify="required"/>
            </div>
        </div>

        <div class="form-group">
            <label for="sortIndex" class="col-sm-3 control-label">排序<span class="xing_red"> *</span></label>
            <div class="col-sm-5">
                <input type="number" id="sortIndex" name="sortIndex" class="form-control input-select-200"
                       placeholder="请输入排序" value="${(sortIndex)}" lay-verify="required|number"/>
            </div>
        </div>

        <div class="form-group">
            <label for="isEnabled" class="col-sm-3 control-label">启用<span class="xing_red"> *</span></label>
            <div class="col-sm-5">
                <label>
                    <input name="isEnabled" type="radio" class="minimal" checked value="1" lay-ignore> 启用
                </label>
                <label>
                    <input name="isEnabled" type="radio" class="minimal" value="0" lay-ignore> 禁用
                </label>
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