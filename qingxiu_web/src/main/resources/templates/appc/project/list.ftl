<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>手上青秀 > 事项基础库
            <#--<@dictTag method="dictValueByType" type="service_type" value="${query.serviceType!}"> ${(dictValueByType)!}</@dictTag>管理-->
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovProject/list/1" method="post"
                          class="form-inline">
                    <#--<input type="hidden" name="serviceType" value="${query.serviceType!0}"/>-->
                        <div class="box-header">
                        <@shiro.hasPermission name="addTGovProject">
                        <div class="input-group">
                            <a class="btn btn-primary" href="/appc/tGovProject/add"
                               data-title="添加办事事项"><i
                                    class="fa fa-plus"></i> 添加</a>
                        </div>
                        </@shiro.hasPermission>
                            <div class="input-group">
                                <select name="themeId" class="form-control select2" lay-ignore
                                        style="width: 100%;">
                                    <option value="">--事项主题--</option>
                                    <#list themeList as m>
                                        <option value="${(m.id)!}"
                                                <#if "${(m.id)!}"=="${(query.themeId)!}">selected</#if>
                                        >${(m.themeTitle)!}</option>
                                    </#list>
                                </select>
                            </div>
                            <div class="input-group">
                                <select name="serviceType" class="form-control select2" lay-ignore
                                        style="width: 100%;">
                                    <option value="">--服务类型--</option>
                                    <@dictTag method="getDictListByType" type="service_type" >
                                        <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                    <#if "${(m.value)!}"=="${(query.serviceType)!}">
                                                        selected
                                                    </#if>
                                                >${(m.label)!}</option>
                                        </#list>
                                    </@dictTag>
                                </select>
                            </div>
                        <#--<div class="input-group">-->
                        <#--<select name="orgId" class="form-control select2" lay-ignore style="width: 100%;"-->
                        <#--lay-verify="required">-->
                        <#--<option value="">--所属机构--</option>-->
                        <#--<#list deptList as dept>-->
                        <#--<option value="${(dept.id)!}"-->
                        <#--<#if "${(dept.id)!}"=="${(orgId)!}">selected</#if>>${(dept.name)!}</option>-->
                        <#--</#list>-->
                        <#--</select>-->
                        <#--</div>-->
                            <div class="input-group">
                                <input type="text" name="baseCode" value="${(query.baseCode)!}"
                                       class="form-control"
                                       placeholder="基本编码查询">
                            </div>
                            <div class="input-group">
                                <input type="text" name="projectTitle" value="${(query.projectTitle)!}"
                                       class="form-control"
                                       placeholder="事项名称查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                <#--<a href="/appc/tGovProject/list/1"-->
                                <#--class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>
                        <#--<div class="input-group pull-right">-->
                        <#--<button type="button" class="btn btn-primary btn-flat" onclick="exportTo('办事事项数据');"><i-->
                        <#--class="fa fa-file-excel-o"></i> 导出-->
                        <#--</button>-->
                        <#--</div>-->
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th class="td-width-300">事项名称</th>
                                <th class="td-width-100">基本编码</th>
                                <th class="td-width-100">办件类型</th>
                                <th class="td-width-100">服务类型</th>
                                <th class="td-width-100">服务对象</th>
                                <th class="td-width-100">是否可用</th>
                                <th class="td-width-300">配置</th>
                                <th class="td-width-150">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.projectTitle)!'--'}</td>
            <td>${(entity.baseCode)!'--'}</td>
            <td><@dictTag method="dictValueByType" type="project_type" value="${(entity.officeType)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td><@dictTag method="dictValueByType" type="service_type" value="${(entity.serviceType)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td>${(entity.serviceObject)!'--'}</td>
            <td><@dictTag method="dictValueByType" type="is_enabled" value="${(entity.isEnabled)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td>
                <@shiro.hasPermission name="listTGovProjectSqcl">
                    <a class="btn btn-primary btn-xs"
                       href="/appc/tGovProjectSqcl/list/1?projectId=${(entity.id?c)!}">申请材料</a>
                </@shiro.hasPermission>
                  <@shiro.hasPermission name="listTGovProjForm">
                    <a class="btn btn-primary btn-xs"
                       href="/appc/tGovProjForm/list/1?projectId=${(entity.id?c)!}">表单配置</a>
                  </@shiro.hasPermission>
                 <@shiro.hasPermission name="listTGovProjectBllc">
                    <a class="btn btn-primary btn-xs"
                       href="/appc/tGovProjectBllc/list/1?projectId=${(entity.id?c)!}">办理流程</a>
                 </@shiro.hasPermission>

                 <@shiro.hasPermission name="listTGovProjectTssphj">
                    <a class="btn btn-primary btn-xs"
                       href="/appc/tGovProjectTssphj/list/1?projectId=${(entity.id?c)!}">审批环节</a>
                 </@shiro.hasPermission>
            </td>
            <td>


                 <@shiro.hasPermission name="editTGovProject">
                 <a class="btn btn-primary btn-xs" href="/appc/tGovProject/edit/${(entity.id?c)!}">编辑</a>
                 </@shiro.hasPermission>
                 <@shiro.hasPermission name="deleteTGovProject">
                    <a class="btn btn-danger btn-xs"
                       data-tiggle="ajax"
                       data-submit-url="/appc/tGovProject/delete?id=${(entity.id?c)!}"
                       data-confirm="您确定要删除该条记录吗?">删除</a>
                 </@shiro.hasPermission>
                <@shiro.hasPermission name="editTGovProject">
                    <#if "${(entity.isEnabled)!}"=="1">
                    <a class="btn btn-danger btn-xs"
                       data-tiggle="ajax"
                       data-submit-url="/appc/tGovProject/changStatus?id=${(entity.id?c)!}"
                       data-confirm="您确定要停用该条记录吗?">停用</a>
                    <#else >
                    <a class="btn btn-primary btn-xs"
                       data-tiggle="ajax"
                       data-submit-url="/appc/tGovProject/changStatus?id=${(entity.id?c)!}"
                       data-confirm="您确定要启用该条记录吗?">启用</a>
                    </#if>
                </@shiro.hasPermission>

            </td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovProject/list/" urlParas="?serviceType=${query.serviceType!}&projectTitle=${query.projectTitle!}&themeId=${query.themeId!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovProject/list/" urlParas="?serviceType=${query.serviceType!}&projectTitle=${query.projectTitle!}&themeId=${query.themeId!}&pageSize=${pageSize!}"  />
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