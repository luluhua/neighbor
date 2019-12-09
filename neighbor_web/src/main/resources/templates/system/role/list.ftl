<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>系统管理 > 角色管理</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/system/role/list/1" method="post" class="form-inline">
                            <div class="box-header">
                                <@shiro.hasPermission name="addRole">
                                    <div class="input-group">
                                        <a class="btn btn-primary dialog" href="javascript:;"
                                           data-url="/system/role/add" data-title="添加角色" data-width="850"
                                           data-height="400"><i class="fa fa-plus"></i> 添加</a>
                                    </div>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="deleteBatchRole">
                                    <div class="input-group">
                                        <a class="btn btn-danger" delete-batch-url="/system/role/deleteBatch"><i
                                                class="fa fa-remove"></i> 批量删除</a>
                                    </div>
                                </@shiro.hasPermission>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="角色名称或角色编号查询">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    <#--                                        <a href="/system/role/list/1" class="btn btn-default"><i-->
                                    <#--                                                    class="fa fa-refresh"></i></a>-->
                                    </div>
                                </div>
                            <#--<div class="input-group pull-right">-->
                            <#--<button type="button" class="btn btn-primary btn-flat" onclick="exportTo('角色数据');">-->
                            <#--<i class="fa fa-file-excel-o"></i> 导出-->
                            <#--</button>-->
                            <#--</div>-->
                            </div><!-- /.box-header -->
                        </form>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th><input value="root" type="checkbox"
                                               class="minimal checkbox-toolbar">
                                    </th>
                                    <th>角色名称</th>
                                    <th>角色编号</th>
                                    <th>排序</th>
                                    <th>描述</th>
                                    <th>状态</th>
                                    <th>授权</th>
                                    <th>操作</th>
                                </tr>
                                <#list pageData.getRecords() as role>
                                    <tr>
                                        <td class="td_checkbox">
                                            <input value="${role.id}" name="roleState" type="checkbox"
                                                   class="minimal checkbox-item">
                                        </td>
                                        <td>${(role.name)!}
                                        <td>${(role.code)!'--'}
                                            <a class="btn btn-xs dialog"
                                               data-wdith="800"
                                               data-title="所属角色[${(role.name)!}]的用户列表"
                                               data-url="/system/role/getUsers?roleId=${role.id}"
                                            ><span sysc sysc-url="/system/role/getCount?roleId=${role.id}"
                                                   format=" [ %s个用户 ]"></span></a>
                                        </td>
                                        <td>${(role.roleState)!}</td>
                                        <td>${(role.remark)!'--'}</td>
                                        <td><#if role.roleState==1>启用<#else><font color="red">禁用</font></#if></td>
                                        <td class="td-width-150">
                                            <@shiro.hasPermission name="authRole">
                                                <a class="btn btn-success btn-xs dialog" href="javascript:;"
                                                   data-url="/system/role/auth/${(role.id)!}?service_type=1"
                                                   data-title="菜单授权"
                                                   data-width="850" data-height="600" data-toggle="tooltip" title="菜单授权"
                                                   data-placement="bottom">菜单授权</a>
                                            </@shiro.hasPermission>

                                            <@shiro.hasPermission name="authRole">
                                                <a class="btn btn-success btn-xs dialog" href="javascript:;"
                                                   data-url="/system/role/auth/${(role.id)!}?service_type=2"
                                                   data-title="审批授权"
                                                   data-width="850" data-height="600" data-toggle="tooltip" title="审批授权"
                                                   data-placement="bottom">审批授权</a>
                                            </@shiro.hasPermission>

                                        </td>
                                        <td class="td-width-100">
                                             <@shiro.hasPermission name="editRole">
                                                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                                   data-url="/system/role/edit/${(role.id)!}" data-title="创建新角色"
                                                   data-width="850" data-height="400" data-toggle="tooltip" title="编辑"
                                                   data-placement="bottom">编辑</a>
                                             </@shiro.hasPermission>
                                            <@shiro.hasPermission name="deleteRole">
                                                <a class="btn btn-danger btn-xs" data-toggle="tooltip" title="删除"
                                                   data-placement="bottom"
                                                   data-tiggle="ajax"
                                                   data-submit-url="/system/role/delete?id=${(role.id)!}"
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
                                <@paginate pageData=pageData actionUrl="/system/role/list/" urlParas="?search=${search!}&daterange=${daterange!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/role/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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