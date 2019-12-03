<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
        <div class="box-body">
            <div class="form-group">
                <label for="pid"  class="col-sm-2 control-label">分組</label>
                <div class="col-sm-10">

                </div>
            </div>
            <div class="form-group">
                <label for="titile" class="col-sm-2 control-label">应用名称</label>
                <div class="col-sm-10">
                   ${(entity.titile)!'--'}
                </div>
            </div>

            <div class="form-group">
                <label for="actionType" class="col-sm-2 control-label">动作类型</label>
                <div class="col-sm-10">
                    <@dictTag method="dictValueByType" type="action_type" value="${(entity.actionType)!}"> ${(dictValueByType)!}</@dictTag>
                </div>
            </div>

            <div class="form-group">
                <label for="actionPage1" class="col-sm-2 control-label">动作目标地址/跳转页面(android)</label>
                <div class="col-sm-10">
                    ${(entity.actionPage1)!'--'}
                </div>
            </div>

            <div class="form-group">
                <label for="actionPage2" class="col-sm-2 control-label">动作目标地址/跳转页面(ios)</label>
                <div class="col-sm-10">
                 ${(entity.actionPage2)!'--'}
                </div>
            </div>
            <div class="form-group">
                <label for="icon" class="col-sm-2 control-label">应用图标</label>
                <div class="col-sm-10">
                    <img src="${(entity.icon)!'--'}" width="40px" height="40px">
                </div>
            </div>
            <div class="form-group">
                <label for="webContent" class="col-sm-2 control-label">webContent</label>
                <div class="col-sm-10">
                         <textarea class="ase" id="editor_id" name="webContent"
                                   style="height:300px;">${(entity.webContent)}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="sortIndex" class="col-sm-2 control-label">排序</label>
                <div class="col-sm-10">
                    ${(entity.sortIndex)}
                </div>
            </div>
            <div class="form-group">
                <label for="isEnabled" class="col-sm-2 control-label">是否启用</label>
                <div class="col-sm-10">
                    <@dictTag method="dictValueByType" type="is_yes_no" value="${(entity.isEnabled)!}"> ${(dictValueByType)!}</@dictTag>
                </div>
            </div>
        </div><!-- /.box-body -->

</@body>
<@footer>
</@footer>