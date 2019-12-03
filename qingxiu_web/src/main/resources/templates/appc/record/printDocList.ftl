<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>审批大厅
                > 待受理
                >打印材料
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovRecord/printDocList/1?recordId=${(projectId)!}"" method="post"
                          class="form-inline">
                        <input type="hidden" name="projectId" value="${projectId!}"/>
                        <div class="box-header">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="申请材料名称查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary" onclick="javasript:history.back(-1)">
                                    <i class="fa fa-backward"></i>
                                    返 回
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>序号</th>
                                <th>申请材料名称</th>
                                <th>申请材料依据</th>
                                <th>材料类型(原件/复印件)</th>
                                <th>是否需电子材料</th>
                                <th>份数</th>
                                <th>规格</th>
                                <th>必要性及描述</th>
                                <th>来源渠道</th>
                                <th>签名签证要求</th>
                                <th>是否容缺</th>
                                <th>材料表格html</th>
                            </tr>
                            <#list pageData.getRecords() as entity>
                            <tr>
                                <td>${(entity.sortIdex)!'--'}</td>
                                <td>${(entity.title)!'--'}</td>
                                <td>${(entity.rule)!'--'}</td>
                                <td>${(entity.ruleType)!'--'}</td>
                                <td>${(entity.needDoc)!'--'}</td>
                                <td>${(entity.count)!'--'}</td>
                                <td>${(entity.spec)!'--'}</td>
                                <td>${(entity.mustDesc)!'--'}</td>
                                <td>${(entity.source)!'--'}</td>
                                <td>${(entity.signCond)!'--'}</td>
                                <td>${(entity.canFallback)!'--'}</td>
                                <td>
                                    <#if (entity.materialHtml)??&&"${(entity.materialHtml)}"!="">
                                        <a class="btn btn-primary btn-xs" title="打印文档"
                                           href="/appc/tGovRecord/printDoc/${(entity.id)!}?recordId=${(recordId)!}">打印文档</a>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
                            <#include "../../common/paginateBar.ftl" />
	  		                <@paginate pageData=pageData actionUrl="/appc/tGovRecord/printDocList/1?recordId=${(projectId)!}" urlParas="?search=${search!}&projectId=${projectId!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
                            <#include "../../common/paginate.ftl" />
                            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovRecord/printDocList/1?recordId=${(projectId)!}" urlParas="?search=${search!}&pageSize=${pageSize!}&projectId=${projectId!}"  />
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