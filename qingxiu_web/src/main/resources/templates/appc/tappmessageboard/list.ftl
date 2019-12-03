<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>app > 用户留言板管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/eessage/tAppMessageBoard/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTAppMessageBoard">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建用户留言板"
                       data-url="/h5/tAppMessageBoard/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建用户留言板</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="title" value="${search!}" class="form-control"
                                       placeholder="标题查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>

                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>

                                <th>标题</th>
                                <th>提问用户</th>
                                <th>提问时间</th>
                                <th>回复状态</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>

            <td>${(entity.title)!'--'}</td>
            <td>${(entity.username)!'--'}</td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
            <td style="color: <#if (entity.recoveryContent)??>#0593E4<#else >#DE1141</#if>"><#if (entity.recoveryContent)??>
                已回复<#else >未回复</#if></td>
            <td>
                <@shiro.hasPermission name="editTAppMessageBoard">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/eessage/tAppMessageBoard/edit/${(entity.id)!}"
                   data-title="查看/回复" data-width="850" data-height="550">查看/回复</a>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTAppMessageBoard">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/h5/tAppMessageBoard/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/eessage/tAppMessageBoard/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/eessage/tAppMessageBoard/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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