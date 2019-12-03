<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="recordId" class="col-sm-2 control-label">办事记录id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="recordId" name="recordId" value="${(entity.recordId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="configId" class="col-sm-2 control-label">办事事项配置id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="configId" name="configId" value="${(entity.configId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="materialName" class="col-sm-2 control-label">材料名</label>
        <div class="col-sm-10">
            <input type="text" disabled id="materialName" name="materialName" value="${(entity.materialName)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="materialUrl" class="col-sm-2 control-label">材料地址</label>
        <div class="col-sm-10">
            <input type="text" disabled id="materialUrl" name="materialUrl" value="${(entity.materialUrl)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="materialContent" class="col-sm-2 control-label">材料内容</label>
        <div class="col-sm-10">
            <input type="text" disabled id="materialContent" name="materialContent" value="${(entity.materialContent)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>