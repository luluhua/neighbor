<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <!-- Main content -->
    <section class="content">
        <form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/sysCity/doAdd">
            <input type="hidden" id="pid"  name="pid" value="0">
            <div class="box-body">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">行政区域</label>
                        <div class="col-sm-10">
                            <select id="xzqhId4"   class="form-control select2 input-select-200"
                                    lay-ignore>
                                <option value="">--省--</option>
                                <#list sysCityList as m>
                                    <option value="#{(m.id)!}">${(m.name)!}</option>
                                </#list>
                            </select>
                            <select id="xzqhId5"   class="form-control select2 input-select-200"
                                    lay-ignore>
                                <option value="">--市--</option>
                            </select>
                            <br/>
                            <br/>
                            <select id="xzqhId"   class="form-control select2 input-select-200"
                                   lay-ignore>
                                <option value="">--县（区）--</option>
                            </select>
                            <select id="xzqhId2"    class="form-control select2 input-select-200"
                                    lay-ignore>
                                <option value="">--请选择乡镇、街道--</option>
                            </select>
                            <select id="xzqhId3"   class="form-control select2 input-select-200"
                                    lay-ignore>
                                <option value="">--请选择社区、村委--</option>
                            </select>
                            <p class="help-block"
                               class="ts-color">* 行政区域不选任何则默认添加省级区域<br/>
                            <p class="help-block"
                               class="ts-color">* 行政区域选择到哪一级则添加该级下属区域</p>
                        </div>
                    </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">名称:<span class="xing_red">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" id="name" name="name" class="form-control input-select-200" placeholder="请输入名称"
                               lay-verify="required"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="abbreviation" class="col-sm-2 control-label">简称</label>
                    <div class="col-sm-10">
                        <input type="text" id="abbreviation" name="abbreviation" class="form-control input-select-200" lay-verify="required"
                               placeholder="请输入简称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="code" class="col-sm-2 control-label">编码:<span class="xing_red">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" id="code" name="code" class="form-control input-select-200" placeholder="请输入编码"
                               lay-verify="required"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="status" class="col-sm-2 control-label">是否启用:<span class="xing_red">*</span></label>
                    <div class="col-sm-10">
                        <label>
                            <input name="enabled" type="radio" class="minimal" checked value="1" lay-ignore> 启用
                        </label>
                        <label>
                            <input name="enabled" type="radio" class="minimal" value="0" lay-ignore> 禁用
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="sortIndex" class="col-sm-2 control-label">排序:<span class="xing_red">*</span></label>
                    <div class="col-sm-10">
                        <input type="number" id="sortIndex" name="sortIndex" class="form-control input-number-100 "
                               placeholder="输入排序" lay-verify="required|number"/>
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
        var city_url="/system/sysCity/getCityByPid";

        $("#xzqhId4").change(function(){
            var cityId=$("#xzqhId4").val();
            $("#pid").val(cityId);
            //获取乡镇、街道
            $.post(city_url,{pid:cityId},function(json){
                if(json.code==200){
                    $("#xzqhId5").empty();
                    // if(json.data.length==0){
                    //     $.alert({
                    //         title: '提示',
                    //         content: "当前选择的县（市、区）,未关联相关乡镇、街道",
                    //         buttons:{"好的":{ btnClass: 'btn-blue'}}
                    //     });
                    //     return;
                    // }
                    $("#xzqhId5").append("<option value='' selected>--请选择市-</option>");
                    $.each(json.data, function(i, item){
                        $("#xzqhId5").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                    })
                }else{
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons:{"好的":{ btnClass: 'btn-blue'}}
                    });
                }
            });
        })
        $("#xzqhId5").change(function(){
            var cityId=$("#xzqhId5").val();
            $("#pid").val(cityId);
            //获取乡镇、街道
            $.post(city_url,{pid:cityId},function(json){
                if(json.code==200){
                    $("#xzqhId").empty();
                    // if(json.data.length==0){
                    //     $.alert({
                    //         title: '提示',
                    //         content: "当前选择的县（市、区）,未关联相关乡镇、街道",
                    //         buttons:{"好的":{ btnClass: 'btn-blue'}}
                    //     });
                    //     return;
                    // }
                    $("#xzqhId").append("<option value='' selected>--县（区）-</option>");
                    $.each(json.data, function(i, item){
                        $("#xzqhId").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                    })
                }else{
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons:{"好的":{ btnClass: 'btn-blue'}}
                    });
                }
            });
        })
        $("#xzqhId").change(function(){
            var cityId=$("#xzqhId").val();
            $("#pid").val(cityId);
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
        })
        $("#xzqhId2").change(function() {
            var cityId = $("#xzqhId2").val();
            $("#pid").val(cityId);
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
        })

        $("#xzqhId3").change(function(){
            var cityId=$("#xzqhId3").val();
            $("#pid").val(cityId);
        })



    </script>
</@footer>