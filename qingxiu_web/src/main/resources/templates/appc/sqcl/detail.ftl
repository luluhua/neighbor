<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="sortIdex" class="col-sm-2 control-label">序号</label>
        <div class="col-sm-10">
            <input type="number" disabled id="sortIdex" name="sortIdex" value="${(entity.sortIdex)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="title" class="col-sm-2 control-label">申请材料名称</label>
        <div class="col-sm-10">
            <input type="text" disabled id="title" name="title" value="${(entity.title)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="rule" class="col-sm-2 control-label">申请材料依据</label>
        <div class="col-sm-10">
            <input type="text" disabled id="rule" name="rule" value="${(entity.rule)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="ruleType" class="col-sm-2 control-label">材料类型(原件/复印件)</label>
        <div class="col-sm-10">
            <input type="text" disabled id="ruleType" name="ruleType" value="${(entity.ruleType)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="needDoc" class="col-sm-2 control-label">是否需电子材料</label>
        <div class="col-sm-10">
            <input type="text" disabled id="needDoc" name="needDoc" value="${(entity.needDoc)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="count" class="col-sm-2 control-label">份数</label>
        <div class="col-sm-10">
            <input type="number" disabled id="count" name="count" value="${(entity.count)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="spec" class="col-sm-2 control-label">规格</label>
        <div class="col-sm-10">
            <input type="text" disabled id="spec" name="spec" value="${(entity.spec)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="mustDesc" class="col-sm-2 control-label">必要性及描述</label>
        <div class="col-sm-10">
            <input type="text" disabled id="mustDesc" name="mustDesc" value="${(entity.mustDesc)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="source" class="col-sm-2 control-label">来源渠道</label>
        <div class="col-sm-10">
            <input type="text" disabled id="source" name="source" value="${(entity.source)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="signCond" class="col-sm-2 control-label">签名签证要求</label>
        <div class="col-sm-10">
            <input type="text" disabled id="signCond" name="signCond" value="${(entity.signCond)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="canFallback" class="col-sm-2 control-label">是否容缺</label>
        <div class="col-sm-10">
            <input type="text" disabled id="canFallback" name="canFallback" value="${(entity.canFallback)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="fileUrl" class="col-sm-2 control-label">样表(空表)下载</label>
        <div class="col-sm-10">
            <input type="text" disabled id="fileUrl" name="fileUrl" value="${(entity.fileUrl)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="remark" class="col-sm-2 control-label">备注</label>
        <div class="col-sm-10">
            <input type="text" disabled id="remark" name="remark" value="${(entity.remark)!}" class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>