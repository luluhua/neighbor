<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <small><a href="/cms/tCmsArticle/list/${pageNumber!}?crt=${(crt.code)!}">
                内容列表 </a> >
                添加
            </small>
        </h1>
    </section>
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">

                    <form class="form-horizontal layui-form layui-form-pane" method="post"
                          action="/cms/tCmsArticle/doAdd" onkeydown="if(event.keyCode==13){return false;}">
                        <div class="box-body">
                            <input name="id" id="id" value="${uuid}" type="hidden">
                            <input name="programId" id="programId" value="${(crt.id)!}" type="hidden">
                            <input name="pageNumber" id="pageNumber" value="${pageNumber!}" type="hidden">
                        </div>
                        <div class="form-group">
                            <label for="classifyId" class="col-sm-2 control-label">文章分类：<span
                                    class="xing_red">*</span></label>
                            <div class="col-sm-10">
                                <div style="position: relative;z-index: 999;">
                                    <input id="orgName" class="org-select" onclick="showTree()" style="height: 33px;"
                                           readOnly="true">
                                    <!-- 模拟select点击框 以及option的text值显示-->
                                    <i class="trg" style="position: absolute;"></i>
                                    <!-- 模拟select右侧倒三角 -->
                                    <input id="orgCode" type="hidden" lay-verify="required" name="classifyId"/>
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
                            <label for="title" class="col-sm-2 control-label">标题：<span
                                    class="xing_red ">*</span></label>
                            <div class="col-sm-10">
                                <input type="text" id="title" name="title" class="form-control input-title-500"
                                       placeholder="请输入标题" lay-verify="required"/>
                            </div>
                        </div>
                    <#if crt.code=='bmfw'>
                         <input id="lngId" type="hidden" name="lng" value="">
                        <input id="latId" type="hidden" name="lat" value="">
                        <div class="form-group">
                            <label for="deptName" class="col-sm-2 control-label">联系地址<span
                                    class="xing_red"> *</span></label>
                            <div class="col-sm-10">
                                <input type="text" id="address" name="location"
                                       class="form-control input-title-500 dialog_param"
                                       data-title="选择地址"
                                       data-url="/toMap" data-par=""
                                       ,data-width="300" data-height="400"
                                       readonly value=""
                                       placeholder="请输入联系地址"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="source" class="col-sm-2 control-label">联系电话：</label>
                            <div class="col-sm-10">
                                <input type="text" id="source" name="source"
                                       class="form-control input-select-200"
                                       placeholder="输入联系电话"/>
                            </div>
                        </div>
                    <div class="form-group" id="jiaoyijzy" style="display: none">
                        <label for="titleSub" class="col-sm-2 control-label">校训：</label>
                        <div class="col-sm-10">
                            <textarea id="titleSub" name="titleSub" class="textar-remark"
                                      placeholder="请输入校训"></textarea>
                        </div>
                    </div>

                    <#elseif crt.code=="zhdj">
                           <div class="form-group">
                               <label for="gotoUrl" class="col-sm-2 control-label">跳转地址</label>
                               <div class="col-sm-10">
                                   <input type="text" id="gotoUrl" name="gotoUrl"
                                          class="form-control input-title-500 "
                                          placeholder="请输入跳转地址"/>
                               </div>
                           </div>
                    <#else >

                         <div class="form-group">
                             <label for="titleSub" class="col-sm-2 control-label">子标题：</label>
                             <div class="col-sm-10">
                                 <input type="text" id="titleSub" name="titleSub"
                                        class="form-control input-title-500"
                                        placeholder="请输入子标题"/>
                             </div>
                         </div>

                        <div class="form-group">
                            <label for="source" class="col-sm-2 control-label">来源：</label>
                            <div class="col-sm-10">
                                <input type="text" id="source" name="source"
                                       class="form-control input-select-200"
                                       placeholder="请输入来源"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="author" class="col-sm-2 control-label">作者：</label>
                            <div class="col-sm-10">
                                <input type="text" id="author" name="author" class="form-control input-select-200"
                                       placeholder="请输入作者"/>
                            </div>
                        </div>
                    </#if>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">是否发布：</label>
                            <div class="col-sm-10">
                                <label>
                                    <input name="articleStatus" type="radio" checked
                                           class="minimal"
                                           value="1" lay-ignore> 是
                                </label>
                                <label>
                                    <input name="articleStatus" type="radio" class="minimal"
                                           value="0" lay-ignore> 否
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="daterange" class="col-sm-2 control-label">发布时间：</label>
                            <div class="col-sm-10">
                                <input type="text"
                                       class="form-control date input-select-200" id="addTime" name="addTime"
                                       placeholder="选择发布时间">
                            </div>
                        </div>
                    <#--<#if crt.code=='bmfw'>-->
                        <div class="form-group">
                            <input type="hidden" id="articleImages" name="articleImages" class="form-control"/>
                            <label for="systemLogo" class="col-sm-2 control-label">多图：</label>
                            <div class="col-sm-1" id="uysr">
                                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                                   data-url="/system/accessory/add?fileQuantity=0&vessel=articleImages&classify=${(crt.code)!}&dict=cms_article"
                                   data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                            </div>
                        <#--<div class="col-sm-8">-->
                        <#--<ul class="uiisar articleImages_url">-->
                        <#--</ul>-->
                        <#--</div>-->
                        </div>
                        <div class="form-group">
                            <label for="systemLogo" class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <ul class="uiisar articleImages_url">
                                </ul>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="hidden" id="image1" name="image1" class="form-control"/>
                            <label for="systemLogo" class="col-sm-2 control-label">缩略图：</label>
                            <div class="col-sm-1" id="uysr">
                                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                                   data-url="/system/accessory/add?fileQuantity=1&vessel=image1&classify=${(crt.code)!}&dict=cms_article"
                                   data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                            </div>
                        <#--<div class="col-sm-8">-->
                        <#--<ul class="uiisar image1_url">-->
                        <#--</ul>-->
                        <#--</div>-->
                        </div>
                        <div class="form-group">
                            <label for="systemLogo" class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <ul class="uiisar image1_url">
                                </ul>
                            </div>
                        </div>
                    <#--<#elseif crt.code!='zhdj'>-->
                        <div class="form-group">
                            <input type="hidden" id="image2" name="image2" class="form-control"/>
                            <label for="systemLogo" class="col-sm-2 control-label">详情图：</label>
                            <div class="col-sm-1" id="uysr">
                                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                                   data-url="/system/accessory/add?fileQuantity=1&vessel=image2&classify=${(crt.code)!}&dict=cms_article"
                                   data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="systemLogo" class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <ul class="uiisar image2_url">
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
                                              placeholder="请输入摘要(限200字)"> </textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="articleContent" class="col-sm-2 control-label">文章内容：</label>
                            <div class="col-sm-10">
                                <a class="btn btn-primary dialog" style="display: none" href="javascript:;"
                                   data-title=" 附件管理" id="jkhaskr"
                                   data-url="/system/accessory/add?fileQuantity=1&vessel=editor_id&classify=${(crt.code)!}&dict=cms_article"
                                   data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                                <textarea class="ase" id="editor_id" name="articleContent"
                                          style="height:300px; width: 80%"></textarea>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="articleTags" class="col-sm-2 control-label">标签：</label>
                            <div class="col-sm-10">
                                <textarea class="tag" name="articleTags"></textarea>
                            </div>
                        </div>
                    <#--<#if crt.code !='bmfw'&& crt.code !='zhdj'>-->
                    <#--<div class="form-group">-->
                    <#--<input type="hidden" id="articleFiles" name="articleFiles" class="form-control"/>-->
                    <#--<label for="systemLogo" class="col-sm-2 control-label">文件上传：</label>-->
                    <#--<div class="col-sm-3">-->
                    <#--<input name="file" type="file" multiple class="file-loading"-->
                    <#--id="articleFilesfile">-->
                    <#--</div>-->
                    <#--</div>-->
                    <#--</#if>-->
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

<script>
    $(function () {
        $(".tag").tagEditor({
            placeholder: '添加规格后按Enter'
        });
    })


</script>

<script src="/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
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
            //上传文件后运行的回调函数,获取上传图片的路径
            afterUpload: function (url) {
            <#--var sae = "<@commonTags method='tagHtpImgURL' type='1' value='1'>${(tagHtpImgURL)!}</@commonTags>" + url + " onerror=this.src='../../../images/default.png'"-->
            <#--// this.sync(sae);-->
            }
            ,
            afterBlur: function () {
                this.sync();
            }
            ,
        });

    });


    var orgList = ${list!}
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

    $('#addTime').daterangepicker({
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
    .trg {
        width: 0;
        height: 0;
        border-left: 3px solid transparent;
        border-right: 3px solid transparent;
        border-top: 6px solid black;;
        position: absolute;
        left: 181px;
        top: 15px;

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