<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>

            <small>
                系统管理 ><a href="/system/sysCity/list/1">省份列表</a> >
                <a href="/system/sysCity/arealist/1?pid=#{(area.pid)!}"> [${(province.name)}][${(city.name)}][${(area.name)}]</a> >
                街道办列表
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/sysCity/streetlist/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addSysCity">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/system/sysCity/add?pid=#{(area.id)}"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 添加</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="街道办名称">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>名称</th>
                                <th>编码</th>
                                <th>启用</th>
                                <th>排序</th>
                                <th >操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>

            <td><a href="/system/sysCity/roadlist/1?pid=#{(entity.id)!}">${(entity.name)!'--'}</a></td>
            <td>${(entity.code)!'--'}</td>
            <td><#if entity.enabled=1>启用<#else>停用</#if></td>
            <td>${(entity.sortIndex)!'--'}</td>
            <td>
                <a class="btn btn-primary btn-xs " href="/tSysOrg/dept/list/1?cityId=#{(entity.id)}">下属部门</a>
                <@shiro.hasPermission name="editSysCity">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/system/sysCity/edit/#{(entity.id)!}"
                   data-title="编辑" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteSysCity">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/system/sysCity/delete?id=#{(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/system/sysCity/streetlist/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/sysCity/streetlist/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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