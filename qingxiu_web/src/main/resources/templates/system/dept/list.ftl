<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
            <#--<small>系统管理 > <a href="/system/sysCity/list/1?pid=#{(city.pid)}">[${(city.name)!}] </a> >部门管理</small>-->
                <small>系统管理 >[${(city.name)!}] 部门管理</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/tSysOrg/dept/list/1" method="post" class="form-inline">
                            <div class="box-header">
                                <@shiro.hasPermission name="addDept">
                                    <div class="input-group">
                                        <a class="btn btn-primary dialog" href="javascript:;" data-title="添加部门"
                                           id="add_a_id"
                                           data-url="/tSysOrg/dept/add?cityId=${(city.id?c)!}" data-width="1000"
                                           data-height="800"><i
                                                class="fa fa-plus"></i> 添加</a>
                                    </div>
                                <div class="input-group ">
                                    <button type="button" update-batch-url="/tSysOrg/dept/updateSortAll"
                                            class="btn btn-primary btn-flat">
                                        <i
                                                class="fa  fa-hand-o-up"></i> 批量修改排序
                                </div>
                                </@shiro.hasPermission>
                                <div class="input-group ">
                                <#--<input type="hidden" id="cityId" name="cityId" value="${(city.id?c)!}">-->
                                    <select id="xzqhId" name="cityId" class="form-control  input-select-200">
                                        <option value="">--县（区）--</option>
                                         <#list sysCityList as m>
                                    <option value="${(m.id?c)!}"
                                        <#if (m.id?c)==(city.id?c)>selected</#if>
                                    >${(m.name)!}</option>
                                         </#list>
                                    </select>
                                    <select id="xzqhId2" name="streeId" class="form-control  input-select-200"
                                    >
                                        <option value="">--请选择乡镇、街道--</option>
                                    </select>
                                    <select id="xzqhId3" name="communityId" class="form-control  input-select-200"
                                    >
                                        <option value="">--请选择社区、村委--</option>
                                    </select>
                                </div>

                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="部门名称">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>

                            </div><!-- /.box-header -->
                        </form>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th><input type="checkbox" lay-filter="allCheck" value="root"
                                               class="minimal  checkbox-toolbar"
                                               lay-ignore>
                                    </th>
                                    <th class="td-width-250">部门名称</th>
                                    <th class="td-width-200">部门编号</th>
                                    <th class="td-width-200">部门电话</th>
                                    <th class="td-width-350">部门地址</th>
                                    <th class="td-width-100">部门图标</th>
                                    <th class="td-width-100">排序</th>
                                    <th class="td-width-200">操作</th>
                                </tr>
                                <#list pageData.getRecords() as dept>
                                    <tr>
                                        <td class=""><input type="checkbox" lay-filter="campus" name="ids"
                                                            value="${(dept.id?c)!}"
                                                            class="minimal checkbox-item"></td>
                                        <td>${(dept.name)!}</td>
                                        <td>${(dept.code)!'--'}</td>
                                        <td>${(dept.telPhone)!'--'}</td>
                                        <td>${(dept.address)!'--'}</td>
                                        <td>
                                            <#if (dept.logoUrl)??>
                                                <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(dept.logoUrl)!''}"
                                                     width="40px" height="40px"/>
                                            <#else >
                                                <img src="../../../images/default.png" width="40px" height="40px"/>
                                            </#if>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control td-input-80"
                                                   onblur="oncheckCode(this)" id="sort_${(dept.id?c)!}"
                                                   name="values" value="${(dept.sortIndex?c)!'--'}">
                                        </td>
                                        <td>
                                            <@shiro.hasPermission name="editDept">
                                            <a href="/system/tSysOrgAddress/list/1?deptId=${(dept.id?c)!}"
                                               class="btn btn-primary btn-xs">办公地址</a>
                                            </@shiro.hasPermission>
                                            <@shiro.hasPermission name="editTSysOrgRole">
                                            <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                               data-title="角色关联"
                                               data-url="/system/tSysOrgRole/add?deptId=${(dept.id?c)!}"
                                               ,data-width="600" data-height="400"> 角色关联</a>
                                            </@shiro.hasPermission>
                                            <@shiro.hasPermission name="addTSysOrgSignature">
                                            <a  href="/system/tSysOrgSignature/list/1?deptId=${(dept.id?c)!}"
                                                class="btn btn-primary btn-xs"> 电子印章</a>
                                            </@shiro.hasPermission>

                                        </td>
                                        <td class="td-width-200">
                                            <@shiro.hasPermission name="editDept">
                                                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                                   data-title="编辑部门"
                                                   data-url="/tSysOrg/dept/edit/#{(dept.id)}?cityId=${(city.id?c)!}"
                                                   ,data-width="1000" data-height="800"> <i
                                                        class="fa fa-pencil-square-o"></i> 编辑</a>
                                            </@shiro.hasPermission>
                                             <@shiro.hasPermission name="deleteDept">
                                                 <a class="btn btn-danger btn-xs"
                                                    data-tiggle="ajax"
                                                    data-submit-url="/tSysOrg/dept/delete?id=${(dept.id?c)!}&cityId=${(city.id?c)!}"
                                                    data-confirm="您确定要删除该条记录吗?"><i class="fa fa-times"></i> 删除</a>
                                             </@shiro.hasPermission>
                                        </td>

                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/tSysOrg/dept/list/" urlParas="?search=${search!}&cityId=${(city.id?c)!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/tSysOrg/dept/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&cityId=${(city.id?c)!}"  />
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
    var _cityId = $("#xzqhId").val()
    var _streeId = "${(streeId)!}"
    var _communityId = "${(communityId)!}"
    //初始化青秀区-社区或村委
    if (_cityId) {
        stree(_cityId);
        attrAddDataUrl(_cityId);
    }
    if (_streeId) {
        community(_streeId);
        attrAddDataUrl(_streeId);
    }
    if (_communityId) {
        attrAddDataUrl(_communityId);
    }
    $("#xzqhId").change(function () {
        var cityId = $("#xzqhId").val();
        // $("#cityId").val(cityId);
        attrAddDataUrl(cityId);
        //获取乡镇、街道
        stree(cityId);
    });

    function attrAddDataUrl(_cityId) {
        $("#add_a_id").attr("data-url", "/tSysOrg/dept/add?cityId=" + _cityId);
    }

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

    //获取社区、村委
    function community(cityId) {
        $.post(city_url, {pid: cityId}, function (json) {
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

    $("#xzqhId2").change(function () {
        var cityId = $("#xzqhId2").val();
        attrAddDataUrl(cityId);
        community(cityId);
    })
    $("#xzqhId3").change(function () {
        var cityId = $("#xzqhId3").val();
        attrAddDataUrl(cityId);
    })

</script>
</@footer>