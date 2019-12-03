<#include "../../common/layout_dl.ftl">
<@header>
 <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/system/tSysOrgSignature/doEdit"
    <#else>
      action="/system/tSysOrgSignature/doAdd"
    </#if>
>
    <#if (entity.id)??>
        <input type="hidden" name="id" value="${(entity.id)}"/>
    </#if>
    <input type="hidden" name="orgId" id="orgId" value="${(entity.orgId)}"/>
    <div class="box-body">
        <div class="form-group">
            <label for="sortIndex" class="col-sm-2 control-label">排序</label>
            <div class="col-sm-10">
                <input type="number" id="sortIndex" name="sortIndex" class="form-control input-number-100"
                       value="${(entity.sortIndex)!}"
                       placeholder="请输入排序"/>
            </div>
        </div>
        <div class="form-group">
            <label for="signatureName" class="col-sm-2 control-label">印章名称</label>
            <div class="col-sm-10">
                <input type="text" id="signatureName" name="signatureName" value="${(entity.signatureName)!}"
                       class="form-control input-title-500"
                       placeholder="请输入印章名称"/>
            </div>
        </div>
        <div class="form-group">
            <label for="flowChart" class="col-sm-2 control-label">电子印章</label>
            <input type="hidden" id="signatureFile" name="signatureFile" value="${(entity.signatureFile)!}">
            <div class="col-sm-10">
                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                   data-url="/system/accessory/add?fileQuantity=1&vessel=signatureFile&classify=signature&dict=signature"
                   data-width="960" data-height="500"><i class="fa fa-plus"></i> 添加附件</a>
            </div>
            <div class="form-group">
                <label for="systemLogo" class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <ul class="uiisar signatureFile_url">
                     <#if entity.signatureFile?? && entity.signatureFile!="" >
                         <li>
                             <span class="layui-icon  layui-icon-close" name="signatureFile"
                                   test="${(entity.signatureFile)!''}">&#x1006;</span>
                             <@commonTags method="getFileSuffix" type="1" value="${(entity.signatureFile)!'--'}">
                                 <#if getFileSuffix==0>
                                     <img onclick="advPreviewImg(this)"
                                          src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.signatureFile)!''}">
                                 <#else>.
                                     <img onclick="advPreviewImg(this)"
                                          class="imgdows"
                                          src="../../../images/file_wj.png">
                                 </#if>
                             </@commonTags>
                         </li>
                     </#if>
                    </ul>
                </div>
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