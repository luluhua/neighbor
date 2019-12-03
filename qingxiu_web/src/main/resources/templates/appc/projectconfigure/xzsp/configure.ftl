<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<#--    <div class="content-wrapper">-->
        <!-- Content Header (Page header) -->
<#--        <section class="content-header">-->
<#--            <h1>-->
<#--                <small>行政审批  > <a href="/appc/tGovProjectCityOrgAdress/list/1">事项管理</a> > 添加事项</small>-->
<#--            </h1>-->
<#--        </section>-->
        <!-- Main content -->
        <section class="content">
            <form class="form-horizontal layui-form layui-form-pane" method="post" action="/appc/tGovProjectCityOrgAdress/doAdd">
               <input type="hidden" name="serviceType" value="${(serviceType)!}">
                <div class="box-body">
<#--                    <div class="form-group">-->
<#--                        <label  class="col-sm-2 control-label">主题<span class="xing_red"> *</span></label>-->
<#--                        <div class="col-sm-10">-->
<#--                         <select  id="themeId" class="form-control select2 input-select-200"-->
<#--                                  lay-verify="required" lay-ignore>-->
<#--                             <option value="">--请选择事项主题--</option>-->
<#--                                <#list themeList as m>-->
<#--                                       <option value="#{(m.id)!}">${(m.themeTitle)!}</option>-->
<#--                                  </#list>-->
<#--                         </select>-->
<#--                        </div>-->
<#--                    </div>-->
                    <div id="projectId" >
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">事项列表<span class="xing_red"> *</span></label>
                        <div class="col-sm-10">
                            <input type="hidden" id="projectIds" name="projectIds" value="">
                            <select id="project-select-id" multiple  class="form-control select2" style="width: 100%;"
                                     lay-verify="required" lay-ignore>
                                <option value="">--请选择事项--</option>
                                <#list projectList as m>-->
                                    <option value="#{(m.id)!}">${(m.projectTitle)!}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">行政区域<span class="xing_red"> *</span></label>
                            <div class="col-sm-10">
                                <select id="xzqhId"  name="cityId" class="form-control select2 input-select-200"
                                         lay-verify="required" lay-ignore>
                                    <option value="">--请选择所属行政区域-</option>
                                    <#list sysCityList as m>
                                        <option value="#{(m.id)!}">${(m.name)!}</option>
                                    </#list>
                                </select>
                                <select id="xzqhId2"  name="streeId"  class="form-control select2 input-select-200" lay-ignore>
                                    <option value="">--请选择乡镇、街道--</option>
                                </select>

                            </div>
                        </div>
                    </div>
                    <div id="deptId" style="display:none;">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">承办部门<span class="xing_red"> *</span></label>
                        <div class="col-sm-10">
                            <select  id="dept-select-id" name="orgId" class="form-control select2 input-select-200" lay-ignore
                                    >

                            </select>
                        </div>
                    </div>
                    </div>
                    <div id="areaAddressId" style="display:none;">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">办理地址<span class="xing_red"> *</span></label>
                        <div class="col-sm-10">
                            <select id="dept-address-select-id"  name="orgAddressId" class="form-control select2 " style="width: 100%;"
                                     lay-verify="required" lay-ignore>
                            </select>
                        </div>
                    </div>
<#--                        <div class="form-group">-->
<#--                            <label for="sortIndex" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>-->
<#--                            <div class="col-sm-10">-->
<#--                                <input type="hidden" id="sortIndex" name="sortIndex"  class="form-control input-select-200"  value="1"   />-->
<#--                            </div>-->
<#--                        </div>-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">&nbsp;</label>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
                            </div>
                        </div>
                    </div>


                </div><!-- /.box-body -->
            </form>
        </section><!-- /.content -->
