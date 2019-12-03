<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>app管理 > 授权日志查询</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/oauth/log/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="Search">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <a href="/oauth/log/list/1"
                                       class="btn btn-default"><i class="fa fa-refresh"></i></a>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('授权日志数据');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>应用编号</th>
                                <th>应用供应商</th>
                                <th>用户GID</th>
                                <th>组件代码</th>
                                <th>方法名</th>
                                <th>请求ip</th>
                                <th>是否成功</th>
                                <th>创建日期</th>
                                <th width="160px">操作</th>
                            </tr>
                        <#list pageData.getRecords() as entity>
                            <tr>
                                <td>${(entity.clientId)!'--'}</td>
                                <td>${(entity.clientProvider)!'--'}</td>
                                <td>${(entity.gid)!'--'}</td>
                                <td>${(entity.module)!'--'}</td>
                                <td>${(entity.method)!'--'}</td>
                                <td>${(entity.fromIp)!'--'}</td>
                                <td><#if entity.isSuccess==1>是<#else>否</#if></td>
                                <td>${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
                                <td>
                                    <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                       data-url="/oauth/log/message/${(entity.id)!}"
                                       data-title="查看请求报文" data-width="850" data-height="550">查看报文</a>
                                    <#--<a class="btn btn-primary btn-xs dialog" href="javascript:;"-->
                                       <#--data-url="/oauth/log/detail/${(entity.id)!}"-->
                                       <#--data-title="查看参数与结果" data-width="850" data-height="550">查看参数</a>-->
                                    <@shiro.hasPermission name="deleteOauthLog">
                                    <a class="btn btn-danger btn-xs"
                                       data-tiggle="ajax"
                                       data-submit-url="/oauth/log/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/oauth/log/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/oauth/log/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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