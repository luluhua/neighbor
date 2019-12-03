<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<style type="text/css">
    .fenye {
        width: 50%;
        margin: auto;
        padding: 12px;
        text-align: center;
    }

    .fenye button {
        width: 100px;
    }

    .box-body {
        width: 98%;
        margin: auto;
        border: 1px solid #666;
        padding: 0px !important;
    }

    .img_type {
        width: 100%;
        height: 50px;
        background-color: #eeeeee;

    }

    .box-yiet {
        width: 96%;
        margin: auto;
    }

    .img_typeew {
        width: 20%;
        float: left;
        padding-top: 10px
    }

    .img_uptype {
        width: 30%;
        float: left;
        /*padding-top: 0px*/
    }

    .img_uptype span {
        display: inline-block;
        width: 80px;
        text-align: center;
        height: 50px;
        line-height: 50px;
        cursor: pointer;
    }

    .uufe {
        background-color: #fff;
    }

    .jutli_img {
        /*padding: 10px;*/
        padding-top: 15px;
    }

    .img_listtitle {
        width: 100%;
        height: 30px;
        line-height: 30px;
        background-color: #eeeeee;
        border-top: 1px dashed #CCC;
        border-bottom: 1px dashed #CCC;
    }

    .img_listtitle b {
        width: 98%;
        margin: auto;
        display: block;
    }

    .ykdregf {
        width: 100%;
        height: 30px;
        line-height: 30px;
        background-color: #eeeeee;
        margin: 10px auto;
    }

    .ykdregf b {
        width: 98%;
        margin: auto;
        display: block;
        border-bottom: 1px dashed #CCC;
    }

    .imglist-juia {
        width: 100%;
        height: 40px;
        /*border-bottom: 1px dashed #666;*/
    }

    .xuangz_img {
        width: 98%;
        margin: auto;
        padding-top: 6px;
    }

    .xuangz_img button {
        padding: 3px 10px 3px 10px;
        color: #fff;
        background-color: #0d6aad;
        border: 1px solid #0d6aad;
    }

    .img_listd {
        width: 98%;
        margin: 10px auto;

    }

    .img_listd ul {
        padding: 0px;
    }

    .img_listd ul li {
        width: 160px;
        height: 233px;
        padding: 5px;
        margin: 0 20px 20px 0;
        border: 1px solid #CCC;
        overflow: hidden;
        float: left;
    }

    .iuifuawrt {
        width: 96%;
        margin: auto;
        height: 160px;

    }

    .iuifuawrt img {
        width: 90%;
        margin: auto;
        display: block;

    }

    .img_listd ul li input {
        width: 10px;
        height: 10px;
    }

    .kiset {
        /*width: 98%;*/
        /*margin: auto;*/
        /*border-top: 1px solid #CCC;*/
        height: 25px;
        width: 100%;
        line-height: 25px;
        overflow: hidden;
        border-bottom: 1px dashed #CCC;
        color: #555;
        /*white-space: nowrap;*/
        font-size: 12px;

    }

    .kiset div {
        float: left;
    }

    .kiset label {
        height: 25px;
        width: 78%;
        line-height: 25px;
        overflow: hidden;
        border-bottom: 1px dashed #CCC;
        color: #555;
        white-space: nowrap;
        padding-left: 10px;
        /*background-color: aqua;*/
    }

    .ykdnea_duotu {
        width: 98%;
        margin: auto;
    }

    .duotu_tishi {
        width: 98%;
        margin: auto;
    }

    .duotu_tishi span {
        display: block;
        width: 50%;
        /*float: left;*/

    }

    .iidt {
        width: 60px;
        border: 1px solid #CCC;
        background-color: #eeeeee;
        float: right;
        margin-top: -20px;
    }

    .iidt span {
        width: 50%;
        display: inline-block !important;
        text-align: center;
        float: left;

    }

    .ykrt {
        background-color: #fff;
    }

    .duotu_jindu {
        width: 100%;
        height: 200px;
        overflow-x: hidden;
        border: 1px solid #CCC;
        margin: 10px 0 20px 0;

    }

    .duotu_jindu ul {
        width: 100%;
        margin: auto;
    }

    .kasiet {
        background-color: #aaa;
        width: 100% !important;
    }

    .airr {
        width: 98% !important;
        margin: auto;
        float: none !important;
    }

    .duotu_jindu .liebu li {
        width: 98%;
        margin: auto;
        height: 30px;
        line-height: 30px;
        border-bottom: 1px solid #CCC;
    }

    .duotu_jindu .liebu li div {
        width: 50%;
        float: left;
    }

    .duotu_jindu .liebu text {
        width: 25%;
        float: left;
    }

    .duotu_jindu .liebu text:nth-child(3) {
        text-align: right;
    }

    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;

    }

    .uiisar li img {
        width: 100%;
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
        left: 94%;
        top: 10px;
    }

    .kaishui {
        margin: 10px 0 20px 0;
    }

    .kaishui button {
        margin-right: 10px;
    }

    .lsaior {
        border-top: 1px dashed #CCC;
        width: 100%;
        margin: 30px 0 50px 0;

    }

    .lsaior button {
        width: 100px;
        margin: 20px auto;
        display: -webkit-box;
    }

    #kfjser {
        padding: 0 8px 0 8px;
        background-color: #0C70C4;
        color: #fff;
        border: 1px solid #0C70C4;

    }

    #fileyuanming {
        display: inline-block;
        margin-top: 3px;
        padding-left: 5px;
    }

    .yir {
        width: 100%;
        height: 150px;
        overflow: hidden;
        display: flex;
        flex-direction: row;
        align-items: center;

    }


