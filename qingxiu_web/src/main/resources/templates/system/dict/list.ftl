<#include "../../common/layout.ftl">
<@header>
<style>
    .tdrem{
        max-width:220px;
        word-wrap:break-word;
        text-overflow:ellipsis;
        white-space:nowrap;
        overflow:hidden;
    }

</style>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>系统管理 > <a href="/tSysDict/dict/listGroup/1">字典分组管理</a> > 分组[${(dictGroup.label)!'--'}]字典管理</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/tSysDict/dict/list/1?moduleId=${(dictGroup.id)!''}" method="post" class="form-inline">
                            <div class="box-header">
                                <@shiro.hasPermission name="addTSysDict">
                                    <div class="input-group">
                                        <a class="btn btn-primary dialog" href="javascript:;" data-title="添加字典"
                                           data-url="/tSysDict/dict/add?moduleId=${(dictGroup.id)!''}" data-width="800" data-height="620"><i
                                                    class="fa fa-plus"></i> 添加</a>
                                    </div>
                                 <div class="input-group">
                                     <a class="btn btn-primary dialog" href="javascript:;" data-title="一键添加字典"
                                        data-url="/tSysDict/dict/toAddBatch?moduleId=${(dictGroup.id)!''}" data-width="800" data-height="620"><i
                                             class="fa fa-plus"></i> 一键添加</a>
                                 </div>
                                </@shiro.hasPermission>
                                <div class="input-group " >
                                    <button type="button" update-batch-url="/tSysDict/dict/updateSortAll"
                                            class="btn btn-primary btn-flat">
                                        <i
                                                class="fa  fa-hand-o-up"></i> 批量修改排序
                                </div>
                                <@shiro.hasPermission name="deleteTSysDict">
                                    <div class="input-group ">
                                        <button type="button" delete-batch-url="/tSysDict/dict/deleteAll" class="btn btn-danger btn-flat">
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
                                                lay-ignore  >全选</th>
                                    <th>字典代码</th>
                                    <th>字典标识</th>
                                    <th>字典标签</th>
                                    <th>字典值</th>
                                    <th>备注</th>
                                    <th>排序</th>
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
                                        <td class="tdrem"> ${(dict.remark)!'--'}</div></td>
                                        <td>
                                            <input type="text" class="form-control td-input-80"
                                                   onblur="oncheckCode(this)"  id="sort_${(dict.id)}"
                                                   name="values" value="${(dict.sortIndex)!'--'}">
                                        </td>
                                        <td>
                                            <@shiro.hasPermission name="editTSysDict">
                                                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                                   data-title="编辑字典" data-url="/tSysDict/dict/edit/${(dict.id)!}"
                                                   ,data-width="800" data-height="620"> <i
                                                            class="fa fa-pencil-square-o"></i> 编辑</a>
                                            </@shiro.hasPermission>
                                            <@shiro.hasPermission name="deleteTSysDict">
                                                <a class="btn btn-danger btn-xs"
                                                   data-tiggle="ajax"
                                                   data-submit-url="/tSysDict/dict/delete?id=${(dict.id)!}"
                                                   data-confirm="您确定要删除该条记录吗?"><i class="fa fa-times"></i> 删除</a>
                                            </@shiro.hasPermission>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/tSysDict/dict/list/" urlParas="?search=${search!}&moduleId=${(dictGroup.id)!''}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/tSysDict/dict/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&moduleId=${(dictGroup.id)!''}"  />
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