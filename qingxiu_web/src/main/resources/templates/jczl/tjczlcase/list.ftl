<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>基层治理 > 案件记录管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/jczl/tJczlCase/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTJczlCase">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                       data-url="/jczl/tJczlCase/add"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 添加</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="Search">
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
                                <th>案件状态</th>
                                <th>地址</th>
                                <th>案件来源</th>
                                <th>紧急类型</th>
                                <th>责任人</th>
                                <th>截止时间</th>
                                <th>上报时间</th>
                                <th>案件编号</th>
                                <th>创建时间</th>
                                <th>更新时间</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.cTitle)!'--'}</td>
            <td>
             <#if entity.cStatus==0>待审核<#elseif entity.cStatus==1>未领取<#elseif entity.cStatus==2>
                 未完成<#elseif entity.cStatus==3>超期办理
             <#elseif entity.cStatus==4>超期办结<#elseif entity.cStatus==5>待检查<#elseif entity.cStatus==6>作废案件
             <#elseif entity.cStatus==7>待审核 <#elseif entity.cStatus==8>待已办结<#elseif entity.cStatus==9>街道协调
             <#elseif entity.cStatus==10>城区协调<#elseif entity.cStatus==11>市级协调<#elseif entity.cStatus==12>非正常办结
             </#if>
            </td>
            <td>${(entity.cAddress)!'--'}</td>
            <td>
                <#if entity.cOrigin==1>APP<#else>其他</#if>
            </td>
            <td>
                <#if (entity.cLevel)??>
                    <#if entity.cLevel==1>非常紧急<#elseif entity.cLevel==2>紧急<#elseif entity.cLevel==3>普通</#if>
                <#else >--
                </#if>
            </td>
            <td>${(entity.cDutyPerson)!'--'}</td>
            <td>${(entity.cDeadline?string('yyyy-MM-dd'))!'--'}</td>
            <td>${(entity.dtReport?string('yyyy-MM-dd'))!'--'}</td>
            <td>${(entity.cCode)!'--'}</td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
            <td>${(entity.dtUpdate?string('yyyy-MM-dd'))!'--'}</td>
            <td>
                <@shiro.hasPermission name="editTJczlCase">
                    <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                       data-url="/jczl/tJczlCase/edit/${(entity.id)!}"
                       data-title="详情" data-width="850" data-height="550">查看详情</a>
                <#--<a class="btn btn-danger btn-xs"-->
                <#--data-tiggle="ajax"-->
                <#--data-submit-url="/jczl/tJczlCase/pass?id=${(entity.id)!}&status=6"-->
                <#--data-confirm="您确定要作废该条记录吗?">作废</a>-->
                </@shiro.hasPermission>
            </td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/jczl/tJczlCase/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/jczl/tJczlCase/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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