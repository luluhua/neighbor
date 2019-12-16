<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>平台用户管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tLjUser/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTLjUser">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建平台用户表"
                       data-url="/appc/tLjUser/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建平台用户表</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="用户名、手机号码搜索">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('平台用户数据');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>用户名</th>
                                <th>手机号码</th>
                                <th>状态</th>
                                <th>创建时间</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                  <@commonTags method="getDecrypt3DEs" type="1" value="${(entity.username)!}">${(getDecrypt3DEs)!}</@commonTags>
            </td>
            <td>
                 <@commonTags method="getDecrypt3DEs" type="1" value="${(entity.mobile)!}">${(getDecrypt3DEs)!}</@commonTags>
            </td>
            <td>
                <#if entity.status==0>
                    正在使用中
                <#else >
                禁用
                </#if>
            </td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd hh:mm:ss'))!'--'}</td>
            <td>
                <@shiro.hasPermission name="editTLjUser">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tLjUser/edit/${(entity.id)!}"
                   data-title="详情" data-width="1200" data-height="800">详情</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTLjUser">
            <a class="btn btn-danger btn-xs"
               data-submit-url="/appc/tLjUser/operationUser?id=${(entity.id)!}">
                <#if entity.status==0>
                    禁用
                <#else >
                    启用
                </#if>
            </a>
            </@shiro.hasPermission>
            </td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tLjUser/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tLjUser/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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