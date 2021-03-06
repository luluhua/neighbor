<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/system/tNavigation/doEdit"
    <#else>
      action="/system/tNavigation/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称</label>
            <div class="col-sm-10">
                <input type="text" id="name" name="name"
                       value="${(entity.name)!}" class="form-control input-select-200" placeholder="请输入名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">code</label>
            <div class="col-sm-10">
                <input type="text" id="code" name="code"
                       value="${(entity.code)!}" class="form-control input-select-200" placeholder="请输入code"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="skipUrl" class="col-sm-2 control-label">跳转URL</label>
            <div class="col-sm-10">
                <input type="text" id="skipUrl" name="skipUrl"
                       value="${(entity.skipUrl)!}" class="form-control nput-title-500" placeholder="请输入跳转URL"/>
            </div>
        </div>
        <div class="form-group">
            <label for="sortIndex" class="col-sm-2 control-label">排序</label>
            <div class="col-sm-10">
                <input type="number" id="sortIndex" name="sortIndex"
                       value="<#if (entity.id)??>${(entity.sortIndex)!}<#else >${(sortIndex)!}</#if>"
                       class="form-control input-number-100" placeholder="请输入排序"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="icon" class="col-sm-2 control-label">图标</label>
            <input type="hidden" id="icon" name="icon"
                   value="${(entity.icon)!}" class="form-control" placeholder="请输入图标"
            />
            <div class="col-sm-1" id="uysr">
                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                   data-url="/system/accessory/add?fileQuantity=1&vessel=icon&classify=navigation&dict=navigation"
                   data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
            </div>
        </div>
        <div class="form-group">
            <label for="systemLogo" class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <ul class="uiisar icon_url">
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
    function GetValue(se, obj, id) {
        // var html = "";
        for (var i = 0; i < obj.url.length; i++) {
            var html = "";
            var url = '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>' + obj.url[i];
            var fileName = obj.url[i].lastIndexOf(".");
            var fileNameLength = obj.url[i].length;
            var suffix = obj.url[i].substring(fileName + 1, fileNameLength);//截
            var array = ["JPG", "JPEG", "PNG", "GIF", "jpg", "jpeg", "png", "gif"];
            var index = $.inArray(suffix, array);
            if (obj.vessel == "editor_id") {
                if (index >= 0) {
                    $("#remoteUrl").val(url);
                } else {
                    layer.msg('此处只能插入图片!', {
                        time: 1000,
                        end: function () {
                        }
                    })
                }
            } else {
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
            }
            if (se == 1) {
                $("." + obj.vessel + "_url").html(html);
                $("#" + obj.vessel).val(obj.url);
            } else {
                $("." + obj.vessel + "_url").append(html);
                var va = $("#" + obj.vessel).val();
                if (va != "") {
                    $("#" + obj.vessel).val(obj.url + "," + va);
                } else {
                    $("#" + obj.vessel).val(obj.url);
                }
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
        var imgalist = "${(entity.icon)!""}"
        if (imgalist != "") {
            htmls += '<li>' +
                    '<span class="layui-icon  layui-icon-close" name="icon"  test="' + imgalist + '">&#x1006;</span>' +
                    '<img onclick="advPreviewImg(this)" src="' + ur + imgalist + '"> ' +
                    '</li>'
            $(".uiisar").html(htmls);
            jkhae();
        }

    });

</script>
<style>


    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;

    }

    .uiisar li img {
        width: 96%;
    }

    .uiisar li span {
        width: 16px;
        height: 16px;
        border-radius: 8px;
        display: block;
        position: relative;
        font-size: 14px;
        color: #fff;
        background-color: red;
        left: 100%;
        top: -5px;
        text-align: center;
    }
</style>
</@footer>