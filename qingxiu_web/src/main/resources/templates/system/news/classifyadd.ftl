<#include "../../common/layout_dl.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/cms/tCmsClassify/doAdd">
    <div class="box-body">
        <input name="pId" type="hidden" value="#{(pid)}">
        <input type="hidden" id="crt" name="crt" value="${crt}"
               lay-verify="required"/>
        <div class="form-group">
            <label for="classifyName" class="col-sm-3 control-label">分类名称：<span class="xing_red ">*</span></label>
            <div class="col-sm-5">
                <input type="text" id="classifyName" name="classifyName" class="form-control input-select-200"
                       placeholder="请输入分类名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class=" form-group">
            <label for="sortIndex" class="col-sm-3 control-label">排序：<span class="xing_red ">*</span></label>
            <div class="col-sm-5">
                <input type="number" id="sortIndex" name="sortIndex" class="form-control input-number-100"
                       value="${(sortIndexs)}" lay-verify="required|number"/>
            </div>
        </div>

        <div class="form-group">
            <input type="hidden" id="iconurl" name="iconurl" class="form-control"/>
            <label for="systemLogo" class="col-sm-3 control-label">图标：</label>
            <div class="col-sm-1" id="uysr">
                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                   data-url="/system/accessory/add?fileQuantity=1&vessel=iconurl&classify=${(crt)!}&dict=cms_article"
                   data-width="960" data-height="400"><i class="fa fa-plus"></i> 添加附件</a>
            </div>
        </div>
        <div class="form-group">
            <label for="systemLogo" class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <ul class="uiisar iconurl_url">
                </ul>
            </div>
        </div>


    <#--<div class=" form-group">-->
    <#--<label for="sortIndex" class="col-sm-3 control-label">图标：<span class="xing_red ">*</span></label>-->
    <#--<input type="hidden" id="iconurl" name="iconurl" class="form-control input-number-100"/>-->
    <#--<div class="col-sm-3">-->
    <#--<input style="width: 80px;margin-right: 20px" name="file" type="file" class="file-loading"-->
    <#--id="systemLogos">-->
    <#--</div>-->
    <#--</div>-->

        <div class=" form-group">
            <label class="col-sm-3 control-label">&nbsp;</label>
            <div class="col-sm-5">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                        class="fa fa-save"></i>
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
<script>

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