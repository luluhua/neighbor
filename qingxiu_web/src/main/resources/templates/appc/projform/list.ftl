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
                >事项表单管理
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovProjForm/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <input type="hidden" name="projectId" value="${projectId!}"/>
                <@shiro.hasPermission name="addTGovProjForm">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建"
                       data-url="/appc/tGovProjForm/add?projectId=${projectId!}"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建</a>
                </div>

                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="表单名称查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary" onclick="javasript:history.back(-1)">
                                    <i class="fa fa-backward"></i>
                                    返 回
                                </button>
                            <#--<button type="button" class="btn btn-primary btn-flat" onclick="exportTo('数据');"><i-->
                            <#--class="fa fa-file-excel-o"></i> 导出-->
                            <#--</button>-->
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th class="td-width-650">表单名称</th>
                                <th>关联材料</th>
                                <th class="td-width-100">是否启用</th>
                                <th class="td-width-100">排序</th>
                                <th class="td-width-200">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.formName)!'--'}</td>
            <td>${(entity.sqclName)!'--'}</td>
            <td><@dictTag method="dictValueByType" type="is_enabled" value="${(entity.isEnable)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td>${(entity.sortIndex)!'--'}</td>
            <td>
                <@shiro.hasPermission name="listTGovProjConfig">
                    <a class="btn btn-primary btn-xs"
                       href="/appc/tGovProjConfig/list/1?formId=${(entity.id?c)!}">配置</a>
                </@shiro.hasPermission>
                <@shiro.hasPermission name="editTGovProjForm">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tGovProjForm/edit/${(entity.id)!}"
                   data-title="编辑" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
                <@shiro.hasPermission name="editTGovProjForm">
                   <#if "${(entity.isEnable)!}"=="0">
                    <a class="btn btn-primary btn-xs"
                       data-tiggle="ajax"
                       data-submit-url="/appc/tGovProjForm/changStatus?id=${(entity.id)!}"
                       data-confirm="您确定要启用该条记录吗?">启用</a>
                   <#else>
                    <a class="btn btn-danger btn-xs"
                       data-tiggle="ajax"
                       data-submit-url="/appc/tGovProjForm/changStatus?id=${(entity.id)!}"
                       data-confirm="您确定要停用该条记录吗?">停用</a>
                   </#if>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTGovProjForm">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tGovProjForm/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovProjForm/list/" urlParas="?search=${search!}&projectId=${projectId!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovProjForm/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&projectId=${projectId!}"  />
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