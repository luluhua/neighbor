<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small><a href="/appc/tActActivityVote/list/1" style="color: #0C70C4">投票排行</a> > 【${(enroll.workName)!}
                】投票列表
            </small>
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
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('活动投票记录数据');">
                                    <i
                                            class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>投票用户</th>
                                <th>PI</th>
                                <th>投票时间</th>
                            <#--<th width="120px">操作</th>-->
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>

            <td>${(entity.username)!'--'}</td>
            <td>${(entity.voteIp)!'--'}</td>
            <td>${(entity.dtVote?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tActActivityVote/votelist/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tActActivityVote/votelist/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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