<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>系统管理  > [${(dept.name)!}]部门-办公地点</small>
        </h1>
    </section>
    <!-- Main content -->
<section class="content">
    <!-- Your Page Content Here -->
<div class="row">
<div class="col-xs-12">
    <div class="box">
        <form action="/system/tSysOrgAddress/list/1?deptId=#{(dept.id)}" method="post"
              class="form-inline">
            <div class="box-header">
                <div class="input-group">
                    <a class="btn " href="javascript:history.back(-1);" ><i class="fa fa-backward"></i> 返回</a>
                </div>
                <@shiro.hasPermission name="addTSysOrgAddress">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加办公地址"
                       data-url="/system/tSysOrgAddress/add?deptId=#{(dept.id)}"
                       data-width="800" data-height="800"><i class="fa fa-plus"></i> 添加</a>
                </div>
            </@shiro.hasPermission>
            <div class="input-group">
                <input type="text" name="search" value="${search!}" class="form-control" placeholder="地址名称查询">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                </div>
            </div>
<#--            <div class="input-group pull-right">-->
<#--                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('组织机构办公地点表数据');"><i-->
<#--                        class="fa fa-file-excel-o"></i> 导出-->
<#--                </button>-->
<#--            </div>-->
    </div><!-- /.box-header -->
    </form>
<div class="box-body table-responsive no-padding">
    <table class="table table-hover">
        <tr>

            <th ><input type="checkbox"lay-filter="allCheck"  value="root" class="minimal  checkbox-toolbar"
                        lay-ignore  >全选</th>
                <th class="table-nowrap ">办公地址</th>
                <th class="table-nowrap ">联系电话</th>
                <th class="table-nowrap ">办公时间</th>
                <th class="table-nowrap ">办理窗口</th>
                <th class="table-nowrap ">公交路线</th>
                <th class="table-nowrap ">启用</th>
                <th class="table-nowrap ">操作</th>
        </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids" value="${((entity.id)?c)!}"
                                           class="minimal checkbox-item"></td>
            <td >${(entity.address)!'--'}</td>
             <td class="table-nowrap ">${(entity.mobile)!'--'}</td>
            <td >${(entity.officeHours)!'--'}</td>
            <td >${(entity.officeWindow)!'--'}</td>
            <td >${(entity.busRoute)!'--'}</td>
            <td class="table-nowrap ">
                <#if entity.isEnabled=1>启用<#else>停用</#if>
            </td>
            <td class="table-nowrap ">
                <@shiro.hasPermission name="editTSysOrgAddress">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/system/tSysOrgAddress/edit/${(entity.id)!}?deptId=#{(dept.id)}"
                   data-title="编辑" data-width="850" data-height="800">编辑</a>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTSysOrgAddress">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/system/tSysOrgAddress/delete?id=${(entity.id)!}"
               data-confirm="您确定要删除该条记录吗?">删除</a>
        </@shiro.hasPermission>
        </td>
        </tr>
                </#list>
    </table>
</div><!-- /.box-body -->
    <div class="box-footer row">
        <div class="col-md-6">
            <#include "../../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/system/tSysOrgAddress/list/" urlParas="?search=${search!}&deptId=#{(dept.id)}"  />
        </div>
        <div class="col-md-6 pull-left">
            <#include "../../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/tSysOrgAddress/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&deptId=#{(dept.id)}"  />
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