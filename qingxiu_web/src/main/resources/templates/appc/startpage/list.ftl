<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>app管理 > app启动页管理</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/appc/tAppStartupPageManage/list/1" method="post"
                              class="form-inline">
                            <div class="box-header">
                                <@shiro.hasPermission name="addTAppStartupPageManage">
                                    <div class="input-group">
                                        <a class="btn btn-primary dialog" href="javascript:;" data-title="添加启动页"
                                           data-url="/appc/tAppStartupPageManage/add"
                                           data-width="1000" data-height="700"><i class="fa fa-plus"></i> 添加</a>
                                    </div>
                                    <div class="input-group">
                                        <button type="button" delete-batch-url="/appc/tAppStartupPageManage/deleteAll"
                                                class="btn btn-danger btn-flat">
                                            <i
                                                    class="fa fa-remove"></i> 批量删除
                                    </div>
                                </@shiro.hasPermission>
                                <div class="input-group">
                                    <select name="aType" class="form-control">
                                        <option value="">--平台类型--</option>
                                        <@dictTag method="getDictListByType" type="app_type" >
                                            <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                        <#if "${(m.value)!}"=="${(aType)!}">selected</#if>>${(m.label)!}</option>
                                            </#list>

                                        </@dictTag>
                                    </select>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="输入版本名称或版本号查询" style="width: 200px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    <#--                                    <a href="/appc/tAppStartupPageManage/list/1"-->
                                    <#--                                       class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
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
                                    <th>缩略图</th>
                                    <th>版本名称</th>
                                    <th>版本号</th>
                                    <th>平台</th>
                                    <th>启用</th>
                                    <th>创建时间</th>
                                    <th width="120px">操作</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                                       value="${(entity.id)!}"
                                                                       class="minimal checkbox-item"></td>
                                    <td>
                                            <#if (entity.aStartupPageUrl)!=''>
                                                <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.aStartupPageUrl)!''}"
                                                     width="40px" height="40px"></td>
                                            <#else >
                                            <img src="../../../images/default.png" width="40px" height="40px">
                                            </#if>
                                        <td>${(entity.aName)!'--'}</td>
                                        <td>${(entity.aCode)!'--'}</td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="app_type" value="${(entity.aType)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="is_yes_no" value="${(entity.aStatus)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
                                        <td>
                                            <@shiro.hasPermission name="editTAppStartupPageManage">
                                                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                                   data-url="/appc/tAppStartupPageManage/edit/${(entity.id)!}"
                                                   data-title="编辑" data-width="1000" data-height="700">编辑</a>
                                            </@shiro.hasPermission>
                                            <@shiro.hasPermission name="deleteTAppStartupPageManage">
                                                <a class="btn btn-danger btn-xs"
                                                   data-tiggle="ajax"
                                                   data-submit-url="/appc/tAppStartupPageManage/delete?id=${(entity.id)!}"
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
                                <@paginate pageData=pageData actionUrl="/appc/tAppStartupPageManage/list/" urlParas="?search=${search!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppStartupPageManage/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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