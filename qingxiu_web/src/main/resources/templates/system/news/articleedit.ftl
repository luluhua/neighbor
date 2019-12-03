<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <small><a href="/cms/tCmsArticle/list/1?crt=${crt!}&pageNumber=${pageNumber!}">
                文章列表 </a> >
                编辑
            </small>
        </h1>
    </section>
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">

                    <form id="frm-main" class="form-horizontal layui-form" method="post"
                          action="/cms/tCmsArticle/doEdit" onsubmit="return updatearticleImages()"
                          onkeydown="if(event.keyCode==13){return false;}">
                        <div class=" box-body">
                            <input name="id" id="id" value="${entity.id}" type="hidden">
                            <input name="crt" id="crt" value="${crt}" type="hidden">
                            <input name="programId" id="programId" value="${(entity.programId)!}" type="hidden">
                            <input name="pageNumber" id="pageNumber" value="${pageNumber}" type="hidden">
                        </div>
                        <div class="form-group">
                            <label for="classifyId" class="col-sm-2 control-label">文章分类：<span
                                    class="xing_red">*</span></label>
                            <div class="col-sm-10">
                                <div style="position: relative;z-index: 999;">
                                    <input id="orgName" class="org-select" value="${classifyName}" onclick="showTree()"
                                           style="height: 33px;"
                                           readOnly="true">

                                    <!-- 模拟select点击框 以及option的text值显示-->
                                    <i class="trg" style="position: absolute;"></i>
                                    <!-- 模拟select右侧倒三角 -->
                                    <input id="orgCode" type="hidden" name="classifyId"
                                           value="${(entity.classifyId)}"/>
                                    <!-- 存储 模拟select的value值 -->

                                    <!-- zTree树状图 相对定位在其下方 -->
                                    <div class="ztree"
                                         style="display:none; position: absolute;border:1px solid #4aa5ff;width:200px;background: #fff">
                                        <ul id="treeDemo"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">标题：</label>
                            <div class="col-sm-10">
                                <input type="text" id="title" name="title" class="form-control input-title-500"
                                       value="${(entity.title)}"/>
                            </div>
                        </div>
                        <#if crt=='bmfw'>
                        <input id="lngId" type="hidden" name="lng" value="${(entity.lng)!''}">
                        <input id="latId" type="hidden" name="lat" value="${(entity.lat)!''}">
                        <div class="form-group">
                            <label for="deptName" class="col-sm-2 control-label">联系地址<span
                                    class="xing_red"> *</span></label>
                            <div class="col-sm-10">
                                <input type="text" id="address" name="location"
                                       class="form-control input-title-500 dialog_param"
                                       data-title="选择地址"
                                       data-url="/toMap" data-par="${(entity.lng?c)!},${(entity.lat?c)!}"
                                       ,data-width="300" data-height="400"
                                       readonly value="${(entity.location)!}"
                                       placeholder="请输入联系地址">

                            </div>
                        </div>
                        <div class="form-group">
                            <label for="source" class="col-sm-2 control-label">联系电话：</label>
                            <div class="col-sm-10">
                                <input type="text" id="source" name="source"
                                       class="form-control input-select-200" value="${(entity.source)!}"
                                       placeholder="输入联系电话"/>
                            </div>
                        </div>
                    <div class="form-group" id="jiaoyijzy"
                         style="display:<#if entity.classifyId==70>block><#else >none</#if> ">
                        <label for="titleSub" class="col-sm-2 control-label">校训：</label>
                        <div class="col-sm-10">
                            <textarea id="titleSub" name="titleSub" class="textar-remark"
                                      placeholder="请输入校训">${(entity.titleSub)!}</textarea>
                        </div>
                    </div>
                        <#elseif crt=="zhdj">
                         <div class="form-group">
                             <label for="gotoUrl" class="col-sm-2 control-label">跳转地址：</label>
                             <div class="col-sm-10">
                                 <input type="text" id="gotoUrl" name="gotoUrl" class="form-control input-select-200"
                                        value="${(entity.gotoUrl)!}"/>
                             </div>
                         </div>
                        <#else >
                            <div class="form-group">
                                <label for="titleSub" class="col-sm-2 control-label">子标题：</label>
                                <div class="col-sm-10">
                                    <input type="text" id="titleSub" name="titleSub"
                                           class="form-control input-title-500"
                                           value="${(entity.titleSub)!}"/>
                                </div>
                            </div>

                        <div class="form-group">
                            <label for="source" class="col-sm-2 control-label">来源：</label>
                            <div class="col-sm-10">
                                <input type="text" id="source" name="source"
                                       class="form-control input-select-200"
                                       value="${(entity.source)!}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="author" class="col-sm-2 control-label">作者：</label>
                            <div class="col-sm-10">
                                <input type="text" id="author" name="author" class="form-control input-select-200"
                                       value="${(entity.author)!}"
                                />
                            </div>
                        </div>



                        </#if>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">是否发布：</label>
                            <div class="col-sm-10">
                                <label>
                                    <input name="articleStatus"
                                           type="radio"${(entity.articleStatus=1)?string('checked','')}
                                           class="minimal"
                                           value="1" lay-ignore> 是
                                </label>
                                <label>
                                    <input name="articleStatus"
                                           type="radio" ${(entity.articleStatus=0)?string('checked','')}
                                           class="minimal"
                                           value="0" lay-ignore> 否
                                </label>
                                <label>
                                    <input name="articleStatus"
                                           type="radio" ${(entity.articleStatus=2)?string('checked','')}
                                           class="minimal"
                                           value="2" lay-ignore> 下架
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="daterange" class="col-sm-2 control-label">发布时间：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control  input-select-200" id="addTime"
                                       name="addTime"
                                       value="${(entity.dtPublish?string('YYYY-MM-dd HH:mm:ss'))!}"
                                       placeholder="选择发布时间">
                            </div>
                        </div>

                    <#--<#if crt=='bmfw'>-->
                        <div class="form-group">
                            <input type="hidden" id="articleImages" name="articleImages" class="form-control"
                                   value="${(entity.articleImages)!}"/>
                            <label for="systemLogo" class="col-sm-2 control-label">多图：</label>
                            <div class="col-sm-1" id="uysr">
                                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                                   data-url="/system/accessory/add?fileQuantity=0&vessel=articleImages&classify=${(crt)!}&dict=cms_article"
                                   data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                            </div>
                        <#--<div class="col-sm-8">-->
                        <#--<ul class="uiisar articleImages_url img_ul">-->

                        <#--</ul>-->
                        <#--</div>-->
                        </div>
                        <div class="form-group">
                            <label for="systemLogo" class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <ul class="uiisar articleImages_url img_ul">

                                </ul>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="hidden" id="image1" name="image1" class="form-control"
                                   value="${(entity.image1)!}"/>
                            <label for="systemLogo" class="col-sm-2 control-label">缩略图：</label>
                            <div class="col-sm-1" id="uysr">
                                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                                   data-url="/system/accessory/add?fileQuantity=1&vessel=image1&classify=${(crt)!}&dict=cms_article"
                                   data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="systemLogo" class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <ul class="uiisar image1_url img_ul">
                                         <#if entity.image1?? && entity.image1!="" >
                                             <li>
                                        <span class="layui-icon  layui-icon-close" name="image1"
                                              test="${(entity.image1)!}">&#x1006;</span>
                                                 <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.image1)!}">
                                             </li>
                                         </#if>
                                </ul>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="hidden" id="image2" name="image2" class="form-control"
                                   value="${(entity.image2)!}"/>
                            <label for="systemLogo" class="col-sm-2 control-label">详情图：</label>
                            <div class="col-sm-1" id="uysr">
                                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                                   data-url="/system/accessory/add?fileQuantity=1&vessel=image2&classify=${(crt)!}&dict=cms_article"
                                   data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="systemLogo" class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <ul class="uiisar image2_url img_ul">
                                    <#if entity.image2?? && entity.image2!="" >
                                        <li>
                                        <span class="layui-icon  layui-icon-close" name="image2"
                                              test="${(entity.image2)!}">&#x1006;</span>
                                            <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.image2)!}">
                                        </li>
                                    </#if>
                                </ul>
                            </div>
                        </div>
                    <#--</#if>-->

                        <div class="form-group">
                            <label for="articleBrief" class="col-sm-2 control-label">内容概要：</label>
                            <div class="col-sm-10">
                                    <textarea placeholder="请输入摘要"
                                              class="textar-remark"
                                              name="articleBrief"
                                              placeholder="请输入摘要(限200字)"> ${(entity.articleBrief)!}</textarea>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="articleContent" class="col-sm-2 control-label">文章内容：</label>
                            <div class="col-sm-10">
                                <a class="btn btn-primary dialog" style="display: none" href="javascript:;"
                                   data-title=" 附件管理" id="jkhaskr"
                                   data-url="/system/accessory/add?fileQuantity=1&vessel=editor_id&classify=${(crt)!}&dict=cms_article"
                                   data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                                <textarea id="editor_id" name="articleContent"
                                          style="height:300px;">${(entity.articleContent)!}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="articleTags" class="col-sm-2 control-label">标签：</label>
                            <div class="col-sm-10">
                                    <textarea class="tag" id="editor_id" name="articleTags"
                                    >${(entity.articleTags)!}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">&nbsp;</label>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                                        class="fa fa-save"></i> 提 交
                                </button>

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
<link rel="stylesheet" href="/plugins/zTreeStyle/zTreeStyle.css">
<script src="/plugins/zTreeStyle/jquery.ztree.all.js"></script>
<script>


    $("#dir").on('change', function () {
        var pid = $(this).val();
        $.post('/system/menu/json?_dc=' + new Date().getTime(), {pid: pid}, function (response) {
            if (response.code == 200) {
                $("#pid").empty();
                $("#pid").select2({
                    data: response.data
                });
            }
        });
    });
    $(function () {
        $(".tag").tagEditor({
            placeholder: '添加规格后按Enter'
        });
    })


