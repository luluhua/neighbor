<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>系统管理 > 消息列表</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/tMsgRecord/msg/list/1" method="post">
                                <div class="input-group">
                                    <@shiro.hasPermission name="addTMsgRecord">
                                        <a class="btn btn-primary dialog" href="javascript:;"
                                           data-url="/tMsgRecord/msg/send" data-title="发送站内消息" data-width="850"
                                           data-height="650"><i class="fa fa-plus"></i> 发送站内消息</a>
                                    </@shiro.hasPermission>
                                </div>
                                <div class="form-group">
                                    <#--<input type="text" name="daterange" value="${daterange!}" class="form-control date"-->
                                           <#--id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">-->
                                    <input type="text" name="sendTimeStart" value="${sendTimeStart!}" autocomplete="off"
                                           class="form-control" readonly
                                           id="sendTimeStart" placeholder="推送日期开始" style="width: 120px;">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="sendTimeEnd" value="${sendTimeEnd!}" autocomplete="off"
                                           class="form-control" readonly
                                           id="sendTimeEnd" placeholder="推送日期结束" style="width: 120px;">
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="输入消息标题查询">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="input-group pull-right">
                                    <button type="button" class="btn btn-primary btn-flat"
                                            onclick="exportTo('站内消息列表');"><i class="fa fa-file-excel-o"></i> 导出
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th>标题</th>
                                    <th>类型</th>
                                    <th>推送时间</th>
                                    <th>状态</th>
                                    <th>接收用户</th>
                                    <th>操作</th>
                                </tr>
                                <#list pageData.getRecords() as msg>
                                    <tr>
                                        <td>${(msg.msgTitle)!}</td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="station_msg_type" value="${(msg.msgType)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td>${(msg.sendTime?string('yyyy/MM/dd HH:mm:ss'))!}</td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="send_status" value="${(msg.sendStatus)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td>
                                            <a class="btn btn-xs dialog"
                                               data-wdith="800"
                                               data-title="消息[${(msg.msgTitle)!}]的接收的用户列表"
                                               data-url="/tMsgRecord/msg/getMsgUser?id=${msg.id}"
                                            ><span sysc sysc-url="/tMsgRecord/msg/getUserCount?id=${msg.id}"
                                                   format=" [ %s个接收用户 ]"></span></a>

                                        </td>
                                        <td>
                                            <a class="btn btn-xs btn-primary dialog"
                                               data-title="消息内容"
                                               data-wdith="800"
                                               data-height="400"
                                               data-url="/tMsgRecord/msg/params/${msg.id}">查看消息内容</a>

                                            <@shiro.hasPermission name="deleteTMsgRecord">
                                                <a class="btn btn-danger btn-xs"
                                                   data-tiggle="ajax"
                                                   data-submit-url="/tMsgRecord/msg/delete?id=${(msg.id)!}"
                                                   data-confirm="您确定要删除该条记录吗?"><i class="fa fa-times"></i> 删除</a>
                                            </@shiro.hasPermission>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/tMsgRecord/msg/list/" urlParas="?search=${search!}&sendTimeStart=${sendTimeStart!}&sendTimeEnd=${sendTimeEnd!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/tMsgRecord/msg/list/" urlParas="?search=${search!}&sendTimeStart=${sendTimeStart!}&sendTimeEnd=${sendTimeEnd!}&pageSize=${pageSize!}"  />
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
        //下方为原有查询条件，先做保留
        // function getBoforeDate(before) {
        //     var now = new Date();
        //     now.setDate(now.getDate() - before);
        //     return now;
        // }
        //
        // function getBoforeMonth(beforeMonth, day) {
        //     var now = new Date();
        //     now.setDate(day);
        //     now.setMonth(now.getMonth() - beforeMonth);
        //     return now;
        // }
        //
        // $(function () {
        //
        //     var now = new Date();
        //
        //     $('.date').daterangepicker({
        //         "showWeekNumbers": true,
        //         "showISOWeekNumbers": true,
        //         "ranges": {
        //             "今天": [
        //                 now,
        //                 now
        //             ],
        //             "昨天": [
        //                 getBoforeDate(1),
        //                 getBoforeDate(1)
        //             ],
        //             "最近7天": [
        //                 getBoforeDate(7),
        //                 now
        //             ],
        //             "最近30天": [
        //                 getBoforeDate(30),
        //                 now
        //             ],
        //             "本月": [
        //                 getBoforeMonth(0, 1),
        //                 getBoforeMonth(0, 31)
        //             ],
        //             "上个月": [
        //                 getBoforeMonth(1, 1),
        //                 getBoforeMonth(1, 31)
        //             ],
        //             "最近三个月": [
        //                 getBoforeMonth(2, 1),
        //                 getBoforeMonth(0, 31)
        //             ]
        //         },
        //         "locale": {
        //             "format": "YYYY/MM/DD",
        //             "separator": "-",
        //             "applyLabel": "应用",
        //             "cancelLabel": "取消",
        //             "fromLabel": "From",
        //             "toLabel": "To",
        //             "customRangeLabel": "自定义",
        //             "weekLabel": "W",
        //             "daysOfWeek": [
        //                 "日",
        //                 "一",
        //                 "二",
        //                 "三",
        //                 "四",
        //                 "五",
        //                 "六"
        //             ],
        //             "monthNames": [
        //                 "一月",
        //                 "二月",
        //                 "三月",
        //                 "四月",
        //                 "五月",
        //                 "六月",
        //                 "七月",
        //                 "八月",
        //                 "九月",
        //                 "十月",
        //                 "十一月",
        //                 "十二月"
        //             ],
        //             "firstDay": 1
        //         },
        //         "alwaysShowCalendars": true,
        //         "autoUpdateInput": false,
        //         "opens": "right",
        //         "buttonClasses": "btn btn-sm"
        //     }, function (start, end, label) {
        //         console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
        //     });
        //
        //     $('.date').on('apply.daterangepicker', function (ev, picker) {
        //         $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
        //     });
        //
        //     $('.date').on('cancel.daterangepicker', function (ev, picker) {
        //         $(this).val('');
        //     });
        //
        // });
        //上方为原有查询条件，先做保留
        //下方修复：295 优化后台管理端，更换时间控件
        layui.use('laydate', function(){
            var laydate = layui.laydate;
            laydate.render({
                elem: '#sendTimeStart'
            });
            laydate.render({
                elem: '#sendTimeEnd'
            });
        });
        //上方修复：295 优化后台管理端，更换时间控件
    </script>
</@footer>