<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>智慧党建 > 党员活动（会议）管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/dj/tDjMeeting/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                        <@shiro.hasPermission name="addTDjMeeting">
                            <div class="input-group">
                                <a class="btn btn-primary" href="/dj/tDjMeeting/add"
                                ><i class="fa fa-plus"></i> 添加</a>
                            </div>
                            <div class="input-group">
                                <button type="button" update-batch-url="/dj/tDjMeeting/updateSortAll"
                                        class="btn btn-primary btn-flat">
                                    <i class="fa  fa-hand-o-up"></i> 批量修改排序
                            </div>
                            <div class="input-group">
                                <button type="button" update-batch-url="/dj/tDjMeeting/publishAll"
                                        class="btn btn-primary btn-flat">
                                    <i class="fa  fa-hand-o-up"></i> 批量发布
                            </div>
                        </@shiro.hasPermission>
                            <div class="input-group" style="width: 15%">
                                <select name="djOrgId" class="form-control select2" lay-ignore style="width: 100%;">
                                    <option value="">--选择党组织--</option>
                                    <#list orgList as dept>
                                        <option value="${(dept.id)!}"
                                        <#if "${(dept.id)!}"=="${(djOrgId)!}">selected</#if>>${(dept.name)!}</option>
                                    </#list>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" name="meetingDateTimeStart" value="${meetingDateTimeStart!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="meetingDateTimeStart" placeholder="会议日期起" style="width: 105px;">
                            </div>
                            <div class="input-group">
                                <input type="text" name="meetingDateTimeEnd" value="${meetingDateTimeEnd!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="meetingDateTimeEnd" placeholder="会议日期止" style="width: 105px;">
                            </div>
                            <div class="input-group">
                                <input type="text" name="publishDateTimeStart" value="${publishDateTimeStart!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="publishDateTimeStart" placeholder="发布日期起" style="width: 105px;">
                            </div>
                            <div class="input-group">
                                <input type="text" name="publishDateTimeEnd" value="${publishDateTimeEnd!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="publishDateTimeEnd" placeholder="发布日期止" style="width: 105px;">
                            </div>
                            <div class="input-group">
                                <input type="text" name="title" value="${title!}" class="form-control"
                                       placeholder="会议标题">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="input-group pull-right" style="padding-left: inherit;">
                                <button type="button" class="btn btn-primary btn-flat"
                                        onclick="newExportTo('/dj/tDjMeeting/exportExcelModel');"><i
                                        class="fa fa-file-excel-o"></i> 模板
                                </button>
                            </div>
                            <div class="input-group pull-right" style="padding-left: inherit;">
                                <button type="button" class="btn btn-primary btn-flat"
                                        onclick="newExportTo('/dj/tDjMeeting/exportExcel');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                            <@shiro.hasPermission name="addTDjMeeting">
                            <div class="input-group pull-right" style="padding-left: inherit;">
                                <button id="importTo" type="button" class="btn btn-primary btn-flat"><i
                                        class="fa fa-file-excel-o"></i> 导入
                                </button>
                            </div>
                            </@shiro.hasPermission>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>
                                    <input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar" lay-ignore>全选
                                </th>
                                <th>会议标题</th>
                                <th>党组织</th>
                                <th>会议时间</th>
                                <th>发布时间</th>
                                <th>发布人</th>
                                <th>会议状态</th>
                                <th>排序</th>
                                <th width="150px">操作</th>
                            </tr>
                        <#list pageData.getRecords() as entity>
                            <tr>
                                <td class="td-width-100">
                                    <input type="checkbox" id="checkbox_${(entity.id)}" lay-filter="campus" name="ids"
                                           value="${((entity.id)?c)!}"
                                           class="minimal checkbox-item">
                                </td>
                                <td>
                                    <a href="/dj/tDjMeeting/detail/${(entity.id)!}">${(entity.title)!'--'}</a>
                                </td>
                                <td>${(entity.djOrgName)!'--'}</td>
                                <td>${(entity.dtMeeting?string('yyyy-MM-dd'))!'--'}</td>
                                <td>${(entity.dtPublish?string('yyyy-MM-dd'))!'--'}</td>
                                <td>${(entity.publishers)!'--'}</td>
                                <td><@dictTag method="dictValueByType" type="mt_state" value="${(entity.mtState)!}"> ${(dictValueByType)!}</@dictTag></td>
                                <td>
                                    <input type="text" class="form-control td-input-80"
                                           onblur="oncheckCode(this)"
                                           onchange="onchangeCode(${(entity.id)})"
                                           id="sort_${(entity.id)}"
                                           name="values" value="${(entity.sortIndex)!'--'}">
                                </td>
                                <td>
                                    <a class="btn btn-primary btn-xs " href="/dj/tDjMeeting/detail/${(entity.id)!}"> <i
                                            class="fa fa-pencil-square-o"></i> 查看详情</a>
                                    <@shiro.hasPermission name="editTDjMeeting">
                                        <#if entity.mtState==1>
                                        <#else >
                                            <a class="btn btn-primary btn-xs"
                                               href="/dj/tDjMeeting/edit/${(entity.id)!}">编辑</a>
                                        </#if>
                                    </@shiro.hasPermission>
                                    <@shiro.hasPermission name="editTDjMeeting">
                                        <#if entity.mtState==1>
                                        <a class="btn btn-danger btn-xs"
                                           data-tiggle="ajax"
                                           data-submit-url="/dj/tDjMeeting/publish?id=${(entity.id)!}"
                                           data-confirm="您确定要下架该条记录吗?">下架</a>
                                        <#else>
                                        <a class="btn btn-primary btn-xs"
                                           data-tiggle="ajax"
                                           data-submit-url="/dj/tDjMeeting/publish?id=${(entity.id)!}"
                                           data-confirm="您确定要发布该条记录吗?">发布</a>
                                        </#if>
                                    </@shiro.hasPermission>
                                    <@shiro.hasPermission name="deleteTDjMeeting">
                                        <#if entity.mtState==1>
                                        <#else>
                                            <a class="btn btn-danger btn-xs"
                                               data-tiggle="ajax"
                                               data-submit-url="/dj/tDjMeeting/delete?id=${(entity.id)!}"
                                               data-confirm="您确定要删除该条记录吗?">删除</a>
                                        </#if>
                                    </@shiro.hasPermission>
                                </td>
                            </tr>
                        </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/dj/tDjMeeting/list/" urlParas="?djOrgId=${djOrgId!}&title=${title!}&meetingDateTimeStart=${meetingDateTimeStart!}&meetingDateTimeEnd=${meetingDateTimeEnd!}&publishDateTimeStart=${publishDateTimeStart!}&publishDateTimeEnd=${publishDateTimeEnd!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/dj/tDjMeeting/list/" urlParas="?djOrgId=${djOrgId!}&title=${title!}&meetingDateTimeStart=${meetingDateTimeStart!}&meetingDateTimeEnd=${meetingDateTimeEnd!}&publishDateTimeStart=${publishDateTimeStart!}&publishDateTimeEnd=${publishDateTimeEnd!}&pageSize=${pageSize!}"  />
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
    function onchangeCode(id) {
        $("#checkbox_" + id).parent().addClass('checked');
        $("#checkbox_" + id).attr('checked', true);
    }

    var index;
    var uploader = new plupload.Uploader({
        browse_button: 'importTo', //这个是点击上传的html标签的id,可以a,button等等
        max_file_size: '100mb', //这是文件的最大上传大小，得跟IIS结合使用
        url: '/dj/tDjMeeting/importExcel', //服务器页面地址，后面跟你想传递的参数
        flash_swf_url: '/js/plupload/plupload.flash.swf',  //flash地址
        filters: [{title: "excel文件", extensions: "xls,xlsx"}],
        multipart: true
    });
    //在实例对象上调用init()方法进行初始化
    uploader.init();
    //绑定各种事件，并在事件监听函数中做你想做的事
    uploader.bind('FilesAdded', function (uploader, files) {
        index = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        uploader.start(); //调用实例对象的start()方法开始上传文件，当然你也可以在其他地方调用该方法
    });
    uploader.bind("FileUploaded", function (uploader, files) {
        layer.close(index);
        layer.msg('文件上传完成');
        window.location.reload();
    });

    //导出excel
    function newExportTo(src) {
        var exportFileUrl = src;
        var djOrgName = "";
        <#if (djOrgName)??>
            djOrgName = ${djOrgName!}
        </#if>
        var index = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        $.ajax(exportFileUrl, {
            dataType: 'json',
            type: 'get',
            data: {'djOrgName': djOrgName},
            async: false,
            headers: {'Content-Type': 'application/json'},
            success: function (jsondata) {
                layer.close(index);
                if (jsondata != null && jsondata.code == 500) {
                    $.alert({
                        title: '提示',
                        content: jsondata.msg,
                        buttons: {"好的": {btnClass: 'btn-blue'}}
                    });
                } else {
                    console.log("---->开始导出---");
                    downloadFile("/download/downloadApp", jsondata.msg);
                }
            }
        });
    }

    function downloadFile(url, name) {
        setTimeout(function () {
            var _a = document.createElement("a");
            var evt = document.createEvent('HTMLEvents');
            evt.initEvent('click', false, false);
            _a.href = url + "?paths=" + name;
            _a.download = name;
            _a.target = "_blank";
            _a.dispatchEvent(evt);
            console.log(_a.href);
            document.body.appendChild(_a);
            _a.click();
            setTimeout(function () {
                document.body.removeChild(_a);
            }, 1000);
        }, 100);
    }

    layui.use('laydate', function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#meetingDateTimeStart'
        });
        laydate.render({
            elem: '#meetingDateTimeEnd'
        });
        laydate.render({
            elem: '#publishDateTimeStart'
        });
        laydate.render({
            elem: '#publishDateTimeEnd'
        });
    });
</script>
</@footer>