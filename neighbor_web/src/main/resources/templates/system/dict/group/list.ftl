<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>系统管理 > 字典分组管理</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/tSysDict/dict/listGroup/1" method="post" class="form-inline">
                            <div class="box-header">
                                <@shiro.hasPermission name="addTSysDict">
                                    <div class="input-group">
                                        <a class="btn btn-primary dialog" href="javascript:;" data-title="添加字典分组"
                                           data-url="/tSysDict/dict/addGroup" data-width="800" data-height="450"><i
                                                    class="fa fa-plus"></i> 添加</a>
                                    </div>
                                </@shiro.hasPermission>

                                <div class="input-group " >
                                    <button type="button" update-batch-url="/tSysDict/dict/updateSortAllGroup"
                                            class="btn btn-primary btn-flat">
                                        <i
                                                class="fa  fa-hand-o-up"></i> 批量修改排序
                                </div>
                                <@shiro.hasPermission name="deleteTSysDict">
                                    <div class="input-group ">
                                        <button type="button" delete-batch-url="/tSysDict/dict/deleteAllGroup" class="btn btn-danger btn-flat">
                                            <i class="fa fa-remove"></i> 批量删除
                                    </div>
                                </@shiro.hasPermission>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="字典标识或字典标签查询">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div><!-- /.box-header -->
                        </form>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th ><input type="checkbox"lay-filter="allCheck"  value="root" class="minimal  checkbox-toolbar"
                                                lay-ignore  >全选
                                    <th>分组代码</th>
                                    <th>分组标识</th>
                                    <th>分组名称</th>
                                    <th>分组值</th>
                                    <th>分组排序</th>
                                    <th>操作</th>
                                </tr>
                                <#list pageData.getRecords() as dict>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids" value="${((dict.id)?c)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>${(dict.code)!'--'}</td>
                                        <td>${(dict.type)!'--'} </td>
                                        <td>${(dict.label)!'--'}</td>
                                        <td>${(dict.value)!'--'}</td>
                                        <td>
                                            <input type="text" class="form-control td-input-80"
                                                   onblur="oncheckCode(this)"  id="sort_${(dict.id)}"
                                                   name="values" value="${(dict.sortIndex)!'--'}">
                                        </td>
                                        <td>
                                            <a class="btn  btn-primary btn-xs" href="/tSysDict/dict/list/1?moduleId=${(dict.id)}">查看分組字典</a>
                                            <@shiro.hasPermission name="editTSysDict">
                                                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                                   data-title="编辑字典分组" data-url="/tSysDict/dict/editGroup/${(dict.id)!}"
                                                   ,data-width="800" data-height="450"> <i
                                                            class="fa fa-pencil-square-o"></i> 编辑</a>
                                            </@shiro.hasPermission>
                                            <@shiro.hasPermission name="deleteTSysDict">
                                                <a class="btn btn-danger btn-xs"
                                                   data-tiggle="ajax"
                                                   data-submit-url="/tSysDict/dict/deleteGroup?id=${(dict.id)!}"
                                                   data-confirm="您确定要删除该条记录吗?"><i class="fa fa-times"></i> 删除</a>
                                            </@shiro.hasPermission>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/tSysDict/dict/listGroup/" urlParas="?search=${search!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/tSysDict/dict/listGroup/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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