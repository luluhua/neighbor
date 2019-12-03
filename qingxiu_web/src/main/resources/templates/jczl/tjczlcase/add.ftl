<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/jczl/tJczlCase/doAdd">
    <div class="box-body">

        <div class="form-group">
            <label for="cTitle" class="col-sm-2 control-label">标题</label>
            <div class="col-sm-10">
                <input type="text" id="cTitle" name="cTitle" class="form-control" placeholder="请输入标题"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cDeptId" class="col-sm-2 control-label">部门id</label>
            <div class="col-sm-10">
                <input type="number" id="cDeptId" name="cDeptId" class="form-control" placeholder="请输入部门id"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cCaseTypeId" class="col-sm-2 control-label">案件类型</label>
            <div class="col-sm-10">
                <input type="number" id="cCaseTypeId" name="cCaseTypeId" class="form-control" placeholder="请输入案件类型"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cStatus" class="col-sm-2 control-label">案件状态</label>
            <div class="col-sm-10">
                <input type="number" id="cStatus" name="cStatus" class="form-control" placeholder="请输入案件状态"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cGridId" class="col-sm-2 control-label">网格id</label>
            <div class="col-sm-10">
                <input type="number" id="cGridId" name="cGridId" class="form-control" placeholder="请输入网格id"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cAddress" class="col-sm-2 control-label">地址</label>
            <div class="col-sm-10">
                <input type="text" id="cAddress" name="cAddress" class="form-control" placeholder="请输入地址"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cOrigin" class="col-sm-2 control-label">案件来源</label>
            <div class="col-sm-10">
                <input type="number" id="cOrigin" name="cOrigin" class="form-control" placeholder="请输入案件来源"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cLevel" class="col-sm-2 control-label">紧急类型</label>
            <div class="col-sm-10">
                <input type="number" id="cLevel" name="cLevel" class="form-control" placeholder="请输入紧急类型"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cDutyPerson" class="col-sm-2 control-label">责任人</label>
            <div class="col-sm-10">
                <input type="number" id="cDutyPerson" name="cDutyPerson" class="form-control" placeholder="请输入责任人"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cDeadline" class="col-sm-2 control-label">截止时间</label>
            <input type="text" name="cDeadline" class="form-control date" id="cDeadline" placeholder="开始日期  - 结束日期"
                   style="width: 228px;">
        </div>

        <div class="form-group">
            <label for="cExplain" class="col-sm-2 control-label">说明</label>
            <div class="col-sm-10">
                <input type="text" id="cExplain" name="cExplain" class="form-control" placeholder="请输入说明"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cDisposer" class="col-sm-2 control-label">处置人</label>
            <div class="col-sm-10">
                <input type="number" id="cDisposer" name="cDisposer" class="form-control" placeholder="请输入处置人"/>
            </div>
        </div>

        <div class="form-group">
            <label for="cReportPerson" class="col-sm-2 control-label">上报人</label>
            <div class="col-sm-10">
                <input type="number" id="cReportPerson" name="cReportPerson" class="form-control" placeholder="请输入上报人"/>
            </div>
        </div>

        <div class="form-group">
            <label for="dtReport" class="col-sm-2 control-label">上报时间</label>
            <input type="text" name="dtReport" class="form-control date" id="dtReport" placeholder="开始日期  - 结束日期"
                   style="width: 228px;">
        </div>

        <div class="form-group">
            <label for="cCode" class="col-sm-2 control-label">案件编号</label>
            <div class="col-sm-10">
                <input type="text" id="cCode" name="cCode" class="form-control" placeholder="请输入案件编号"/>
            </div>
        </div>

        <div class="form-group">
            <label for="dtUpdate" class="col-sm-2 control-label">更新时间</label>
            <input type="text" name="dtUpdate" class="form-control date" id="dtUpdate" placeholder="开始日期  - 结束日期"
                   style="width: 228px;">
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