<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>app管理 > 用户地址管理</small>
        </h1>
    </section>
    <!-- Main content -->
<section class="content">
    <!-- Your Page Content Here -->
<div class="row">
<div class="col-xs-12">
    <div class="box">
        <form action="/appc/appUserAddress/list/1" method="post"
              class="form-inline">
            <div class="box-header">
                <@shiro.hasPermission name="addTAppUserAddress">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建"
                       data-url="/appc/appUserAddress/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建</a>
                </div>
            </@shiro.hasPermission>
            <div class="input-group">
                <input type="text" name="search" value="${search!}" class="form-control" placeholder="请输入地址名称或详细地址查询">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                </div>
            </div>


    </div><!-- /.box-header -->
    </form>
<div class="box-body table-responsive no-padding">
    <table class="table table-hover">
        <tr>
            <th>地址名称</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>行政区域</th>
            <th>详细地址</th>
            <th>是否默认</th>
            <th>创建日期</th>
            <th>最后修改时间</th>
            <th>操作</th>
        </tr>
        <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.addressName)!'--'}</td>
            <td>${(entity.contactName)!'--'}</td>
            <td>${(entity.contactPhone)!'--'}</td>
            <td>
                <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/appc/appUserAddress/show_area/${(entity.id)!}"
                   data-title="查看行政地区" data-width="850" data-height="550">查看行政地区</a>
            </td>
            <td>${(entity.addressDetail)!'--'}</td>
            <td>${(entity.isDefault)!'--'}</td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
            <td>${(entity.updateTime?string('yyyy-MM-dd'))!'--'}</td>
            <td>
                <@shiro.hasPermission name="editTAppUserAddress">
                    <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/appc/appUserAddress/edit/${(entity.id)!}"
                       data-title="编辑" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>

                <@shiro.hasPermission name="defaultTAppUserAddress">
                     <a class="btn btn-danger btn-xs" data-toggle="tooltip" title="设为默认"
                        data-placement="bottom"
                        data-tiggle="ajax"
                        style="display: <#if entity.isDefault==0><#else>none</#if>"
                        data-submit-url="/appc/appUserAddress/default/${(entity.id)!}"
                        data-confirm="您确定讲此条设置成默认吗?">设为默认</a>
                </@shiro.hasPermission>

                <@shiro.hasPermission name="deleteTAppUserAddress">
                    <a class="btn btn-danger btn-xs"
                    data-tiggle="ajax"
                    data-submit-url="/appc/appUserAddress/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/appUserAddress/list/" urlParas="?search=${search!}"  />
        </div>
        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/appUserAddress/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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