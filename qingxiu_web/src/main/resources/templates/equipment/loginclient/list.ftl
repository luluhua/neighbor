<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>app管理 > 在线用户列表</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/userloginclient/list/1" method="post">
                                <div class="input-group ">
                                    <button type="button" delete-batch-url="/userloginclient/deleteAll"
                                            class="btn btn-danger btn-flat">
                                        <i class="fa fa-remove"></i> 批量删除
                                </div>
                                <div class="input-group">
                                    <select name="mobilePlatform" class="form-control" lay-ignore
                                            selected="selected">
                                        <option  <#if mobilePlatform??><#else>selected="selected"</#if>  value="">--选择平台类型--</option>
                                         <@dictTag method="getDictListByType" type="app_type" >
                                             <#list getDictListByType as m>
                                             <option value="${(m.value)!}" <#if mobilePlatform??><#if mobilePlatform==m.value>selected="selected"</#if></#if> >${(m.label)!}</option>
                                             </#list>
                                         </@dictTag>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <#--<input type="text" name="daterange" value="${daterange!}" class="form-control date" id="daterange" placeholder="登录开始日期  - 结束日期" style="width: 228px;">-->
                                        <input type="text" name="loginTimeStart" value="${loginTimeStart!}" autocomplete="off"
                                               class="form-control" readonly
                                               id="loginTimeStart" placeholder="登录日期开始" style="width: 120px;">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="loginTimeEnd" value="${loginTimeEnd!}" autocomplete="off"
                                           class="form-control" readonly
                                           id="loginTimeEnd" placeholder="登录日期结束" style="width: 120px;">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="userId" value="${userId!}" class="form-control" placeholder="用户ID" style="width: 88px;">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="registerClientIp" value="${registerClientIp!}" class="form-control" placeholder="IP地址" style="width: 128px;">
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="设备标识">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th><input type="checkbox" lay-filter="allCheck" value="root"
                                               class="minimal  checkbox-toolbar"
                                               lay-ignore>全选
                                    </th>
                                    <th>app用户ID</th>
                                    <#--<th>guid</th>-->
                                    <th>Android标识</th>
                                    <th>iso标识</th>
                                    <th>登录ip</th>
                                    <th>登录时间</th>
                                    <th>操作系统版本</th>
                                    <th>手机型号</th>
                                    <th>客户端类型</th>
                                    <th>app版本</th>
                                    <th>app包名</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                                       value="${(entity.id)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>${(entity.userId)!}</td>
                                        <#--<td>${(entity.guid)!}</td>-->
                                        <td>${(entity.clientId)!}</td>
                                        <td>${(entity.deviceToken)!}</td>
                                        <td>${(entity.loginIp)!}</td>
                                        <td>${(entity.loginTime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                                        <td>${(entity.mobileSystemVersion)!}</td>
                                        <td>${(entity.mobileModel)!}</td>
                                        <td>
                                            <#if entity.mobilePlatform??>
                                                <#if entity.mobilePlatform=="1">
                                                    Android
                                                <#elseif entity.mobilePlatform=="2">
                                                    IOS
                                                <#else>

                                                </#if>
                                            </#if>
                                        </td>
                                        <td>${(entity.appVersion)!}</td>
                                                <td><@dictTag method="dictValueByType" type="app_push_package" value="${(entity.packageName)!}"> ${(dictValueByType)!}</@dictTag></td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/userloginclient/list/" urlParas="?search=${search!}&loginTimeStart=${loginTimeStart!}&loginTimeEnd=${loginTimeEnd!}&mobilePlatform=${(mobilePlatform)!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/userloginclient/list/" urlParas="?search=${search!}&loginTimeStart=${loginTimeStart!}&loginTimeEnd=${loginTimeEnd!}&pageSize=${pageSize!}&mobilePlatform=${(mobilePlatform)!}"  />
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
                elem: '#loginTimeStart'
            });
            laydate.render({
                elem: '#loginTimeEnd'
            });
        });
        //上方修复：295 优化后台管理端，更换时间控件
    </script>
</@footer>