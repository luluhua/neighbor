<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>网络问政 > 管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/wzReply/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addWzReply">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建"
                       data-url="/system/wzReply/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="Search">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <a href="/system/wzReply/list/1"
                                       class="btn btn-default"><i class="fa fa-refresh"></i></a>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('数据');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th width="100px">
                                    行号
                                </th>
                                <th>dataSource</th>
                                <th>dataSourceId</th>
                                <th>caseId</th>
                                <th>rpUsername</th>
                                <th>rpContent</th>
                                <th>rpDatetime</th>
                                <th>rpFiles</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                ${((pageData.current-1)*pageData.size +entity_index+1)!}
            </td>
            <td>${(entity.dataSource)!'--'}</td>
            <td>${(entity.dataSourceId)!'--'}</td>
            <td>${(entity.caseId)!'--'}</td>
            <td>${(entity.rpUsername)!'--'}</td>
            <td>${(entity.rpContent)!'--'}</td>
            <td>${(entity.rpDatetime?string('yyyy-MM-dd'))!'--'}</td>
            <td>${(entity.rpFiles)!'--'}</td>
            <td>
                <@shiro.hasPermission name="editWzReply">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/system/wzReply/edit/${(entity.id)!}"
                   data-title="编辑" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteWzReply">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/system/wzReply/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/system/wzReply/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/wzReply/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
</@footer>