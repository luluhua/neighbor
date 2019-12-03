<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="apuId" class="col-sm-2 control-label">分类id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="apuId" name="apuId" value="${(entity.apuId)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="deptId" class="col-sm-2 control-label">部门id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="deptId" name="deptId" value="${(entity.deptId)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="themeId" class="col-sm-2 control-label">主题id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="themeId" name="themeId" value="${(entity.themeId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="entranceIcon" class="col-sm-2 control-label">图标</label>
        <div class="col-sm-10">
            <input type="text" disabled id="entranceIcon" name="entranceIcon" value="${(entity.entranceIcon)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="entranceUrl" class="col-sm-2 control-label">口跳转地址</label>
        <div class="col-sm-10">
            <input type="text" disabled id="entranceUrl" name="entranceUrl" value="${(entity.entranceUrl)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="sortIndex" class="col-sm-2 control-label">排序（越大越靠前）</label>
        <div class="col-sm-10">
            <input type="number" disabled id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>