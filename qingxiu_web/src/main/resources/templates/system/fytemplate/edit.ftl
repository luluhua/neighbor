<#include "../../common/layout_dl.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/system/fyTemplate/doEdit"
    <#else>
      action="/system/fyTemplate/doAdd"
    </#if>
>
        <#if (entity.id)??><input id="id" type="hidden" name="id" value="${(entity.id)}"/>
        <#else >
         <input type="hidden" id="id" name="id" value="${(uuid)}"/>
        </#if>

    <div class="box-body">
        <div class="form-group">
            <label for="docType" class="col-sm-2 control-label">类型：</label>
            <div class="col-sm-10">
                <select id="docType" name="docType" class="form-control select2 input-select-200" lay-ignore
                        selected="selected">
                    <option value="">--选择类型--</option>
                         <@dictTag method="getDictListByType" type="doc_type" >
                             <#list getDictListByType as m>
                              <option selected="selected" value="${(m.value)!}">${(m.label)!}</option>
                             </#list>
                         </@dictTag>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="docClassify" class="col-sm-2 control-label">分类：</label>
            <div class="col-sm-10">
                <select id="docClassify" name="docClassify" class="form-control select2 input-select-200"
                        lay-verify="required"
                        lay-ignore>
                    <#if (entity.id)??>
                        <#list classifiy as cl>
                         <option value="${(cl.id)!}"
                            <#if "${(cl.id)!}"=="${(entity.docClassify)!}">selected</#if>>${(cl.name)!}</option>
                        </#list>

                    <#else >
                         <option lay-verify="required" value="">--请选择--</option>
                    </#if>
                </select>


                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">标题：</label>
            <div class="col-sm-10">
                <input type="text" id="title" name="title"
                       value="${(entity.title)!}" class="form-control" placeholder="请输入标题"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="url" class="col-sm-2 control-label">上传模板</label>
            <div class="col-sm-10">
                <input type="hidden" id="url" name="url"
                       value="${(entity.url)!}" class="form-control"
                       lay-verify="required"/>
                <input type="hidden" id="filename" name="filename"
                       value="${(entity.filename)!}" class="form-control"
                       lay-verify="required"/>
                <div class="col-sm-3">
                    <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                       data-url="/system/accessory/add?fileQuantity=1&vessel=url&classify=fytemplate&dict=fytemplate"
                       data-width="960" data-height="650"><i class="fa fa-plus"></i> 添加附件</a>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="systemLogo" class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <ul class="uiisar url_url">
                    <#if (entity.url)??>
                              <#if entity.url!="" >
                                  <li>
                                      <span class="layui-icon  layui-icon-close" name="url"
                                            test="${(entity.url)!''}">&#x1006;</span>
                                          <@commonTags method="getFileSuffix" type="1" value="${(entity.url)!'--'}">
                                              <#if getFileSuffix==0>
                                                  <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.url)!''}">
                                              <#else>
                                                   <img class="imgdows" src="../../../images/file_wj.png">
                                              </#if>
                                          </@commonTags>
                                  </li>
                              </#if>
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
<script>
    $("#docType").on('change', function () {
        var type = $(this).val();
        $.post('/system/fyTemplate/json?_dc=' + new Date().getTime(), {type: type}, function (response) {
            if (response.code == 200) {
                $("#docClassify").empty();
                $("#docClassify").select2({
                    data: response.data
                });
            }
        });
    });
</script>

<script>

    $(document).ready(function () {
        jkhae();
    });

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
                $("#filename").val(obj.fileoldName);
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
            $("#filename").val("");
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