<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>智慧党建 > <a href="/dj/tDjDgw/list/1?pid=0">大工委信息管理</a>${params.orgNav!}</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/dj/tDjDgw/list/1?pid=${params.id!}" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTDjDgw">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/dj/tDjDgw/add"
                       data-width="800" data-height="550"><i class="fa fa-plus"></i> 添加</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${params.search!}" class="form-control" placeholder="输入名称">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <a href="/dj/tDjDgw/list/1?pid=${params.id!}" class="btn btn-default"><i class="fa fa-refresh"></i></a>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <#if params.id != 0>
                                <button type="button" class="btn btn-primary btn-flat" onclick="window.location.href='/dj/tDjDgw/list/1?pid=${params.pid!}'" style="margin-right: 10px;"><i
                                        class="fa"></i> 返回上页
                                </button>
                                </#if>
                                <button type="button" class="btn btn-primary btn-flat" onclick="window.location.href='/dj/tDjDgw/list/tree'" style="margin-right: 10px;"><i
                                        class="fa"></i> 结构树显示
                                </button>
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('党建-大工委数据');">
                                    <i class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th width="100px">
                                    <input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar"
                                           lay-ignore>全选
                                </th>
                                <th>名称</th>
                                <th>运行制度</th>
                                <th>排序</th>
                                <th width="180px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                           value="${(entity.id)!''}"
                                           class="minimal checkbox-item"></td>
            <td>${(entity.name)!'--'}</td>

            <td>
                <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/dj/tDjDgw/detail/${(entity.id)!}"
                   data-title="运行制度" data-width="850" data-height="550">查看</a>
            </td>
            <td>${(entity.sort)!'--'}</td>
            <td>
                <a class="btn btn-primary btn-xs " href="/dj/tDjDgw/list/1?pid=${(entity.id)!}">下级部门</a>
                <@shiro.hasPermission name="editTDjDgw">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/dj/tDjDgw/edit/${(entity.id)!}"
                   data-title="编辑" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTDjDgw">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/dj/tDjDgw/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/dj/tDjDgw/list/" urlParas="?search=${params.search!}&pid=${params.id!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/dj/tDjDgw/list/" urlParas="?search=${params.search!}&pageSize=${pageSize!}&pid=${params.id!}"  />
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