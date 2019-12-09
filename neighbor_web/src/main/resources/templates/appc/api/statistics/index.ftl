<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>app管理 >  app接口统计</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline"  action="/appc/tAppApiLog/list/1" method="post">

                                <div class="input-group">
                                    <select name="origin" class="form-control">
                                        <option value="">--来源--</option>
                                        <@dictTag method="getDictListByType" type="app_orgin" >
                                            <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                        <#if "${(m.value)!}"=="${(origin)!}">selected</#if>
                                                >${(m.label)!}</option>
                                            </#list>

                                        </@dictTag>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="daterange" value="${daterange!}" class="form-control date" id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control" style="width: 300px;" placeholder="接口名称或接口地址或ip地址查询">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="box-body table-responsive no-padding">

                        </div><!-- /.box-body -->
                        <div class="box-footer row">

                        </div>
                    </div><!-- /.box -->
                </div>
            </div>
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
</@body>
<@footer>
    <script>

        function getBoforeDate(before){
            var now = new Date();
            now.setDate(now.getDate()-before);
            return now;
        }

        function getBoforeMonth(beforeMonth,day){
            var now = new Date();
            now.setDate(day);
            now.setMonth(now.getMonth()-beforeMonth);
            return now;
        }

        $(function(){

            var now = new Date();

            $('.date').daterangepicker({
                "showWeekNumbers": true,
                "showISOWeekNumbers": true,
                "ranges": {
                    "今天": [
                        now,
                        now
                    ],
                    "昨天": [
                        getBoforeDate(1),
                        getBoforeDate(1)
                    ],
                    "最近7天": [
                        getBoforeDate(7),
                        now
                    ],
                    "最近30天": [
                        getBoforeDate(30),
                        now
                    ],
                    "本月": [
                        getBoforeMonth(0,1),
                        getBoforeMonth(0,31)
                    ],
                    "上个月": [
                        getBoforeMonth(1,1),
                        getBoforeMonth(1,31)
                    ],
                    "最近三个月": [
                        getBoforeMonth(2,1),
                        getBoforeMonth(0,31)
                    ]
                },
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
                "autoUpdateInput":false,
                "opens": "right",
                "buttonClasses": "btn btn-sm"
            }, function(start, end, label) {
                console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
            });

            $('.date').on('apply.daterangepicker', function(ev, picker) {
                $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
            });

            $('.date').on('cancel.daterangepicker', function(ev, picker) {
                $(this).val('');
            });

        });
    </script>
</@footer>