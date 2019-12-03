<#include "../../common/layout_dl.ftl">
<@header>
  <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
    <form role="form" class="form-horizontal layui-form layui-form-pane" method="post" action="/tSysOrg/dept/doEdit">
        <input type="hidden" name="id" value="${(dept.id)!}"/>
        <input id="cityId" type="hidden" name="cityId" value="${(city.id?c)!}">
        <input id="lngId" type="hidden" name="lng" value="${(dept.lng?c)!}">
        <input id="latId" type="hidden" name="lat" value="${(dept.lat?c)!}">
        <div class="box-body">

            <div class="form-group">
                <label for="deptName" class="col-sm-2 control-label">行政区域</label>
                <div class="col-sm-10">
                        ${(city.name)!} <a href="javascript:void(0);" class="upAbt" onclick="upCity();">修改行政区域</a>
                    <div id="cityDiv" class="cityDiv">
                        <select id="xzqhId"  class="form-control select2 input-select-200" lay-ignore>
                            <option value="">--县（区）--</option>
                         <#list sysCityList as m>
                             <option value="${(m.id?c)!}"  <#if (m.id?c)=='2924'>selected</#if>>${(m.name)!}</option>
                         </#list>
                        </select>
                        <select id="xzqhId2"  class="form-control select2 input-select-200" lay-ignore>
                            <option value="">--请选择乡镇、街道--</option>
                        </select>
                        <select id="xzqhId3"  class="form-control select2 input-select-200" lay-ignore>
                            <option value="">--请选择社区、村委--</option>
                        </select>

                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="deptName" class="col-sm-2 control-label">父级部门</label>
                <div class="col-sm-10">
                    <select name="pid" class="form-control select2 input-select-200" lay-verify="required" lay-ignore>
                        <option value="0"> --请选择父级部门--</option>
            <#list list as m>
              <option value="${(m.id)!}" ${(m.id==dept.pid)?string('selected="selected"','')}> ${(m.name)!}</option>
            </#list>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="deptName" class="col-sm-2 control-label">机构代码<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="code" name="code" class="form-control input-select-200" lay-verify="required"
                           value="${(dept.code)!}"
                           placeholder="请输入机构代码">
                </div>
            </div>
            <div class="form-group">
                <label for="deptName" class="col-sm-2 control-label">部门名称<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="name" name="name" class="form-control input-select-200" lay-verify="required"
                           value="${(dept.name)!}"
                           placeholder="请输入部门名称">
                </div>
            </div>
            <div class="form-group">
                <label for="deptName" class="col-sm-2 control-label">部门类型</label>
                <div class="col-sm-10">
                    <input type="hidden" id="orgType" name="orgType" value="${(dept.orgType)!}">
                    <#--<select name="sasf" id="getorgType" multiple class="form-control select2 input-select-200"-->
                            <#--lay-verify="required"-->
                            <#--lay-ignore>-->
                        <#--<option value="0" <#if (dept)??&&dept.orgType==0>selected</#if>> --请选择--</option>-->
                        <#--<@dictTag method="getDictListByType" type="dept_type" >-->
                            <#--<#list getDictListByType as m>-->
                        <#--<option value="${(m.value)!}"-->
                                <#--<#if (dept)??&&(m.value==((dept.orgType)?c))>selected</#if> >${(m.label)!}</option>-->
                            <#--</#list>-->
                        <#--</@dictTag>-->
                    <#--</select>-->
                    <select name="sasf" id="getorgType" class="form-control select2 input-select-200"
                            lay-verify="required"
                            lay-ignore>
                        <option value="0" <#if (dept)??&&dept.orgType==0>selected</#if>> --请选择--</option>
                        <@dictTag method="getDictListByType" type="dept_type" >
                            <#list getDictListByType as m>
                        <option value="${(m.value)!}"
                                <#if (dept)??&&(m.value==((dept.orgType)?c))>selected</#if> >${(m.label)!}</option>
                            </#list>
                        </@dictTag>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="abbreviation" class="col-sm-2 control-label">部门简称</label>
                <div class="col-sm-10">
                    <input type="text" id="abbreviation" name="abbreviation" class="form-control input-select-200"
                           lay-verify="required"
                           value="${(dept.abbreviation)!}"
                           placeholder="请输入部门简称">
                </div>
            </div>
            <div class="form-group">
                <label for="deptName" class="col-sm-2 control-label">部门图标<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="hidden" value="${(dept.logoUrl)!}" id="logoUrl" name="logoUrl">
                    <div class="form-group">
                        <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                           data-url="/system/accessory/add?fileQuantity=1&vessel=logoUrl&classify=dept_logoUrl&dict=dept_file"
                           data-width="960" data-height="650"><i class="fa fa-plus"></i> 添加图标</a>

                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="systemLogo" class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <ul class="uiisar logoUrl_url">
                            <#if dept.logoUrl?? && dept.logoUrl!="" >
                                <li>
                                      <span class="layui-icon  layui-icon-close" name="logoUrl"
                                            test="${( dept.logoUrl)!''}">&#x1006;</span>
                                          <@commonTags method="getFileSuffix" type="1" value="${( dept.logoUrl)!'--'}">
                                              <#if getFileSuffix==0>
                                                  <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${( dept.logoUrl)!''}">
                                              <#else>
                                                   <img class="imgdows" src="../../../images/file_wj.png">
                                              </#if>
                                          </@commonTags>
                                </li>
                            </#if>
                    </ul>
                </div>
            </div>

            <div class="form-group">
                <label for="deptName" class="col-sm-2 control-label">实景图</label>
                <input type="hidden" id="promotionalImage" value="${(dept.promotionalImage)!}" name="promotionalImage">
                <div class="col-sm-10">
                    <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                       data-url="/system/accessory/add?fileQuantity=0&vessel=promotionalImage&classify=dept_promotionalImage&dict=dept_file"
                       data-width="960" data-height="650"><i class="fa fa-plus"></i> 添加实景图</a>
                </div>
            </div>
            <div class="form-group">
                <label for="systemLogo" class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <ul class="uiisar promotionalImage_url">

                    </ul>
                </div>
            </div>
            <div class="form-group">
                <label for="deptName" class="col-sm-2 control-label">联系电话<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="telPhone" name="telPhone" class="form-control input-select-200"
                           lay-verify="required|mobile"
                           value="${(dept.telPhone)!}"
                           placeholder="请输入联系电话">
                </div>
            </div>

            <div class="form-group">
                <label for="deptName" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="sortIndex" name="sortIndex" class="form-control input-select-200"
                           lay-verify="required"
                           value="${(dept.sortIndex)!}"
                           placeholder="请输入排序编号">
                </div>
            </div>
            <div class="form-group">
                <label for="deptName" class="col-sm-2 control-label">联系地址<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="address" name="address" class="form-control dialog_param"
                           lay-verify="required" readonly
                           data-title="选择地址"
                           data-url="/toMap" data-par="${(dept.lng?c)!},${(dept.lat?c)!}"
                           ,data-width="300" data-height="400"
                           value="${(dept.address)!}"
                           placeholder="请输入联系地址">
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱地址</label>
                <div class="col-sm-10">
                    <input type="text" id="email" name="email" value="${(dept.email)!}"
                           class="form-control input-select-200" lay-verify="" placeholder="请输入邮箱地址">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">部门描述</label>
                <div class="col-sm-10">
                    <textarea class="form-control" name="remark" rows="3"
                              placeholder="请输入描述，最多300个字符 ...">${(dept.remark)!}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">公交路线</label>
                <div class="col-sm-10">
                    <textarea class="form-control" name="busRoute" rows="3"
                              placeholder="请输入公交路线,最多300个字符 ...">${(dept.busRoute)!}</textarea></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                            class="fa fa-save"></i> 提 交
                    </button>
                </div>
            </div>
        </div>
    </form>
