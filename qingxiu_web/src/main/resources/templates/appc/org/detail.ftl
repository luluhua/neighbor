<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="projectId" class="col-sm-2 control-label">projectId</label>
        <div class="col-sm-10">
            <input type="number" disabled id="projectId" name="projectId" value="${(entity.projectId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="orgId" class="col-sm-2 control-label">orgId</label>
        <div class="col-sm-10">
            <input type="number" disabled id="orgId" name="orgId" value="${(entity.orgId)!}" class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>