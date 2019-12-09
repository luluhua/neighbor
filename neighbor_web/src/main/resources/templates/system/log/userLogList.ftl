<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>系统管理 > 用户登录日志查询</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/tSysUserLog/log/list/1" method="post">
                                <div class="form-group">
                                    <#--<input type="text" name="daterange" value="${daterange!}" class="form-control date"-->
                                           <#--id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">-->
                                    <input type="text" name="createTimeStart" value="${createTimeStart!}" autocomplete="off"
                                           class="form-control" readonly
                                           id="createTimeStart" placeholder="登录日期开始" style="width: 120px;">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="createTimeEnd" value="${createTimeEnd!}" autocomplete="off"
                                           class="form-control" readonly
                                           id="createTimeEnd" placeholder="登录日期结束" style="width: 120px;">
                                </div>
                                <div class="input-group">
                                    <select name="loginType" class="form-control">
                                            <option value="">--登录来源--</option>
                                                <#if (loginType)??&&loginType=='2'>
                                                    <option value="1" >web端</option>
                                                    <option value="2" selected>app端</option>
                                                <#else>
                                                  <option value="1" selected>web端</option>
                                                    <option value="2">app端</option>
                                                </#if>
                                    </select>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="登录用户或用户IP查询">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
<#--                                        <a href="/tSysUserLog/log/list/1" class="btn btn-default"><i-->
<#--                                                    class="fa fa-refresh"></i></a>-->
                                    </div>
                                </div>
                                <div class="input-group pull-right">
                                    <button type="button" class="btn btn-primary btn-flat"
                                            onclick="exportTo('用户登录日志数据');"><i class="fa fa-file-excel-o"></i> 导出
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th>登录来源</th>
                                    <th>登录用户</th>
                                    <th>用户IP</th>
                                    <th>登录时间</th>
                                    <th>是否成功</th>
                                </tr>
                                <#list pageData.getRecords() as log>
                                    <tr>
                                        <td>
                                            <#if log.loginType ==2>app端
                                            <#else>web端
                                            </#if>
                                        </td>
                                        <td>${(log.userName)!}</td>
                                        <td>
                                            <#if log.loginIp=='0:0:0:0:0:0:0:1'>
                                                本机
                                            <#else>
                                                ${(log.loginIp)!'--'}
                                            </#if>
                                        </td>
                                        <td>${(log.dtCreate?string('yyyy/MM/dd HH:mm:ss'))!}</td>
                                        <td>
                                            <#if log.isLoginOk ==1>成功
                                            <#else>失败
                                            </#if>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/tSysUserLog/log/list/" urlParas="?search=${search!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/tSysUserLog/log/list/" urlParas="?search=${search!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}&pageSize=${pageSize!}"  />
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
                elem: '#createTimeStart'
            });
            laydate.render({
                elem: '#createTimeEnd'
            });
        });
        //上方修复：295 优化后台管理端，更换时间控件
    </script>
</@footer>