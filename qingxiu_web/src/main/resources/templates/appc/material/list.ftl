<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>APP管理 > 办事记录 >办事材料</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovRecordMaterial/list/1" method="post"
                          class="form-inline">
                        <input type="hidden" name="recordId" value="${recordId!}"/>
                        <div class="box-header">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="材料名查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <#--<a href="/appc/tGovRecordMaterial/list/1"-->
                                       <#--class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary" onclick="javasript:history.back(-1)">
                                    <i class="fa fa-backward"></i>
                                    返 回
                                </button>
                                <#--<button type="button" class="btn btn-primary btn-flat"-->
                                        <#--onclick="exportTo('办事记录材料信息表数据');"><i-->
                                        <#--class="fa fa-file-excel-o"></i> 导出-->
                                <#--</button>-->
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th></th>
                                <th>材料名</th>
                                <th style="min-width: 450px">材料地址</th>
                                <th style="min-width: 150px">材料内容</th>
                                <#--<th width="120px">操作</th>-->
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td></td>
            <td>${(entity.materialName)!'--'}</td>
            <td><#if (entity.materialUrl)??><a href="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.materialUrl)}">${(entity.materialUrl)}</a><#else>--</#if></td>
            <td>${(entity.materialContent)!'--'}</td>
            <#--<td>-->
                <#--<a class="btn btn-primary btn-xs dialog" href="javascript:;"-->
                   <#--data-url="/appc/tGovRecordMaterial/detail/${(entity.id)!}"-->
                   <#--data-title="办事材料详情" data-width="850" data-height="550">详情</a>-->
                <#--<@shiro.hasPermission name="listTGovRecordMaterial">-->
                    <#--<a class="btn btn-primary btn-xs"-->
                       <#--href="/appc/tGovRecordMaterial/list/1?recordId=${(entity.id)!}">材料记录</a>-->
                <#--</@shiro.hasPermission>-->
            <#--</td>-->
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <#--<div class="box-footer row">-->
                        <#--<div class="col-md-6">-->
            <#--<#include "../../common/paginateBar.ftl" />-->
	  		  <#--<@paginate pageData=pageData actionUrl="/appc/tGovRecordMaterial/list/" urlParas="?search=${search!}&recordId=${recordId!}"  />-->
                        <#--</div>-->
                        <#--<div class="col-md-6 pull-left">-->
            <#--<#include "../../common/paginate.ftl" />-->
            <#--<@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovRecordMaterial/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&recordId=${recordId!}"  />-->
                        <#--</div>-->
                    <#--</div>-->
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
</@footer>