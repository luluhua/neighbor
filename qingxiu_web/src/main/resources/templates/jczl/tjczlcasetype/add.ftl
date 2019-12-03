<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/jczl/tJczlCaseType/doAdd">
    <div class="box-body">

        <div class="form-group">
            <label for="cName" class="col-sm-2 control-label">类型名称</label>
            <div class="col-sm-10">
                <input type="text" id="cName" name="cName" class="form-control input-select-200" placeholder="请输入类型名称"/>
            </div>
        </div>
        <div class="form-group">
            <label for="cDeptId" class="col-sm-2 control-label">部门</label>
            <div class="col-sm-10">
                <select name="cDeptId" class="form-control select2 input-select-200" lay-ignore
                        lay-verify="required">
                          <#list deptList as dept>
                              <option value="${(dept.id)!}">${(dept.name)!}</option>
                          </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="qxt_code" class="col-sm-2 control-label">青秀通接口编码</label>
            <div class="col-sm-10">
                <input type="text" id="qxt_code" name="code" class="form-control input-select-200" placeholder="请输入青秀通接口编码" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="cRemark" class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <textarea class="textar-remark" id="cRemark" name="cRemark" placeholder="请输入备注"></textarea>
            <#--<input type="text" id="cRemark" name="cRemark" class="form-control" placeholder="请输入备注"/>-->
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