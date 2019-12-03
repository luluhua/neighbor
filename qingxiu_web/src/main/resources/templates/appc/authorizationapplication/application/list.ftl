<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>appc > 第三方授权应用管理</small>
        </h1>
    </section>
    <!-- Main content -->
<section class="content">
    <!-- Your Page Content Here -->
<div class="row">
<div class="col-xs-12">
    <div class="box">
        <form action="/appc/tAppAuthorizationApplication/list/1" method="post"
              class="form-inline">
            <div class="box-header">
                <@shiro.hasPermission name="addTAppAuthorizationApplication">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/appc/tAppAuthorizationApplication/add"
                       data-width="800" data-height="800"><i class="fa fa-plus"></i> 添加</a>
                </div>
            </@shiro.hasPermission>
            <div class="input-group">
                <input type="text" name="search" value="${search!}" class="form-control" placeholder="Search">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                </div>
            </div>
            <div class="input-group pull-right">
                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('第三方授权应用数据');"><i
                        class="fa fa-file-excel-o"></i> 导出
                </button>
            </div>
    </div><!-- /.box-header -->
    </form>
<div class="box-body table-responsive no-padding">
    <table class="table table-hover">
        <tr>
            <th width="100px">行号</th>
            <th>appSecret</th>
            <th>appId</th>
            <th>应用名称</th>
            <th>应用公司</th>
            <th>备注</th>
            <th>是否启用</th>
            <th>合法域名</th>
            <th>回调地址</th>
            <th>dtCreate</th>
            <th width="120px">操作</th>
        </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                    ${((pageData.current-1)*pageData.size +entity_index+1)!}
            </td>
                                                                        <td>${(entity.appSecret)!'--'}</td>
                                                                                                            <td>${(entity.appId)!'--'}</td>
                                                                                                            <td>${(entity.appName)!'--'}</td>
                                                                                                            <td>${(entity.appCompany)!'--'}</td>
                                                                                                            <td>${(entity.remark)!'--'}</td>
                                                                                                            <td>
                                                                                                               <@dictTag method="dictValueByType" type="is_yes_no" value="${(entity.isEnabled)!}"> ${(dictValueByType)!}</@dictTag>
                                                                                                            </td>
                                                                                                            <td>${(entity.legalDomainName)!'--'}</td>
                                                                                                            <td>${(entity.callbackUrl)!'--'}</td>
                                                                                                            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
                                                            <td>
                <@shiro.hasPermission name="editTAppAuthorizationApplication">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/appc/tAppAuthorizationApplication/edit/${(entity.id)!}"
                   data-title="编辑第三方授权应用" data-width="850" data-height="800">编辑</a>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTAppAuthorizationApplication">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tAppAuthorizationApplication/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tAppAuthorizationApplication/list/" urlParas="?search=${search!}"  />
        </div>
        <div class="col-md-6 pull-left">
            <#include "../../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppAuthorizationApplication/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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