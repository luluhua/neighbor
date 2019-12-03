<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="themeTitle" class="col-sm-2 control-label">主题名称</label>
        <div class="col-sm-10">
            <input type="text" disabled id="themeTitle" name="themeTitle" value="${(entity.themeTitle)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="code" class="col-sm-2 control-label">主题编号</label>
        <div class="col-sm-10">
            <input type="text" disabled id="code" name="code" value="${(entity.code)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="themeType" class="col-sm-2 control-label">主题类型</label>
        <div class="col-sm-10">
             <@dictTag method="dictValueByType" type="theme_type" value="${(entity.themeType)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="themeUrl" class="col-sm-2 control-label">跳转链接（保留字段）</label>
        <div class="col-sm-10">
            <input type="text" disabled id="themeUrl" name="themeUrl" value="${(entity.themeUrl)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="themeIcon" class="col-sm-2 control-label">主题图标</label>
        <div class="col-sm-10">
            <input type="text" disabled id="themeIcon" name="themeIcon" value="${(entity.themeIcon)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="orgId" class="col-sm-2 control-label">所属机构/label>
        <div class="col-sm-10">
            <input type="number" disabled id="orgId" name="orgId" value="${(entity.orgId)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="isEnabled" class="col-sm-2 control-label">是否可用
            1:可以 0：停用（或正在升级中）
        </label>
        <div class="col-sm-10">
           <@dictTag method="dictValueByType" type="is_enabled" value="${(entity.isEnabled)!}"> ${(dictValueByType)!}</@dictTag>
        </div>
    </div>
    <div class="form-group">
        <label for="sortIndex" class="col-sm-2 control-label">排序（数字越大越前）</label>
        <div class="col-sm-10">
            <input type="number" disabled id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>