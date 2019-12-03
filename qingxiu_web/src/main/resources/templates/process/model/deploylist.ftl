<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
  <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>系统管理 > 发布历史</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
            <!-- Your Page Content Here -->
                    <div class="box">
                        <div class="box-header">

                            <form class="form-inline" action="/process/deployLog/1" method="post">
                                <div class="form-group">
                                    <input type="text" name="daterange" value="${daterange!}" class="form-control date"
                                           id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">
                                </div>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="input-group pull-right">
                                    <button type="button" class="btn btn-primary btn-flat" onclick="javascript :history.back(-1);" ><i class="fa fa-file-excel-o"></i> 返回上页</button>
                                </div>
                            </form>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th>发布版本ID</th>
                                    <th>版本号</th>
                                    <th>操作</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td>${(entity.deploymentId)!}</td>
                                        <td>${(entity.version)!}</td>
                                        <td>
                                            <a class="btn btn-primary btn-xs " href="/process/historyRunProcess/1?procDefId=${(entity.id)!''}">查看历史运行流程记录</a>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/process/deployLog/" urlParas="?daterange=${daterange!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/process/deployLog/" urlParas="?daterange=${daterange!}&pageSize=${pageSize!}"  />
                            </div>
                        </div>
                    </div><!-- /.box -->
                </div>
            </div>
        </section><!-- /.content -->
  </div><!-- /.content-wrapper -->
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
                        getBoforeMonth(0, 1),
                        getBoforeMonth(0, 31)
                    ],
                    "上个月": [
                        getBoforeMonth(1, 1),
                        getBoforeMonth(1, 31)
                    ],
                    "最近三个月": [
                        getBoforeMonth(2, 1),
                        getBoforeMonth(0, 31)
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
                "autoUpdateInput": false,
                "opens": "right",
                "buttonClasses": "btn btn-sm"
            }, function (start, end, label) {
                console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
            });

            $('.date').on('apply.daterangepicker', function (ev, picker) {
                $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
            });

            $('.date').on('cancel.daterangepicker', function (ev, picker) {
                $(this).val('');
            });

        });
    </script>
</@footer>