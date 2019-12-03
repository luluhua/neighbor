<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
 <form role="form" class="layui-form layui-form-pane" method="post" action="/cms/tCmsTag/doEdit">
     <input type="hidden" name="id" value="${(entity.id)!}"/>
     <div class="box-body">

         <div class="form-group">
             <label for="uname">名称：</label>
             <input type="text" name="tagName" class="form-control" value="${(entity.tagName)!}"
                    placeholder="请输入名称"
                    lay-verify="required">
         </div>

         <div class="form-group">
             <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i> 提 交
             </button>
             <a class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i class="fa fa-close"></i>
                 取消</a>
         </div>
     </div><!-- /.box-body -->
 </form>
</@body>
<@footer>
<script>

    function getBoforeDate(before) {
        var now = new Date();
        now.setDate(now.getDate() - before);
        return now;
    }

    function getBoforeMonth(beforeMonth, day) {
        var now = new Date();
        now.setDate(day);
        now.setMonth(now.getMonth() - beforeMonth);
        return now;
    }

    $(function () {
    <#--$(".link-target").val(${(entity.linkTarget)!});-->
        $(".ref-type").val(${(entity.refType)!});
        var now = new Date();

        $('.date').daterangepicker({
            "showWeekNumbers": true,
            "showISOWeekNumbers": true,

            "locale": {
                "format": "YYYY/MM/DD",
                "separator": "-",
                "applyLabel": "应用",
                "cancelLabel": "取消",
                "fromLabel": "From",
                "toLabel": "To",
                "customRangeLabel": "自定义",
                "weekLabel": "W",
                "daysOfWeek": [
                    "日",
                    "一",
                    "二",
                    "三",
                    "四",
                    "五",
                    "六"
                ],
                "monthNames": [
                    "一月",
                    "二月",
                    "三月",
                    "四月",
                    "五月",
                    "六月",
                    "七月",
                    "八月",
                    "九月",
                    "十月",
                    "十一月",
                    "十二月"
                ],
                "firstDay": 1
            },
            "alwaysShowCalendars": true,
            "autoUpdateInput": false,
            "opens": "right",
            "buttonClasses": "btn btn-sm"
        }, function (start, end, label) {

        });

        $('.date').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
        });

        $('.date').on('cancel.daterangepicker', function (ev, picker) {
            // $(this).val('');
        });

    });
</script>
</@footer>