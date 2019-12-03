<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>网络问政 > 问政排行情况列表</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/wzRank/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <@shiro.hasPermission name="deleteWzRank">
                                    <div class="input-group">
                                        <a class="btn btn-danger" delete-batch-url="/system/wzRank/deleteBatch">
                                            <i class="fa fa-remove"></i> 批量删除
                                        </a>
                                    </div>
                            </@shiro.hasPermission>

                            <div class="form-group">
                                <#--<input type="text" name="daterange" value="${daterange!}" class="form-control date"-->
                                       <#--id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">-->
                                <input type="text" name="createTimeStart" value="${createTimeStart!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="createTimeStart" placeholder="日期开始" style="width: 120px;">
                            </div>
                            <div class="form-group">
                                <input type="text" name="createTimeEnd" value="${createTimeEnd!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="createTimeEnd" placeholder="日期结束" style="width: 120px;">
                            </div>
                            <div class="input-group">
                                <select name="groupName" style="width: 120px" class="form-control">
                                    <option value="">--类型--</option>
                                  <@dictTag method="getDictListByType" type="wz_group" >
                                      <#list getDictListByType as m>
                                            <option value="${(m.value)!}"
                                                <#if "${(m.value)!}"=="${(group)!}">selected</#if>
                                            >${(m.label)!}</option>
                                      </#list>
                                  </@dictTag>
                                </select>
                                <input type="text" name="search" value="${search!}"
                                       class="form-control input-select-200"
                                       placeholder="类型、处理部门">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>
                                    <input value="root" type="checkbox" class="minimal checkbox-toolbar">
                                </th>
                                <th>类型</th>
                                <th>处理部门</th>
                                <th>数量</th>
                                <th>时间</th>
                                <th width="120px">操作</th>
                            </tr>
                            <#list pageData.getRecords() as entity>
                            <tr>
                                <td class="td_checkbox">
                                    <input value="${entity.id}" name="wzrankState" type="checkbox"
                                           class="minimal checkbox-item">
                                </td>
                                <td>${(entity.groupName)!'--'}</td>
                                <td>${(entity.title)!'--'}</td>
                                <td>${(entity.value)!'--'}</td>
                                <td>${(entity.dtCreated?string('yyyy-MM-dd'))!'--'}</td>
                                <td>
                                    <@shiro.hasPermission name="editWzRank">
                                        <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                           data-url="/system/wzRank/edit/${(entity.id)!}"
                                           data-title="编辑" data-width="850" data-height="550">编辑</a>
                                    </@shiro.hasPermission>
                                    <@shiro.hasPermission name="deleteWzRank">
                                        <a class="btn btn-danger btn-xs"
                                           data-tiggle="ajax"
                                           data-submit-url="/system/wzRank/delete?id=${(entity.id)!}"
                                           data-confirm="您确定要删除该条记录吗?">删除</a>
                                    </@shiro.hasPermission>
                                </td>
                            </tr>
                            </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
                            <#include "../../common/paginateBar.ftl" />
	  		                <@paginate pageData=pageData actionUrl="/system/wzRank/list/" urlParas="?search=${search!}&groupName=${group!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
                            <#include "../../common/paginate.ftl" />
                            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/wzRank/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&groupName=${group!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}"  />
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