</style>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" onsubmit="return file_quantity()">
    <input type="hidden" id="classifyId" name="classifyId" value="1"/>
    <input type="hidden" id="descript" name="descript" value="2"/>
    <input type="hidden" id="imageWidth" name="imageWidth" value="3"/>
    <input type="hidden" id="quantity" name="quantity" value="${(quantity)!}"/>
    <input type="hidden" id="vessel" name="vessel" value="${(vessel)!}"/>
    <input type="hidden" id="classify" name="classify" value="${(classify)!}"/>

    <div class="box-body">
        <div class="img_type">
            <div class="box-yiet">
                <div class="img_typeew">
                    <b>文件分类：</b>
                    <select name="img_type" id="img_type" class="select2" style="width: 100px" lay-verify="" lay-ignore>
                        <option value="">全部</option>
                        <@dictTag method="getDictListByType" type="${(dict)!}" >
                            <#list getDictListByType as m>
                              <option value="${(m.value)!}" ${(m.value==classify)?string('selected="selected"','')}>${(m.label)!}</option>
                            </#list>
                        </@dictTag>
                    </select>
                </div>
                <div class="img_uptype">
                    <span class="uufe">文件列表</span>
                    <span>多图上传</span>
                </div>
            </div>
        </div>


        <div class="jutli_img">
            <div class="dantushangc" style="display: ">
                <div class="ykdregf">
                    <b>单文件上传</b>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">选择图片：<span class="xing_red">*</span></label>
                    <div class="col-sm-6">
                        <input type="file" id="fileids" name="fileid" style="width: 72px;float: left;">
                        <span id="fileyuanming">未选择任何文件</span>
                    </div>
                    <div class="col-sm-2">
                        <button id="kfjser" type="button"><span
                                class="layui-icon layui-icon-upload-drag">&#xe681;</span>上传
                        </button>
                    </div>
                </div>
                <div class="img_listtitle">
                    <b>图片列表</b>
                </div>
                <div class="imglist-juia">
                    <div class="xuangz_img">
                        <input type="checkbox" lay-skin="primary" id="c_all" lay-filter="c_all" title="全部">
                        <button type="button" id="details_on" onclick="deketefile()">删除选择项</button>
                    </div>
                    <div class="img_listd">
                        <ul>
                            <#list pageData.getRecords() as list>
                                <li>
                                    <div class="iuifuawrt">
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tbody>
                                            <tr>
                                                <td valign="middle" style="width:160px;height: 150px;">
                                                    <a href="javascript:void(0)" class="yir">
                                                         <@commonTags method="getFileSuffix" type="1" value="${(list.filePath)!'--'}">
                                                       <#if getFileSuffix==0>
                                                        <img title="${(list.fileOldName)!'--'}"
                                                             onclick="advPreviewImg(this)"
                                                             src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(list.filePath)!'--'}"
                                                             onerror="this.src='../../../images/default.png'"">
                                                       <#else >
                                                           <img title="${(list.fileOldName)!'--'}"
                                                                onclick="advPreviewImg(this)"
                                                                src="../../../images/file_wj.png">
                                                       </#if>
                                                         </@commonTags>
                                                    </a>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <div class="kiset">
                                            <input type="checkbox" name="file_url" lay-skin="primary"
                                                   id="${(list.id)!'--'}" class="${(list.fileOldName)!}"
                                                   value="${(list.filePath)!'--'}">
                                            <label title="${(list.fileOldName)!'--'}">${(list.fileOldName)!'--'}</label>
                                        </div>
                                        <div class="kiset">
                                            <span>上传时间:${(list.createDatetime?string('yyyy-MM-dd'))!}</span>
                                        </div>
                                        <div class="kiset">
                                            <span>上传者:${(list.createUsername)!'--'}</span>
                                        </div>
                                    </div>
                                </li>
                            </#list>
                        </ul>

                    </div>
                </div>

                <div style="clear:both;"></div>


            </div>

            <!-- 多图 -->
            <div class="ykdnea_duotu" style="display: none">
                <div class="duotu_tishi">
                    <b>选择图片</b>
                    <span>将文件添加到上传队列，然后点击”开始上传“按钮。</span>
                    <div class="iidt">
                    <#--<span class="layui-icon layui-icon-more ykrt">&#xe65f</span>-->
                    <#--<span class="layui-icon layui-icon-picture-fine">&#xe60d</span>-->
                    </div>
                </div>
                <div class="duotu_jindu">
                    <ul class="liebu" style="display: ">
                        <table class="table table-hover">
                            <tr>
                                <th>文件名</th>
                                <th>文件大小</th>
                                <th>上传进度</th>
                            </tr>
                            <tbody id="fjaet">

                            <tbody>
                        </table>
                    </ul>
                    <ul class="uiisar" id="ing_Ise" style="display: none">
                    <#--<li>-->
                    <#--<span class="layui-icon  layui-icon-close">&#x1006;</span>-->
                    <#--<img src="/images/loginbg_010.jpg">-->
                    <#--</li>-->
                    </ul>
                </div>
                <div class="kaishui">
                    <button id="duotushangc" type="button"><span class="layui-icon ayui-icon-add-1">&#xe654;</span>添加文件
                    </button>
                    <button id="duotushangckais" type="button"><span
                            class="layui-icon layui-icon-upload-drag">&#xe681;</span>开始上传
                    </button>
                </div>
            </div>
            <!-- 多图 -->
        </div>
        <div style="clear:both;"></div>


        <div class="lsaior">
            <button type="button" class="btn btn-success" onclick="file_quantity()"><i
                    class="fa fa-save"></i>
                确 定
            </button>
        </div>
        <#if (pageData.total >12)>
            <div class="fenye">
                <button type="button">上一页</button>
                <button type="button">下一页</button>
            </div>
        </#if>


    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
