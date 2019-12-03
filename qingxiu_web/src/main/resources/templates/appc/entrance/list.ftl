<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>APP管理 > 办事入口</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tProjectEntrance/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTProjectEntrance">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建办事入口"
                       data-url="/appc/tProjectEntrance/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建办事入口</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="Search">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <a href="/appc/tProjectEntrance/list/1"
                                       class="btn btn-default"><i class="fa fa-refresh"></i></a>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('办事入口数据');">
                                    <i
                                            class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th width="100px">
                                    行号
                                </th>
                                <th>分类id</th>
                                <th>部门id</th>
                                <th>主题id</th>
                                <th>名称</th>
                                <th>图标</th>
                                <th>跳转地址</th>
                                <th>排序</th>
                                <th>创建日期</th>
                                <th>是否删除</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                ${((pageData.current-1)*pageData.size +entity_index+1)!}
            </td>
            <td>${(entity.apuId)!'--'}</td>
            <td>${(entity.deptId)!'--'}</td>
            <td>${(entity.themeId)!'--'}</td>
            <td>${(entity.entranceName)!'--'}</td>
            <td>${(entity.entranceIcon)!'--'}</td>
            <td>${(entity.entranceUrl)!'--'}</td>
            <td>${(entity.sortIndex)!'--'}</td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
            <td>${(entity.isDeleted)!'--'}</td>
            <td>
                <@shiro.hasPermission name="editTProjectEntrance">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tProjectEntrance/edit/${(entity.id)!}"
                   data-title="编辑办事入口" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTProjectEntrance">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tProjectEntrance/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tProjectEntrance/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tProjectEntrance/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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