<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>APP管理 > 企业用户信息</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tCompanyInfo/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       style="width: 300px;"
                                       placeholder="法人姓名、公司名称、联系人、联系方式">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>姓名</th>
                                <th>单位名称</th>
                                <th>单位地址</th>
                                <th>联系电话</th>
                                <th width="100px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.corporationsName)!}</td>
            <td>${(entity.companyName)!}</td>
            <td>${(entity.companyProvince)} ${(entity.companyCity)} ${(entity.companyArea)} ${(entity.companyAddress)}</td>
            <td>${(entity.contactPhone)!}</td>
            <td><@shiro.hasPermission name="detailTCompanyInfo">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tCompanyInfo/detail/${(entity.id)!}"
                   data-title="企业用户信息详情" data-width="1050" data-height="650">详情</a>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTCompanyInfo">
                <a class="btn btn-danger btn-xs"
                   data-tiggle="ajax"
                   data-submit-url="/appc/tCompanyInfo/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tCompanyInfo/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tCompanyInfo/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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