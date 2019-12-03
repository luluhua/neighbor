<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
<link rel="stylesheet" href="/plugins/layui/css/layui.css">
</@header>
<@body>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <small><a href="/tCmsAdvpos/list/1">广告位列表</a> > <a
                    href="/cms/tCmsAdv/list/1?advPosId=#{(pos.id)}">[${(pos.name)}] 广告内容列表 </a>
                >[${(entity.advTitle)}] 编辑
            </small>
        </h1>
    </section>
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form role="form" class="form-horizontal layui-form layui-form-pane" method="post"
                          action="/cms/tCmsAdv/doEdit">
                        <input type="hidden" id="id" name="id" value="${(entity.id)}">
                    <#--<input type="hidden" name="advposId" value="${(entity.advposId)}">-->
                        <div class="box-body">
                            <div class="form-group">
                                <label for="pId" class="col-sm-2 control-label">所属广告位：<span
                                        class="xing_red">*</span></label>
                                <div class="col-sm-10">
                                    <select name="advposId" class="form-control select2 input-select-200"
                                            lay-verify="" lay-ignore>
                                     <#list posList as posList>
                                         <option value="${(posList.id)!}" ${(posList.id==entity.advposId)?string('selected="selected"','')}>${(posList.name)!}</option>
                                     </#list>
                                    </select>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="advTitle" class="col-sm-2 control-label">标题：<span
                                            class="xing_red">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="advTitle" class="form-control input-title-500"
                                               value="${(entity.advTitle)!'--'}"
                                               required lay-verify="required"">

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="actionPage1" class="col-sm-2 control-label">动作目标(android)：<span
                                            class="xing_red">*</span></label>
                                    <div class="col-sm-2">
                                        <input type="radio" name="androidaction" title="无" value="android_isNo"
                                               lay-filter="erweima" ${(entity.actionPage1="0")?string('checked','')}>
                                        <input type="radio" name="androidaction" value="android_isPitch"
                                               lay-filter="erweima" ${(entity.actionPage1!="0")?string('checked','')}
                                               title="填入">
                                    </div>
                                    <div class="col-sm-5">
                                        <input name="actionPage1" id="actionPage1" type="text"
                                               style="display: <#if entity.actionPage1!="0">block<#else >none</#if>"
                                               class="form-control" placeholder="输入动作目标"
                                               value="${(entity.actionPage1)!}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="actionPage2" class="col-sm-2 control-label">动作目标(IOS)：<span
                                            class="xing_red">*</span></label>
                                    <div class="col-sm-2">
                                        <input type="radio" name="IOSaction" title="无" value="IOS_isNo"
                                               lay-filter="erweima" ${(entity.actionPage2="0")?string('checked','')}>
                                        <input type="radio" name="IOSaction" value="IOS_isPitch" lay-filter="erweima"
                                            ${(entity.actionPage2!="0")?string('checked','')}
                                               title="填入">
                                    </div>
                                    <div class="col-sm-5">
                                        <input name="actionPage2" id="actionPage2" type="text"
                                               style="display: <#if entity.actionPage2!="0">block<#else >none</#if>"
                                               class="form-control" placeholder="输入动作目标"
                                               value="${(entity.actionPage2)!}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="linkTarget" class="col-sm-2 control-label">打开方式：<span
                                            class="xing_red">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="radio" name="linkTarget" value=""
                                               title="本页面打开" ${(entity.linkTarget="")?string('checked','')}>
                                        <input type="radio" name="linkTarget" value="_blank"
                                               title="新页面打开" ${(entity.linkTarget == "_blank")?string('checked','')}>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">是否发布：</label>
                                    <div class="col-sm-10">
                                        <input type="radio" name="status" value="1"
                                               title="是" ${(entity.status=1)?string('checked','')}>
                                        <input type="radio" name="status" value="0"
                                               title="否" ${(entity.status=0)?string('checked','')}>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="daterange" class="col-sm-2 control-label">有效时间：<span
                                            class="xing_red">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text"
                                               value="${(entity.dtStart?string('yyyy/MM/dd'))!}-${(entity.dtEnd?string('yyyy/MM/dd'))!}"
                                               class="form-control date input-select-200" name="daterange"
                                               placeholder="开始日期  - 结束日期">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="sortIndex" class="col-sm-2 control-label">排序：<span
                                            class="xing_red">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="sortIndex" class="form-control input-number-100"
                                               value="${(entity.sortIndex)!'--'}"
                                               lay-verify="required|number">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="advRemark" class="col-sm-2 control-label">备注：</label>
                                    <div class="col-sm-10">
                                        <textarea name="advRemark" class="textar-remark " placeholder="请输入广告备注说明"
                                        >${(entity.advRemark)!'--'}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="advType" for="name" class="col-sm-2 control-label">类型：<span
                                            class="xing_red">*</span></label>
                                    <div class="col-sm-10">
                                     <@dictTag method="getDictListByType" type="adv_refType" >
                                         <#list getDictListByType as m>
                                             <input type="radio" name="advType" value="${(m.value)!}"
                                                    lay-filter="advType"
                                                    title="${(m.label)!}"
                                                    <#if "${(m.value)!}"=="${(entity.advType)!}">checked</#if>>
                                         </#list>
                                     </@dictTag>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <input type="hidden" id="imgURL" name="imgURL" class="form-control"
                                           value="${(imgURL)!''}"/>
                                    <label for="systemLogo" class="col-sm-2 control-label">图片：<span
                                            class="xing_red">*</span></label>
                                    <div class="col-sm-1" id="uysr">
                                        <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                                           data-url="/system/accessory/add?fileQuantity=1&vessel=imgURL&classify=cmsadv&dict=cmsadv"
                                           data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="systemLogo" class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <ul class="uiisar imgURL_url">
                                            <#if imgURL?? && imgURL!="" >
                                                <li>
                                                        <span class="layui-icon  layui-icon-close" name="imgURL"
                                                              test="${(imgURL)!''}">&#x1006;</span>
                                                            <@commonTags method="getFileSuffix" type="1" value="${(imgURL)!'--'}">
                                                                <#if getFileSuffix==0>
                                                                    <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(imgURL)!''}">
                                                                <#else>
                                                                     <img class="imgdows"
                                                                          src="../../../images/file_wj.png  ">
                                                                </#if>
                                                            </@commonTags>
                                                </li>
                                            </#if>
                                        </ul>
                                    </div>
                                </div>


                                <div class="form-group" id="acd_content"
                                     style=" <#if entity.advType!=2>display:none </#if>">
                                    <label for="content" class="col-sm-2 control-label">内容：<span
                                            class="xing_red">*</span></label>
                                    <div class="col-sm-10">
                                        <a class="btn btn-primary dialog" style="display: none" href="javascript:;"
                                           data-title=" 附件管理" id="jkhaskr"
                                           data-url="/system/accessory/add?fileQuantity=1&vessel=editor_id&classify=cmsadv&dict=cmsadv"
                                           data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                                        <textarea class="ase" id="editor_id" name="content"
                                                  style="height:300px; width: 80%"
                                        >${(entity.content)!''}</textarea>
                                    </div>
                                </div>


                                <br/> <br/> <br/>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                                                class="fa fa-save"></i> 提 交
                                        </button>
                                        <a class="btn btn-default" href="/cms/tCmsAdv/list/1?advPosId=#{(pos.id)}"><i
                                                class="fa fa-close"></i> 取消</a>
                                    </div>
                                </div>
                            </div><!-- /.box-body -->
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>

