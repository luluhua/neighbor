<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="cTitle" class="col-sm-2 control-label">标题</label>
        <div class="col-sm-10">
            <input type="text" disabled id="cTitle" name="cTitle" value="${(entity.cTitle)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cDeptId" class="col-sm-2 control-label">部门id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cDeptId" name="cDeptId" value="${(entity.cDeptId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cCaseTypeId" class="col-sm-2 control-label">案件类型</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cCaseTypeId" name="cCaseTypeId" value="${(entity.cCaseTypeId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cStatus" class="col-sm-2 control-label">案件状态</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cStatus" name="cStatus" value="${(entity.cStatus)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cGridId" class="col-sm-2 control-label">网格id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cGridId" name="cGridId" value="${(entity.cGridId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cAddress" class="col-sm-2 control-label">地址</label>
        <div class="col-sm-10">
            <input type="text" disabled id="cAddress" name="cAddress" value="${(entity.cAddress)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cOrigin" class="col-sm-2 control-label">案件来源</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cOrigin" name="cOrigin" value="${(entity.cOrigin)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cLevel" class="col-sm-2 control-label">紧急类型</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cLevel" name="cLevel" value="${(entity.cLevel)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cDutyPerson" class="col-sm-2 control-label">责任人</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cDutyPerson" name="cDutyPerson" value="${(entity.cDutyPerson)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cDeadline" class="col-sm-2 control-label">截止时间</label>
        <input type="text" disabled name="cDeadline" class="form-control"
               value="${(entity.cDeadline?string('yyyy-MM-dd'))!}" id="cDeadline">
    </div>
    <div class="form-group">
        <label for="cExplain" class="col-sm-2 control-label">说明</label>
        <div class="col-sm-10">
            <input type="text" disabled id="cExplain" name="cExplain" value="${(entity.cExplain)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cDisposer" class="col-sm-2 control-label">处置人</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cDisposer" name="cDisposer" value="${(entity.cDisposer)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cReportPerson" class="col-sm-2 control-label">上报人</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cReportPerson" name="cReportPerson" value="${(entity.cReportPerson)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="dtReport" class="col-sm-2 control-label">上报时间</label>
        <input type="text" disabled name="dtReport" class="form-control"
               value="${(entity.dtReport?string('yyyy-MM-dd'))!}" id="dtReport">
    </div>
    <div class="form-group">
        <label for="cCode" class="col-sm-2 control-label">案件编号</label>
        <div class="col-sm-10">
            <input type="text" disabled id="cCode" name="cCode" value="${(entity.cCode)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="dtUpdate" class="col-sm-2 control-label">更新时间</label>
        <input type="text" disabled name="dtUpdate" class="form-control"
               value="${(entity.dtUpdate?string('yyyy-MM-dd'))!}" id="dtUpdate">
    </div>
</div>
</@body>
<@footer>
</@footer>