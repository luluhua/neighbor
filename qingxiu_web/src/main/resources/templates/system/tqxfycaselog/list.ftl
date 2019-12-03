<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>青秀法院 > 案件查询记录</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/qxfy/tQxfyCaseLog/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="queryCaseByCode">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/qxfy/tQxfyCaseLog/query"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 添加</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="案件代码">
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
                                <th width="100px">
                                    行号
                                </th>
                                <th>查询号码</th>
                                <th>案件ID</th>
                                <th>案件代码</th>
                                <th>查询返回的数据</th>
                                <th>查询时间</th>
                                <th>请求地方</th>
                                <th width="120px">操作</th>
                            </tr>
            <#list pageData.getRecords() as entity>
        <tr>
            <td>
                ${((pageData.current-1)*pageData.size +entity_index+1)!}
            </td>
            <td>${(entity.yQueryPhone)!'--'}</td>
            <td>${(entity.yCaseId)!'--'}</td>
            <td>${(entity.yCaseCode)!'--'}</td>
            <td>${(entity.yReturnInfo)!'--'}</td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
            <td>
                <#if entity.yQueryPlace=1>
                    后台
                <#else >
                    Api
                </#if>
            </td>
            <td>
                <@shiro.hasPermission name="getCaseDetails">
                    <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                       data-url="/qxfy/tQxfyCaseLog/getCaseDetails/${(entity.id)!}"
                       data-title="获取案件详情" data-width="850" data-height="550">获取案件详情</a>
                </@shiro.hasPermission>

                <@shiro.hasPermission name="deleteTQxfyCaseLog">
                    <a class="btn btn-danger btn-xs"
                       data-tiggle="ajax"
                       data-submit-url="/qxfy/tQxfyCaseLog/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/qxfy/tQxfyCaseLog/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/qxfy/tQxfyCaseLog/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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