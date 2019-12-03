<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <small><a href="/dj/tDjMeeting/list/1">
                党员活动（会议） </a> >
                添加/编辑
            </small>
        </h1>
        <button type="submit"
                style="z-index:9999; width: 100px;right: 10px;float: right;margin-top: -20px;margin-bottom: 10px;"
                class="btn btn-primary" onclick="goBack()">返回
        </button>
    </section>
    <section class="content">
        <form class="form-horizontal layui-form layui-form-pane" method="post"
                    <#if (entity.id)??>
                      action="/dj/tDjMeeting/doEdit"
                    <#else>
                      action="/dj/tDjMeeting/doAdd"
                    </#if>
        >
                    <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="mtClassify" class="col-sm-2 control-label">会议分类</label>
                                <div class="col-sm-10">
                                    <select id="mtClassify" name="mtClassify"
                                            class="form-control select2 input-select-200"
                                            lay-ignore
                                            lay-verify="required">
                                        <option value="" disabled selected>--请选择会议分类--</option>
                                <@dictTag method="getDictListByType" type="mt_classify" >
                                    <#list getDictListByType as m>
                                       <option value="${(m.value)!}"
                                        <#if "${(m.value)!}"=="${(entity.mtClassify)!}">
                                             selected
                                        </#if>
                                       >${(m.label)!}</option>
                                    </#list>
                                </@dictTag>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="djOrgName" class="col-sm-2 control-label">党组织</label>
                                <div class="col-sm-10">
                                    <input type="hidden" id="isDgw" name="isDgw" />
                                    <input type="hidden" id="djOrgName" name="djOrgName"
                                           value="${(entity.djOrgName)!}"/>
                                    <select id="djOrgId" name="djOrgId" class="form-control select2 input-title-500"
                                            lay-verify="required" lay-ignore>
                                        <option value='' <#if !(entity.djOrgId)??>selected</#if>>--请选择党组织--</option>
                                        <#list orgList as org>
                                            <option value="${(org.id)}"
                                                    <#if (entity.djOrgId)??&&entity.djOrgId==org.id>selected</#if> >${(org.name)!}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="title" class="col-sm-2 control-label">会议标题</label>
                                <div class="col-sm-10">
                                    <input type="text" id="title" name="title"
                                           value="${(entity.title)!}" class="form-control" placeholder="请输入会议标题"
                                           lay-verify="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtTheme" class="col-sm-2 control-label">会议主题</label>
                                <div class="col-sm-10">
                                    <input type="text" id="mtTheme" name="mtTheme"
                                           value="${(entity.mtTheme)!}" class="form-control" placeholder="请输入会议主题"
                                           lay-verify="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dtMeeting" class="col-sm-2 control-label">会议时间</label>
                                <div class="col-sm-10">
                                    <input type="text"
                                           class="form-control date input-select-200"
                                           id="dtMeeting" name="dtMeetingStr"
                                           value="${(entity.dtMeeting?string('yyyy-MM-dd HH:mm:ss'))!}"
                                           placeholder="选择会议时间"
                                           lay-verify="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">会议地点</label>
                                <div class="col-sm-10">
                                    <input type="text" id="address" name="address"
                                           value="${(entity.address)!}" class="form-control" placeholder="请输入会议地点"
                                           lay-verify="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtType" class="col-sm-2 control-label">会议类型</label>
                                <div class="col-sm-10">
                                    <select id="mtType" name="mtType" class="form-control select2 input-select-200"
                                            lay-ignore
                                            lay-verify="required">
                                        <option value="" disabled selected>--请选择会议类型--</option>
                                 <#list mtTypeList as m>
                                       <option value="${(m.value)!}"
                                        <#if "${(m.value)!}"=="${(entity.mtType)!}">
                                             selected
                                        </#if>
                                       >${(m.label)!}</option>
                                 </#list>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="participants" class="col-sm-2 control-label">参会人员</label>
                                <div class="col-sm-10">
                            <textarea id="participants" name="participants"
                                      value="${(entity.participants)!}" rows="3" class="form-control"
                                      placeholder="请输入参会人员"
                                      lay-verify="required">${(entity.participants)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="numberOfAbsences" class="col-sm-2 control-label">缺席人数</label>
                                <div class="col-sm-10">
                                    <input type="number" id="numberOfAbsences" name="numberOfAbsences"
                                           value="${(entity.numberOfAbsences)!}" class="form-control input-number-100"
                                           placeholder="请输入缺席人数"
                                           lay-verify="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="attendance" class="col-sm-2 control-label">出席人数</label>
                                <div class="col-sm-10">
                                    <input type="number" id="attendance" name="attendance"
                                           value="${(entity.attendance)!}" class="form-control input-number-100"
                                           placeholder="请输入出席人数"
                                           lay-verify="required"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtContent" class="col-sm-2 control-label">会议内容</label>
                                <div class="col-sm-10">
                            <textarea id="editor_id" name="mtContent"
                                      rows="4" class="form-control" placeholder="请输入会议内容"
                                      lay-verify="required">${(entity.mtContent)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group" hidden id="result_div">
                                <label for="numberOfAbsences" class="col-sm-2 control-label">会议结果</label>
                                <div class="col-sm-10">
                                    <input type="text" id="result" name="result"
                                           value="${(entity.result)!}" class="form-control"
                                           placeholder="请输入会议结果"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtFile" class="col-sm-2 control-label">会议图片</label>
                                <div class="col-sm-10" id="uysr">
                                    <input type="hidden" id="mtFile" name="mtFile" value="${(entity.mtFile)!}">
                                    <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                                       data-url="/system/accessory/add?fileQuantity=10&vessel=mtFile&classify=mtFile&dict=dj_file"
                                       data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtFile" class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <ul class="uiisar mtFile_url">
                                        <#if (entity.mtFile)?? && entity.mtFile!="" >
                                            <#list entity.mtFile?split(",") as p>
                                                <#if p!="">
                                                <li>
                                                     <span class="layui-icon  layui-icon-close" name="mtFile"
                                                           test="${p}" onclick="remove(this)">&#x1006;</span>
                                                                  <@commonTags method="getFileSuffix" type="1" value="${p}">
                                                                      <#if getFileSuffix==0>
                                                                            <img onclick="advPreviewImg(this)"
                                                                                 class="imgdows"
                                                                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${p}">
                                                                      <#else>.
                                                                             <img onclick="advPreviewImg(this)"
                                                                                  class="imgdows"
                                                                                  src="../../../images/file_wj.png">
                                                                      </#if>
                                                                  </@commonTags>
                                                </li>
                                                </#if>
                                            </#list>
                                        </#if>
                                    </ul>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div style="text-align: center">
                                        <button type="button" class="btn btn-red" onclick="javasript:history.back(-1)">
                                            <i class="fa fa-backward"></i>
                                            返 回
                                        </button>
                                        <button type="submit" class="btn btn-success"
                                                lay-submit lay-filter="submit"><i
                                                class="fa fa-save"></i>
                                            提 交
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.box-body -->
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>
</@body>
<@footer>
<script src="/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<script>
    $('#dtMeeting').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "timePicker": true,
        "timePicker24Hour": true,
        // "opens": "center",
        locale: {
            format: "YYYY-MM-DD HH:mm:ss",
            applyLabel: '确定',
            cancelLabel: '取消',
            daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                '七月', '八月', '九月', '十月', '十一月', '十二月'
            ],
            // firstDay: 1
        },
    }, function (start) {

    });

    $("#djOrgId").on("change", function () {
        var djOrgName = $("#djOrgId").find("option:selected").text();
        $("#djOrgName").val(djOrgName);
    })
    $("#mtClassify").on("change", function () {
        var mtClassify = $("#mtClassify").find("option:selected").val();
        if (mtClassify == 'djlxhy') {
            $("#isDgw").val(1);
            $("#result_div").show()
        } else {
            $("#isDgw").val(0);
            $("#result_div").hide()
        }
        var index = layer.load(1, {
            shade: [0.1, '#fff'] //0.1透明度的白色背景
        });
        $.post("/dj/tDjMeeting/getMtData", {type: mtClassify}, function (data) {
            if (data.code == 200) {
                layer.close(index);
                $("#mtType").empty();
                $("#mtType").append("<option value='' selected>--请选择会议类型-</option>");
                $.each(data.data['mtTypeList'], function (i, item) {
                    $("#mtType").append("<option value='" + item.value + "'>" + item.label + "</option>");
                });
                $("#djOrgId").empty();
                $("#djOrgName").val('');
                $("#djOrgId").val('');
                $("#djOrgId").append("<option value='' selected>--请选择党组织-</option>");
                $.each(data.data['orgList'], function (i, item) {
                    $("#djOrgId").append("<option value='" + item.id + "'>" + item.name + "</option>");
                });
            } else {
                layer.close(index);
                $.alert({
                    title: '提示',
                    content: data.msg,
                    buttons: {"好的": {btnClass: 'btn-blue'}}
                });
            }
        })
    });
    // KindEditor
    KindEditor.ready(function (K) {
        window.editor = K.create('#editor_id', {
            filePostName: "file",
            allowPreviewEmoticons: true,
            resizeType: 1,
            width: "100%",
            height: "300px",
            allowImageUpload: false,//允许上传图片
            allowFileManager: false, //允许对上传图片进行管理
            uploadJson: '/img/fileUpload',
            fileManagerJson: '/img/fileManager',
            //上传文件后运行的回调函数,获取上传图片的路径
            afterUpload: function (url) {

            }
            ,
            afterBlur: function () {
                this.sync();
            }
            ,
        });

    });

    function GetValue(se, obj, id) {
        // var html = "";
        var va = $("#" + obj.vessel).val();
        if (va != "") {
            $("#" + obj.vessel).val(va + "," + obj.url);
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
                            '<img onclick="advPreviewImg(this)" src="' + url + '" class="imgdows"> ' +
                            '</li>'
                } else {
                    html = '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="' + obj.vessel + '" test="' + obj.url[i] + '">&#x1006;</span>' +
                            '<img src="../../../images/file_wj.png" class="imgdows"> ' +
                            '</li>'
                }
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

    function remove(obj) {
        var p = $(obj).attr("test");
        obj.parentNode.parentNode.removeChild(obj.parentNode);
        var ps = $("#mtFile").val();
        $("#mtFile").val(ps.replace(p , ""));
    }
</script>
<script>
    function goBack() {
        window.location.href = "/dj/tDjMeeting/list/1";
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