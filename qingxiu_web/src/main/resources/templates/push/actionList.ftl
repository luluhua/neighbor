<#include "../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>系统管理 > 推送导航</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/push/action/list/1" method="post" class="form-inline">
                        <div class="box-header">
                            <@shiro.hasPermission name="savePushAction">
                                <div class="input-group">
                                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                                       data-url="/push/action/form"
                                       data-width="800" data-height="650"><i class="fa fa-plus"></i> 添加</a>
                                </div>
                            </@shiro.hasPermission>

                            <div class="input-group">
                                <input type="text" name="value" value="${params.value!}" class="form-control"
                                       placeholder="编码查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>导航</th>
                                <th>编码</th>
                                <th>深度</th>
                                <th>分类</th>
                                <th>参数</th>
                                <th width="150px">操作</th>
                            </tr>
              <#list page.getRecords() as item>
              	  <tr>
                      <td>${(item.navigates)!}</td>
                      <td>${(item.value)!}</td>
                      <td>${(item.deep)!}</td>
                      <td>${(item.type)!}</td>
                      <td>
                            <#if (item.params)??>
                                <#list item.params as p>
                                    ${(p.key)!}:${(p.value)!}&nbsp;
                                </#list>
                            </#if>
                      </td>
                      <td>
	                	 <@shiro.hasPermission name="savePushAction">
	                	   <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-title="编辑"
                              data-url="/push/action/form?id=${(item.id)!}" data-width="800" data-height="650"
                              data-toggle="tooltip" title="编辑" data-placement="bottom">编辑</a>
                         </@shiro.hasPermission>
	                	<@shiro.hasPermission name="deletePushAction">
	                	<a class="btn btn-danger btn-xs" data-toggle="tooltip" title="删除" data-placement="bottom"
                           data-tiggle="ajax"
                           data-submit-url="/push/action/delete?id=${(item.id)!}"
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
	  		  <@paginate pageData=page actionUrl="/push/action/list/" urlParas="?value=${params.value!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../common/paginate.ftl" />
 			<@paginate currentPage=page.getCurrent() totalPage=page.getPages() actionUrl="/push/action/list/" urlParas="?value=${params.value!}&pageSize=${pageSize!}"  />
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