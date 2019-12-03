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
                <#--<@dictTag method="dictValueByType" type="service_type" value="${serviceType!}"> ${(dictValueByType)!}</@dictTag>-->
                >事项配置管理
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovProjConfig/list/1" method="post"
                          class="form-inline">
                        <#--<input type="hidden" name="projectId" value="${projectId!}"/>-->
                        <input type="hidden" name="formId" value="${formId!}"/>
                        <div class="box-header">
                        <@shiro.hasPermission name="addTGovProjConfig">
                            <div class="input-group">
                                <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                                   data-url="/appc/tGovProjConfig/add?formId=${formId!}"
                                   data-width="800" data-height="600"><i class="fa fa-plus"></i> 添加</a>
                            </div>
                        <div class="input-group">
                            <a class="btn btn-primary " href="/appc/tGovProjForm/editHtml?id=${(formId)!}"
                               target="_blank" <i class="fa fa-plus"></i>编辑表格HTML</a>
                        </div>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="editTGovProjConfig">
                            <div class="input-group">
                                <button type="button" update-batch-url="/appc/tGovProjConfig/updateSortAll"
                                        class="btn btn-primary btn-flat">
                                    <i class="fa  fa-hand-o-up"></i> 批量修改排序
                            </div>
                        </@shiro.hasPermission>
                        <#--<@shiro.hasPermission name="deleteTGovProjConfig">-->
                             <#--<div class="input-group">-->
                                 <#--<button type="button" delete-batch-url="/appc/tGovProjConfig/deleteAll"-->
                                         <#--class="btn btn-danger btn-flat">-->
                                     <#--<i class="fa  fa-remove"></i> 批量删除-->
                             <#--</div>-->
                        <#--</@shiro.hasPermission>-->
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="表单名称查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                <#--<a href="/appc/tGovProjConfig/list/1"-->
                                <#--class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary" onclick="javasript:history.back(-1)">
                                    <i class="fa fa-backward"></i>
                                    返 回
                                </button>
                            <#--<button type="button" class="btn btn-primary btn-flat"-->
                            <#--onclick="exportTo('办事事项表单配置表数据');"><i-->
                            <#--class="fa fa-file-excel-o"></i> 导出-->
                            <#--</button>-->
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>
                                    <#--<input type="checkbox" lay-filter="allCheck" value="root"-->
                                           <#--class="minimal  checkbox-toolbar"-->
                                           <#--lay-ignore>全选-->
                                </th>
                                <#--<th>表单名称</th>-->
                                <th>字段名称</th>
                                <th>字段类型</th>
                                <th>配置类型</th>
                                <th>是否必填</th>
                                <th>是否启用</th>
                                <th>排序</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td-width-50">
                <input type="checkbox" id="checkbox_${(entity.id)}" lay-filter="campus" name="ids"
                       value="${((entity.id)?c)!}"
                       class="minimal checkbox-item">
            </td>
            <#--<td>${(entity.formName)!'--'}</td>-->
            <td class="td-width-400">${(entity.configName)!'--'}</td>
            <td class="td-width-350"><@dictTag method="dictValueByType" type="config_type" value="${(entity.configType)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td class="td-width-100"><@dictTag method="dictValueByType" type="config_source" value="${(entity.configSource)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td class="td-width-100"><@dictTag method="dictValueByType" type="is_must" value="${(entity.isMust)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td class="td-width-100"><@dictTag method="dictValueByType" type="is_enabled" value="${(entity.isEnabled)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td>
                <input type="text" class="form-control td-input-80"
                       onblur="oncheckCode(this)"
                       onchange="onchangeCode(${(entity.id)})"
                       id="sort_${(entity.id)}"
                       name="values" value="${(entity.sortIndex)!'--'}">
            </td>
            <td>
                <@shiro.hasPermission name="editTGovProjConfig">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tGovProjConfig/edit/${(entity.id)!}"
                   data-title="编辑办事事项表单配置表" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTGovProjConfig">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tGovProjConfig/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovProjConfig/list/" urlParas="?search=${search!}&formId=${formId!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovProjConfig/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&formId=${formId!}"  />
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
        $("#checkbox_" + id).attr('checked',true);
    }
</script>
</@footer>