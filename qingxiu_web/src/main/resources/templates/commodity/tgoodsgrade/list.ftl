<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>物品信息 > 物品评分表管理</small>
        </h1>
    </section>
    <!-- Main content -->
<section class="content">
    <!-- Your Page Content Here -->
<div class="row">
<div class="col-xs-12">
    <div class="box">
        <form action="/commodity/tGoodsGrade/list/1" method="post"
              class="form-inline">
            <div class="box-header">
                <@shiro.hasPermission name="addTGoodsGrade">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建物品评分表"
                       data-url="/commodity/tGoodsGrade/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建物品评分表</a>
                </div>
            </@shiro.hasPermission>
            <div class="input-group">
                <input type="text" name="search" value="${search!}" class="form-control" placeholder="Search">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                    <a href="/commodity/tGoodsGrade/list/1"
                       class="btn btn-default"><i class="fa fa-refresh"></i></a>
                </div>
            </div>
            <div class="input-group pull-right">
                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('物品评分表数据');"><i
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
                                                                        <th>goodsId</th>
                                                                                                            <th>userId</th>
                                                                                                            <th>gradeUserId</th>
                                                                                                            <th>0 不匿名 1匿名</th>
                                                                                                            <th>explain</th>
                                                                                                            <th>sortIndex</th>
                                                                                                            <th>创建时间</th>
                                                                                                            <th>是否删除 1:已删除 0：未删除</th>
                                                            <th width="120px">操作</th>
        </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                    ${((pageData.current-1)*pageData.size +entity_index+1)!}
            </td>
                                                                        <td>${(entity.goodsId)!'--'}</td>
                                                                                                            <td>${(entity.userId)!'--'}</td>
                                                                                                            <td>${(entity.gradeUserId)!'--'}</td>
                                                                                                            <td>${(entity.gradeType)!'--'}</td>
                                                                                                            <td>${(entity.explain)!'--'}</td>
                                                                                                            <td>${(entity.sortIndex)!'--'}</td>
                                                                                                            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
                                                                                                            <td>${(entity.isDeleted)!'--'}</td>
                                                            <td>
                <@shiro.hasPermission name="editTGoodsGrade">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/commodity/tGoodsGrade/edit/${(entity.id)!}"
                   data-title="编辑物品评分表" data-width="850" data-height="550">编辑</a>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTGoodsGrade">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/commodity/tGoodsGrade/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/commodity/tGoodsGrade/list/" urlParas="?search=${search!}"  />
        </div>
        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/commodity/tGoodsGrade/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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