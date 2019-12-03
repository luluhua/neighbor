<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>app管理 > App版本管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/tApp/version/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTAppVersion">
                <div class="input-group">
                    <a class="btn btn-primary " href="/tApp/version/add"
                       ><i class="fa fa-plus"></i> 添加</a>
                </div>
                    <div class="input-group ">
                        <button type="button" delete-batch-url="/tApp/version/deleteAll"
                                class="btn btn-danger btn-flat">
                            <i
                                    class="fa fa-remove"></i> 批量删除
                    </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <select name="vType" class="form-control">
                                    <option value="">--平台类型--</option>
                                    <@dictTag method="getDictListByType" type="app_type" >
                                        <#list getDictListByType as m>
                                            <option value="${(m.value)!}"
                                                    <#if "${(m.value)!}"=="${(vType)!}">selected</#if>>${(m.label)!}</option>
                                        </#list>

                                    </@dictTag>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="输入版本名称或版本号查询" style="width: 200px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                <#--                                    <a href="/tApp/version/list/1"-->
                                <#--                                                                                                    class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>

                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover" style="table-layout:fixed;">
                            <tr>
                                <th><input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar"
                                           lay-ignore>全选
                                </th>
                                <th>版本名称</th>
                                <th>版本号</th>
                                <th>平台</th>
                                <th>强制更新</th>
                                <th>创建日期</th>
                                <th>更新说明</th>
                                <th>下载</th>
                                <#--<th width="120px">操作</th>-->
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr class="leui">
            <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids" value="${(entity.id?c)!}"
                                           class="minimal checkbox-item"></td>
            <td>${(entity.vName)!'--'}</td>
            <td>${(entity.vCode)!'--'}</td>
            <td>
                <@dictTag method="dictValueByType" type="app_type" value="${(entity.vType)!}"> ${(dictValueByType)!}</@dictTag>
            </td>
            <td>
                <@dictTag method="dictValueByType" type="is_yes_no" value="${(entity.vStatus)!}"> ${(dictValueByType)!}</@dictTag>
            </td>
            <td>${(entity.dtCreate?string('yyyy/MM/dd HH:mm:ss'))!'--'}</td>
            <td style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">${(entity.upDescription)!'--'}</td>
            <td>
                <#if entity.vType=1 || entity.vType=2 >
                    <a class="btn btn-primary btn-xs dow" name="${(entity.vDownloadUrl)}"
                       href="/download/downloadApp?paths=<@commonTags method="appdowurl" type="${(entity.vType)!}" value="${(entity.vDownloadUrl)}">${(appdowurl)!}</@commonTags>"
                    >下载</a>
                    <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                       data-url="/tApp/version/detail/${(entity.id)!}"
                       data-title="详情" data-width="750" data-height="400">详情</a>
                <#else >
                    --
                </#if>
            </td>
            <#--<td>-->
                <#--<@shiro.hasPermission name="editTAppVersion">-->
                <#--<a class="btn btn-primary btn-xs dialog" href="javascript:;"-->
                   <#--data-url="/tApp/version/edit/${(entity.id?c)!}"-->
                   <#--data-title="编辑" data-width="850" data-height="450">编辑</a>-->
                <#--</@shiro.hasPermission>-->
            <#--<@shiro.hasPermission name="deleteTAppVersion">-->
            <#--<a class="btn btn-danger btn-xs"-->
               <#--data-tiggle="ajax"-->
               <#--data-submit-url="/tApp/version/delete?id=${(entity.id?c)!}"-->
               <#--data-confirm="您确定要删除该条记录吗?">删除</a>-->
            <#--</@shiro.hasPermission>-->
            <#--</td>-->
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/tApp/version/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/tApp/version/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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
    $(function () {
        $(".leui .dow").click(function () {
            var paths = $(this).attr("name");
            window.location.href = "/download/downloadFile?paths=" + paths;
        });
    })


</script>
</@footer>