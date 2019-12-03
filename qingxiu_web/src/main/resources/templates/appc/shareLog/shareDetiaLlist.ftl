<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>用户分享 > 分享码[${(shareCode)!}]详情>></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tAppUserSharedetail/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <input autocomplete="off"  type="text" name="daterange" value="${daterange!}" class="form-control date" id="daterange" placeholder="浏览时间查询" style="width: 228px;">
                            </div>
                            <#--<div class="input-group">-->
                                <#--<input type="text" name="search" value="${search!}" class="form-control" placeholder="用户IP、设备标识查询">-->
                                <#--<input type="text" name="shareCode" value="${shareCode!}" class="form-control" style="display: none;">-->
                                <#--<div class="input-group-btn">-->
                                    <#--<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>-->
                                <#--</div>-->
                            <#--</div>-->
                            <input type="text" name="shareCode" value="${shareCode!}" class="form-control" style="display: none;">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="设备标识查询">  </div>
                            <div class="input-group">
                                <input type="text" name="mobile" value="${mobile!}" class="form-control"
                                       placeholder="手机号码查询">  </div>
                            <div class="form-group">
                                <div class="input-group">
                            <input type="text" name="searchIp" value="${searchIp!}" class="form-control"
                                           placeholder="用户IP查询">  </div>
                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                            </div>

                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="window.location.href='/appc/tAppUserSharelog/list/1'" style="margin-right: 10px;"><i
                                        class="fa"></i> 返回上页
                                </button>
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('分享码${(shareCode)!}详情');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>用户手机号码</th>
                                <th>用户设备标识</th>
                                <th>用户IP</th>
                                <th>浏览时间</th>
                                <th>下载时间</th>
                                <th>激活时间</th>
                                <th>验证类型</th>
                                <th>验证状态</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.mobile)!'<span style="color:red;">未激活</span>'}</td>
            <td>${(entity.equipmentToken)!'<span style="color:red;">未激活</span>'}</td>
            <td>${(entity.clientIp)!'--'}</td>
            <td>${(entity.dtBrowse?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td>${(entity.dtDownload?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td>${(entity.dtActivation?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td><#if entity.verifyType?? >
                <#if entity.verifyType==1 >
                    分享码验证
                <#else >
                    设备参数验证
                </#if>
                <#else >
                --
            </#if>

            </td>
            <td>
                <#if entity.verifyState==0 >
                    <span style="color: red;">未验证</span>
                <#else >
                    <span style="color: green;">已验证</span>
                </#if>
            </td>
            <td>

            <@shiro.hasPermission name="deleteTAppUserSharedetail">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tAppUserSharedetail/delete?id=${(entity.id)!}"
               data-confirm="您确定要删除该条记录吗?">删除</a>
            </@shiro.hasPermission>
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
               data-url="/appc/tAppUserSharedetail/info?id=${(entity.id)!}"
                data-title="详细信息" data-width="550" data-height="550">详细信息</a>
         </td>
     </tr>
             </#list>
                     </table>
                 </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tAppUserSharedetail/list/" urlParas="?search=${search!}&shareCode=${shareCode!}&daterange=${daterange!}&mobile=${(mobile)!}&searchIp=${(searchIp)!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppUserSharedetail/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&shareCode=${shareCode!}&daterange=${daterange!}&mobile=${(mobile)!}&searchIp=${(searchIp)!}"  />
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

    function getBoforeDate(before){
        var now = new Date();
        now.setDate(now.getDate()-before);
        return now;
    }

    function getBoforeMonth(beforeMonth,day){
        var now = new Date();
        now.setDate(day);
        now.setMonth(now.getMonth()-beforeMonth);
        return now;
    }

    $(function(){

        var now = new Date();

        $('.date').daterangepicker({
            "showWeekNumbers": true,
            "showISOWeekNumbers": true,
            "ranges": {
                "今天": [
                    now,
                    now
                ],
                "昨天": [
                    getBoforeDate(1),
                    getBoforeDate(1)
                ],
                "最近7天": [
                    getBoforeDate(7),
                    now
                ],
                "最近30天": [
                    getBoforeDate(30),
                    now
                ],
                "本月": [
                    getBoforeMonth(0,1),
                    getBoforeMonth(0,31)
                ],
                "上个月": [
                    getBoforeMonth(1,1),
                    getBoforeMonth(1,31)
                ],
                "最近三个月": [
                    getBoforeMonth(2,1),
                    getBoforeMonth(0,31)
                ]
            },
            "locale": {
                "format": "YYYY/MM/DD",
                "separator": "-",
                "applyLabel": "应用",
                "cancelLabel": "取消",
                "fromLabel": "From",
                "toLabel": "To",
                "customRangeLabel": "自定义",
                "weekLabel": "W",
                "daysOfWeek": [
                    "日",
                    "一",
                    "二",
                    "三",
                    "四",
                    "五",
                    "六"
                ],
                "monthNames": [
                    "一月",
                    "二月",
                    "三月",
                    "四月",
                    "五月",
                    "六月",
                    "七月",
                    "八月",
                    "九月",
                    "十月",
                    "十一月",
                    "十二月"
                ],
                "firstDay": 1
            },
            "alwaysShowCalendars": true,
            "autoUpdateInput":false,
            "opens": "right",
            "buttonClasses": "btn btn-sm"
        }, function(start, end, label) {
            console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
        });

        $('.date').on('apply.daterangepicker', function(ev, picker) {
            $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
        });

        $('.date').on('cancel.daterangepicker', function(ev, picker) {
            $(this).val('');
        });

    });
</script>
</@footer>