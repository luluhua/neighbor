<#include "../../common/layout_dl.ftl">
<@header>
 <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
      <#if (entity.id)??>action="/appc/tGovTheme/doEdit"<#else>action="/appc/tGovTheme/doAdd"</#if>>
    <div class="box-body">
        <input type="hidden" name="id" value="${(entity.id)!}"/>
        <div class="form-group">
            <label for="processCode" class="col-sm-2 control-label">服务类型<span
                    class="xing_red"> *</span></label>
            <div class="col-sm-4">
                <select id="serviceType" name="serviceType" class="form-control select2 input-select-200"
                        lay-ignore
                        style="width: 100%;"
                        lay-verify="required">
                    <option value="" disabled selected>--请选择服务类型--</option>
                    <@dictTag method="getDictListByType" type="service_type" >
                        <#list getDictListByType as m>
                            <option value="${(m.value)!}"
                                <#if "${(m.value)!}"=="${(entity.serviceType)!}">
                                    selected
                                </#if>
                            >${(m.label)!}</option>
                        </#list>
                    </@dictTag>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="themeType" class="col-sm-2 control-label">主题类型<span
                    class="xing_red"> *</span></label>
            <div class="col-sm-4">
                <select name="themeType" class="form-control select2 input-select-200" lay-ignore style="width: 100%;"
                        lay-verify="required">
                    <option value="" disabled <#if !(entity.themeType)??>selected</#if>>--请选择主题类型--</option>
                    <@dictTag method="getDictListByType" type="theme_type" >
                        <#list getDictListByType as m>
                            <option <#if "${(m.value)!}"=="${(entity.themeType)!}">selected</#if>
                                    value="${(m.value)!}">${(m.label)!}</option>
                        </#list>
                    </@dictTag>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="themeTitle" class="col-sm-2 control-label">主题名称<span
                    class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="themeTitle" name="themeTitle" value="${(entity.themeTitle)!}"
                       class="form-control input-title-500" placeholder="请输入主题名称" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">主题编号<span
                    class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="code" name="code" value="${(entity.code)!}" class="form-control input-title-500"
                       placeholder="请输入主题编号" lay-verify="required"/>
            </div>
        </div>

        <div class="form-group">
            <label for="themeUrl" class="col-sm-2 control-label">跳转链接（保留字段）</label>
            <div class="col-sm-10">
                <input type="text" id="themeUrl" name="themeUrl" value="${(entity.themeUrl)!}"
                       class="form-control input-title-500"
                       placeholder="请输入跳转链接"/>
            </div>
        </div>
        <div class="form-group">
            <label for="isEnabled" class="col-sm-2 control-label">是否可用<span
                    class="xing_red"> *</span>
            </label>
            <div class="col-sm-10">
                <@dictTag method="getDictListByType" type="is_enabled" >
                    <#list getDictListByType as m>
                         <label>
                             <input name="isEnabled" type="radio" class="minimal"
                                    <#if "${(m.value)!}"=="${(entity.isEnabled)!}">checked</#if> value="${(m.value)!}"
                                    lay-ignore> ${(m.label)!}
                         </label>
                    </#list>
                </@dictTag>
            </div>
        </div>
        <div class="form-group">
            <label for="sortIndex" class="col-sm-2 control-label">排序（数字越大越前）</label>
            <div class="col-sm-10">
                <input type="number" id="sortIndex" name="sortIndex" class="form-control input-number-100"
                       value="${(entity.sortIndex)!}"
                       placeholder="请输入排序（数字越大越前）"/>
            </div>
        </div>
        <div class="form-group">
            <label for="themeUrl" class="col-sm-2 control-label">主题图标</label>
            <input type="hidden" value="${(entity.themeIcon)!}" id="themeIcon" name="themeIcon">
            <div class="col-sm-1" id="uysr">
                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                   data-url="/system/accessory/add?fileQuantity=1&vessel=themeIcon&classify=themeIcon&dict=themeIcon"
                   data-width="960" data-height="500"><i class="fa fa-plus"></i> 添加附件</a>
            </div>
        </div>
        <div class="form-group">
            <label for="systemLogo" class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <ul class="uiisar themeIcon_url">
                     <#if entity.themeIcon?? && entity.themeIcon!="" >
                         <li>
                             <span class="layui-icon  layui-icon-close" name="themeIcon"
                                   test="${(entity.themeIcon)!''}">&#x1006;</span>
                             <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.themeIcon)!''}">
                         </li>
                     </#if>
                </ul>
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>
                    提 交
                </button>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
<script src="/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<script src="/app/js/file-upload.js"></script>
  <script>
      $(document).ready(function () {
          jkhae();
      });

      function GetValue(se, obj, id) {
          // var html = "";
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