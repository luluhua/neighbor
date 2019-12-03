<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small><a href="/activity/tActivityEnroll/list/1" style="color: #0C70C4">活动报名管理</a> > 活动投票记录管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tActActivityVote/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="作品名称查询">
                                <div class="input-group-btn">
                                    <select id="workgroup" class="form-control input-select-200" name="workgroup">
                                        <option value="">--请选择--</option>
                                        <option value="A组（小学组）" <#if workgroup??&&workgroup=='A组（小学组）'>selected</#if>>
                                            小学组
                                        </option>
                                        <option value="B组（中学组）" <#if workgroup??&&workgroup=='B组（中学组）'>selected</#if>>
                                            初中组
                                        </option>
                                    </select>
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('活动投票记录数据');">
                                    <i class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>排行</th>
                                <th>作品名称</th>
                                <th>分组</th>
                                <th>票数</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                ${(entity_index+1)!}
            </td>
            <td>${(entity.workName)!'--'}</td>
            <td>${(entity.workGroup)!'--'}</td>
            <td>${(entity.sum)!'--'}</td>
            <td>
                <@shiro.hasPermission name="editTActActivityVote">
                <a class="btn btn-primary btn-xs" href="/appc/tActActivityVote/votelist/1?id=${(entity.id)!}">查看详情</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTActActivityVote">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tActActivityVote/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tActActivityVote/list/" urlParas="?search=${search!}&workgroup=${(workgroup)!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tActActivityVote/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&workgroup=${(workgroup)!}"  />
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