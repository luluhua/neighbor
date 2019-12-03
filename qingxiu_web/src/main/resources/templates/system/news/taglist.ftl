<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>系统管理 > 内容管理 > 文章标签列表</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/cms/tCmsTag/list/1" method="post" class="form-inline">
                        <div class="box-header">
                        <@shiro.hasPermission name="addTCmsTag">
                            <div class="input-group">
                                <a class="btn btn-primary dialog" href="javascript:;" data-title="创建文章标签"
                                   data-url="/cms/tCmsTag/add"
                                   data-width="800" data-height="650"><i class="fa fa-plus"></i> 创建文章标签</a>
                            </div>
                        </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="Search">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <a href="/cms/tCmsTag/list/1" class="btn btn-default"><i
                                            class="fa fa-refresh"></i></a>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('菜单数据');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th width="100px">行号</th>
                                <th>名称</th>
                                <th>使用次数</th>
                                <th width="150px">操作</th>
                            </tr>
              <#list pageData.getRecords() as taglist>
              	  <tr>
                      <td>
                          <label>
                              ${((pageData.current-1)*pageData.size +taglist_index+1)!}
                          </label>
                      </td>
                      <td>${(taglist.tagName)!}</td>
                      <td>${(taglist.tagCount)!}</td>
                      <td>
                      <@shiro.hasPermission name="editTCmsTag">
                          <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-title="编辑"
                             data-url="/cms/tCmsTag/edit/${(taglist.id)!}" data-width="800" data-height="650"
                             data-toggle="tooltip" title="编辑" data-placement="bottom">编辑</a>
                      </@shiro.hasPermission>
                      <@shiro.hasPermission name="deleteTCmsTag">
                          <a class="btn btn-danger btn-xs" data-toggle="tooltip" title="删除" data-placement="bottom"
                             data-tiggle="ajax"
                             data-submit-url="/cms/tCmsTag/delete?id=${(taglist.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/cms/tCmsTag/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
 			<@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/cms/tCmsTag/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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