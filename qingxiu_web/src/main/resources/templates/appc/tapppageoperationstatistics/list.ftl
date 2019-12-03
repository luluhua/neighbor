<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>行为统计 > 行为日志统计</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tAppPageOperationStatistics/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="模块/值/类型">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <a href="/appc/tAppPageOperationStatistics/list/1" class="btn btn-default"><i class="fa fa-refresh"></i></a>
                                    <#--<a class="btn btn-default"
                                       data-tiggle="ajax"
                                       data-submit-url="/appc/tAppPageOperationStatistics/execute"
                                       data-confirm="您确定执行统计吗?">执行统计</a>-->
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>分组</th>
                                <th>类型</th>
                                <th>值</th>
                                <th>名称</th>
                                <th>统计数</th>
                                <th>合计数</th>
                                <th>平均数</th>
                <@shiro.hasPermission name="deleteTAppPageOperationStatistics">
                                <th width="120px">操作</th>
                </@shiro.hasPermission>
                            </tr>
                <#list pageData.getRecords() as entity>
                    <tr>
                        <td>${(entity.group)!'--'}</td>
                        <td>${(entity.type)!'--'}</td>
                        <td>${(entity.value)!'--'}</td>
                        <td>${(entity.name)!'--'}</td>
                        <td>${(entity.count)!'--'}</td>
                        <td>${(entity.sum)!'--'}</td>
                        <td>${(entity.avg)!'--'}</td>
                <@shiro.hasPermission name="deleteTAppPageOperationStatistics">
                        <td>
                            <a class="btn btn-danger btn-xs"
                               data-tiggle="ajax"
                               data-submit-url="/appc/tAppPageOperationStatistics/delete?id=${(entity.id)!}"
                               data-confirm="您确定要删除该条记录吗?">删除</a>
                        </td>
                </@shiro.hasPermission>
                    </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tAppPageOperationStatistics/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppPageOperationStatistics/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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