<script type="text/javascript">

    $("#img_type").on('change', function () {
        var classify = $(".select2").val();
        window.location.href = '/system/accessory/add?pageNumber=1&fileQuantity=${(quantity)!}&vessel=${(vessel)!}&classify=' + classify + '&dict=${(dict)!}';
    });

    layui.use('form', function () {
        var form = layui.form;
        //全选
        form.on('checkbox(c_all)', function (data) {
            var a = data.elem.checked;
            if (a == true) {
                $("input[name='file_url']").prop("checked", true);
                form.render('checkbox');
            } else {
                $("input[name='file_url']").prop("checked", false);
                form.render('checkbox');
            }

        });
    });


    $(document).ready(function () {
        $(".img_uptype span").click(function () {
            $(this).addClass("uufe").siblings().removeClass("uufe");
            var se = $(this).index();
            if (se == 0) {
                $(".dantushangc").css({'display': 'block'});
                $(".ykdnea_duotu").css({'display': 'none'});
            } else {
                $(".dantushangc").css({'display': 'none'});
                $(".ykdnea_duotu").css({'display': 'block'});
            }

        });
        $(".iidt span").click(function () {
            $(this).addClass("ykrt").siblings().removeClass("ykrt");
            var se = $(this).index();
            if (se == 0) {
                $(".liebu").css({'display': 'block'});
                $(".uiisar").css({'display': 'none'});
            } else {
                $(".uiisar").css({'display': 'block'});
                $(".liebu").css({'display': 'none'});
            }
        });
        $(".fenye button").click(function () {
            var bul = $(this).index();
            var pageNumber = ${(pageNumber)!};
            var toa = ${(pageData.total)!}
            if (bul == 0) {
                if (pageNumber > 1) {
                    pageNumber--;
                }
            } else {
                if (pageNumber < toa) {
                    pageNumber++;
                }
            }
            window.location.href = '/system/accessory/add?pageNumber=' + pageNumber + "&fileQuantity=${(quantity)}&vessel=${(vessel)}&classify=${(classify)!}&dict=${(dict)!}";
        })


    });
    var uploader = new plupload.Uploader({
        runtimes: 'gears,html5,html4,silverlight,flash',
        browse_button: 'fileids',
        url: '/system/tSysAttachment/file/upload',
        flash_swf_url: '/plugins/plupload-2.3.6/js/Moxie.swf',
        silverlight_xap_url: '/plugins/plupload-2.3.6/js/Moxie.xap',
        filters: {
            max_file_size: '5mb',
            mime_types: [
                {title: "files", extensions: "${(config.classifyType)!}"}
            ],
            prevent_duplicates: true
        },
        multi_selection: false, //单图：false、多图：true
        multipart_params: {
            descript: $("#descript").val(),
            imageWidth: $("#imageWidth").val(),
            imageHeight: $("#imageHeight").val(),
            classify: $(".select2").val(),
        },
    });
    uploader.init();
    uploader.bind('FileFiltered', function (uploader, file) {
        if (file.origSize > 5 * 1024 * 1024) {
            layer.msg('文件过大，最大可选5mb');
            return;
        }
    });
    uploader.bind('FilesAdded', function (uploader, files) {
        var _files = uploader.files;
        if (_files.length > 1) {
            uploader.splice(0, 1);
        }
        $("#fileyuanming").html(files[0].name);
        if (files.length != 1) {
            return;
        }
        var li = '';
        plupload.each(files, function (file) { //遍历文件

        });
    });
    uploader.bind('FileUploaded', function (uploader, files, data) {
        layer.msg('文件上传中...', {
            time: 1000,
            end: function () {
                window.location.reload();
            }

        });
    });
    uploader.bind('UploadProgress', function (uploader, file) {
        var percent = file.percent;
        $("#" + file.id).find('.bar').css({"width": percent + "%"});
        $("#" + file.id).find(".percent").text(percent + "%");

    });

    document.getElementById('kfjser').onclick = function () {
        uploader.start();
    };

    var uploaderduotu = new plupload.Uploader({
        runtimes: 'gears,html5,html4,silverlight,flash',
        browse_button: 'duotushangc', //触发文件选择对话框的按钮，为那个元素id
        url: '/system/tSysAttachment/file/upload', //服务器端的上传页面地址
        flash_swf_url: '/plugins/plupload-2.3.6/js/Moxie.swf',
        silverlight_xap_url: '/plugins/plupload-2.3.6/js/Moxie.xap',
        filters: {
            max_file_size: '5mb',     //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
            mime_types: [//允许文件上传类型
                {title: "files", extensions: "${(config.classifyType)!}"}
            ],
            prevent_duplicates: true
        },
        multi_selection: true, //单图：false、多图true
        multipart_params: {
            classify: $(".select2").val(),
            descript: $("#descript").val(),
            imageWidth: $("#imageWidth").val(),
            imageHeight: $("#imageHeight").val(),

        },
    });
    uploaderduotu.init();
    uploaderduotu.bind('FilesAdded', function (uploader, files) {
        var li = '';
        plupload.each(files, function (file) {
            var siz = Math.floor(file.origSize / 1024)
            li += "<tr id='" + file.id + "a'>" +
                    " <td>" + file.name + "<span class='layui-icon layui-icon-close' onclick='removeFile(" + file.id + ")'>&#x1006;</span></td>" +
                    "<td>" + siz + "KB</td>" +
                    "<td id='" + file.id + "'>" + file.percent + "%</td>" +
                    "</tr>";
        });
        $("#fjaet").prepend(li);

    });
    var alignment;
    var alir = "";
    uploaderduotu.bind('FileUploaded', function (uploaderduotu, files, data) {
        // alert(alignment + (alignment - 1));
        alignment--;
        layer.msg('文件上传中...', {
            time: 1000,
            end: function () {

            }
        })
        if (alignment == 0) {
            window.location.reload();
        }

    });
    uploaderduotu.bind('UploadProgress', function (uploaderduotu, file) {
        var percent = file.percent;
        $("#" + file.id).text(percent + "%");

    });

    //
    uploaderduotu.bind('QueueChanged', function (uploaderduotu) {
        document.getElementById('duotushangckais').onclick = function () {
            uploaderduotu.start();
            alignment = $("#fjaet tr").length;
            alir = $("#fjaet tr").length;
        }
    });

    // uploaderduotu.start();


    function removeFile(file) {
        uploaderduotu.removeFile(file);
        $("#" + file.id + "a").remove();
    }

    function file_quantity() {
        var se = $("#quantity").val();
        var rd = $("input[name='file_url']:checked").length;
        var vessel = $("#vessel").val();
        var map = {};
        if (se != 0 && rd > se) {
            layer.alert("此处只能选择" + se + "个文件", {
                time: 2000,
                end: function () {
                }
            });
            return false;
        } else {
            var len = $("input[name='file_url']:checked").length;
            var arrPic = new Array(); //定义一个数组URL
            var arrId = new Array(); //定义一个数组存放ID
            var fileoldName = new Array();//原名
            for (var i = 0; i < len; i++) {
                arrPic[i] = $("input[name='file_url']:checked").eq(i).val(); //将所有img路径存储到数组中
                arrId[i] = $("input[name='file_url']:checked").eq(i).prop('id'); //将所有img路径存储到数组中
                fileoldName[i] = $("input[name='file_url']:checked").eq(i).prop('class'); //将所有img路径存储到数组中
            }
            map = {"vessel": vessel, "url": arrPic, "id": arrId, "fileoldName": fileoldName}
            parent.GetValue(se, map, arrId);
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        }

    }

    function deketefile() {
        var len = $("input[name='file_url']:checked").length;
        if (len <= 0) {
            layer.msg('未选择任何数据！', {
                time: 1000,
                end: function () {
                }
            })
        } else {
            layer.confirm('附件可能被其他业务使用，确定要删除吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                var arrPic = []; //定义一个数组
                for (var i = 0; i < len; i++) {
                    arrPic[i] = $("input[name='file_url']:checked").eq(i).prop("id");
                }
                $.post('/system/accessory/deletefile/' + arrPic, function (response) {
                    if (response.status) {
                        layer.msg('删除成功！', {
                            icon: 1,
                            time: 1000,
                            end: function () {
                                window.location.reload();
                            }
                        })

                    } else {
                        layer.msg('删除失败！', {
                            time: 1000,
                            end: function () {

                            }
                        })
                    }
                });
            }, function () {

            });
        }
    }
</script>






</@footer>