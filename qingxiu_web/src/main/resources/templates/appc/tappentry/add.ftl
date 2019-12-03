<#include "../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/appc/tAppEntry/doAdd">
    <input type="hidden" name="pid" value="${(pid)!}">
    <input type="hidden" name="moduleId" value="${(tAppEntry.moduleId)!}">
    <div class="box-body">
        <div class="form-group">
            <label for="pid" class="col-sm-2 control-label">分組</label>
            <div class="col-sm-10">
                ${(tAppEntry.titile)!}
            </div>
        </div>
        <div class="form-group">
            <label for="titile" class="col-sm-2 control-label">应用代码<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="code" name="code" value="${(code)!}" class="form-control input-title-700" placeholder="请输入编码"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="titile" class="col-sm-2 control-label">应用名称<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="titile" name="titile" class="form-control input-title-700" placeholder="请输入标题"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="brief" class="col-sm-2 control-label">摘要</label>
            <div class="col-sm-10">
                <input type="text" id="brief" name="brief" class="form-control input-title-700" placeholder="请输入摘要"
                       lay-verify="brief"/>
            </div>
        </div>
        <div class="form-group">
            <label for="actionType" class="col-sm-2 control-label">动作类型<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <select name="actionType" class="form-control select2 input-select-200" lay-verify="required"
                        lay-ignore>
                        <@dictTag method="getDictListByType" type="action_type" >
                            <#list getDictListByType as m>
                                <option value="${(m.value)!}">${(m.label)!}</option>
                            </#list>
                        </@dictTag>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="actionPage1" class="col-sm-2 control-label">动作目标地址/跳转页面(android)</label>
            <div class="col-sm-10">
                <input type="text" id="actionPage1" name="actionPage1" class="form-control input-title-700"
                       placeholder="请输入动作目标地址/跳转页面(android)"/>
            </div>
        </div>
        <div class="form-group">
            <label for="actionPage2" class="col-sm-2 control-label">动作目标地址/跳转页面(ios)</label>
            <div class="col-sm-10">
                <input type="text" id="actionPage2" name="actionPage2" class="form-control input-title-700"
                       placeholder="请输入动作目标地址/跳转页面(ios)"/>
            </div>
        </div>
        <div class="form-group">
            <label for="appDownloadUrl1" class="col-sm-2 control-label">第三方app下载地址(android)</label>
            <div class="col-sm-10">
                <input type="text" id="appDownloadUrl1" name="appDownloadUrl1" class="form-control input-title-700"
                       placeholder="第三方app下载地址(android)"/>
            </div>
        </div>
        <div class="form-group">
            <label for="appDownloadUrl2" class="col-sm-2 control-label">第三方app下载地址(ios)</label>
            <div class="col-sm-10">
                <input type="text" id="appDownloadUrl2" name="appDownloadUrl2" class="form-control input-title-700"
                       placeholder="第三方app下载地址(ios)"/>
            </div>
        </div>
        <div class="form-group">
            <input type="hidden" id="icon" name="icon" value="" class="form-control"/>
            <label for="systemLogo" class="col-sm-2 control-label">应用图标：</label>
            <div class="col-sm-3">
                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                   data-url="/system/accessory/add?fileQuantity=1&vessel=icon&classify=entry_icon&dict=app_entry"
                   data-width="1000" data-height="650"><i class="fa fa-plus"></i> 添加图标</a>
            </div>
        </div>
        <div class="form-group">
            <label for="systemLogo" class="col-sm-2 control-label"></label>
            <div class="col-sm-2">
                <ul class="uiisar icon_url">

                </ul>
            </div>
        </div>
        <div class="form-group">
            <input type="hidden" id="qrcode" name="qrcode" value="" class="form-control"/>
            <label for="systemQrcode" class="col-sm-2 control-label">应用二维码：</label>
            <div class="col-sm-3">
                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                   data-url="/system/accessory/add?fileQuantity=1&vessel=qrcode&classify=entry_qrcode&dict=app_entry"
                   data-width="1000" data-height="650"><i class="fa fa-plus"></i> 添加二维码</a>
            </div>
        </div>
        <div class="form-group">
            <label for="systemLogo" class="col-sm-2 control-label"></label>
            <div class="col-sm-2">
                <ul class="uiisar qrcode_url">

                </ul>
            </div>
        </div>


        <div class="form-group">
            <label for="qrcodeType" class="col-sm-2 control-label">应用类型</label>
            <div class="col-sm-10">
                <select name="qrcodeType" class="form-control select2 input-select-200" lay-ignore>
                        <@dictTag method="getDictListByType" type="qrcode_type" >
                            <#list getDictListByType as m>
                              <option value="${(m.value)!}" ${(m.value=='0')?string('selected','')}>${(m.label)!}</option>
                            </#list>
                        </@dictTag>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="webContent" class="col-sm-2 control-label">webContent</label>
            <div class="col-sm-10">
                         <textarea name="webContent" cols="100" rows="100"
                                   style="height:100px;"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="explain" class="col-sm-2 control-label">应用说明/版权信息</label>
            <div class="col-sm-10">
                         <textarea name="explain" cols="100" rows="100"
                                   style="height:100px;"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="sortIndex" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="number" id="sortIndex" name="sortIndex" lay-verify="required"
                       class="form-control input-select-200" placeholder="请输入排序" value="${(sortIndex)}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="hot" class="col-sm-2 control-label">热门<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <label>
                    <input name="hot" type="radio" class="minimal" checked value="1" lay-ignore> 是
                </label>
                <label>
                    <input name="hot" type="radio" class="minimal" value="0" lay-ignore> 否
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="recommend" class="col-sm-2 control-label">推荐<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <label>
                    <input name="recommend" type="radio" class="minimal" checked value="1" lay-ignore> 是
                </label>
                <label>
                    <input name="recommend" type="radio" class="minimal" value="0" lay-ignore> 否
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="isEnabled" class="col-sm-2 control-label">启用<span class="xing_red"> *</span></label>
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
    <script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
   <script src="/app/js/file-upload.js?v=11"></script>
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