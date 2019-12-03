<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>基层治理 > 部门申述管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/jczl/tJczlCaseDepartmentalRepresentations/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTJczlCaseDepartmentalRepresentations">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建部门申述"
                       data-url="/jczl/tJczlCaseDepartmentalRepresentations/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建部门申述</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="Search">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                <#--<a href="/jczl/tJczlCaseDepartmentalRepresentations/list/1"-->
                                <#--class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>
                        <#--<div class="input-group pull-right">-->
                        <#--<button type="button" class="btn btn-primary btn-flat" onclick="exportTo('部门申述数据');"><i-->
                        <#--class="fa fa-file-excel-o"></i> 导出-->
                        <#--</button>-->
                        <#--</div>-->
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>案件</th>
                                <th>申述内容</th>
                                <th>申述状态</th>
                                <th>申述时间</th>
                                <th>申述结果</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.cCaseId)!'--'}</td>
            <td>${(entity.cRepresentationsContent)!'--'}</td>
            <td>${(entity.cStatus)!'--'}</td>
            <td>${(entity.dtRepresentations?string('yyyy-MM-dd'))!'--'}</td>
            <td>${(entity.cResult)!'--'}</td>
            <td>
                <@shiro.hasPermission name="editTJczlCaseDepartmentalRepresentations">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/jczl/tJczlCaseDepartmentalRepresentations/edit/${(entity.id)!}"
                   data-title="编辑部门申述" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTJczlCaseDepartmentalRepresentations">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/jczl/tJczlCaseDepartmentalRepresentations/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/jczl/tJczlCaseDepartmentalRepresentations/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/jczl/tJczlCaseDepartmentalRepresentations/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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