<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>授权中心 > 客户端管理</small>
        </h1>
    </section>
    <!-- Main content -->
<section class="content">
    <!-- Your Page Content Here -->
<div class="row">
<div class="col-xs-12">
    <div class="box">
        <form action="/appc/oauthClients/list/1" method="post"
              class="form-inline">
            <div class="box-header">
                <@shiro.hasPermission name="addOauthClients">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/appc/oauthClients/add"
                       data-width="800" data-height="600"><i class="fa fa-plus"></i> 添加</a>
                </div>
            </@shiro.hasPermission>
            <div class="input-group">
                <input type="text" name="search" value="${search!}" class="form-control" placeholder="应用提供商名称">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
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
            <th>应用提供商</th>
           <th>APPID</th>
           <th>创建时间</th>
           <th>更新时间</th>
           <th width="120px">操作</th>
        </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.applicationProvider)!'--'}</td>
            <td>${(entity.clientId)!'--'}</td>
            <td>${(entity.createTime?string('yyyy-MM-dd'))!'--'}</td>
            <td>${(entity.modifyTime?string('yyyy-MM-dd'))!'--'}</td>
            <td>
                <@shiro.hasPermission name="editOauthClients">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/appc/oauthClients/edit/${(entity.id)!}"
                   data-title="编辑" data-width="850" data-height="600">编辑</a>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteOauthClients">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/oauthClients/delete?id=${(entity.id)!}"
               data-confirm="您确定要删除该条记录吗?">删除</a>
        </@shiro.hasPermission>
        </td>
        </tr>
                </#list>
    </table>
</div><!-- /.box-body -->
    <div class="box-footer row">
        <div class="col-md-6">
            <#include "../../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/oauthClients/list/" urlParas="?search=${search!}"  />
        </div>
        <div class="col-md-6 pull-left">
            <#include "../../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/oauthClients/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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