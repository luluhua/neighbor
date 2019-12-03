<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="title" class="col-sm-2 control-label">标题</label>
        <div class="col-sm-10">
            <input type="text" disabled id="title" name="title" value="${(entity.title)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="content" class="col-sm-2 control-label">内容</label>
        <div class="col-sm-10">
            <input type="text" disabled id="content" name="content" value="${(entity.content)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="userId" class="col-sm-2 control-label">用户ID</label>
        <div class="col-sm-10">
            <input type="number" disabled id="userId" name="userId" value="${(entity.userId)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="recoveryTime" class="col-sm-2 control-label">回复时间</label>
        <input type="text" disabled name="recoveryTime" class="form-control"
               value="${(entity.recoveryTime?string('yyyy-MM-dd'))!}" id="recoveryTime">
    </div>
    <div class="form-group">
        <label for="recoveryContent" class="col-sm-2 control-label">回复内容</label>
        <div class="col-sm-10">
            <input type="text" disabled id="recoveryContent" name="recoveryContent" value="${(entity.recoveryContent)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>