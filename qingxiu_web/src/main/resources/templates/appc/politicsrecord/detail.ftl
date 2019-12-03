<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="apuId" class="col-sm-2 control-label">用户id</label>
        <div class="col-sm-10">
            <input type="number" disabled id="apuId" name="apuId" value="${(entity.apuId)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="title" class="col-sm-2 control-label">标题</label>
        <div class="col-sm-10">
            <input type="text" disabled id="title" name="title" value="${(entity.title)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="orgId" class="col-sm-2 control-label">发往</label>
        <div class="col-sm-10">
            <input type="number" disabled id="orgId" name="orgId" value="${(entity.orgId)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="politicsType" class="col-sm-2 control-label">类型</label>
        <div class="col-sm-10">
            <input type="number" disabled id="politicsType" name="politicsType" value="${(entity.politicsType)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="content" class="col-sm-2 control-label">详细描述</label>
        <div class="col-sm-10">
            <input type="text" disabled id="content" name="content" value="${(entity.content)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="status" class="col-sm-2 control-label">状态</label>
        <div class="col-sm-10">
            <input type="number" disabled id="status" name="status" value="${(entity.status)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="result" class="col-sm-2 control-label">结果</label>
        <div class="col-sm-10">
            <input type="text" disabled id="result" name="result" value="${(entity.result)!}" class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>