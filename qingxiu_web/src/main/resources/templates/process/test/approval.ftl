<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <form role="form"  class="form-horizontal layui-form layui-form-pane " method="post" action="/testProcess/approval">
        <input type="hidden" name="taskId" value="${(taskId)!}" />
        <div class="form-group">
            <label  class="col-sm-2 control-label">审批结果<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <label>
                    <input name="state" type="radio" class="minimal" checked value="1" lay-ignore> 同意
                </label>
                <label>
                    <input name="state" type="radio" class="minimal"   value="0" lay-ignore> 驳回
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="explain" class="col-sm-2 control-label">审批说明</label>
            <div class="col-sm-10">
                         <textarea  name="remark" cols="100" rows="100"
                                    style="height:100px;"></textarea>
            </div>
        </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
                </div>
            </div>
        </div>
    </form>
</@body>
<@footer>
</@footer>