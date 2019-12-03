<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="entranceId" class="col-sm-2 control-label">入口id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="entranceId" name="entranceId" value="${(entity.entranceId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="gid" class="col-sm-2 control-label">用户id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="gid" name="gid" value="${(entity.gid)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="sortIndex" class="col-sm-2 control-label">排序（越大越靠前）</label>
        <div class="col-sm-10">
            <input type="number" disabled id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="sDeleted" class="col-sm-2 control-label">是否删除 1:已删除 0：未删除</label>
        <div class="col-sm-10">
            <input type="number" disabled id="sDeleted" name="sDeleted" value="${(entity.sDeleted)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>