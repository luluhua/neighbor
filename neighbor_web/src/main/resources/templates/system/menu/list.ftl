<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>系统管理 > 菜单管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/menu/list/1" method="post" class="form-inline">
                        <div class="box-header">
                            <@shiro.hasPermission name="addMenu">
                                <div class="input-group">
                                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加菜单"
                                       data-url="/system/menu/add"
                                       data-width="800" data-height="650"><i class="fa fa-plus"></i> 添加</a>
                                </div>
                                <div class="input-group ">
                                    <button type="button" update-batch-url="/system/menu/updateSortAll"
                                            class="btn btn-primary btn-flat">
                                        <i class="fa  fa-hand-o-up"></i> 批量修改排序
                                </div>
                            </@shiro.hasPermission>
                            <div class="input-group">
                                <select name="deep" class="form-control">
                                    <option value="">--类型--</option>
                                    <option value="1" <#if (deep)??&&deep=='1'>selected</#if>>目录</option>
                                    <option value="2" <#if (deep)??&&deep=='2'>selected</#if>>菜单</option>
                                    <option value="3" <#if (deep)??&&deep=='3'>selected</#if>>功能</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <select name="serviceType" class="form-control">
                                    <option value="">--分组--</option>
                                    <@dictTag method="getDictListByType" type="menu_service_type" >
                                        <#list getDictListByType as m>
                                            <option value="${(m.value)!}"
                                                    <#if (serviceType)??&&serviceType=='${(m.value)!}'>selected</#if> >${(m.label)!}</option>
                                        </#list>
                                    </@dictTag>
                                </select>
                            </div>
                            <div class="input-group">
                                <select name="isEnabled" class="form-control">
                                    <option value="">--是否显示--</option>
                                    <option value="1" <#if (isEnabled)??&&isEnabled=='1'>selected</#if> >是</option>
                                    <option value="0" <#if (isEnabled)??&&isEnabled=='0'>selected</#if> >否</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="菜单名称查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                <#--                                    <a href="/system/menu/list/1" class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
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
                                <th><input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar"
                                           lay-ignore>全选
                                </th>
                                <th>菜单名称</th>
                                <th>分组</th>
                                <th>是否显示</th>
                                <th>编码</th>
                                <th>访问地址</th>
                                <th>显示图标</th>
                                <th>深度</th>
                                <th>资源</th>
                                <th>排序</th>
                                <th>类型</th>
                                <th width="150px">操作</th>
                            </tr>
              <#list pageData.getRecords() as menu>
              	  <tr>
                      <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                     value="${(menu.id)!''}"
                                                     class="minimal checkbox-item"></td>
                      <td>${(menu.menuName)!}
                      <td><@dictTag method="dictValueByType" type="menu_service_type" value="${(menu.serviceType)!'1'}"> ${(dictValueByType)!}</@dictTag></td>
                      <td>
                          <@dictTag method="dictValueByType" type="is_yes_no" value="${(menu.isEnabled)!'1'}"> ${(dictValueByType)!}</@dictTag>
                      </td>
                      <td>${(menu.code)!}</td>
                      <td><#if menu.deep?? && (menu.deep==1 || menu.deep==3) >--<#else><a href="${(menu.url)!'#'}"
                                                                                          target="_blank">${(menu.url)!}</a></#if>
                      </td>
                      <td><i class="fa ${(menu.icon)!}"></i></td>
                      <td>${(menu.deep)!}</td>
                      <td>${(menu.resource)!"--"}</td>
                      <td>
                          <input type="text" class="form-control td-input-80"
                                 onblur="oncheckCode(this)" id="sort_${(menu.id)}"
                                 name="values" value="${(menu.sort)!'--'}">
                      </td>
                      <td><#if menu.deep?? && menu.deep==1 >目录<#elseif menu.deep?? && menu.deep==2 ||  menu.deep==4>
                          菜单<#else>
                          功能</#if> </td>
                      <td>
	                	 <@shiro.hasPermission name="editMenu">
	                	   <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-title="编辑菜单"
                              data-url="/system/menu/edit/${(menu.id)!}" data-width="800" data-height="650"
                              data-toggle="tooltip" title="编辑" data-placement="bottom">编辑</a>
                         </@shiro.hasPermission>
	                	<@shiro.hasPermission name="deleteMenu">
	                	<a class="btn btn-danger btn-xs" data-toggle="tooltip" title="删除" data-placement="bottom"
                           data-tiggle="ajax"
                           data-submit-url="/system/menu/delete?id=${(menu.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/system/menu/list/" urlParas="?search=${search!}&deep=${deep!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
 			<@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/menu/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&deep=${deep!}"  />
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