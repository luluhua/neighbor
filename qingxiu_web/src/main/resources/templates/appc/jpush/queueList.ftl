<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>推送记录 > 推送队列</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline"  action="/system/jpush/queueList/1" method="post">
                                <div class="input-group ">
                                    <@shiro.hasPermission name="addJPush">

                                        <a class="btn btn-primary dialog" href="javascript:;"
                                        data-url="/system/jpush/addJPush" data-title="自定义推送" data-width=""
                                       data-height="650" style="margin-right: 5px;"><i class="fa fa-plus"></i> 自定义推送</a>

                                        <a class="btn btn-primary dialog" href="javascript:;"
                                           data-url="/system/jpush/addPushForm" data-title="模板推送" data-width=""
                                           data-height="650"><i class="fa fa-plus"></i> 模板推送</a>
                                    </@shiro.hasPermission>
                                </div>

                                <div class="input-group pull-right">
                                    <button type="button" class="btn btn-primary btn-flat" onclick="window.location.href='/system/jpush/logList/1' "><i class="fa fa-file-excel-o"></i> 查看历史</button>
                                </div>
                            </form>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <#--<th >序号</th>-->
                                    <th>通道</th>
                                    <th>设备</th>
                                    <th>次数</th>
                                    <th>标题</th>
                                    <th>内容</th>
                                    <th>时间</th>
                                    <th width="120px">操作</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <#--<td class="td_checkbox"></td>-->
                                        <td>
                                            ${(entity.pushChannel)!"--"}
                                        </td>
                                        <td>${(entity.clientId)!''}${(entity.deviceToken)!''}</td>
                                        <td><#if entity.retryCount==0>尚未开始<#else>正在第 ${(entity.retryCount)!} 次</#if></td>
                                        <td>${(entity.msgTitle)!'--'}</td>
                                        <td>${(entity.msgText)!'--'}</td>
                                        <td>${(entity.updateTime?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
                                        <td>
                                            <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                               data-url="/system/jpush/returnInfo/${(entity.id)!}" data-title="日志"
                                               data-width="650" data-height="550">查看日志</a>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/system/jpush/queueList/" urlParas="?search=${search!}&daterange=${daterange!}&registerId=${(registerId!)}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/jpush/queueList/" urlParas="?search=${search!}&daterange=${daterange!}&registerId=${(registerId!)}&pageSize=${pageSize!}"  />
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