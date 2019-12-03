<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">环节</label>
        <div class="col-sm-10">
            <input type="text" disabled id="name" name="name" value="${(entity.name)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="step" class="col-sm-2 control-label">步骤</label>
        <div class="col-sm-10">
            <input type="text" disabled id="step" name="step" value="${(entity.step)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="user" class="col-sm-2 control-label">办理人</label>
        <div class="col-sm-10">
            <input type="text" disabled id="user" name="user" value="${(entity.user)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="deadline" class="col-sm-2 control-label">办理时限</label>
        <div class="col-sm-10">
            <input type="number" disabled id="deadline" name="deadline" value="${(entity.deadline)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="remark" class="col-sm-2 control-label">办理时限说明</label>
        <div class="col-sm-10">
            <input type="text" disabled id="remark" name="remark" value="${(entity.remark)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="detail" class="col-sm-2 control-label">办理内容</label>
        <div class="col-sm-10">
            <input type="text" disabled id="detail" name="detail" value="${(entity.detail)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="result" class="col-sm-2 control-label">办理结果</label>
        <div class="col-sm-10">
            <input type="text" disabled id="result" name="result" value="${(entity.result)!}" class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>