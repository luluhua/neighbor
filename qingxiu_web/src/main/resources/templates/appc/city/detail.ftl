<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="cityId" class="col-sm-2 control-label">cityId</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cityId" name="cityId" value="${(entity.cityId)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="projectId" class="col-sm-2 control-label">projectId</label>
        <div class="col-sm-10">
            <input type="number" disabled id="projectId" name="projectId" value="${(entity.projectId)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>