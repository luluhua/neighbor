<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>appc > 授权记录管理</small>
        </h1>
    </section>
    <!-- Main content -->
<section class="content">
    <!-- Your Page Content Here -->
<div class="row">
<div class="col-xs-12">
    <div class="box">
        <form action="/appc/tAppAuthorizationApplicationLog/list/1" method="post"
              class="form-inline">
            <div class="box-header">
                <@shiro.hasPermission name="addTAppAuthorizationApplicationLog">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建授权记录"
                       data-url="/appc/tAppAuthorizationApplicationLog/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建授权记录</a>
                </div>
            </@shiro.hasPermission>
            <div class="input-group">
                <input type="text" name="search" value="${search!}" class="form-control" placeholder="Search">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                    <a href="/appc/tAppAuthorizationApplicationLog/list/1"
                       class="btn btn-default"><i class="fa fa-refresh"></i></a>
                </div>
            </div>
            <div class="input-group pull-right">
                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('授权记录数据');"><i
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
                                                                        <th>登录用户id</th>
                                                                                                            <th>appUserGid</th>
                                                                                                            <th>授权应用ID</th>
                                                                                                            <th>授权时间</th>
                                                                                                            <th>用户授权操作 0 不同意 1不同意</th>
                                                                                                            <th>授权内容</th>
                                                                                                            <th>请求授权IP</th>
                                                                                                            <th>是否删除 1:已删除 0：未删除</th>
                                                                                                            <th>本次授权结果 0 成功授权 1用户不同意授权 2授权失败</th>
                                                            <th width="120px">操作</th>
        </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                    ${((pageData.current-1)*pageData.size +entity_index+1)!}
            </td>
                                                                        <td>${(entity.appUserId)!'--'}</td>
                                                                                                            <td>${(entity.appUserGid)!'--'}</td>
                                                                                                            <td>${(entity.appId)!'--'}</td>
                                                                                                            <td>${(entity.authorizationTime?string('yyyy-MM-dd'))!'--'}</td>
                                                                                                            <td>${(entity.authorizationResult)!'--'}</td>
                                                                                                            <td>${(entity.authorizationRoles)!'--'}</td>
                                                                                                            <td>${(entity.requestIp)!'--'}</td>
                                                                                                            <td>${(entity.isDeleted)!'--'}</td>
                                                                                                            <td>${(entity.state)!'--'}</td>
                                                            <td>
                <@shiro.hasPermission name="editTAppAuthorizationApplicationLog">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/appc/tAppAuthorizationApplicationLog/edit/${(entity.id)!}"
                   data-title="编辑授权记录" data-width="850" data-height="550">编辑</a>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTAppAuthorizationApplicationLog">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tAppAuthorizationApplicationLog/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tAppAuthorizationApplicationLog/list/" urlParas="?search=${search!}"  />
        </div>
        <div class="col-md-6 pull-left">
            <#include "../../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppAuthorizationApplicationLog/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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