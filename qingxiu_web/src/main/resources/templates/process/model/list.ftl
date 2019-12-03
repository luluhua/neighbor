<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>流程管理 > 流程列表</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">

                            <form class="form-inline" action="/process/list/1" method="post">
                                <div class="input-group">
                                    <a class="btn btn-primary " target="_blank" href="<@commonTags method="tagHtpFlowAbleURL" type="1" value="1">${(tagHtpFlowAbleURL)!}</@commonTags>/#/processes?p=d08ad42844e448189316f199278fa13e&t=1209edd4ac1a472ea365aa3881440704"><i class="fa fa-plus"></i> 流程模型管理</a>
                                </div>
                                <div class="form-group">
                                    <#--<input type="text" name="daterange" value="${daterange!}" class="form-control date"-->
                                           <#--id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">-->
                                        <input type="text" name="lastUpdatedDateTimeStart" value="${lastUpdatedDateTimeStart!}" autocomplete="off"
                                               class="form-control" readonly
                                               id="lastUpdatedDateTimeStart" placeholder="更新日期开始" style="width: 120px;">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="lastUpdatedDateTimeEnd" value="${lastUpdatedDateTimeEnd!}" autocomplete="off"
                                           class="form-control" readonly
                                           id="lastUpdatedDateTimeEnd" placeholder="更新日期结束" style="width: 120px;">
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="模型key或name或备注信息查询">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="input-group pull-right">
                                    <button type="button" class="btn btn-primary btn-flat"style="margin-right: 20px;"
                                            data-tiggle="ajax-return-msg"
                                            data-submit-url="/process/oneButtonPublishing"
                                            data-confirm="您确定要一件发布所有流程模型吗?"><i class="fa fa-file-excel-o"></i>一键发布流程</button>

                                    <button type="button" class="btn btn-primary btn-flat"
                                            data-tiggle="ajax-return-msg"
                                            data-submit-url="/process/oneButtonPublishingForm"
                                            data-confirm="您确定要一件发布所有流程模型表单吗?"><i class="fa fa-file-excel-o"></i>一键发布表单</button>

                                </div>
                            </form>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th>名称</th>
                                    <th>key</th>
                                    <th>说明</th>
                                    <th>更新时间</th>
                                    <th>操作</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td>${(entity.name)!}</td>
                                        <td>${(entity.modelKey)!}</td>
                                        <td>${(entity.description)!}</td>
                                        <td>${(entity.lastUpdated?string('yyyy/MM/dd HH:mm:ss'))!}</td>
                                        <td>
                                            <a class="btn btn-primary btn-xs "
                                               data-tiggle="ajax"
                                               data-submit-url="/process/deploy?bpmName=${(entity.modelKey)!''}"
                                               data-confirm="您确定要发布该条记录吗?">发布</a>

                                            <a class="btn btn-primary btn-xs " href="/process/deployLog/1?bpmName=${(entity.modelKey)!''}">发布历史</a>

                                            <a class="btn btn-primary btn-xs" target="_blank" href="<@commonTags method="tagHtpFlowAbleURL" type="1" value="1">${(tagHtpFlowAbleURL)!}</@commonTags>/#/editor/${(entity.id)!}"
                                               >编辑流程</a>

                                            <a class="btn btn-primary btn-xs" target="_blank" href="<@commonTags method="tagHtpFlowAbleURL" type="1" value="1">${(tagHtpFlowAbleURL)!}</@commonTags>/app/rest/models/${(entity.id)!}/bpmn20?version=${(entity.lastUpdated?string('yyyyMMddHHmmss'))!}"
                                            >bpm下载</a>


                                            <a class="btn btn-primary btn-xs "
                                               data-tiggle="ajax"
                                               data-submit-url="/process/startFlow?processKey=${(entity.modelKey)!''}"
                                               data-confirm="您确定要发起该条记录吗?">发起流程</a>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/process/list/" urlParas="?search=${search!}&lastUpdatedDateTimeStart=${lastUpdatedDateTimeStart!}&lastUpdatedDateTimeEnd=${lastUpdatedDateTimeEnd!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/process/list/" urlParas="?search=${search!}&lastUpdatedDateTimeStart=${lastUpdatedDateTimeStart!}&lastUpdatedDateTimeEnd=${lastUpdatedDateTimeEnd!}&pageSize=${pageSize!}"  />
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
                elem: '#lastUpdatedDateTimeStart'
            });
            laydate.render({
                elem: '#lastUpdatedDateTimeEnd'
            });
        });
        //上方修复：295 优化后台管理端，更换时间控件
    </script>
</@footer>