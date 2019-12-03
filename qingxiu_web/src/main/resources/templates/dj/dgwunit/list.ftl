<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>成员单位管理 > 成员单位列表</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/dj/tDjDgwUnit/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                        <@shiro.hasPermission name="addTDjDgwUnit">
                            <div class="input-group">
                                <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                                   data-url="/dj/tDjDgwUnit/add"
                                   data-width="800" data-height="400"><i class="fa fa-plus"></i> 添加</a>
                            </div>
                        </@shiro.hasPermission>
                            <div class="input-group ">
                                <button type="button" update-batch-url="/dj/tDjDgwUnit/updateSortAll" class="btn btn-primary btn-flat">
                                    <i class="fa  fa-hand-o-up"></i> 批量修改排序
                                </button>
                            </div>
                            <div class="input-group" style="width: 15%">
                                <select name="dgwId" class="form-control select2" lay-ignore style="width: 100%;">
                                    <option value="">--选择大工委/大党委--</option>
                                    <#list dgwList as dgw>
                                        <option value="${(dgw.id)!}"
                                        <#if "${(dgw.id)!}"=="${(dgwId)!}">selected</#if>><#if "${(dgw.pid)!}"!="0">${(dgw.pname)!} > </#if>${(dgw.name)!}</option>
                                    </#list>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="输入名称">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <a href="/dj/tDjDgwUnit/list/1"
                                       class="btn btn-default"><i class="fa fa-refresh"></i></a>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat"
                                        onclick="exportTo('党建-成员单位数据');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th width="100px">
                                    <input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar"
                                           lay-ignore>全选
                                </th>
                                <th>名称</th>
                                <th>归属</th>
                                <th>运行制度</th>
                                <th>排序</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                <input type="checkbox" lay-filter="campus" name="ids"
                       value="${(entity.id)!''}" class="minimal checkbox-item">
            </td>
            <td>${(entity.name)!'--'}</td>
            <td>${(entity.pname)!'--'}</td>
            <td><a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/dj/tDjDgwUnit/detail/${(entity.id)!}"
                   data-title="运行制度" data-width="850" data-height="550">查看</a></td>
            <td><input type="text" class="form-control td-input-80"
                       onblur="oncheckCode(this)" id="sort_${(entity.id)}"
                       name="values" value="${(entity.sort)!'--'}"></td>
            <td>
                <@shiro.hasPermission name="editTDjDgwUnit">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/dj/tDjDgwUnit/edit/${(entity.id)!}"
                   data-title="编辑成员单位" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTDjDgwUnit">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/dj/tDjDgwUnit/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/dj/tDjDgwUnit/list/" urlParas="?search=${search!}&dgwId=${dgwId!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/dj/tDjDgwUnit/list/" urlParas="?search=${search!}&dgwId=${dgwId!}&pageSize=${pageSize!}"  />
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