<#include "../../common/layout_dl.ftl">
<@header>
 <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tGovProjectSqcl/doEdit"
    <#else>
      action="/appc/tGovProjectSqcl/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
        <#if (entity.projectId)??>
            <input type="hidden" name="projectId" value="${(entity.projectId)}"/>
        <#else>
            <input type="hidden" name="projectId" value="${projectId!}"/>
        </#if>
    <div class="box-body">
        <div class="form-group">
            <label for="sortIdex" class="col-sm-2 control-label">序号</label>
            <div class="col-sm-10">
                <#if (entity.id)??>
                    <input type="number" class="form-control input-number-100" name="sortIdex"
                           value="${(entity.sortIdex)!}"/>
                <#--<p class="form-control no-border">${(entity.sortIdex)!}</p>-->
                <#else>
                    <input type="number" class="form-control input-number-100" name="sortIdex" value="${sortIndex!}"/>
                <#--<p class="form-control no-border">${sortIndex!}</p>-->
                </#if>
            </div>
        </div>
        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">申请材料名称<span class="xing_red">*</span></label>
            <div class="col-sm-10">
                <input type="text" id="title" name="title"
                       value="${(entity.title)!}" class="form-control" placeholder="请输入申请材料名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="rule" class="col-sm-2 control-label">申请材料依据</label>
            <div class="col-sm-10">
                <textarea type="text" id="rule" name="rule"
                          value="${(entity.rule)!}" class="form-control" placeholder="请输入申请材料依据"
                >${(entity.rule)!}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label for="ruleType" class="col-sm-2 control-label">材料类型(原件/复印件)</label>
            <div class="col-sm-10">
                <input type="text" id="ruleType" name="ruleType"
                       value="${(entity.ruleType)!}" class="form-control input-select-200" placeholder="请输入材料类型(原件/复印件)"
                />
            </div>
        </div>
        <div class="form-group">
            <label for="needDoc" class="col-sm-2 control-label">是否需电子材料</label>
            <div class="col-sm-10">
                <label>
                    <input name="needDoc" type="radio" class="minimal" value="是"
                           <#if (entity.id)??&&"${(entity.needDoc)!}"=="是">checked</#if> lay-ignore>是
                </label>
                <label>
                    <input name="needDoc" type="radio" class="minimal" value="否"
                           <#if (entity.id)??&&"${(entity.needDoc)!}"=="否">checked</#if> lay-ignore>否
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="count" class="col-sm-2 control-label">份数</label>
            <div class="col-sm-10">
                <input type="number" id="count" name="count"
                       value="${(entity.count)!}" class="form-control input-number-100" placeholder="请输入份数"
                />
            </div>
        </div>
        <div class="form-group">
            <label for="spec" class="col-sm-2 control-label">规格</label>
            <div class="col-sm-10">
                <input type="text" id="spec" name="spec"
                       value="${(entity.spec)!}" class="form-control input-number-100" placeholder="请输入规格"/>
            </div>
        </div>
        <div class="form-group">
            <label for="mustDesc" class="col-sm-2 control-label">必要性及描述</label>
            <div class="col-sm-10">
                <input type="text" id="mustDesc" name="mustDesc"
                       value="${(entity.mustDesc)!}" class="form-control" placeholder="请输入必要性及描述"/>
            </div>
        </div>
        <div class="form-group">
            <label for="source" class="col-sm-2 control-label">来源渠道</label>
            <div class="col-sm-10">
                <input type="text" id="source" name="source"
                       value="${(entity.source)!}" class="form-control" placeholder="请输入来源渠道"/>
            </div>
        </div>
        <div class="form-group">
            <label for="signCond" class="col-sm-2 control-label">签名签证要求</label>
            <div class="col-sm-10">
                <input type="text" id="signCond" name="signCond"
                       value="${(entity.signCond)!}" class="form-control" placeholder="请输入签名签证要求"/>
            </div>
        </div>
        <div class="form-group">
            <label for="canFallback" class="col-sm-2 control-label">是否容缺</label>
            <div class="col-sm-10">
                <label>
                    <input name="canFallback" type="radio" class="minimal" value="是"
                           <#if (entity.id)??&&"${(entity.canFallback)!}"=="是">checked</#if> lay-ignore>是
                </label>
                <label>
                    <input name="canFallback" type="radio" class="minimal" value="否"
                           <#if (entity.id)??&&"${(entity.canFallback)!}"=="否">checked</#if> lay-ignore>否
                </label>
            </div>
        </div>
    <#--<div class="form-group">-->
    <#--<label for="fileUrl" class="col-sm-2 control-label">空表</label>-->
    <#--<div class="col-sm-10" id="fileUrlId">-->
    <#--<input type="hidden" id="fileUrl" name="fileUrl" value="${(entity.fileUrl)!}"/>-->
    <#--<input name="file" type="file" class="file-loading" multiple id="systemLogo">-->
    <#--</div>-->
    <#--</div>-->

        <div class="form-group">
            <label for="flowChart" class="col-sm-2 control-label">空表</label>
            <div class="col-sm-10">
                <input type="hidden" id="fileUrl" name="fileUrl" value="${(entity.fileUrl)!}">
                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                   data-url="/system/accessory/add?fileQuantity=0&vessel=fileUrl&classify=sqcl_flowChart&dict=sys_project_sqcl"
                   data-width="960" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
            </div>
        </div>
        <div class="form-group">
            <label for="systemLogo" class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <ul class="uiisar fileUrl_url">

                </ul>
            </div>
        </div>

        <div class="form-group">
            <label for="flowChart" class="col-sm-2 control-label">样表</label>
            <div class="col-sm-10">
                <input type="hidden" id="sampletableUrls" name="sampletableUrls" value="${(entity.sampletableUrls)!}">
                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                   data-url="/system/accessory/add?fileQuantity=0&vessel=sampletableUrls&classify=sqcl_sampletableUrls&dict=sys_project_sqcl"
                   data-width="960" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
            </div>
        </div>
        <div class="form-group">
            <label for="systemLogo" class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <ul class="uiisar sampletableUrls_url">

                </ul>
            </div>
        </div>


        <div class="form-group">
            <label for="remark" class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <textarea type="text" id="remark" name="remark" style="width:95%;height: 200px;"
                          value="${(entity.remark)!}" class="form-control"
                          placeholder="请输入备注">${(entity.remark)!}</textarea>
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

    $(document).ready(function () {
        var htmls = "";
        var ur = '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>'
        var imgalist = "${(entity.fileUrl)!"-"}"

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
                            '<span class="layui-icon  layui-icon-close" name="fileUrl"  test="' + _p[j] + '">&#x1006;</span>' +
                            '<img onclick="advPreviewImg(this)" src="' + ur + _p[j] + '"> ' +
                            '</li>'
                } else {
                    htmls += '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="fileUrl"  test="' + _p[j] + '">&#x1006;</span>' +
                            '<img src="../../../images/file_wj.png"> ' +
                            '</li>'
                }
                $(".fileUrl_url").html(htmls);
            }
        }
        var somhtml = "";
        var sampletableUrls = "${(entity.sampletableUrls)!"-"}"
        if (sampletableUrls != "-" && sampletableUrls != "") {
            var _p = sampletableUrls.split(',');
            for (var j = 0; j < _p.length; j++) {
                var fileName = _p[j].lastIndexOf(".");
                var fileNameLength = _p[j].length;
                var suffix = _p[j].substring(fileName + 1, fileNameLength);//截
                var array = ["JPG", "JPEG", "PNG", "GIF", "jpg", "jpeg", "png", "gif"];
                var index = $.inArray(suffix, array);
                if (index >= 0) {
                    somhtml += '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="sampletableUrls"  test="' + _p[j] + '">&#x1006;</span>' +
                            '<img onclick="advPreviewImg(this)" src="' + ur + _p[j] + '"> ' +
                            '</li>'
                } else {
                    somhtml += '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="sampletableUrls"  test="' + _p[j] + '">&#x1006;</span>' +
                            '<img src="../../../images/file_wj.png"> ' +
                            '</li>'
                }
                $(".sampletableUrls_url").html(somhtml);
            }
        }
        jkhae();
    });

</script>

<style>
    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;
    }
</style>
</@footer>