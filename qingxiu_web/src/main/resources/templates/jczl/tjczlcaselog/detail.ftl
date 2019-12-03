<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="cActionType" class="col-sm-2 control-label">流转类型 1分配 2处理 3作废 4回退</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cActionType" name="cActionType" value="${(entity.cActionType)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cActionUser" class="col-sm-2 control-label">流转操作人</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cActionUser" name="cActionUser" value="${(entity.cActionUser)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="dtAction" class="col-sm-2 control-label">流转操作时间</label>
        <input type="text" disabled name="dtAction" class="form-control"
               value="${(entity.dtAction?string('yyyy-MM-dd'))!}" id="dtAction">
    </div>
    <div class="form-group">
        <label for="cActionRevicedUser" class="col-sm-2 control-label">接收人</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cActionRevicedUser" name="cActionRevicedUser"
                   value="${(entity.cActionRevicedUser)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cProcessingContent" class="col-sm-2 control-label">操作内容</label>
        <div class="col-sm-10">
            <input type="text" disabled id="cProcessingContent" name="cProcessingContent"
                   value="${(entity.cProcessingContent)!}" class="form-control"/>
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