<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>消息管理 > 意见反馈</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tAppFeedback/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                        <#--<@shiro.hasPermission name="addTAppFeedback">-->
                            <#--<div class="input-group">-->
                                <#--<a class="btn btn-primary dialog" href="javascript:;" data-title="添加"-->
                                   <#--data-url="/appc/tAppFeedback/add"-->
                                   <#--data-width="800" data-height="400"><i class="fa fa-plus"></i> 添加</a>-->
                            <#--</div>-->
                        <#--</@shiro.hasPermission>-->
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="内容查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>提交用户</th>
                                <th style="width: 400px">反馈内容</th>
                                <th>反馈时间</th>
                                <th>状态</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.userName)!'匿名'}</td>
            <td>${(entity.content)!'--'}</td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td><#if entity.isreply==0>未回复<#else >已回复</#if></td>
            <td>
                <@shiro.hasPermission name="editTAppFeedbackReply">
                    <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                       data-url="/appc/tAppFeedback/reply/1?deviceToken=${(entity.deviceToken)!}"
                       data-title="回复" data-width="850" data-height="700">回复</a>
                </@shiro.hasPermission>
            </td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tAppFeedback/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppFeedback/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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