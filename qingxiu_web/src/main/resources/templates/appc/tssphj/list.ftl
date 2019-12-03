<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>手上青秀
                > 事项基础库
            <#--<@dictTag method="dictValueByType" type="service_type" value="${serviceType!}"> ${(dictValueByType)!}</@dictTag> -->
                > 特殊审批环节管理
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovProjectTssphj/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTGovProjectTssphj">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/appc/tGovProjectTssphj/add?projectId=${projectId!}"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 添加</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="环节名称">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                <#--<a href="/appc/tGovProjectTssphj/list/1"-->
                                <#--class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary" onclick="javasript:history.back(-1)">
                                    <i class="fa fa-backward"></i>
                                    返 回
                                </button>
                            <#--<button type="button" class="btn btn-primary btn-flat" onclick="exportTo('特殊审批环节数据');">-->
                            <#--<i-->
                            <#--class="fa fa-file-excel-o"></i> 导出-->
                            <#--</button>-->
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th style="min-width: 200px">环节名称</th>
                                <th style="max-width: 350px">实施依据</th>
                                <th style="min-width: 100px;">办结时限</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
        <#--<td>${(entity.sortIndex)!'--'}</td>/-->
            <td>${(entity.title)!'--'}</td>
            <td>${(entity.rule)!'--'}</td>
            <td>${(entity.deadline)!'--'}</td>
            <td>
                <@shiro.hasPermission name="editTGovProjectTssphj">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tGovProjectTssphj/edit/${(entity.id)!}"
                   data-title="编辑特殊审批环节" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTGovProjectTssphj">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tGovProjectTssphj/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovProjectTssphj/list/" urlParas="?search=${search!}&projectId=${projectId!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovProjectTssphj/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&projectId=${projectId!}"  />
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