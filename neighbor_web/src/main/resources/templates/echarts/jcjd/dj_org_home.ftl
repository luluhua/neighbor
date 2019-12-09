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
    <div class="tree-title"><span>${(orgName)!}</span></div>
    <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs" style="margin: 20px 5px;">
        <ul id="myTabs" class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">党员信息</a></li>
            <li role="presentation" class=""><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">三会一课</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                <form action="/jcjd/dj_org_home/1?orgId=${djOrgId!}&type=1" method="post"
                      class="form-inline">
                    <div class="box-header">
                        <div class="input-group">
                            <input type="text" name="search" value="${search!}" class="form-control"
                                   placeholder="党员姓名">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </div>

                    </div><!-- /.box-header -->
                </form>
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover">
                        <tr>
                            <th>姓名</th>
                            <#--<th>性别</th>-->
                            <th>出生日期</th>
                            <th>入党日期</th>
                            <th>学历</th>
                            <th width="220px">操作</th>
                        </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td>${(entity.name)!"--"}</td>
                                        <#--<td>${(entity.sex)!"--"}</td>-->
                                        <td>${(entity.birthday)!"--"}</td>
                                        <td>${(entity.partyDate)!'--'}</td>
                                        <td><@dictTag method="dictValueByType" type="edu_detail" value="${(entity.education)!'--'}"> ${(dictValueByType)!}</@dictTag></td>
                                        <td>
                                            <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                               data-title="党员信息详情" data-url="/jcjd/partymemberDeatil/${(entity.id)!}"
                                               ,data-width="800" data-height="480"> <i
                                                    class="fa fa-pencil-square-o"></i> 查看详情</a>
                                        </td>
                                    </tr>
                                </#list>
                    </table>
                </div><!-- /.box-body -->
                <div class="box-footer row">
                    <#--<div class="col-md-6">-->
                                <#--<#include "../../common/paginateBar.ftl" />-->
                                <#--<@paginate pageData=pageData actionUrl="/jcjd/dj_org_home/" urlParas="?search=${search!}&orgId=${(djOrgId)}&type=1"  />-->
                    <#--</div>-->
                    <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/jcjd/dj_org_home/" urlParas="?search=${search!}&pageSize=${pageSize!}&orgId=${(djOrgId)}&type=1"  />
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                <form action="/jcjd/dj_org_home/1?orgId=${djOrgId!}&type=2" method="post"
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
                        <#list pageData2.getRecords() as entity>
                            <tr>
                                <td>${(entity.title)!'--'}</td>
                                <td>${(entity.djOrgName)!'--'}</td>
                                <td>${(entity.dtMeeting?string('yyyy-MM-dd'))!'--'}</td>
                                <td>
                                    <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                       data-title="会议信息" data-url="/jcjd/meetingDetail/${(entity.id)!}"
                                       ,data-width="800" data-height="680"> <i
                                            class="fa fa-pencil-square-o"></i> 查看详情</a>
                                </td>
                            </tr>
                        </#list>
                    </table>
                </div><!-- /.box-body -->
                <div class="box-footer row">
                    <#--<div class="col-md-6">-->
            <#--<#include "../../common/paginateBar.ftl" />-->
	  		  <#--<@paginate pageData=pageData2 actionUrl="/jcjd/dj_org_home/" urlParas="?orgId=${djOrgId!}&type=2"  />-->
                    <#--</div>-->
                    <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData2.getCurrent() totalPage=pageData2.getPages() actionUrl="/jcjd/dj_org_home/" urlParas="?orgId=${djOrgId!}&search=${search!}&pageSize=${pageSize!}&type=2"  />
                    </div>
                </div>
            </div>
        </div>
    </div>
</@body>
<@footer>
<script>
    var _type='${(type)!}';
    if(_type=='1'){
        $("#home-tab").tab('show');
    }else if(_type=='2'){
        $("#profile-tab").tab('show');
    }else{
        $("#home-tab").tab('show');
    }
    $('#myTabs a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    })
</script>

</@footer>