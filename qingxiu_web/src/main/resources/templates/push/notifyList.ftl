<#include "../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>推送管理 > 通知记录</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/push/notify/list/1" method="post" class="form-inline">
                        <div class="box-header">
                            <@shiro.hasPermission name="saveNotify">
                                <div class="input-group">
                                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                                       data-url="/push/notify/form"
                                       data-width="800" data-height="650"><i class="fa fa-plus"></i> 添加</a>
                                </div>
                            </@shiro.hasPermission>

                            <div class="input-group">
                                <input type="text" name="source" value="${params.source!}" class="form-control"
                                       placeholder="来源查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>编号</th>
                                <th>来源</th>
                                <th>标题</th>
                                <th>内容</th>
                                <th>类型</th>
                                <th width="150px">操作</th>
                            </tr>
              <#list page.getRecords() as item>
              	  <tr>
                      <td>${(item.id)!}</td>
                      <td>${(item.source)!}</td>
                      <td>${(item.title)!}</td>
                      <td>${(item.content)!}</td>
                      <td><#if item.typeFlag == 0>自定义
                      <#elseif item.typeFlag == 1>全部的
                      <#elseif item.typeFlag == 2>在线的
                      <#elseif item.typeFlag == 3>批量的</#if></td>
                      <td>
                          <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-title="详情"
                             data-url="/push/notify/detail?id=${(item.id)!}" data-width="800" data-height="650"
                             data-toggle="tooltip" title="详情" data-placement="bottom">详情</a>
	                	<@shiro.hasPermission name="deleteNotify">
	                	<a class="btn btn-danger btn-xs" data-toggle="tooltip" title="删除" data-placement="bottom"
                           data-tiggle="ajax"
                           data-submit-url="/push/notify/delete?id=${(item.id)!}"
                           data-confirm="您确定要删除该条记录吗?">删除</a>
                        </@shiro.hasPermission>
                      </td>
                  </tr>
              </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
         	  <#include "../common/paginateBar.ftl" />
	  		  <@paginate pageData=page actionUrl="/push/notify/list/" urlParas="?source=${params.source!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../common/paginate.ftl" />
 			<@paginate currentPage=page.getCurrent() totalPage=page.getPages() actionUrl="/push/notify/list/" urlParas="?source=${params.source!}&pageSize=${pageSize!}"  />
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