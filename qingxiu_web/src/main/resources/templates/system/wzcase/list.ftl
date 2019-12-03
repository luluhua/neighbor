<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>网络问政 > 问政列表</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/wzCase/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <@shiro.hasPermission name="addWzCase">
                                <div class="input-group">
                                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建"
                                       data-url="/system/wzCase/add"
                                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建</a>
                                </div>
                            </@shiro.hasPermission>

                            <@shiro.hasPermission name="deleteWzCase">
                                <div class="input-group">
                                    <a class="btn btn-danger" delete-batch-url="/system/wzCase/deleteBatch">
                                        <i class="fa fa-remove"></i> 批量删除
                                    </a>
                                </div>
                            </@shiro.hasPermission>

                            <div class="form-group">
                                <#--<input type="text" name="daterange" value="${daterange!}" class="form-control date"-->
                                       <#--id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">-->
                                <input type="text" name="postDateTimeStart" value="${postDateTimeStart!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="postDateTimeStart" placeholder="提交日期开始" style="width: 120px;">
                            </div>
                            <div class="form-group">
                                <input type="text" name="postDateTimeEnd" value="${postDateTimeEnd!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="postDateTimeEnd" placeholder="提交日期结束" style="width: 120px;">
                            </div>
                            <div class="input-group">
                                <select name="dep" style="width: 120px" class="form-control">
                                    <option value="">--处理单位--</option>
                                    <#list deplist as deplist>
                                        <option value="${(deplist.dep)!}"
                                         <#if "${(deplist.dep)!}"=="${(dep)!}">selected</#if>>
                                            ${(deplist.dep)!}
                                        </option>
                                    </#list>
                                </select>
                                <select name="statusText" style="width: 120px" class="form-control">
                                    <option value="">--处理状态--</option>
                                      <@dictTag method="getDictListByType" type="status_text" >
                                          <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                        <#if "${(m.value)!}"=="${(statusText)!}">selected</#if>
                                                >${(m.label)!}</option>
                                          </#list>
                                      </@dictTag>
                                </select>

                                <input type="text" name="search" value="${search!}"
                                       class="form-control input-select-200"
                                       placeholder="问政编号、标题、提交人">
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
                                <th>问政编号</th>
                                <th>标题</th>
                                <th>类型</th>
                                <th>处理单位</th>
                                <th>提交人</th>
                                <th>提交时间</th>
                                <th>点击量</th>
                                <th>状态</th>
                                <th>查看</th>
                                <th>操作</th>
                            </tr>
                            <#list pageData.getRecords() as entity>
                            <tr>
                                <td class="td-width-50">
                                    <input value="${entity.id}" name="wzcaseState" type="checkbox"
                                           class="minimal checkbox-item">
                                </td>
                                <td class="td-width-150">${(entity.num)!'--'}</td>
                                <td class="td-width-250">${(entity.title)!'--'}</td>
                                <td class="td-width-50">${(entity.ctypeText)!'--'}</td>
                                <td class="td-width-200">${(entity.dep)!'--'}</td>
                                <td class="td-width-100">${(entity.postUsername)!'--'}</td>
                                <td class="td-width-150">${(entity.postDatetime?string('yyyy-MM-dd'))!'--'}</td>
                                <td class="td-width-100">${(entity.viewsCount1)!'--'}</td>
                                <td class="td-width-100">
                                    ${(entity.statusText)!'--'}
                                </td>
                                <td class="td-width-250">
                                    <@shiro.hasPermission name="editWzCase">
                                        <a class="btn btn-info btn-xs" data-width="550" data-height="350"
                                           href="/system/wzCase/edit/#{(entity.id)!}">查看及回复</a>
                                        <a class="btn btn-info btn-xs" TARGET="_blank"
                                           href="<@commonTags method="tagH5URL" type="1" value="1">${(tagH5URL)!}</@commonTags>/qingxiuh5/qxwz/details/#{(entity.id)!}">查看H5</a>
                                    </@shiro.hasPermission>

                                </td>
                                <td class="td-width-150">
                                   <@shiro.hasPermission name="deleteWzCase">
                                       <a class="btn btn-danger btn-xs"
                                          data-tiggle="ajax"
                                          data-submit-url="/system/wzCase/delete?id=#{(entity.id)!}"
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
                            <@paginate pageData=pageData actionUrl="/system/wzCase/list/" urlParas="?search=${search!}&dep=${dep!}&statusText=${statusText!}&postDateTimeStart=${postDateTimeStart!}&postDateTimeEnd=${postDateTimeEnd!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
                            <#include "../../common/paginate.ftl" />
                            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/wzCase/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&dep=${dep!}&statusText=${statusText!}&postDateTimeStart=${postDateTimeStart!}&postDateTimeEnd=${postDateTimeEnd!}"  />
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
                elem: '#postDateTimeStart'
            });
            laydate.render({
                elem: '#postDateTimeEnd'
            });
        });
        //上方修复：295 优化后台管理端，更换时间控件
    </script>

</@footer>
