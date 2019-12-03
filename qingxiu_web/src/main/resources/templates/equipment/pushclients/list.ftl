<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>app管理 > 用户设备信息</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/pushclient/list/1" method="post">
                                <div class="input-group ">
                                    <button type="button" delete-batch-url="/pushclient/deleteAll"
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
                                    <#--<input type="text" name="daterange" value="${daterange!}" class="form-control date" id="daterange" placeholder="注册开始日期  - 结束日期" style="width: 228px;">-->
                                    <input type="text" name="registerDateTimeStart" value="${registerDateTimeStart!}" autocomplete="off"
                                           class="form-control" readonly
                                           id="registerDateTimeStart" placeholder="注册日期开始" style="width: 120px;">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="registerDateTimeEnd" value="${registerDateTimeEnd!}" autocomplete="off"
                                           class="form-control" readonly
                                           id="registerDateTimeEnd" placeholder="注册日期结束" style="width: 120px;">
                                </div>
                                <div class="input-group">
                                    <select name="isValidate" class="form-control" lay-ignore
                                            selected="selected">
                                        <option  <#if isValidate??><#else>selected="selected"</#if>  value="">--是否活跃--</option>
                                        <option value="0" <#if isValidate??><#if isValidate=="0">selected="selected"</#if></#if> >活跃</option>
                                        <option value="1" <#if isValidate??><#if isValidate=="1">selected="selected"</#if></#if> >不活跃</option>
                                        <option value="2" <#if isValidate??><#if isValidate=="2">selected="selected"</#if></#if> >已删除app</option>
                                    </select>
                                </div>
                                <div class="input-group">
                                    <select name="enablePush" class="form-control" lay-ignore
                                            selected="selected">
                                        <option  <#if enablePush??><#else>selected="selected"</#if>  value="">--是否开启推送--</option>
                                        <option value="0" <#if enablePush??><#if enablePush=="0">selected="selected"</#if></#if> >不推送</option>
                                        <option value="1" <#if enablePush??><#if enablePush=="1">selected="selected"</#if></#if> >推送</option>
                                    </select>
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
                                    <th>Android标识</th>
                                    <th>ios标识</th>
                                    <th>注册时间</th>
                                    <th>注册ip</th>
                                    <th>是否活跃</th>
                                    <th>是否开启推送</th>
                                    <th>操作系统版本</th>
                                    <th>手机型号</th>
                                    <th>客户端类型</th>
                                    <th>app版本</th>
                                    <th>app包名</th>
                                    <th>更新时间</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                                       value="${(entity.id)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>${(entity.userId)!}</td>
                                        <td>${(entity.clientId)!}</td>
                                        <td>${(entity.deviceToken)!}</td>
                                        <td>${(entity.registerDateTime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                                        <td>${(entity.registerClientIp)!}</td>
                                        <td>
                                            <#if entity.isValidate??>
                                                <#if entity.isValidate==0>
                                                    活跃
                                                <#elseif entity.isValidate==1>
                                                    不活跃
                                                <#elseif entity.isValidate==2>
                                                    已删除app
                                                <#else>
                                                </#if>
                                            </#if>
                                        </td>
                                        <td>
                                            <#if entity.enablePush??>
                                                <#if entity.enablePush==0>
                                                    不推送
                                                <#elseif entity.enablePush==1>
                                                    推送
                                                <#else>
                                                </#if>
                                            </#if>
                                        </td>
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
                                        <td>${(entity.updateDateTime?string('yyyy-MM-dd HH:mm:ss'))!}</td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/pushclient/list/" urlParas="?search=${search!}&registerDateTimeStart=${registerDateTimeStart!}&registerDateTimeEnd=${registerDateTimeEnd!}&mobilePlatform=${(mobilePlatform!)}&isValidate=${(isValidate!)}&enablePush=${enablePush!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/pushclient/list/" urlParas="?search=${search!}&registerDateTimeStart=${registerDateTimeStart!}&registerDateTimeEnd=${registerDateTimeEnd!}&mobilePlatform=${(mobilePlatform!)}&isValidate=${(isValidate!)}&enablePush=${enablePush!}&pageSize=${pageSize!}"  />
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
                elem: '#registerDateTimeStart'
            });
            laydate.render({
                elem: '#registerDateTimeEnd'
            });
        });
        //上方修复：295 优化后台管理端，更换时间控件
    </script>
</@footer>