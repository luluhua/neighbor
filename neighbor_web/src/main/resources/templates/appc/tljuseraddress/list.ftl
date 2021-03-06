<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>appc > 用户地址信息表管理</small>
        </h1>
    </section>
    <!-- Main content -->
<section class="content">
    <!-- Your Page Content Here -->
<div class="row">
<div class="col-xs-12">
    <div class="box">
        <form action="/appc/tLjUserAddress/list/1" method="post"
              class="form-inline">
            <div class="box-header">
                <@shiro.hasPermission name="addTLjUserAddress">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建用户地址信息表"
                       data-url="/appc/tLjUserAddress/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建用户地址信息表</a>
                </div>
            </@shiro.hasPermission>
            <div class="input-group">
                <input type="text" name="search" value="${search!}" class="form-control" placeholder="Search">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                    <a href="/appc/tLjUserAddress/list/1"
                       class="btn btn-default"><i class="fa fa-refresh"></i></a>
                </div>
            </div>
            <div class="input-group pull-right">
                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('用户地址信息表数据');"><i
                        class="fa fa-file-excel-o"></i> 导出
                </button>
            </div>
    </div><!-- /.box-header -->
    </form>
<div class="box-body table-responsive no-padding">
    <table class="table table-hover">
        <tr>
            <th width="100px">
                行号</th>
                                                                        <th>用户Id</th>
                                                                                                            <th>省份</th>
                                                                                                            <th>城市</th>
                                                                                                            <th>区域</th>
                                                                                                            <th>详细地址</th>
                                                                                                            <th>是否删除 0:默认</th>
                                                                                                            <th>创建时间</th>
                                                                                                            <th>是否删除 1:已删除 0：未删除</th>
                                                            <th width="120px">操作</th>
        </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                    ${((pageData.current-1)*pageData.size +entity_index+1)!}
            </td>
                                                                        <td>${(entity.userId)!'--'}</td>
                                                                                                            <td>${(entity.province)!'--'}</td>
                                                                                                            <td>${(entity.city)!'--'}</td>
                                                                                                            <td>${(entity.region)!'--'}</td>
                                                                                                            <td>${(entity.detailedAddress)!'--'}</td>
                                                                                                            <td>${(entity.state)!'--'}</td>
                                                                                                            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
                                                                                                            <td>${(entity.isDeleted)!'--'}</td>
                                                            <td>
                <@shiro.hasPermission name="editTLjUserAddress">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/appc/tLjUserAddress/edit/${(entity.id)!}"
                   data-title="编辑用户地址信息表" data-width="850" data-height="550">编辑</a>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTLjUserAddress">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tLjUserAddress/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tLjUserAddress/list/" urlParas="?search=${search!}"  />
        </div>
        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tLjUserAddress/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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