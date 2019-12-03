<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>手上青秀 > 事项基础库
            <#--<@dictTag method="dictValueByType" type="service_type" value="${serviceType!}"> ${(dictValueByType)!}</@dictTag> -->
                > 办理流程管理
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovProjectBllc/list/1" method="post"
                          class="form-inline">
                        <input type="hidden" name="projectId" value="${projectId!}"/>
                        <div class="box-header">
                <@shiro.hasPermission name="addTGovProjectBllc">
                    <div class="input-group">
                        <a class="btn btn-primary dialog" href="javascript:;" data-title="创建办理流程"
                           data-url="/appc/tGovProjectBllc/add?projectId=${projectId!}"
                           data-width="800" data-height="400"><i class="fa fa-plus"></i> 添加</a>
                    </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="环节名称查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                <#--<a href="/appc/tGovProjectBllc/list/1"-->
                                <#--class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary" onclick="javasript:history.back(-1)">
                                    <i class="fa fa-backward"></i>
                                    返 回
                                </button>
                            <#--<button type="button" class="btn btn-primary btn-flat" onclick="exportTo('办理流程数据');"><i-->
                            <#--class="fa fa-file-excel-o"></i> 导出-->
                            <#--</button>-->
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>环节名称</th>
                                <th>步骤</th>
                                <th>办理人</th>
                                <th>办理时限</th>
                                <th>办理时限说明</th>
                                <th>办理内容</th>
                                <th>办理结果</th>
                                <th>操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td-width-200">${(entity.name)!'--'}</td>
            <td class="td-width-200">${(entity.step)!'--'}</td>
            <td class="td-width-100">${(entity.user)!'--'}</td>
            <td class="td-width-150">${(entity.deadline)!'--'}</td>
            <td class="td-width-200">${(entity.remark)!'--'}</td>
            <td class="td-width-200">${(entity.detail)!'--'}</td>
            <td class="td-width-150">${(entity.result)!'--'}</td>
            <td class="td-width-100">
                <@shiro.hasPermission name="editTGovProjectBllc">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tGovProjectBllc/edit/${(entity.id)!}"
                   data-title="编辑办理流程" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTGovProjectBllc">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tGovProjectBllc/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovProjectBllc/list/" urlParas="?search=${search!}&projectId=${projectId!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovProjectBllc/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&projectId=${projectId!}"  />
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