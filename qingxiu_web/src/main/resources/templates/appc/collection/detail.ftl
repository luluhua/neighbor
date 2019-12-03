<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="apuId" class="col-sm-2 control-label">用户</label>
        <div class="col-sm-10">
            <input type="number" disabled id="apuId" name="apuId" value="${(entity.apuId)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="themeId" class="col-sm-2 control-label">办事主题</label>
        <div class="col-sm-10">
            <input type="number" disabled id="themeId" name="themeId" value="${(entity.themeId)!}"
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