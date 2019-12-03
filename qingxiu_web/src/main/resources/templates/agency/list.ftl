<#include "../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>手上青秀 > 中介公司信息</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/tGovAgency/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <div class="input-group">
                                    <a class="btn btn-primary dialog" href="javascript:;" data-title="中介公司信息添加"
                                       data-url="/tGovAgency/add"
                                       data-width="1000" data-height="600"><i class="fa fa-plus"></i> 添加</a>
                                </div>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       style="width: 300px;"
                                       placeholder="公司名称、地址、电话、备注">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>公司名称</th>
                                <th>联系电话</th>
                                <th>公司地址</th>
                                <th>是否可用</th>
                                <th>备注</th>
                                <th>操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.name)!}</td>
            <td>${(entity.mobile)!}</td>
            <td>${(entity.address)!}</td>
            <td>
                <@dictTag method="getDictListByType" type="is_enabled" >
                    <#list getDictListByType as m>
                        <#if "${(m.value)!}"=="${(entity.isEnabled)!}">${(m.label)}</#if>
                    </#list>
                </@dictTag>
            </td>
            <td>${(entity.remark)!}</td>
            <td><a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/tGovAgency/edit/${(entity.id)!}"
                   data-title="中介公司信息编辑" data-width="700" data-height="450">编辑</a>
                <a class="btn btn-danger btn-xs"
                   data-tiggle="ajax"
                   data-submit-url="/tGovAgency/delete?id=${(entity.id)!}"
                   data-confirm="您确定要删除该条记录吗?">删除</a>
            </td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/tGovAgency/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/tGovAgency/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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