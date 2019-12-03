<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>app管理 >  app接口日志</small>
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
                                <@shiro.hasPermission name="deleteTAppApiLog">
                                    <div class="input-group ">
                                        <button type="button" delete-batch-url="/appc/tAppApiLog/deleteAll" class="btn btn-danger btn-flat">
                                            <i class="fa fa-remove"></i> 批量删除
                                    </div>
                                </@shiro.hasPermission>
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
                                    <#--<input type="text" name="daterange" value="${daterange!}" class="form-control date" id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">-->
                                        <input type="text" name="createTimeStart" value="${createTimeStart!}" autocomplete="off"
                                               class="form-control" readonly
                                               id="createTimeStart" placeholder="访问日期开始" style="width: 120px;">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="createTimeEnd" value="${createTimeEnd!}" autocomplete="off"
                                           class="form-control" readonly
                                           id="createTimeEnd" placeholder="访问日期结束" style="width: 120px;">
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control" style="width: 300px;" placeholder="接口名称或接口地址或ip地址查询">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                                <div class="input-group pull-right">
                                    <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('app接口日志数据');"><i class="fa fa-file-excel-o"></i> 导出</button>
                                </div>
                            </form>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th ><input type="checkbox"lay-filter="allCheck"  value="root" class="minimal  checkbox-toolbar"
                                                lay-ignore  >全选
                                    </th>
                                    <th>接口名称</th>
                                    <th>接口地址</th>
                                    <th>访问IP</th>
                                    <th>访问来源</th>
                                    <th>客户端</th>
                                    <th>访问时间 </th>
                                    <th>请求耗时 </th>
                                    <th>成功标识 </th>
                                    <th width="120px">操作</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids" value="${(entity.id?c)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>${(entity.title)!'--'}</td>
                                        <td>${(entity.url)!'--'}</td>
                                        <td>${(entity.ip)!'--'}</td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="app_orgin" value="${(entity.origin)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="app_type" value="${(entity.appType)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td>${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
                                        <td>${(entity.taking)!'--'}毫秒</td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="is_yes_no" value="${(entity.isOk)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td>
                                            <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                               data-url="/appc/tAppApiLog/info/${(entity.id?c)!}" data-title="请求参数"
                                               data-width="850" data-height="650">请求参数</a>
                                            <@shiro.hasPermission name="deleteTAppApiLog">
                                                <a class="btn btn-danger btn-xs"
                                                   data-tiggle="ajax"
                                                   data-submit-url="/appc/tAppApiLog/delete?id=${(entity.id?c)!}"
                                                   data-confirm="您确定要删除该条记录吗?">删除</a>
                                            </@shiro.hasPermission>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/appc/tAppApiLog/list/" urlParas="?search=${search!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}&origin=${(origin!)}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppApiLog/list/" urlParas="?search=${search!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}&pageSize=${pageSize!}&origin=${(origin!)}"  />
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
        // function getBoforeDate(before){
        //     var now = new Date();
        //     now.setDate(now.getDate()-before);
        //     return now;
        // }
        //
        // function getBoforeMonth(beforeMonth,day){
        //     var now = new Date();
        //     now.setDate(day);
        //     now.setMonth(now.getMonth()-beforeMonth);
        //     return now;
        // }
        //
        // $(function(){
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
        //                 getBoforeMonth(0,1),
        //                 getBoforeMonth(0,31)
        //             ],
        //             "上个月": [
        //                 getBoforeMonth(1,1),
        //                 getBoforeMonth(1,31)
        //             ],
        //             "最近三个月": [
        //                 getBoforeMonth(2,1),
        //                 getBoforeMonth(0,31)
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
        //         "autoUpdateInput":false,
        //         "opens": "right",
        //         "buttonClasses": "btn btn-sm"
        //     }, function(start, end, label) {
        //         console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
        //     });
        //
        //     $('.date').on('apply.daterangepicker', function(ev, picker) {
        //         $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
        //     });
        //
        //     $('.date').on('cancel.daterangepicker', function(ev, picker) {
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