</script>

<script src="/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<script src="/app/js/file-upload.js"></script>
<script>


    // KindEditor
    KindEditor.ready(function (K) {
        window.editor = K.create('#editor_id', {
            filePostName: "file",
            allowPreviewEmoticons: true,
            resizeType: 1,
            width: "100%",
            height: "300px",
            allowImageUpload: true,//允许上传图片
            allowFileManager: true, //允许对上传图片进行管理
            uploadJson: '/img/fileUpload',
            fileManagerJson: '/img/fileManager',
            data: {
                serviceId: 1
            },
            afterBlur: function () {
                this.sync();
            },
        });
        K('#image').click(function () {
            editor.loadPlugin('image', function () {
                //图片弹窗的基本参数配置
                editor.plugin.imageDialog({
                    showRemote: false,
                    imageUrl: K('#url').val(), //如果图片路径框内有内容直接赋值于弹出框的图片地址文本框
                    //点击弹窗内”确定“按钮所执行的逻辑
                    clickFn: function (url, title, width, height, border, align) {
                        K('#url').val(url);//获取图片地址
                        editor.hideDialog(); //隐藏弹窗
                    }
                });
            });
        });
    });


    var orgList = ${classifyList!}
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        //回调
        callback: {
            onClick: zTreeBeforeClick
        },
        view: {
            fontCss: {fontSize: "14px"}
        }
    };

    function zTreeBeforeClick(event, treeId, treeNode) {
        var fa = !treeNode.isParent;
        if (fa) {
            zTreeOnClick(event, treeId, treeNode);
        }
        return fa;//当是父节点 返回false 不让选取
    };

    //节点点击事件
    function zTreeOnClick(event, treeId, treeNode) {
        $('#orgName').val(treeNode.name);
        $('#orgCode').val(treeNode.id)
        if (treeNode.id == "70") {
            $("#jiaoyijzy").css({'display': 'block'})
        } else {
            $("#jiaoyijzy").css({'display': 'none'})
        }
        hideTree();
    };
    $(document).ready(function () {
        //初始组织树状图
        $.fn.zTree.init($("#treeDemo"), setting, orgList);
    });

    //下拉框显示 隐藏
    function showTree() {
        if ($('.ztree').css('display') == 'none') {
            $('.ztree').css('display', 'block');
        } else {
            $('.ztree').css('display', 'none');
        }
        $("body").bind("mousedown", onBodyDownByActionType);
    }

    function hideTree() {
        $('.ztree').css('display', 'none');
        $("body").unbind("mousedown", onBodyDownByActionType);
        return false;
    }

    //区域外点击事件
    function onBodyDownByActionType(event) {
        if (event.target.id.indexOf('treeDemo') == -1) {
            if (event.target.id != 'selectDevType') {
                hideTree();
            }
        }
    }

    function hjsgr(a, b) {
        var _b = b + ',', idx = a.indexOf(b), idx2 = a.indexOf(_b);
        if (idx == idx2)
            a = a.replace(_b, '');
        return a;
    }

    $('#addTime').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "timePicker": true,
        "timePicker24Hour": true,
        "opens": "center",
        locale: {
            format: "YYYY-MM-DD HH:mm:ss",
            applyLabel: '确定',
            cancelLabel: '取消',
            daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                '七月', '八月', '九月', '十月', '十一月', '十二月'
            ],
            firstDay: 1
        },
    }, function (start) {

    });


    function GetValue(se, obj, id) {
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
                $("#remoteUrl").val(url);
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

    $(document).ready(function () {
        var htmls = "";
        var ur = '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>'
        var imgalist = "${(entity.articleImages)!"-"}"
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
                            '<span class="layui-icon  layui-icon-close" name="articleImages"  test="' + _p[j] + '">&#x1006;</span>' +
                            '<img onclick="advPreviewImg(this)" src="' + ur + _p[j] + '"> ' +
                            '</li>'
                } else {
                    htmls += '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="articleImages"  test="' + _p[j] + '">&#x1006;</span>' +
                            '<img src="../../../images/file_wj.png"> ' +
                            '</li>'
                }
                $(".articleImages_url").html(htmls);

            }
        }
        jkhae();
    });

    setInputValue('${(entity.location)!''}');
</script>
<style>
    .trg {
        width: 0;
        height: 0;
        border-left: 3px solid transparent;
        border-right: 3px solid transparent;
        border-top: 6px solid black;;
        position: absolute;
        left: 181px;
        top: 8px;

    }

    .org-select {
        cursor: default;
        z-index: -1;
        width: 200px;
    }

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