<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>appc > 用户扩展表管理</small>
        </h1>
    </section>
    <!-- Main content -->
<section class="content">
    <!-- Your Page Content Here -->
<div class="row">
<div class="col-xs-12">
    <div class="box">
        <form action="/appc/tLjUserInfo/list/1" method="post"
              class="form-inline">
            <div class="box-header">
                <@shiro.hasPermission name="addTLjUserInfo">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建用户扩展表"
                       data-url="/appc/tLjUserInfo/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建用户扩展表</a>
                </div>
            </@shiro.hasPermission>
            <div class="input-group">
                <input type="text" name="search" value="${search!}" class="form-control" placeholder="Search">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                    <a href="/appc/tLjUserInfo/list/1"
                       class="btn btn-default"><i class="fa fa-refresh"></i></a>
                </div>
            </div>
            <div class="input-group pull-right">
                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('用户扩展表数据');"><i
                        class="fa fa-file-excel-o"></i> 导出
                </button>
            </div>
    </div><!-- /.box-header -->
    </form>
<div class="box-body table-responsive no-padding">
    <table class="table table-hover">
        <tr>
            <th width="100px">
                行号</th>
                                                                        <th>用户表id</th>
                                                                                                            <th>昵称</th>
                                                                                                            <th>邮箱</th>
                                                                                                            <th>0:未填写，1：男，2：女</th>
                                                                                                            <th>头像</th>
                                                            <th width="120px">操作</th>
        </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                    ${((pageData.current-1)*pageData.size +entity_index+1)!}
            </td>
                                                                        <td>${(entity.userId)!'--'}</td>
                                                                                                            <td>${(entity.nickname)!'--'}</td>
                                                                                                            <td>${(entity.email)!'--'}</td>
                                                                                                            <td>${(entity.gender)!'--'}</td>
                                                                                                            <td>${(entity.avatarUrl)!'--'}</td>
                                                            <td>
                <@shiro.hasPermission name="editTLjUserInfo">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/appc/tLjUserInfo/edit/${(entity.id)!}"
                   data-title="编辑用户扩展表" data-width="850" data-height="550">编辑</a>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTLjUserInfo">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tLjUserInfo/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tLjUserInfo/list/" urlParas="?search=${search!}"  />
        </div>
        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tLjUserInfo/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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