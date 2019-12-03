<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
      action="/jczl/tJczlCaseDepartmentalRepresentations/doEdit">
    <div class="box-body">
        <div class="form-group">
            <label for="cCaseId" class="col-sm-2 control-label">cCaseId</label>
            <div class="col-sm-10">
                <input type="number" id="cCaseId" name="cCaseId" value="${(entity.cCaseId)!}" class="form-control"
                       placeholder="请输入cCaseId" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="cRepresentationsContent" class="col-sm-2 control-label">申述内容</label>
            <div class="col-sm-10">
                <input type="text" id="cRepresentationsContent" name="cRepresentationsContent"
                       value="${(entity.cRepresentationsContent)!}" class="form-control" placeholder="请输入申述内容"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="cStatus" class="col-sm-2 control-label">申述状态</label>
            <div class="col-sm-10">
                <input type="number" id="cStatus" name="cStatus" value="${(entity.cStatus)!}" class="form-control"
                       placeholder="请输入申述状态" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="dtRepresentations" class="col-sm-2 control-label">申述时间</label>
            <input type="text" name="dtRepresentations" class="form-control date" value="${(entity.dtRepresentations)!}"
                   id="dtRepresentations" placeholder="开始日期  - 结束日期" style="width: 228px;">
        </div>
        <div class="form-group">
            <label for="cResult" class="col-sm-2 control-label">申述结果</label>
            <div class="col-sm-10">
                <input type="text" id="cResult" name="cResult" value="${(entity.cResult)!}" class="form-control"
                       placeholder="请输入申述结果" lay-verify="required"/>
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