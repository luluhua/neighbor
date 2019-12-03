<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="projectId" class="col-sm-2 control-label">事项id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="projectId" name="projectId" value="${(entity.projectId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="configName" class="col-sm-2 control-label">表单名称</label>
        <div class="col-sm-10">
            <input type="text" disabled id="configName" name="configName" value="${(entity.configName)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="configType" class="col-sm-2 control-label">表单类型
        </label>
        <div class="col-sm-10">
            <@dictTag method="dictValueByType" type="file_type" value="${(entity.configType)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="isMust" class="col-sm-2 control-label">是否必填
            1:必填 0 非必填
        </label>
        <div class="col-sm-10">
            <@dictTag method="dictValueByType" type="is_must" value="${(entity.isMust)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="isEnabled" class="col-sm-2 control-label">是否启用
            1:启用 0 停用
        </label>
        <div class="col-sm-10">
            <@dictTag method="dictValueByType" type="is_enabled" value="${(entity.isEnabled)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="sortIndex" class="col-sm-2 control-label">排序（越大越前）</label>
        <div class="col-sm-10">
            <input type="number" disabled id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>