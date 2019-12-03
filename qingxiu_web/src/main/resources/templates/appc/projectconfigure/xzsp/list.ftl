<#include "../../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>行政审批 ></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovProjectCityOrgAdress/list/1" method="post"
                          class="form-inline " >
                        <div class="box-header">
                <@shiro.hasPermission name="addTGovProjectCityOrgAdress">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;"
                       data-url="/appc/tGovProjectCityOrgAdress/add"
                       data-title="添加行政审批事项" data-width="800" data-height="600"><i class="fa fa-plus"></i> 添加</a>
                </div>
                  <div class="input-group">
                      <a class="btn btn-primary " href="/appc/tGovProjectCityOrgAdress/addBatchProcess?serviceType=0"
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

                            <div class="input-group input-select-200">
                                <input type="hidden" id="cityId" name="cityId" value="${(cityId?c)!}">
                                <select id="xzqhId"  class="form-control  select2" lay-ignore >
                                    <option value="">--行政区域--</option>
                        <#list sysCityList as m>
                            <option value="#{(m.id)!}"
                                    <#if "${(m.id)!}"=="${(cityId)!}">selected</#if>
                            >${(m.name)!}</option>
                        </#list>
                                </select>
                            </div>
                        <#--<div class="input-group">-->
                        <#--<input type="hidden" id="streeId" name="streeId" value="${(streeId?c)!}">-->
                        <#--<select id="xzqhId2" class="form-control  input-select-200">-->
                        <#--<option value="">--请选择乡镇、街道--</option>-->
                        <#--</select>-->
                        <#--</div>-->
                            <div class="input-group input-select-200">
                                <input type="hidden" id="deptId" name="deptId" value="${(deptId?c)!}">
                                <select  id="xzqhId3"   class="form-control  select2"  lay-ignore >
                                    <option value="">--请选择部门--</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="事项名称">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('事项数据');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th style="white-space: nowrap"><input type="checkbox" lay-filter="allCheck"
                                                                       value="root"
                                                                       class="minimal checkbox-toolbar"
                                                                       lay-ignore>全选
                                </th>
                                <th>ID</th>
                                <th>流程模型</th>
                                <th>事项名称</th>
                                <th>区域-部门</th>
                                <th>排序</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                           value="${(entity.id?c)!}"
                                           class="minimal checkbox-item td-width-50"></td>
            <td class="td-width-50">${(entity.id?c)!}</td>
            <td class="td-width-150">${(entity.modelKey)!}</td>
            <td class="td-width-450">${(entity.projectTitle)!}</td>
            <td class="td-width-250">${(entity.cityName)!}-${(entity.deptName)!}</td>
            <td class="td-width-100">
                <input type="text" class="form-control td-input-80"
                        id="sort_${(entity.id)}"
                       name="values" value="${(entity.sortIndex)!'--'}">
            </td>
            <td class="td-width-100">

        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovProjectCityOrgAdress/list/" urlParas="?search=${search!}&cityId=${(cityId?c)!}&deptId=${(deptId?c)!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovProjectCityOrgAdress/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&cityId=${(cityId?c)!}&deptId=${(deptId?c)!}"  />
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
    var _cityId = $("#cityId").val();
    var _streeId = $("#streeId").val();
    var _deptId = $("#deptId").val();

    if (_cityId != null && _cityId != "") {
        stree(_cityId);
    }
    if (_streeId != null && _streeId != "") {
        deptt(_streeId);
    } else {
        deptt(_cityId);
    }

    $("#xzqhId").change(function () {
        var cityId = $("#xzqhId").val();
        $("#cityId").val(cityId);
        //获取乡镇、街道
        stree(cityId);
        deptt(cityId);
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
        deptt(cityId);
    })
    $("#xzqhId3").change(function () {
        var deptId = $("#xzqhId3").val();
        $("#deptId").val(deptId);
    })


    function deptt(_dsdf) {
        var dept_url = "/appc/tGovProjectCityOrgAdress/getDeptByCityId";
        if (_dsdf == null || _dsdf == '') {
            return;
        }
        $.post(dept_url, {id: _dsdf}, function (json) {
            if (json.code == 200) {
                $("#xzqhId3").empty();
                $("#xzqhId3").append("<option value='' selected>--请选择部门--</option>");
                $.each(json.data, function (i, item) {
                    if (_deptId == item.id) {
                        $("#xzqhId3").append("<option value='" + item.id + "' selected>" + item.name + "</option>");
                    } else {
                        $("#xzqhId3").append("<option value='" + item.id + "' >" + item.name + "</option>");
                    }
                })
            }
        });
    }
</script>
</@footer>