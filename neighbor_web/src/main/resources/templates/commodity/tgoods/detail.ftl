<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">物品名称</label>
        <div class="col-sm-10">
            <input type="text" disabled id="name" name="name" value="${(entity.name)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="describe" class="col-sm-2 control-label">描述</label>
        <div class="col-sm-10">
            <input type="text" disabled id="describe" name="describe" value="${(entity.describe)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="quantity" class="col-sm-2 control-label">数量</label>
        <div class="col-sm-10">
            <input type="number" disabled id="quantity" name="quantity" value="${(entity.quantity)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="specification" class="col-sm-2 control-label">规格</label>
        <div class="col-sm-10">
            <input type="text" disabled id="specification" name="specification" value="${(entity.specification)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="intro" class="col-sm-2 control-label">介绍</label>
        <div class="col-sm-10">
            <input type="text" disabled id="intro" name="intro" value="${(entity.intro)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="Images" class="col-sm-2 control-label">图片</label>
        <div class="col-sm-10">
            <input type="text" disabled id="Images" name="Images" value="${(entity.Images)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="priceType" class="col-sm-2 control-label">价格类型 0单价 1总价</label>
        <div class="col-sm-10">
            <input type="number" disabled id="priceType" name="priceType" value="${(entity.priceType)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="sortIndex" class="col-sm-2 control-label">sortIndex</label>
        <div class="col-sm-10">
            <input type="number" disabled id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="navigationCode" class="col-sm-2 control-label">导航code</label>
        <div class="col-sm-10">
            <input type="text" disabled id="navigationCode" name="navigationCode" value="${(entity.navigationCode)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>