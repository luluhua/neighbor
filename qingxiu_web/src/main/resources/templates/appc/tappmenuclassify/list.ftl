<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>App页面分类
                <#if (parent)??>
                    <#list parent as parent>
                   >
                    <a href="/appc/tAppMenuClassify/list/1?pid=#{(parent.pid)}">${(parent.titile)!}</a>
                    </#list>
                </#if>
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tAppMenuClassify/list/1?pid=#{(pid)!}" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTAppMenuClassify">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/appc/tAppMenuClassify/add/#{(pid)!}"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 添加</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <button type="button" update-batch-url="/appc/tAppMenuClassify/updateSortAll"
                                        class="btn btn-primary btn-flat">
                                    <i class="fa  fa-hand-o-up"></i> 批量修改排序
                            </div>
                            <div class="input-group ">
                                <button type="button" delete-batch-url="/cms/tCmsAdv/deleteAll"
                                        class="btn btn-danger btn-flat">
                                    <i class="fa fa-remove"></i> 批量删除
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="名称、code">
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
                                <th>名称</th>
                                <th>code</th>
                                <th>是否启用</th>
                                <th>排序</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                           value="${(entity.id)!}"
                                           class="minimal checkbox-item"></td>
            <td><a href="/appc/tAppMenuClassify/list/1?pid=${(entity.id)!}">${(entity.titile)!'--'}</a></td>
            <td>${(entity.code)!'--'}</td>
            <td><#if entity.isEnabled=0>停用<#else >启用</#if></td>
            <td>
                <input type="text" id="sort_${(entity.id)}" class="form-control td-input-80"
                       onblur="oncheckCode(this)" name="values" value="${(entity.sortIndex)!'--'}">
            </td>
            <td>
                <@shiro.hasPermission name="editTAppMenuClassify">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tAppMenuClassify/edit/${(entity.id)!}?pid=#{(pid)!}"
                   data-title="编辑" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTAppMenuClassify">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tAppMenuClassify/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tAppMenuClassify/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppMenuClassify/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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