<#--    </div><!-- /.content-wrapper &ndash;&gt;-->
</@body>
<@footer>
    <script type="application/javascript">
        var project_url="/appc/tGovProjectCityOrgAdress/getProject";
        var dept_url="/appc/tGovProjectCityOrgAdress/getDeptByCityId";
        $("#themeId").change(function(){
            //获取办事事项
            $.post(project_url,{themeId:$("#themeId").val()},function(json){
                if(json.code==200){
                    $("#project-select-id").empty();
                    if(json.data.length==0){
                        $.alert({
                            title: '提示',
                            content: "当前选择的主题,未关联相关办事事项",
                            buttons:{"好的":{ btnClass: 'btn-blue'}}
                        });
                        return;
                    }
                    $("#project-select-id").append("<option value='' selected>--请选择办理事项--</option>");
                    $.each(json.data, function(i, item){
                        $("#project-select-id").append("<option value='"+ item.id+"'>"+item.projectTitle+"</option>");
                    })
                    $("#projectId").show();
                }else{
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons:{"好的":{ btnClass: 'btn-blue'}}
                    });
                }
            });
        })


        var city_url="/system/sysCity/getCityByPid";
        $("#xzqhId").change(function(){
            var cityId=$("#xzqhId").val();
            //获取乡镇、街道
            $.post(city_url, {pid: cityId}, function (json) {
                if (json.code == 200) {
                    $("#xzqhId2").empty();
                    if (json.data.length == 0) {
                        $.alert({
                            title: '提示',
                            content: "当前选择的乡镇、街道）,未关联相关社区、村委",
                            buttons: {"好的": {btnClass: 'btn-blue'}}
                        });
                        return;
                    }
                    $("#xzqhId2").append("<option value='' selected>--请选择社区、村委--</option>");
                    $.each(json.data, function (i, item) {
                        $("#xzqhId2").append("<option value='" + item.id + "'>" + item.name + "</option>");
                    })
                } else {
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons: {"好的": {btnClass: 'btn-blue'}}
                    });
                }
            });

            //获取部门
            $.post(dept_url,{id:cityId},function(json){
                console.log(json);
                if(json.code==200){
                    $("#dept-select-id").empty();
                    if(json.data.length==0){
                        $.alert({
                            title: '提示',
                            content: "当前选择的行政区域,未关联相关办理部门",
                            buttons:{"好的":{ btnClass: 'btn-blue'}}
                        });
                        return;
                    }
                    $("#dept-select-id").append("<option value='' selected>--请选择办理部门--</option>");
                    $.each(json.data, function(i, item){
                        $("#dept-select-id").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                    })
                    $("#deptId").show();
                }else{
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons:{"好的":{ btnClass: 'btn-blue'}}
                    });
                }
            });

        })


        $("#xzqhId2").change(function() {
            var cityId=$("#xzqhId2").val();
            //获取部门
            $.post(dept_url,{id:cityId},function(json){
                console.log(json);
                if(json.code==200){
                    $("#dept-select-id").empty();
                    if(json.data.length==0){
                        $.alert({
                            title: '提示',
                            content: "当前选择的行政区域,未关联相关办理部门",
                            buttons:{"好的":{ btnClass: 'btn-blue'}}
                        });
                        return;
                    }
                    $("#dept-select-id").append("<option value='' selected>--请选择办理部门--</option>");
                    $.each(json.data, function(i, item){
                        $("#dept-select-id").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                    })
                    $("#deptId").show();
                }else{
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons:{"好的":{ btnClass: 'btn-blue'}}
                    });
                }
            });
        })

        var dept_address_url="/appc/tGovProjectCityOrgAdress/getDeptAddressByDeptId";
        $("#dept-select-id").change(function(){
            var id=$("#dept-select-id").val();
            //获取部门地址（办事地址）
            $.post(dept_address_url,{id:id},function(json){
                console.log(json);
                if(json.code==200){
                    $("#dept-address-select-id").empty();
                    if(json.data.length==0){
                        $.alert({
                            title: '提示',
                            content: "当前选择的办理部门,未关联相关办理地址",
                            buttons:{"好的":{ btnClass: 'btn-blue'}}
                        });
                        return;
                    }
                    $("#dept-address-select-id").append("<option value='' selected>--请选择办理部门地址--</option>");
                    $.each(json.data, function(i, item){
                        $("#dept-address-select-id").append("<option value='"+ item.id+"'>"+item.address+"</option>");
                    })
                    $("#areaAddressId").show();
                }else{
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons:{"好的":{ btnClass: 'btn-blue'}}
                    });
                }
            });
        })
        //事项
        $('#project-select-id').on("change",function () {
            var obj = this;
            var themeVal = "";
            for(var i=0;i<obj.options.length;i++){
                if(obj.options[i].selected){
                    themeVal += obj.options[i].value+",";
                }
            }
            $("#projectIds").val(themeVal.substring(0,themeVal.length-1));
        });

        $("#xzqhId").val("2924");
        $('#xzqhId').trigger('change');
    </script>
</@footer>