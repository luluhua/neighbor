<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>APP管理 > 应用分组管理</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/appc/tAppEntry/list/1" method="post"
                              class="form-inline">
                            <div class="box-header">
                                <@shiro.hasPermission name="addTAppEntry">
                                    <div class="input-group">
                                        <a class="btn btn-primary dialog" href="javascript:;" data-title="添加分组"
                                           data-url="/appc/tAppEntry/addGroup"
                                           data-width="500" data-height="300"><i class="fa fa-plus"></i> 添加</a>
                                    </div>
                                </@shiro.hasPermission>
                                <div class="input-group">
                                    <button type="button" update-batch-url="/appc/tAppEntry/updateSortAllGroup"
                                            class="btn btn-primary btn-flat">
                                        <i
                                                class="fa  fa-hand-o-up"></i> 批量修改排序
                                </div>
                                <div class="input-group ">
                                    <button type="button" delete-batch-url="/appc/tAppEntry/deleteAllGroup"
                                            class="btn btn-danger btn-flat">
                                        <i
                                                class="fa fa-remove"></i> 批量删除
                                </div>

                                <div class="input-group">
                                    <select name="moduleId" class="form-control">
                                        <option value="">--模块--</option>
                                        <@dictTag method="getDictListByType" type="app_entry_module_type" >
                                            <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                        <#if "${(m.value)!}"=="${(moduleId)!}">selected</#if>
                                                >${(m.label)!}</option>
                                            </#list>

                                        </@dictTag>
                                    </select>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="分组名称">
                                </div>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    <#--                        <a href="/appc/tAppEntry/list/1"-->
                                    <#--                           class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
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
                                    <th>模块名称</th>
                                    <th>分组名称</th>
                                    <th>启用</th>
                                    <th>顺序</th>
                                    <th>创建日期</th>
                                    <th width="120px">操作</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                                       value="${(entity.id)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="app_entry_module_type" value="${(entity.moduleId)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td>
                                            <a href="/appc/tAppEntry/pidlist/1?pid=${(entity.id)!}">
                                                ${(entity.titile)!'--'}
                                            </a>
                                        </td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="is_yes_no" value="${(entity.isEnabled)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td>
                                            <input type="text" id="sort_${(entity.id?c)}" class="form-control td-input-80"
                                                   onblur="oncheckCode(this)" name="values"
                                                   value="${(entity.sortIndex?c)!'--'}">
                                        </td>
                                        <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
                                        <td>
                                            <@shiro.hasPermission name="editTAppEntry">
                                                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                                   data-url="/appc/tAppEntry/editGroup/${(entity.id)!}"
                                                   data-title="编辑分组" data-width="500" data-height="300">编辑</a>
                                            </@shiro.hasPermission>
                                            <@shiro.hasPermission name="deleteTAppEntry">
                                                <a class="btn btn-danger btn-xs"
                                                   data-tiggle="ajax"
                                                   data-submit-url="/appc/tAppEntry/deleteGroup?id=${(entity.id)!}"
                                                   data-confirm="您确定要删除该条记录吗?">删除</a>
                                            </@shiro.hasPermission>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/appc/tAppEntry/list/" urlParas="?search=${search!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppEntry/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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