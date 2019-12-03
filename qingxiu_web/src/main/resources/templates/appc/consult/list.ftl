<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>手上青秀 > 在线咨询表管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovConsult/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group input-select-200">
                                <select id="xzqhId3" name="orgId" class="form-control select2 input-select-200"
                                        lay-ignore>
                                    <option value="">--请选择部门--</option>
                                    <option value="-1" <#if "-1"=="${(params.orgId)!}">selected</#if>>其他</option>
                                    <option value="0" <#if "0"=="${(params.orgId)!}">selected</#if>>基层审批</option>
                                <#list deptList as d>
                                    <option value="#{(d.id)!}"
                                        <#if "${(d.id)!}"=="${(params.orgId)!}">selected</#if>
                                    >${(d.name)!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="input-group input-select-200">
                                <select id="xzqhId3" name="status" class="form-control select2 input-select-200"
                                        lay-ignore>
                                    <option value="">--请选择状态--</option>
                                    <option value="1" <#if "1"=="${(params.status)!}">selected</#if>>未回复</option>
                                    <option value="2" <#if "2"=="${(params.status)!}">selected</#if>>已回复</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <#--<input type="text" name="daterange" value="${params.daterange!}" class="form-control date" id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">-->
                                <input type="text" name="updateTimeStart" value="${updateTimeStart!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="updateTimeStart" placeholder="咨询日期开始" style="width: 120px;">
                            </div>
                            <div class="form-group">
                                <input type="text" name="updateTimeEnd" value="${updateTimeEnd!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="updateTimeEnd" placeholder="咨询日期结束" style="width: 120px;">
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${params.search!}" class="form-control"
                                       placeholder="根据标题或主题查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <#--<a href="/appc/tGovConsult/list/1"
                                       class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>咨询标题</th>
                                <th>所属部门</th>
                                <th>咨询主题</th>
                                <th>咨询用户</th>
                                <th>咨询时间</th>
                                <th>状态</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.title)!'--'}</td>
            <td>${(entity.orgName)!'--'}</td>
            <td>${(entity.themeName)!'--'}</td>
            <td style="white-space:nowrap">${(entity.userMobile)!'--'}</td>
            <td style="white-space:nowrap">${(entity.dtUpdate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td style="white-space:nowrap;<#if "1"!="${(entity.consultStatus)!}">color: #ff5053;</#if>"><@dictTag method="dictValueByType" type="consult_status" value="${(entity.consultStatus)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td>
                <@shiro.hasPermission name="replyTGovConsult">
                    <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                       data-url="/appc/tGovConsult/reply?id=${(entity.id)!}"
                       data-title="回复在线咨询" data-width="850" data-height="550">回复</a>
                </@shiro.hasPermission>
            </td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovConsult/list/" urlParas="?search=${search!}&updateTimeStart=${updateTimeStart!}&updateTimeEnd=${updateTimeEnd!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovConsult/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&updateTimeStart=${updateTimeStart!}&updateTimeEnd=${updateTimeEnd!}"  />
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
            elem: '#updateTimeStart'
        });
        laydate.render({
            elem: '#updateTimeEnd'
        });
    });
    //上方修复：295 优化后台管理端，更换时间控件
</script>
</@footer>