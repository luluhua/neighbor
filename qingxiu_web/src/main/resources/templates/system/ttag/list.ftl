<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>导航管理 > 标签管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/tTag/list/${navigationId!}" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTTag">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加标签"
                       data-url="/system/tTag/add/${navigationId!}?pid=${pid!}"
                       data-width="1200" data-height="800"><i class="fa fa-plus"></i> 添加标签</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="名称搜索">
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
                                <th>code</th>
                                <th>图标</th>
                                <th>跳转URL</th>
                                <th>跳转类型</th>
                                <th>排序</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
             <tr>
                 <td>
                     <a href="/system/tTag/list/${navigationId!}?pid=${entity.id!}">
                         ${(entity.name)!'--'}
                     </a>
                 </td>
                 <td>${(entity.code)!'--'}</td>
                 <td>
                     <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.icon)!'--'}"
                          onerror="this.src='../../../images/default.png'" style="width: 30px;height: 30px"">
                 </td>
                 <td>${(entity.skipUrl)!'--'}</td>
                 <td>
                     <#if entity.skipType==0>直接打开<#elseif entity.skipType==1>新页面打开 <#else >弹出层</#if>
                 </td>
                 <td>${(entity.sortIndex)!'--'}</td>
                 <td>
                <@shiro.hasPermission name="editTTag">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/system/tTag/edit/${(entity.id)!}"
                   data-title="编辑标签表" data-width="1200" data-height="800">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTTag">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/system/tTag/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/system/tTag/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/tTag/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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