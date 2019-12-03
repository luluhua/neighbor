<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="cDeptId" class="col-sm-2 control-label">部门</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cDeptId" name="cDeptId" value="${(entity.cDeptId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cName" class="col-sm-2 control-label">类型名称</label>
        <div class="col-sm-10">
            <input type="text" disabled id="cName" name="cName" value="${(entity.cName)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cRemark" class="col-sm-2 control-label">备注</label>
        <div class="col-sm-10">
            <input type="text" disabled id="cRemark" name="cRemark" value="${(entity.cRemark)!}" class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>