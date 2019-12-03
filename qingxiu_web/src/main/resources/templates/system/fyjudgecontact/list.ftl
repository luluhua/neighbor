<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>清秀法院 > 法官联系管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/fyJudgeContact/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addFyJudgeContact">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/system/fyJudgeContact/add"
                       data-width="650" data-height="550"><i class="fa fa-plus"></i> 添加</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group ">
                                <button type="button" delete-batch-url="/system/fyJudgeContact/deleteAll"
                                        class="btn btn-danger btn-flat">
                                    <i class="fa fa-remove"></i> 批量删除
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="姓名、部门名称">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>

                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th><input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar"
                                           lay-ignore>全选
                                </th>
                                <th>姓名</th>
                                <th>部门名称</th>
                                <th>电话</th>
                                <th>邮箱地址</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                           value="${(entity.id)!}"
                                           class="minimal checkbox-item"></td>

            <td>${(entity.name)!'--'}</td>
            <td>${(entity.deptName)!'--'}</td>
            <td>${(entity.mobile1)!}   ${(entity.mobile2)!}</td>
            <td>${(entity.email)!'--'}</td>
            <td>
                <@shiro.hasPermission name="editFyJudgeContact">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/system/fyJudgeContact/edit/${(entity.id)!}"
                   data-title="编辑" data-width="650" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteFyJudgeContact">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/system/fyJudgeContact/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/system/fyJudgeContact/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/fyJudgeContact/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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