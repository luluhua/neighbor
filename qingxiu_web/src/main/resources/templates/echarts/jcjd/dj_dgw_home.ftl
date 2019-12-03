<#include "../../common/layout_dl.ftl">
<@header>
<style type="text/css">
    .tree-title{
        padding: 10px 15px 5px;
        font-size: 22px;
        border-bottom: 1px solid #d2d6de;
    }
    .tree-title span{
        padding: 5px 15px;
        border-bottom: 2px solid;
    }
</style>
</@header>
<@body>
    <div class="tree-title"><span>${(dgwName)!}</span></div>
    <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs" style="margin: 20px 5px;">
        <ul id="myTabs" class="nav nav-tabs" role="tablist">
            <li role="presentation" class="<#if t==1>active</#if>"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">大工委成员单位</a></li>
            <li role="presentation" class="<#if t==2>active</#if>"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">党建联席会议</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div role="tabpanel" class="tab-pane fade <#if t==1>active in</#if>" id="home" aria-labelledby="home-tab">
                <!-- Your Page Content Here -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box" style="border-top:0;">
                            <form action="/jcjd/dgwList/1?t=1&dgwid=${dgwid!}" method="post"
                                  class="form-inline">
                                <div class="box-header">
                                    <div class="input-group">
                                        <input type="text" name="search" value="${search1!}" class="form-control"
                                               placeholder="成员名称">
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
                                        <th>运行制度</th>
                                    </tr>
                                <#list dgwUnitPage.getRecords() as entity>
                                    <tr>
                                        <td>${(entity.name)!'--'}</td>

                                        <td>
                                            <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/jcjd/dgwDetail/${(entity.id)!}"
                                               data-title="运行制度" data-width="850" data-height="550">查看</a>
                                        </td>
                                    </tr>
                                </#list>
                                </table>
                            </div><!-- /.box-body -->
                            <div class="box-footer row">
                                <#--<div class="col-md-6">-->
            <#--<#include "../../common/paginateBar.ftl" />-->
	  		  <#--<@paginate pageData=dgwPage actionUrl="/jcjd/dgwList/" urlParas="?t=1&dgwid=${dgwid!}&search=${search1!}"  />-->
                                <#--</div>-->
                                <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=dgwUnitPage.getCurrent() totalPage=dgwUnitPage.getPages() actionUrl="/jcjd/dgwList/" urlParas="?t=1&dgwid=${dgwid!}&search=${search1!}&pageSize=${pageSize!}"  />
                                </div>
                            </div>
                        </div><!-- /.box -->
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade <#if t==2>active in</#if>" id="profile" aria-labelledby="profile-tab">
                <!-- Your Page Content Here -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box" style="border-top:0;">
                            <form action="/jcjd/dgwList/1?t=2&dgwid=${dgwid!}" method="post"
                                  class="form-inline">
                                <div class="box-header">
                                    <div class="input-group">
                                        <input type="text" name="search" value="${search2!}" class="form-control"
                                               placeholder="会议标题">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>

                                </div><!-- /.box-header -->
                            </form>
                            <div class="box-body table-responsive no-padding">
                                <table class="table table-hover">
                                    <tr>
                                        <th>会议标题</th>
                                        <th>党组织</th>
                                        <th>会议时间</th>
                                        <th>操作</th>
                                    </tr>
                        <#list meetingPage.getRecords() as entity>
                            <tr>
                                <td>${(entity.title)!'--'}</td>
                                <td>${(entity.djOrgName)!'--'}</td>
                                <td>${(entity.dtMeeting?string('yyyy-MM-dd'))!'--'}</td>
                                <td><a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                       data-title="会议信息" data-url="/jcjd/meetingDetail/${(entity.id)!}"
                                       ,data-width="800" data-height="680"> <i
                                        class="fa fa-pencil-square-o"></i> 查看详情</a></td>
                            </tr>
                        </#list>
                                </table>
                            </div><!-- /.box-body -->
                            <div class="box-footer row">
                                <#--<div class="col-md-6">-->
            <#--<#include "../../common/paginateBar.ftl" />-->
	  		  <#--<@paginate pageData=meetingPage actionUrl="/jcjd/dgwList/" urlParas="?t=2&dgwid=${dgwid!}&search=${search2!}"  />-->
                                <#--</div>-->
                                <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=meetingPage.getCurrent() totalPage=meetingPage.getPages() actionUrl="/jcjd/dgwList/" urlParas="?t=2&dgwid=${dgwid!}&search=${search2!}&pageSize=${pageSize!}"  />
                                </div>
                            </div>
                        </div><!-- /.box -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</@body>
<@footer>
<script>
    $('#myTabs a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    })
    var _type='${(t)!}';
    if(_type=='1'){
        $("#home-tab").tab('show');
    }else if(_type=='2'){
        $("#profile-tab").tab('show');
    }else{
        $("#home-tab").tab('show');
    }
</script>

</@footer>