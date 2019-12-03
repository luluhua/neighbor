<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="aName" class="col-sm-2 control-label">版本名称</label>
        <div class="col-sm-10">
            <input type="text" disabled id="aName" name="aName" value="${(entity.aName)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="aType" class="col-sm-2 control-label">平台</label>
        <div class="col-sm-10">
            <@dictTag method="dictValueByType" type="app_type" value="${(entity.aType)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="aStartupPageUrl" class="col-sm-2 control-label">启动页地址</label>
        <div class="col-sm-10">
            <input type="text" disabled id="aStartupPageUrl" name="aStartupPageUrl" value="${(entity.aStartupPageUrl)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="aStatus" class="col-sm-2 control-label">是否强制更新</label>
        <div class="col-sm-10">
            <@dictTag method="dictValueByType" type="is_yes_no" value="${(entity.aStatus)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>