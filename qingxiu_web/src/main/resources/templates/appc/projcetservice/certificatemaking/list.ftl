<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>审批大厅 > 待制证</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovProjectService/certificateMakingList/1" method="post"
                          class="form-inline">
                        <div class="box-header">

                            <div class="input-group">
                                <button type="button" delete-batch-url="/appc/tGovProjectService/deleteAll"
                                        class="btn btn-danger btn-flat">
                                    <i class="fa fa-remove"></i> 批量删除
                                </button>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="事项名称">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>

                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th class="td-width-50" style="white-space: nowrap"><input type="checkbox"
                                                                                           lay-filter="allCheck"
                                                                                           value="root"
                                                                                           class="minimal  checkbox-toolbar"
                                                                                           lay-ignore>全选
                                </th>
                                <th class="td-width-650">制证事项</th>
                                <th class="td-width-100">用户名</th>
                                <th class="td-width-100">用户电话</th>
                                <th class="td-width-150">提交日期</th>
                                <th class="td-width-150">操作</th>
                            </tr>
        <#list pageData.getRecords() as entity>
        <tr>
            <td class="td_checkbox">
                <input type="checkbox" lay-filter="campus" name="ids"
                       value="${(entity.id?c)!}"
                       class="minimal checkbox-item">
            </td>
            <td>
                ${(entity.projectTitle)!}
            </td>
            <td>
                ${(entity.appUserName)!}
            </td>
            <td>
                <@commonTags method="getDecrypt3DEs" type="1" value="${(entity.appUserMobile)!}">${(getDecrypt3DEs)!}</@commonTags>
            </td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td>
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tGovProjectService/toCertificateMaking?id=${(entity.id?c)!}"
                   data-title="制证" data-width="850" data-height="550"
                >制证</a>

            </td>
        </tr>
        </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovProjectService/certificateMakingList/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovProjectService/certificateMakingList/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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