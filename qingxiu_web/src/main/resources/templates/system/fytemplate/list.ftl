<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>青秀法院 > 文书模板管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/fyTemplate/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addFyTemplate">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/system/fyTemplate/add"
                       data-width="1000" data-height="700"><i class="fa fa-plus"></i> 添加</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <select name="docType" class="form-control">
                                    <option value="">--分类查询--</option>
                                        <@dictTag method="getDictListByType" type="doc_type" >
                                            <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                        <#if "${(m.value)!}"=="${(docType)!}">selected</#if>
                                                >${(m.label)!}</option>
                                            </#list>
                                        </@dictTag>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="标题搜索">
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
                                <th>标题</th>
                                <th>类型</th>
                                <th>下载</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                           value="${(entity.id)!}"
                                           class="minimal checkbox-item"></td>
            <td>${(entity.title)!'--'}</td>
            <td> <@dictTag method="dictValueByType" type="doc_type" value="${(entity.docType)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td><a class="ca_download"
                   href="/download/downloadwenshu/${(entity.id)}">下载</a>
            </td>
            <td>
                <@shiro.hasPermission name="editFyTemplate">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/system/fyTemplate/edit/${(entity.id)!}"
                   data-title="编辑" data-width="1000" data-height="700">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteFyTemplate">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/system/fyTemplate/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/system/fyTemplate/list/" urlParas="?search=${search!}&docType=${(docType)!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/fyTemplate/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&docType=${(docType)!}"  />
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>

<style>
    .ca_download {
        width: 50px;
        height: 20px;
        background: #0d6aad;
        text-align: center;
        color: #FFF;
        display: inline-block;
        font-size: 14px;
    }
</style>
</@footer>