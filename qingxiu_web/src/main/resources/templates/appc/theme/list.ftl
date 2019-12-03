<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>手上青秀 > 办事主题管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovTheme/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                        <@shiro.hasPermission name="addTGovTheme">
                        <div class="input-group">
                            <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                               data-url="/appc/tGovTheme/add"
                               data-width="1000" data-height="600"><i class="fa fa-plus"></i> 添加</a>
                        </div>
                        </@shiro.hasPermission>
                             <@shiro.hasPermission name="editTGovTheme">
                            <div class="input-group">
                                <button type="button" update-batch-url="/appc/tGovTheme/updateSortAll"
                                        class="btn btn-primary btn-flat">
                                    <i class="fa  fa-hand-o-up"></i> 批量修改排序
                            </div>
                             </@shiro.hasPermission>
                        <@shiro.hasPermission name="deleteTGovTheme">
                            <div class="input-group">
                                <button type="button" delete-batch-url="/appc/tGovTheme/deleteAll"
                                        class="btn btn-danger btn-flat">
                                    <i class="fa  fa-remove"></i> 批量删除
                            </div>
                        </@shiro.hasPermission>
                            <div class="input-group">
                                <select name="themeType" class="form-control select2" lay-ignore
                                        style="width: 100%;">
                                    <option value="">--主题类型--</option>
                                    <@dictTag method="getDictListByType" type="theme_type" >
                                        <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                    <#if "${(m.value)!}"=="${(themeType)!}">
                                                        selected
                                                    </#if>
                                                >${(m.label)!}</option>
                                        </#list>
                                    </@dictTag>
                                </select>
                            </div>
                            <div class="input-group">
                                <select name="serviceType" class="form-control select2" lay-ignore
                                        style="width: 100%;">
                                    <option value="">--服务类型--</option>
                                    <@dictTag method="getDictListByType" type="service_type" >
                                        <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                    <#if "${(m.value)!}"=="${(serviceType)!}">
                                                        selected
                                                    </#if>
                                                >${(m.label)!}</option>
                                        </#list>
                                    </@dictTag>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="主题名称查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                <#--<a href="/appc/tGovTheme/list/1"-->
                                <#--class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>
                            <div class="input-group pull-right">
                            <#--<button type="button" class="btn btn-primary btn-flat" onclick="exportTo('办事主题表数据');"><i-->
                            <#--class="fa fa-file-excel-o"></i> 导出-->
                            <#--</button>-->
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>
                                    <input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar"
                                           lay-ignore>全选
                                </th>
                                <th style="max-width: 150px">主题图标</th>
                                <th>主题名称</th>
                                <th>主题编号</th>
                                <th>主题类型</th>
                                <th>服务类型</th>
                                <th>是否可用</th>
                                <th>排序</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td_checkbox">
                <input type="checkbox" id="checkbox_${(entity.id)}" lay-filter="campus" name="ids"
                       value="${((entity.id)?c)!}"
                       class="minimal checkbox-item">
            </td>
            <td>
                <img style="width: 60px;"
                     <#if (entity.themeIcon)??&&"${(entity.themeIcon)}"!= "">
                        src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.themeIcon)!}"
                     <#else>
                        src="/images/default.png"
                     </#if>
                />
            </td>
            <td>${(entity.themeTitle)!'--'}</td>
            <td>${(entity.code)!'--'}</td>
            <td><@dictTag method="dictValueByType" type="theme_type" value="${(entity.themeType)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td><@dictTag method="dictValueByType" type="service_type" value="${(entity.serviceType)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td><@dictTag method="dictValueByType" type="is_enabled" value="${(entity.isEnabled)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td>
                <input type="text" class="form-control td-input-80"
                       onblur="oncheckCode(this)"
                       onchange="onchangeCode(${(entity.id)})"
                       id="sort_${(entity.id)}"
                       name="values" value="${(entity.sortIndex)!'--'}">
            </td>
            <td>
                <@shiro.hasPermission name="editTGovTheme">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tGovTheme/edit/${(entity.id)!}"
                   data-title="编辑办事主题" data-width="1000" data-height="600">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTGovTheme">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tGovTheme/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovTheme/list/" urlParas="?search=${search!}&themeType=${themeType!}&serviceType=${serviceType!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovTheme/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&themeType=${themeType!}&serviceType=${serviceType!}"  />
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script type="application/javascript">
    function onchangeCode(id) {
        $("#checkbox_" + id).parent().addClass('checked');
        $("#checkbox_" + id).attr('checked', true);
    }
</script>
</@footer>