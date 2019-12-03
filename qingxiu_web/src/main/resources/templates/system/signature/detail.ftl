<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="orgId" class="col-sm-2 control-label">部门id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="orgId" name="orgId" value="${(entity.orgId)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="signatureFile" class="col-sm-2 control-label">电子印章文件</label>
        <div class="col-sm-10">
            <input type="text" disabled id="signatureFile" name="signatureFile" value="${(entity.signatureFile)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="isEnabled" class="col-sm-2 control-label">是否可用
            1:可以 0：停用（或正在升级中）
        </label>
        <div class="col-sm-10">
            <input type="number" disabled id="isEnabled" name="isEnabled" value="${(entity.isEnabled)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>