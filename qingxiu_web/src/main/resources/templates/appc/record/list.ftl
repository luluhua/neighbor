<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>手上青秀 > 办事记录</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovRecord/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="form-group">
                                <input type="text" name="createTimeStart" value="${createTimeStart!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="createTimeStart" placeholder="提交日期开始" style="width: 120px;">
                            </div>
                            <div class="form-group">
                                <input type="text" name="createTimeEnd" value="${createTimeEnd!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="createTimeEnd" placeholder="提交日期结束" style="width: 120px;">
                            </div>
                            <div class="form-group">
                                <input type="text" name="aduitTimeStart" value="${aduitTimeStart!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="aduitTimeStart" placeholder="审批日期开始" style="width: 120px;">
                            </div>
                            <div class="form-group">
                                <input type="text" name="aduitTimeEnd" value="${aduitTimeEnd!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="aduitTimeEnd" placeholder="审批日期结束" style="width: 120px;">
                            </div>
                            <div class="form-group">
                                <input type="text" name="apuName" value="${query.apuName!}" class="form-control"
                                       id="apuName" placeholder="输入手机号精确查询">
                            </div>
                            <#if !(status)?? || "${modelState}"=="0">
                                <input name="modelState" type="hidden" value="0"/>
                                <div class="form-group">
                                    <select class="form-control" name="status">
                                     <@dictTag method="getDictListByType" type="record_status" >
                                            <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                    <#if "${(m.value)!}"=="${(status)!}">
                                                        selected
                                                    </#if>
                                                >${(m.label)!}</option>
                                            </#list>
                                     </@dictTag>
                                    </select>
                                </div>
                            <#else >
                                 <input name="modelState" type="hidden" value="1"/>
                                 <input type="hidden" name="status" value="${(status)!}">
                            </#if>
                            <div class="input-group">
                                <input type="text" name="projectTitle" value="${(query.projectTitle)!}"
                                       class="form-control"
                                       placeholder="事项名称查询">
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
                                </th>
                                <th class="td-width-600">审批事项</th>
                                <th class="td-width-100">提交用户</th>
                                <th class="td-width-300">提交日期</th>
                                <th class="td-width-150">审批状态</th>
                                <th class="td-width-300">审批日期</th>
                                <th class="td-width-150">当前节点</th>
                                <th class="td-width-150">间隔时间</th>
                                <th class="td-width-150">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
            </td>
            <td>${(entity.projectTitle)!'--'}</td>
            <td><@commonTags method="getDecrypt3DEs" type="1" value="${(entity.mobile)!}">${(getDecrypt3DEs)!}</@></td>
            <td>${(entity.postDatetime?replace('.0',''))!'--'}</td>
            <td>
                <#if entity.status==1>
                    <span style="color:red">未进入审批环节</span>
                <#elseif entity.status==2>
                    <span style="color:red">审批中</span>
                <#elseif entity.status==4>
                    <span style="color:green">已驳回</span>
                <#else>
                    <span style="color:green">审核完结</span>
                </#if>

            </td>
            <td>${(entity.handleTime?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td>
                <#if entity.status==1>
                    <span style="color:red">待受理</span>
                <#elseif entity.status==2>
                    ${(entity.handleUserName)!''}
                <#elseif  entity.status==3 >
                      <span style="color:green">已完结</span>
                <#elseif  entity.status==4>
                    <span style="color:green">退回用户</span>
                <#elseif  entity.status==5 >
                      <span style="color:red">待制证</span>
                <#elseif  entity.status==6>
                      <span style="color:red">待配送</span>
                </#if>
            </td>
            <td>${(entity.intervalDate)!'--'}</td>
            <td>
            <#--<a class="btn btn-primary btn-xs" title="打印文档"-->
            <#--href="/appc/tGovRecord/printDocList/1?recordId=${(entity.id)!}">打印文档</a>-->

                <#if (status)??>
                    <#if entity.status==1>
                         <a class="btn btn-primary btn-xs " href="/appc/tGovRecord/detail?id=${(entity.id)!}">审批</a>
                    <#else >
                        <a class="btn btn-primary btn-xs " href="/appc/tGovRecord/detail/?id=${(entity.id)!}">查看</a>
                    </#if>
                <#else >
                     <a class="btn btn-primary btn-xs " href="/appc/tGovRecord/detail/?id=${(entity.id)!}">查看</a>
                </#if>
                   <@shiro.hasPermission name="detailT">
                <a class="btn btn-danger btn-xs"
                   data-tiggle="ajax"
                   data-submit-url="/appc/tGovRecord/delete?id=${(entity.id?c)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovRecord/list/" urlParas="?projectTitle=${query.projectTitle!}&org=${(org)!}&apuName=${query.apuName!}&aduitTimeStart=${aduitTimeStart!}&aduitTimeEnd=${aduitTimeEnd!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}&status=${status!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovRecord/list/" urlParas="?projectTitle=${query.projectTitle!}&pageSize=${pageSize!}&org=${(org)!}&apuName=${query.apuName!}&aduitTimeStart=${aduitTimeStart!}&aduitTimeEnd=${aduitTimeEnd!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}&status=${status!}"  />
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script type="application/javascript">
    var message = '${(message)!}'
    console.log("message===" + message);
    if (message != null && message != '') {
        layer.msg("'" + message + "'");
    }

</script>
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
        laydate.render({
            elem: '#aduitTimeStart'
        });
        laydate.render({
            elem: '#aduitTimeEnd'
        });
    });
    //上方修复：295 优化后台管理端，更换时间控件
</script>
</@footer>