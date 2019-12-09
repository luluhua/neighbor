<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>内容管理 > 广告位列表</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/tCmsAdvpos/list/1" method="post" class="form-inline">
                        <div class="box-header">
                        <@shiro.hasPermission name="addTCmsAdvpos">
                            <div class="input-group">
                                <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                                   data-url="/tCmsAdvpos/add"
                                   data-width="550" data-height="350"><i class="fa fa-plus"></i> 添加</a>
                            </div>
                        </@shiro.hasPermission>
                            <div class="input-group ">
                                <button type="button" delete-batch-url="/tCmsAdvpos/deleteAll"
                                        class="btn btn-danger btn-flat">
                                    <i class="fa fa-remove"></i> 批量删除
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="请输入搜索的名称、广告代码">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        <#--<div class="input-group pull-right">-->
                        <#--<button type="button" class="btn btn-primary btn-flat" onclick="exportTo('菜单数据');"><i-->
                        <#--class="fa fa-file-excel-o"></i> 导出-->
                        <#--</button>-->
                        <#--</div>-->
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th><input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar"
                                           lay-ignore>全选
                                </th>
                                <th>名称</th>
                                <th>广告位代码</th>
                                <th>创建日期</th>
                                <th>备注</th>
                                <th width="200px">操作</th>
                            </tr>
              <#list pageData.getRecords() as advpos>
              	  <tr>
                      <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                     value="${(advpos.id)!}"
                                                     class="minimal checkbox-item"></td>
                      <td>${(advpos.name)!}</td>
                      <td>${(advpos.code)!}</td>
                      <td>${(advpos.dtCreate?string('yyyy-MM-dd'))!}</td>
                      <td>${(advpos.remark)!}</td>
                      <td>
	                	 <@shiro.hasPermission name="editTCmsAdvpos">
	                	   <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-title="编辑"
                              data-url="/tCmsAdvpos/edit/${(advpos.id)!}" data-width="770" data-height="700"
                              data-toggle="tooltip" title="编辑" data-placement="bottom">编辑</a>
                         </@shiro.hasPermission>
	                	<@shiro.hasPermission name="deleteTCmsAdvpos">
	                	<a class="btn btn-danger btn-xs" data-toggle="tooltip" title="删除" data-placement="bottom"
                           data-tiggle="ajax"
                           data-submit-url="/tCmsAdvpos/delete?id=${(advpos.id)!}"
                           data-confirm="您确定要删除该条记录吗?">删除</a>
                        </@shiro.hasPermission>
                          <@shiro.hasPermission name="TCmsAdvList">
	                	   <a class="btn btn-primary btn-xs"
                              href="/cms/tCmsAdv/list/1?advPosId=${(advpos.id)!}">查看广告列表</a>
                          </@shiro.hasPermission>
                      </td>
                  </tr>
              </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
         	  <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/tCmsAdvpos/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
 			<@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/tCmsAdvpos/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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