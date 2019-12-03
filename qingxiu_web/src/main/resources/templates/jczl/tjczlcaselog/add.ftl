<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/jczl/tJczlCaseLog/doAdd">
    <div class="box-body">

        <div class="form-group">
            <label for="cActionType" class="col-sm-2 control-label">流转类型 1分配 2处理 3作废 4回退</label>
            <div class="col-sm-10">
                <input type="number" id="cActionType" name="cActionType" class="form-control"
                       placeholder="请输入流转类型 1分配 2处理 3作废 4回退"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cActionUser" class="col-sm-2 control-label">流转操作人</label>
            <div class="col-sm-10">
                <input type="number" id="cActionUser" name="cActionUser" class="form-control" placeholder="请输入流转操作人"/>
            </div>
        </div>

        <div class="form-group">
            <label for="dtAction" class="col-sm-2 control-label">流转操作时间</label>
            <input type="text" name="dtAction" class="form-control date" id="dtAction" placeholder="开始日期  - 结束日期"
                   style="width: 228px;">
        </div>

        <div class="form-group">
            <label for="cActionRevicedUser" class="col-sm-2 control-label">接收人</label>
            <div class="col-sm-10">
                <input type="number" id="cActionRevicedUser" name="cActionRevicedUser" class="form-control"
                       placeholder="请输入接收人"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cProcessingContent" class="col-sm-2 control-label">操作内容</label>
            <div class="col-sm-10">
                <input type="text" id="cProcessingContent" name="cProcessingContent" class="form-control"
                       placeholder="请输入操作内容"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cRemark" class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <input type="text" id="cRemark" name="cRemark" class="form-control" placeholder="请输入备注"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>
                    提 交
                </button>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>