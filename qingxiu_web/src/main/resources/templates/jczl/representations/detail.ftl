<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="cCaseId" class="col-sm-2 control-label">cCaseId</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cCaseId" name="cCaseId" value="${(entity.cCaseId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cRepresentationsContent" class="col-sm-2 control-label">申述内容</label>
        <div class="col-sm-10">
            <input type="text" disabled id="cRepresentationsContent" name="cRepresentationsContent"
                   value="${(entity.cRepresentationsContent)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="cStatus" class="col-sm-2 control-label">申述状态</label>
        <div class="col-sm-10">
            <input type="number" disabled id="cStatus" name="cStatus" value="${(entity.cStatus)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="dtRepresentations" class="col-sm-2 control-label">申述时间</label>
        <input type="text" disabled name="dtRepresentations" class="form-control"
               value="${(entity.dtRepresentations?string('yyyy-MM-dd'))!}" id="dtRepresentations">
    </div>
    <div class="form-group">
        <label for="cResult" class="col-sm-2 control-label">申述结果</label>
        <div class="col-sm-10">
            <input type="text" disabled id="cResult" name="cResult" value="${(entity.cResult)!}" class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>