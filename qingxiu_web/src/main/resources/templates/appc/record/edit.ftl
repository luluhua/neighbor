<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"

      action="/system/tGovRecordMsg/doAdd"


    <div class="box-body">
        <div class="form-group">

        </div>
        <input type="hidden" name="recordId" value="${id}"/>
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">消息内容</label>
            <div class="col-sm-10">
                <textarea name="content" style="width: 90%;height: 150px"></textarea>
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