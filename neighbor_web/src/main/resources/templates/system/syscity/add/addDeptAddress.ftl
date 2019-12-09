<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <!-- Main content -->
    <section class="content">
        <form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/tSysOrgAddress/doAdd">
            <input type="hidden" id="cityId" name="cityId" value="">
            <input id="lngId" type="hidden" name="lng" value="${(dept.lng)!}">
            <input id="latId" type="hidden" name="lat" value="${(dept.lat)!}">
            <div class="box-body">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">行政区域<span class="xing_red"> *</span></label>
                        <div class="col-sm-10">
                            <select id="xzqhId" name="cityId"  class="form-control select2 input-select-200"
                                    lay-verify="required" lay-ignore>
                                <option value="">--县（市、区）--</option>
                                <#list sysCityList as m>
                                    <option value="#{(m.id)!}">${(m.name)!}</option>
                                </#list>
                            </select>
                            <select id="xzqhId2"  name="streeId"  class="form-control select2 input-select-200"
                                    lay-ignore>
                                <option value="">--请选择乡镇、街道--</option>
                            </select>
                            <select id="xzqhId3"  name="communityId" class="form-control select2 input-select-200"
                                    lay-ignore>
                                <option value="">--请选择社区、村委--</option>
                            </select>

                        </div>

                    </div>
                <div id="deptId" style="display:none;">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">办理部门<span class="xing_red"> *</span></label>
                        <div class="col-sm-10">
                            <select  id="dept-select-id" name="orgId" class="form-control select2 input-select-200"
                                     lay-verify="required" lay-ignore>

                            </select>
                            <p class="help-block"
                               class="ts-color">* 行政区域选择到哪一级则自动关联相关办理部门<br/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">地址<span class="xing_red"> *</span></label>
                        <div class="col-sm-10">
                            <input type="text"  id="suggestId" name="address"
                                   value="${(entity.address)!}" class="form-control" placeholder="请输入地址"
                                   lay-verify="required"/>
                            <div id="mapId" style="display: hidden;"></div>
                            <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mobile" class="col-sm-2 control-label">联系电话<span class="xing_red"> *</span></label>
                        <div class="col-sm-10">
                            <input type="text" id="mobile" name="mobile"
                                   value="${(entity.mobile)!}" class="form-control input-select-200" placeholder="请输入联系电话"
                                   lay-verify="required"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="busRoute" class="col-sm-2 control-label">公交路线</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="busRoute" rows="3"  placeholder="请输入公交路线">${(entity.busRoute?trim)!}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="officeHours" class="col-sm-2 control-label">办公时间</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="officeHours" rows="3" placeholder="请输入办公时间">${(entity.officeHours)!}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="officeWindow" class="col-sm-2 control-label">办理窗口</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="officeWindow" rows="3" placeholder="请输入办理窗口">${(entity.officeWindow)!}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-2 control-label">是否启用:</label>
                        <div class="col-sm-10">
                            <label>
                                <input name="isEnabled" type="radio" class="minimal" checked value="1" lay-ignore> 启用
                            </label>
                            <label>
                                <input name="isEnabled" type="radio" class="minimal" value="0" lay-ignore> 禁用
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="remark" rows="3" placeholder="请输入备注">${(entity.remark)!}</textarea>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
                    </div>
                </div>


            </div><!-- /.box-body -->
        </form>
    </section><!-- /.content -->
</@body>
<@footer>
    <script type="application/javascript">
        setInputValue('${(entity.address)!}');
        var city_url="/system/sysCity/getCityByPid";
        $("#xzqhId").change(function(){
            var cityId=$("#xzqhId").val();
            $("#cityId").val(cityId);
            //获取乡镇、街道
            $.post(city_url,{pid:cityId},function(json){
                if(json.code==200){
                    $("#xzqhId2").empty();
                    // if(json.data.length==0){
                    //     $.alert({
                    //         title: '提示',
                    //         content: "当前选择的县（市、区）,未关联相关乡镇、街道",
                    //         buttons:{"好的":{ btnClass: 'btn-blue'}}
                    //     });
                    //     return;
                    // }
                    $("#xzqhId2").append("<option value='' selected>--请选择乡镇、街道--</option>");
                    $.each(json.data, function(i, item){
                        $("#xzqhId2").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                    })
                }else{
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons:{"好的":{ btnClass: 'btn-blue'}}
                    });
                }
            });
            getDept(cityId);
        })

        var city_url="/system/sysCity/getCityByPid";
        $("#xzqhId2").change(function() {
            var cityId = $("#xzqhId2").val();
            $("#cityId").val(cityId);
            //获取乡镇、街道
            $.post(city_url, {pid: cityId}, function (json) {
                if (json.code == 200) {
                    $("#xzqhId3").empty();
                    // if (json.data.length == 0) {
                    //     $.alert({
                    //         title: '提示',
                    //         content: "当前选择的乡镇、街道）,未关联相关社区、村委",
                    //         buttons: {"好的": {btnClass: 'btn-blue'}}
                    //     });
                    //     return;
                    // }
                    $("#xzqhId3").append("<option value='' selected>--请选择社区、村委--</option>");
                    $.each(json.data, function (i, item) {
                        $("#xzqhId3").append("<option value='" + item.id + "'>" + item.name + "</option>");
                    })
                } else {
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons: {"好的": {btnClass: 'btn-blue'}}
                    });
                }
            });
            getDept(cityId);
        })

        $("#xzqhId3").change(function(){
            var cityId=$("#xzqhId3").val();
            $("#cityId").val(cityId);
            getDept(cityId);
        })

function getDept(_cityId){
    var  dept_url="/appc/tGovProjectCityOrgAdress/getDeptByCityId";
    //获取部门
    $.post(dept_url,{id:_cityId},function(json){
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
}
    </script>
</@footer>