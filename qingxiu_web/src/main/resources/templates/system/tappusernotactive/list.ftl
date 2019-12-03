<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>app管理 > 未激活用户管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/tAppUserNotactive/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="手机号码查询">
                            </div>
                            <div class="form-group">
                                <#--<input type="text" name="aduitTime" value="${aduitTime!}" class="form-control date"-->
                                       <#--id="daterange" placeholder="审批日期查询" style="width: 228px;">-->
                                <input type="text" name="createTimeStart" value="${createTimeStart!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="createTimeStart" placeholder="参与日期开始" style="width: 120px;">
                            </div>
                            <div class="form-group">
                                <input type="text" name="createTimeEnd" value="${createTimeEnd!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="createTimeEnd" placeholder="参与日期结束" style="width: 120px;">
                            </div>
                            <div class="input-group">
                                <select id="state" name="state" class="form-control"
                                        lay-ignore>
                                    <option value="" <#if "${(state)!}"=="">selected</#if>>--状态--</option>
                                    <option value="0" <#if "${(state)!}"=="0">selected</#if>>未激活</option>
                                    <option value="1" <#if "${(state)!}"=="1">selected</#if>>已激活</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat"
                                        onclick="exportTo('app推广活动用户数据');">
                                    <i
                                            class="fa fa-file-excel-o"></i>导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>手机号码</th>
                                <th>来源</th>
                                <th>是否激活</th>
                                <th>参与时间</th>
                                <th>激活时间</th>
                                <th>操作</th>
                            </tr>
    <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.mobile)!'--'}</td>
            <td><#if entity.source==1>联通公众号<#else >其他</#if></td>
            <td><#if entity.state==0>未激活<#else >已激活</#if></td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td>${(entity.dtActivation?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td>
        <@shiro.hasPermission name="editTAppUserNotactive">
        <a class="btn btn-primary btn-xs dialog" href="javascript:;"
           data-url="/system/tAppUserNotactive/edit/${(entity.id)!}"
           data-title="编辑未激活用户" data-width="850" data-height="550">查看</a>
        </@shiro.hasPermission>
            <#--<@shiro.hasPermission name="deleteTAppUserNotactive">-->
            <#--<a class="btn btn-danger btn-xs"-->
            <#--data-tiggle="ajax"-->
            <#--data-submit-url="/appc/tAppUserNotactive/delete?id=${(entity.id)!}"-->
            <#--data-confirm="您确定要删除该条记录吗?">删除</a>-->
            <#--</@shiro.hasPermission>-->
            </td>
        </tr>
    </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/system/tAppUserNotactive/list/" urlParas="?search=${search!}&state=${(state)!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/tAppUserNotactive/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&state=${(state)!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}"  />
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
    //     var now = new Date();
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
    //         console.log(
    //                 "New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
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