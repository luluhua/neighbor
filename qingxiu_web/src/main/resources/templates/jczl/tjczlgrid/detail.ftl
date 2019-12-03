<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="gName" class="col-sm-2 control-label">网格名称</label>
        <div class="col-sm-10">
            <input type="text" disabled id="gName" name="gName" value="${(entity.gName)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="gCode" class="col-sm-2 control-label">网格编号</label>
        <div class="col-sm-10">
            <input type="number" disabled id="gCode" name="gCode" value="${(entity.gCode)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="gAddress" class="col-sm-2 control-label">网格地址</label>
        <div class="col-sm-10">
            <input type="text" disabled id="gAddress" name="gAddress" value="${(entity.gAddress)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="gCoordinate" class="col-sm-2 control-label">网格左边</label>
        <div class="col-sm-10">
            <input type="text" disabled id="gCoordinate" name="gCoordinate" value="${(entity.gCoordinate)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="gRemark" class="col-sm-2 control-label">备注</label>
        <div class="col-sm-10">
            <input type="text" disabled id="gRemark" name="gRemark" value="${(entity.gRemark)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="gStatus" class="col-sm-2 control-label">是否启用</label>
        <div class="col-sm-10">
             <@dictTag method="dictValueByType" type="is_enabled" value="${(entity.gStatus)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="gManagePerson" class="col-sm-2 control-label">网格管理人</label>
        <div class="col-sm-10">
            <input type="number" disabled id="gManagePerson" name="gManagePerson" value="${(entity.gManagePerson)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>