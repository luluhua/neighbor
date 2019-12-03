<#include "../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.min.css">
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/appc/tAppStartupPageManage/doAdd">
    <div class="box-body">

        <div class="form-group">
            <label for="aName" class="col-sm-2 control-label">版本名称<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="aName" name="aName" class="form-control" placeholder="请输入版本名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="aName" class="col-sm-2 control-label">版本号<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="aCode" name="aCode" class="form-control input-select-200" placeholder="请输入版本号"
                       value="${(sortIndex)!''}" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="aType" class="col-sm-2 control-label">平台<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <@dictTag method="getDictListByType" type="app_type" >
                    <#list getDictListByType as m>
                                <input type="radio" name="aType" class="minimal" value="${(m.value)!}" checked
                                       lay-ignore>
                        ${(m.label)!}
                    </#list>
                </@dictTag>
            </div>
        </div>

        <div class="form-group">
            <label for="aStartupPageUrl" class="col-sm-2 control-label">启动页<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="hidden" id="aStartupPageUrl" name="aStartupPageUrl" lay-verify="required">
                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                   data-url="/system/accessory/add?fileQuantity=0&vessel=aStartupPageUrl&classify=aStartupPageUrl&dict=app_startpage_aStartupPageUrl"
                   data-width="960" data-height="650"><i class="fa fa-plus"></i> 添加图片</a>
            </div>
        </div>
        <div class="form-group">
            <label for="systemLogo" class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <ul class="uiisar aStartupPageUrl_url">
                </ul>
            </div>
        </div>


        <div class="form-group">
            <label for="aStatus" class="col-sm-2 control-label">是否启用<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                 <@dictTag method="getDictListByType" type="is_yes_no" >
                     <#list getDictListByType as m>
                                <input type="radio" name="aStatus" class="minimal" value="${(m.value)!}" checked
                                       lay-ignore>
                         ${(m.label)!}
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