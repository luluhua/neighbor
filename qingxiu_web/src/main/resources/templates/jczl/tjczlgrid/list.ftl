<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>基层治理 > 网格管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/jczl/tJczlGrid/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTJczlGrid">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/jczl/tJczlGrid/add"
                       data-width="1000" data-height="600"><i class="fa fa-plus"></i> 添加</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="Search">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                <#--<a href="/jczl/tJczlGrid/list/1"-->
                                <#--class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>
                        <#--<div class="input-group pull-right">-->
                        <#--<button type="button" class="btn btn-primary btn-flat" onclick="exportTo('网格数据');"><i-->
                        <#--class="fa fa-file-excel-o"></i> 导出-->
                        <#--</button>-->
                        <#--</div>-->
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>网格名称</th>
                                <th>网格编号</th>
                                <th>网格地址</th>
                            <#--<th>网格坐标</th>-->
                                <th>备注</th>
                                <th>是否删除</th>
                                <th>创建时间</th>
                                <th>是否启用</th>
                                <th>网格管理人</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.gName)!'--'}</td>
            <td>${(entity.gCode)!'--'}</td>
            <td>${(entity.gAddress)!'--'}</td>
            <td>${(entity.gRemark)!'--'}</td>
            <td>${(entity.isDeleted)!'--'}</td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
            <td><#if entity.gStatus==0>停用<#elseif entity.gStatus==1>启用</#if></td>
            <td>${(entity.gManagePerson)!'--'}</td>
            <td>
                <@shiro.hasPermission name="editTJczlGrid">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/jczl/tJczlGrid/edit/${(entity.id)!}"
                   data-title="编辑网格" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTJczlGrid">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/jczl/tJczlGrid/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/jczl/tJczlGrid/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/jczl/tJczlGrid/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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