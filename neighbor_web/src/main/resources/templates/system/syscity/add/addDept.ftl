<#include "../../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.min.css">
</@header>
<@body>
    <!-- Main content -->
    <section class="content">
        <form class="form-horizontal layui-form layui-form-pane" method="post" action="/tSysOrg/dept/doAdd">
            <input type="hidden" name="pid" value="0">
            <input type="hidden" id="cityId" name="cityId" value="">
            <div class="box-body">
                <div class="form-group">
                    <label class="col-sm-2 control-label">行政区域<span class="xing_red"> *</span></label>
                    <div class="col-sm-10">
                        <select id="xzqhId" name="cityId" class="form-control select2 input-select-200"
                                lay-verify="required" lay-ignore>
                            <option value="">--县（市、区）--</option>
                                <#list sysCityList as m>
                                    <option value="#{(m.id)!}">${(m.name)!}</option>
                                </#list>
                        </select>
                        <select id="xzqhId2" name="streeId" class="form-control select2 input-select-200"
                                lay-ignore>
                            <option value="">--请选择乡镇、街道--</option>
                        </select>
                        <select id="xzqhId3" name="communityId" class="form-control select2 input-select-200"
                                lay-ignore>
                            <option value="">--请选择社区、村委--</option>
                        </select>
                        <p class="help-block"
                           class="ts-color">* 行政区域选择到哪一级则添加该级下属部门<br/>
                    </div>

                </div>
                <div class="form-group">
                    <label for="deptName" class="col-sm-2 control-label">机构代码<span class="xing_red"> *</span></label>
                    <div class="col-sm-10">
                        <input type="text" id="code" name="code" class="form-control input-select-200"
                               lay-verify="required" placeholder="请输入机构代码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="deptName" class="col-sm-2 control-label">部门名称<span class="xing_red"> *</span></label>
                    <div class="col-sm-10">
                        <input type="text" id="name" name="name" class="form-control input-select-200"
                               lay-verify="required" placeholder="请输入部门名称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="abbreviation" class="col-sm-2 control-label">部门简称<span
                            class="xing_red"> *</span></label>
                    <div class="col-sm-10">
                        <input type="text" id="abbreviation" name="abbreviation" class="form-control input-select-200"
                               lay-verify="required" placeholder="请输入部门简称">
                    </div>
                </div>
            <#--<div class="form-group">-->
            <#--<label for="deptName" class="col-sm-2 control-label">部门图标</label>-->
            <#--<input type="hidden"  id="logoUrl" name="logoUrl">-->
            <#--<div class="col-sm-10">-->
            <#--<input name="file" type="file" class="file-loading" id="systemLogo">-->
            <#--</div>-->
            <#--</div>-->
                <div class="form-group">
                    <label for="deptName" class="col-sm-2 control-label">部门图标</label>
                    <input type="hidden" id="logoUrl" name="logoUrl">
                    <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                       data-url="/system/accessory/add?fileQuantity=1&vessel=logoUrl&classify=dept_logoUrl&dict=dept_file"
                       data-width="960" data-height="650"><i class="fa fa-plus"></i> 添加图标</a>
                </div>
                <div class="form-group">
                    <label for="systemLogo" class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                        <ul class="uiisar logoUrl_url">

                        </ul>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-sm-2 control-label">部门描述</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="remark" rows="3"
                                  placeholder="请输入描述，最多300个字符 ..."></textarea></div>
                </div>


                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                                class="fa fa-save"></i> 提 交
                        </button>
                    </div>
                </div>
            </div><!-- /.box-body -->
        </form>
    </section><!-- /.content -->
</@body>
<@footer>
    <script src="/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
    <script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
    <script type="application/javascript">
        var city_url = "/system/sysCity/getCityByPid";
        $("#xzqhId").change(function () {
            var cityId = $("#xzqhId").val();
            $("#cityId").val(cityId);
            //获取乡镇、街道
            $.post(city_url, {pid: cityId}, function (json) {
                if (json.code == 200) {
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
        })
        $("#xzqhId2").change(function () {
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
        })

        $("#xzqhId3").change(function () {
            var cityId = $("#xzqhId3").val();
            $("#cityId").val(cityId);
        })

        function GetValue(se, obj, id) {
            var va = $("#" + obj.vessel).val();
            if (va != "") {
                $("#" + obj.vessel).val(obj.url + "," + va);
            } else {
                $("#" + obj.vessel).val(obj.url);
            }
            for (var i = 0; i < obj.url.length; i++) {
                var html = "";
                var url = '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>' + obj.url[i];
                var fileName = obj.url[i].lastIndexOf(".");
                var fileNameLength = obj.url[i].length;
                var suffix = obj.url[i].substring(fileName + 1, fileNameLength);//截
                var array = ["JPG", "JPEG", "PNG", "GIF", "jpg", "jpeg", "png", "gif"];
                var index = $.inArray(suffix, array);
                if (index >= 0) {
                    html = '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="' + obj.vessel + '" test="' + obj.url[i] + '">&#x1006;</span>' +
                            '<img onclick="advPreviewImg(this)" src="' + url + '"> ' +
                            '</li>'
                } else {
                    html = '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="' + obj.vessel + '" test="' + obj.url[i] + '">&#x1006;</span>' +
                            '<img src="../../../images/file_wj.png"> ' +
                            '</li>'
                }
                if (se == 1) {
                    $("." + obj.vessel + "_url").html(html);
                    $("#" + obj.vessel).val(obj.url);
                } else {
                    $("." + obj.vessel + "_url").append(html);
                }

            }

            jkhae();

        }

        function jkhae() {
            $(".uiisar span").click(function () {
                $(this).next().parent().remove();
                var name = $(this).attr("name");
                var hjsgr = $("#" + name).val();
                var key = $(this).attr('test');
                var sess = (',' + hjsgr + ',').replace(',' + key + ',', ',').substr(1).replace(/,$/, '');
                $("#" + name).val(sess);
            });
        }
    </script>
<style>
    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;
    }
</style>
</@footer>