</@body>
<@footer>
<script>

    layui.use('form', function () {
        var form = layui.form;
        form.on('radio(advType)', function (data) {
            if (data.value == "1") {
                $("#acd_content").css({'display': 'none'});
                $("#acd_img").css({'display': 'block'});
                $(".ase").attr("name", "");
                $("#image_1").attr("name", "fileurl");
            } else if (data.value == "2") {
                $("#acd_content").css({'display': 'block'});
                $("#acd_img").css({'display': 'none'});
                $("#image_1").attr("name", "");
            }
            else if (data.value == "3") {
                $("#acd_content").css({'display': 'none'});
                $("#acd_img").css({'display': 'block'});
                $(".ase").attr("name", "");
                $("#image_1").attr("name", "fileurl");
            }
            form.render();
        });
    });

    layui.use('form', function () {
        var form = layui.form;
        form.on('radio(erweima)', function (data) {
            if (data.value == "android_isPitch") {
                var t1 = $("#actionPage1").val()
                $("#actionPage1").css({'display': 'block'}).val(t);
            } else if (data.value == "IOS_isPitch") {
                var t2 = $("#actionPage2").val()
                $("#actionPage2").css({'display': 'block'}).val(t2);
            } else if (data.value == "android_isNo") {
                $("#actionPage1").css({'display': 'none'}).val("0");
            } else if (data.value == "IOS_isNo") {
                $("#actionPage2").css({'display': 'none'}).val("0");
            }
            form.render();
        });
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
<script>

</script>
<script>

    function getBoforeDate(before) {
        var now = new Date();
        now.setDate(now.getDate() - before);
        return now;
    }

    function getBoforeMonth(beforeMonth, day) {
        var now = new Date();
        now.setDate(day);
        now.setMonth(now.getMonth() - beforeMonth);
        return now;
    }

    $(function () {
        jkhae();
        var now = new Date();

        $('.date').daterangepicker({
            "showWeekNumbers": true,
            "showISOWeekNumbers": true,

            "locale": {
                "format": "YYYY/MM/DD",
                "separator": "-",
                "applyLabel": "应用",
                "cancelLabel": "取消",
                "fromLabel": "From",
                "toLabel": "To",
                "customRangeLabel": "自定义",
                "weekLabel": "W",
                "daysOfWeek": [
                    "日",
                    "一",
                    "二",
                    "三",
                    "四",
                    "五",
                    "六"
                ],
                "monthNames": [
                    "一月",
                    "二月",
                    "三月",
                    "四月",
                    "五月",
                    "六月",
                    "七月",
                    "八月",
                    "九月",
                    "十月",
                    "十一月",
                    "十二月"
                ],
                "firstDay": 1
            },
            "alwaysShowCalendars": true,
            "autoUpdateInput": false,
            "opens": "right",
            "buttonClasses": "btn btn-sm"
        }, function (start, end, label) {

        });

        $('.date').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
            // $("#dtStart").val(picker.startDate.format('yyyy-MM-dd HH:mm:ss'));
            // $("#dtEnd").val(picker.endDate.format('yyyy-MM-dd HH:mm:ss'));
        });

        $('.date').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

    });
</script>

<script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>

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