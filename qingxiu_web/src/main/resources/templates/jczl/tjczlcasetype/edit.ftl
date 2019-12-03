<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/jczl/tJczlCaseType/doEdit">
    <input type="hidden" name="id" value="${(entity.id)!}"/>
    <div class="box-body">
        <div class="form-group">
            <label for="cName" class="col-sm-2 control-label">类型名称</label>
            <div class="col-sm-10">
                <input type="text" id="cName" name="cName" value="${(entity.cName)!}"
                       class="form-control input-select-200"
                       placeholder="请输入类型名称" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="cDeptId" class="col-sm-2 control-label">部门</label>
            <div class="col-sm-10">
                <select name="cDeptId" class="form-control  input-select-200" lay-ignore
                        lay-verify="required">
                          <#list deptList as dept>
                              <option value="${(dept.id)!}"
                                      <#if "${(entity.cDeptId)!}"=="${(dept.id)!}">selected</#if>>${(dept.name)!}</option>
                          </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="qxt_code" class="col-sm-2 control-label">青秀通接口编码</label>
            <div class="col-sm-10">
                <input type="text" id="qxt_code" name="code" value="${(entity.code)!}" class="form-control input-select-200" placeholder="请输入青秀通接口编码" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="cRemark" class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <textarea class="textar-remark" id="cRemark" name="cRemark"
                          placeholder="请输入备注">${(entity.cRemark)!}</textarea>
            <#--<input type="text" id="cRemark" name="cRemark" value="${(entity.cRemark)!}" class="form-control"-->
            <#--placeholder="请输入备注"/>-->
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