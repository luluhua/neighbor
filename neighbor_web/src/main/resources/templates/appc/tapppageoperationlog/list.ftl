<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>行为日志 > 行为日志管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tAppPageOperationLog/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="模块/名称/key">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <a href="/appc/tAppPageOperationLog/list/1" class="btn btn-default"><i class="fa fa-refresh"></i></a>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>模块</th>
                                <th>名称</th>
                                <th>页面地址</th>
                                <th>页面key</th>
                                <th>时长（秒）</th>
                                <th>设备类型</th>
                                <th>app版本</th>
                                <th>访问IP</th>
                                <th>时间</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
                    <tr>
                        <td>${(entity.model)!'--'}</td>
                        <td>${(entity.name)!'--'}</td>
                        <td>${(entity.url)!'--'}</td>
                        <td>${(entity.key)!'--'}</td>
                        <td>${(entity.timeLength)!'--'}秒</td>

                        <td>${(entity.mobilePlatform)!'--'}</td>
                        <td>${(entity.appVersion)!'--'}</td>

                        <td>${(entity.requestIp)!'--'}</td>
                        <td>${(entity.dtCreate?string("yyyy-MM-dd HH:mm:ss"))!'--'}</td>
                        <td>
                            <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                               data-url="/appc/tAppPageOperationLog/detail/${(entity.id)!}"
                               data-title="详情" data-width="850" data-height="650">查看</a>
                            <@shiro.hasPermission name="deleteTAppPageOperationLog">
                            <a class="btn btn-danger btn-xs"
                               data-tiggle="ajax"
                               data-submit-url="/appc/tAppPageOperationLog/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tAppPageOperationLog/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppPageOperationLog/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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