</@body>
<@footer>
  <script>

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

      $(document).ready(function () {
          var htmls = "";
          var ur = '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>'
          var imgalist = "${(dept.promotionalImage)!'-'}"
          if (imgalist != "-" && imgalist != "") {
              var _p = imgalist.split(',');
              for (var j = 0; j < _p.length; j++) {
                  var fileName = _p[j].lastIndexOf(".");
                  var fileNameLength = _p[j].length;
                  var suffix = _p[j].substring(fileName + 1, fileNameLength);//截
                  var array = ["JPG", "JPEG", "PNG", "GIF", "jpg", "jpeg", "png", "gif"];
                  var index = $.inArray(suffix, array);
                  if (index >= 0) {
                      htmls += '<li>' +
                              '<span class="layui-icon  layui-icon-close" name="promotionalImage"  test="' + _p[j] + '">&#x1006;</span>' +
                              '<img onclick="advPreviewImg(this)" src="' + ur + _p[j] + '"> ' +
                              '</li>'
                  } else {
                      htmls += '<li>' +
                              '<span class="layui-icon  layui-icon-close" name="promotionalImage"  test="' + _p[j] + '">&#x1006;</span>' +
                              '<img src="../../../images/file_wj.png"> ' +
                              '</li>'
                  }
                  $(".promotionalImage_url").html(htmls);
              }
          }
          jkhae();
      });
      $('#getorgType').on("change", function () {
          var obj = this;
          var themeVal = "";
          for (var i = 0; i < obj.options.length; i++) {
              if (obj.options[i].selected) {
                  themeVal += obj.options[i].value + ",";
              }
          }
          $("#orgType").val(themeVal.substring(0, themeVal.length - 1));
      });
  </script>
<style>
    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;
    }
    .upAbt{
        font-size: 13xp;
        color: dodgerblue;
        margin-left: 10px;
    }
    .cityDiv{
        clear: both;
        display: none;
    }
</style>

<script>

    var city_url = "/system/sysCity/getCityByPid";
    var _cityId = "2924";
    var _streeId = "";
    var _communityId = "";
    //初始化青秀区-社区或村委
    if (_cityId) {
        stree(_cityId);
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
    $("#xzqhId").change(function () {
        var cityId = $("#xzqhId").val();
        //获取乡镇、街道
        stree(cityId);
        $("#cityId").val(cityId);
    });
    $("#xzqhId2").change(function () {
        var cityId = $("#xzqhId2").val();
        community(cityId);
        $("#cityId").val(cityId);
    })
    $("#xzqhId3").change(function () {
        var cityId = $("#xzqhId3").val();
        $("#cityId").val(cityId);
    })
    //修改行政区域
    function upCity() {
        $("#cityDiv").show();
    }
</script>
</@footer>