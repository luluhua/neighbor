<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="sortIndex" class="col-sm-2 control-label">序号</label>
        <div class="col-sm-10">
            <input type="number" disabled id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="title" class="col-sm-2 control-label">环节名称</label>
        <div class="col-sm-10">
            <input type="text" disabled id="title" name="title" value="${(entity.title)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="rule" class="col-sm-2 control-label">实施依据</label>
        <div class="col-sm-10">
            <input type="text" disabled id="rule" name="rule" value="${(entity.rule)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="deadline" class="col-sm-2 control-label">deadline</label>
        <div class="col-sm-10">
            <input type="text" disabled id="deadline" name="deadline" value="${(entity.deadline)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>