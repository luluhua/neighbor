<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <form role="form"  class="form-horizontal layui-form layui-form-pane " method="post" action="/appc/tGovProjectService/doCertificateMaking">
        <input type="hidden" name="id" value="${(entity.id)!}" />
        <input type="hidden" name="projectRecordId" value="${(entity.projectRecordId)!}" />
        <div class="box-body">

        <div class="form-group">
            <label for="explain" class="col-sm-2 control-label">制证时间</label>
            <div class="col-sm-10">
                <input type="text"
                       value=""
                       class="form-control date input-select-200" name="zhizhengTime" id="addTime"
                       placeholder="制证日期">
            </div>
        </div>

        <div class="form-group">
            <label for="explain" class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                         <textarea  name="remark" cols="80" rows="10"></textarea>
            </div>
        </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
                </div>
            </div>
        </div>
        </div>
    </form>
</@body>
<@footer>
<script>

    $('#addTime').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "timePicker": true,
        "timePicker24Hour": false,
        "opens": "center",
        locale: {
            format: "YYYY-MM-DD",
            applyLabel: '确定',
            cancelLabel: '取消',
            daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                '七月', '八月', '九月', '十月', '十一月', '十二月'
            ],
            firstDay: 1
        },
    }, function (start) {

    });
</script>
</@footer>