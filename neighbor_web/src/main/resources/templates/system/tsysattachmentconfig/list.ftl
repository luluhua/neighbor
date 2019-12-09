<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>附件管理 > 附件上传配置管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/tSysAttachmentConfig/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTSysAttachmentConfig">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/system/tSysAttachmentConfig/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 添加</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="分类搜索">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                <#--<a href="/system/tSysAttachmentConfig/list/1"-->
                                <#--class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>
                        <#--<div class="input-group pull-right">-->
                        <#--<button type="button" class="btn btn-primary btn-flat" onclick="exportTo('附件上传配置数据');">-->
                        <#--<i-->
                        <#--class="fa fa-file-excel-o"></i> 导出-->
                        <#--</button>-->
                        <#--</div>-->
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>附件分类</th>
                                <th>可上传的附件类型</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>

            <td>${(entity.classify)!'--'}</td>
            <td>${(entity.classifyType)!'--'}</td>
            <td>
                <@shiro.hasPermission name="editTSysAttachmentConfig">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/system/tSysAttachmentConfig/edit/${(entity.id)!}"
                   data-title="编辑附件上传配置" data-width="850" data-height="550">编辑</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTSysAttachmentConfig">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/system/tSysAttachmentConfig/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/system/tSysAttachmentConfig/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/tSysAttachmentConfig/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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