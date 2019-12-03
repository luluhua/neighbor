<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>用户分享 > 列表</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tAppUserShareChannel/channelUserList/1" method="post"
                          class="form-inline">
                        <div class="box-header">

                            <div class="input-group ">
                                <a style="display: block;padding: 6px 12px;font-size: 14px;" class="btn btn-primary btn-xs" href="/appc/tAppUserShareChannel/bindAppUser?id=${(entity.id)!}" >
                                    绑定用户</a>
                            </div>
                            <div class="input-group ">
                                <button type="button" untying-batch-url="/appc/tAppUserShareChannel/deleteBindAll" class="btn btn-danger btn-flat">
                                    <i class="fa fa-remove"></i> 解除绑定
                            </div>
                            <#--<div class="input-group">-->
                                <#--<input type="text" name="search" value="${search!}" class="form-control"-->
                                       <#--placeholder="分享码、用户GID查询">  </div>-->
                            <#--<div class="form-group">-->
                                <#--<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>-->
                            <#--</div>-->
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="window.location.href='/appc/tAppUserShareChannel/list/1?id=${(pid)!}'" style="margin-right: 10px;"><i
                                        class="fa"></i> 返回上页
                                </button>
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('分享数据');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th ><input type="checkbox"lay-filter="allCheck"  value="root" class="minimal  checkbox-toolbar"
                                            lay-ignore  >全选
                                </th>
                                <th>用户[gid]</th>
                                <th>用户分享碼</th>
                                <#--<th>浏览数</th>-->
                                <#--<th>下载数</th>-->
                                <#--<th>激活数</th>-->
                            </tr>
                <#list pageData.getRecords() as entity2>
        <tr>
            <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids" value="${(entity2.id)!}"
                                           class="minimal checkbox-item"></td>
            <td>${(entity2.gid)!'--'}</td>
            <td>${(entity2.shareCode)!'--'}</td>
            <#--<td>${(entity2.browseNum)!'--'}</td>-->
            <#--<td>${(entity2.dowloadNum)!'--'}</td>-->
            <#--<td>${(entity2.activationNum)!'--'}</td>-->
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tAppUserShareChannel/channelUserList/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppUserShareChannel/channelUserList/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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