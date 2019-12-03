<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>基层办事 ></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovProjectCityOrgAdress/jcbsList/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTGovProjectCityOrgAdress">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;"
                       data-url="/appc/tGovProjectCityOrgAdress/addJcbs"
                       data-title="添加基层办事事项" data-width="800" data-height="600"><i class="fa fa-plus"></i> 添加</a>
                </div>
                 <div class="input-group">
                     <a class="btn btn-primary " href="/appc/tGovProjectCityOrgAdress/addBatchJcbs"
                        data-title="添加基层办事事项" data-width="800" data-height="600"><i class="fa fa-plus"></i> 批量添加</a>
                 </div>
                 <div class="input-group">
                     <a class="btn btn-primary " href="/appc/tGovProjectCityOrgAdress/addBatchProcess?serviceType=1"
                        data-title="配置流程" data-width="800" data-height="600"><i class="fa fa-plus"></i> 配置流程</a>
                 </div>
                </@shiro.hasPermission>
                            <div class="input-group ">
                                <button type="button" update-batch-url="/appc/tGovProjectCityOrgAdress/updateSortAll"
                                        class="btn btn-primary btn-flat">
                                    <i
                                            class="fa  fa-hand-o-up"></i> 批量修改排序
                            </div>
                            <div class="input-group">
                                <button type="button" delete-batch-url="/appc/tGovProjectCityOrgAdress/deleteAll"
                                        class="btn btn-danger btn-flat">
                                    <i class="fa fa-remove"></i> 批量删除
                                </button>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('事项数据');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                            <br/><br/>
                            <div class="input-group">
                                <input type="hidden" id="cityId" name="cityId" value="${(cityId?c)!}">
                                <input type="hidden" id="streeId" name="streeId" value="${(streeId?c)!}">
                                <input type="hidden" id="communityId" name="communityId" value="${(communityId?c)!}">
                                <select id="xzqhId" class="form-control input-select-200">
                                    <option value="">--行政区域--</option>
                        <#list sysCityList as m>
                            <option value="#{(m.id)!}"
                                    <#if "${(m.id)!}"=="${(cityId)!}">selected</#if>
                            >${(m.name)!}</option>
                        </#list>
                                </select>
                            </div>
                            <div class="input-group">
                                <select id="xzqhId2" class="form-control  input-select-200">
                                    <option value="">--请选择乡镇、街道--</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <select id="xzqhId3" class="form-control  input-select-200">
                                    <option value="">--请选择社区、村委--</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="事项名称">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>

                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th style="white-space: nowrap"><input type="checkbox" lay-filter="allCheck"
                                                                       value="root"
                                                                       class="minimal  checkbox-toolbar"
                                                                       lay-ignore>全选
                                </th>
                                <th>ID</th>
                                <th>流程模型</th>
                                <th>事项名称</th>
                                <th>区域-街道-社区-部门-地址</th>
                                <th>排序</th>
                                <#--<th width="120px">操作</th>-->
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                           value="${(entity.id?c)!}"
                                           class="minimal checkbox-item"></td>
            <td>${(entity.id?c)!}</td>
            <td>${(entity.modelKey)!}</td>
            <td>${(entity.projectTitle)!}</td>
            <td>${(entity.cityName)!}-${(entity.streeName)!}-${(entity.communityName)!}-${(entity.deptName)!}
                -${(entity.deptAddress)!}</td>
            <td>
                <input type="text" class="form-control td-input-80"
                        id="sort_${(entity.id)}"
                       name="values" value="${(entity.sortIndex)!'--'}">
            </td>
            <#--<td>-->
            <#--<@shiro.hasPermission name="deleteTGovProjectCityOrgAdress">-->
                <#--<a class="btn btn-danger btn-xs"-->
                   <#--data-tiggle="ajax"-->
                   <#--data-submit-url="/appc/tGovProjectCityOrgAdress/delete?id=${(entity.id?c)!}"-->
                   <#--data-confirm="您确定要删除该条记录吗?">删除</a>-->
            <#--</@shiro.hasPermission>-->
            <#--</td>-->
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovProjectCityOrgAdress/jcbsList/" urlParas="?search=${search!}&cityId=${(cityId?c)!}&streeId=${(streeId!)}&communityId=${(communityId)!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovProjectCityOrgAdress/jcbsList/" urlParas="?search=${search!}&pageSize=${pageSize!}&cityId=${(cityId?c)!}&streeId=${(streeId!)}&communityId=${(communityId)!}"  />
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script type="application/javascript">
    var city_url = "/system/sysCity/getCityByPid";
    var _streeId = $("#streeId").val();
    var _communityId = $("#communityId").val();
    //初始化青秀区-社区或村委
    stree($("#xzqhId").val());
    //初始化 _streeId下社区或村委
    community(_streeId);
    $("#xzqhId").change(function () {
        var cityId = $("#xzqhId").val();
        $("#cityId").val(cityId);
        //获取乡镇、街道
        stree(cityId);
    })

    function stree(_cityId) {
        $.post(city_url, {pid: _cityId}, function (json) {
            if (json.code == 200) {
                $("#xzqhId2").empty();
                $("#xzqhId2").append("<option value='' selected>--请选择乡镇、街道--</option>");
                $.each(json.data, function (i, item) {
                    if (_streeId == item.id) {
                        $("#xzqhId2").append("<option value='" + item.id + "' selected>" + item.name + "</option>");
                    } else {
                        $("#xzqhId2").append("<option value='" + item.id + "'>" + item.name + "</option>");
                    }

                })
            } else {
                $.alert({
                    title: '提示',
                    content: json.msg,
                    buttons: {"好的": {btnClass: 'btn-blue'}}
                });
            }
        });
    }

    $("#xzqhId2").change(function () {
        var cityId = $("#xzqhId2").val();
        $("#streeId").val(cityId);
        community(cityId);
    })

    function community(_cityId) {
        //获取社区、村委
        $.post(city_url, {pid: _cityId}, function (json) {
            if (json.code == 200) {
                $("#xzqhId3").empty();
                $("#xzqhId3").append("<option value='' selected>--请选择社区、村委--</option>");
                $.each(json.data, function (i, item) {
                    if (_communityId == item.id) {
                        $("#xzqhId3").append("<option value='" + item.id + "' selected>" + item.name + "</option>");
                    } else {
                        $("#xzqhId3").append("<option value='" + item.id + "'>" + item.name + "</option>");
                    }
                })
            } else {
                $.alert({
                    title: '提示',
                    content: json.msg,
                    buttons: {"好的": {btnClass: 'btn-blue'}}
                });
            }
        });
    }

    $("#xzqhId3").change(function () {
        var cityId = $("#xzqhId3").val();
        $("#communityId").val(cityId);
    })

</script>
</@footer>