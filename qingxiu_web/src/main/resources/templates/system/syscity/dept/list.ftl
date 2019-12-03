<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>系统管理 ><a href="/system/sysCity/citylist/1"> 行政区域列表</a> ${(city.name)!}</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/system/sysCity/cityOrg/1?cityId=${(city.id)!}" method="post" class="form-inline">
                            <div class="box-header">
                                <@shiro.hasPermission name="addDept">
                                    <div class="input-group">
                                        <a class="btn btn-primary dialog" href="javascript:;" data-title="添加部门"
                                           data-url="/tSysOrg/dept/add?cityId=${(city.id)!}" data-width="800" data-height="800"><i
                                                    class="fa fa-plus"></i> 添加</a>
                                    </div>
                                </@shiro.hasPermission>
                                <div class="input-group " >
                                    <button type="button" update-batch-url="/tSysOrg/dept/updateSortAll"
                                            class="btn btn-primary btn-flat">
                                        <i
                                                class="fa  fa-hand-o-up"></i> 批量修改排序
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="部门名称">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="input-group pull-right">
                                    <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('部门数据');">
                                        <i class="fa fa-file-excel-o"></i> 导出
                                    </button>
                                </div>
                            </div><!-- /.box-header -->
                        </form>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th ><input type="checkbox"lay-filter="allCheck"  value="root" class="minimal  checkbox-toolbar"
                                                lay-ignore  >全选</th>
                                    <th>部门名称</th>
                                    <th>部门编号</th>
                                    <th>部门电话</th>
                                    <th>部门地址</th>
                                    <th>部门图标</th>
                                    <th>排序</th>
                                    <th width="120px">操作</th>
                                </tr>
                                <#list pageData.getRecords() as dept>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids" value="${((dept.id)?c)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>${(dept.name)!}</td>
                                        <td>${(dept.code)!'--'}</td>
                                        <td>${(dept.telPhone)!'--'}</td>
                                        <td>${(dept.address)!'--'}</td>
                                        <td>
                                            <#if (dept.logoUrl)??>
                                                <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(dept.logoUrl)!''}" width="40px" height="40px"/>
                                            <#else >
                                                <img src="../../../../images/default.png" width="40px"  height="40px"/>
                                            </#if>
                                           </td>
                                        <td>
                                            <input type="text" class="form-control td-input-80"
                                                   onblur="oncheckCode(this)"  id="sort_${(dept.id)}"
                                                   name="values" value="${(dept.sortIndex)!'--'}">
                                        </td>
                                        <td>
                                            <@shiro.hasPermission name="editDept">
                                                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                                   data-title="编辑部门" data-url="/tSysOrg/dept/edit/${(dept.id)!}?cityId=${(city.id)!}"
                                                   ,data-width="800" data-height="800"> <i
                                                            class="fa fa-pencil-square-o"></i> 编辑</a>
                                            </@shiro.hasPermission>
                                            <@shiro.hasPermission name="deleteDept">
                                                <a class="btn btn-danger btn-xs"
                                                   data-tiggle="ajax"
                                                   data-submit-url="/tSysOrg/dept/delete?id=${(dept.id)!}"
                                                   data-confirm="您确定要删除该条记录吗?"><i class="fa fa-times"></i> 删除</a>
                                            </@shiro.hasPermission>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/system/sysCity/cityOrg/" urlParas="?search=${search!}&cityId=${(city.id)!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/sysCity/cityOrg/" urlParas="?search=${search!}&pageSize=${pageSize!}&cityId=${(city.id)!}"  />
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