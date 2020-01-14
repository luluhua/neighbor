<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small><a href="/appc/tLjUser/list/1">用户列表</a> > 物品信息表管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/commodity/tGoods/list/1?userId=${(userId)!}" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="关键字搜索">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>物品名称</th>
                                <th>数量</th>
                                <th>规格</th>
                                <th>价格</th>
                                <th>价格类型</th>
                                <th>发布时间</th>
                                <th>是否删除</th>
                                <th>状态</th>
                            <#--<th width="120px">操作</th>-->
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.name)!'--'}</td>
            <td>${(entity.quantity)!'--'}</td>
            <td>${(entity.specification)!'--'}</td>
            <td>${(entity.price)!'--'}</td>
            <td>
                <#if entity.priceType==0>
                    单价
                <#else >
                    总价
                </#if>
            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
            <td>
                 <#if entity.isDeleted==0>
                     未删除
                 <#else >
                    已删除
                 </#if>
            </td>
            <td>
                 <#if entity.status==0>
                     上架中
                 <#else >
                    已已下架
                 </#if>
            </td>
            <td>
                <@shiro.hasPermission name="editTGoods">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/commodity/tGoods/edit/${(entity.id)!}"
                   data-title="查看" data-width="850" data-height="550">查看</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTGoods">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/commodity/tGoods/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/commodity/tGoods/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/commodity/tGoods/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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