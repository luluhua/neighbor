<#include "../../common/layout_dl.ftl">
<@header>
    <link href="${ctx}/wholesalestore/css/css.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/wholesalestore/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/style.css"/>
    <link href="${ctx}/base/js/layui/css/layui.css" rel="stylesheet"/>
</@header>
<@js>

</@js>
<@body>

<!--联系我们-->
    <#include "../base/contact.ftl">

<!--顶部-->
    <#include "../base/topHtml.ftl">
<div class="content_foot">
    <dl>
        <dd>
            <a href="${ctx}/index">返回首页</a>
            <a href="${ctx}/resource/ex?p=ex">我的资源</a>
            <a href="${ctx}/resource/ex?p=ex" class="curt_bg">编辑</a>
        </dd>
    </dl>
    <div class="">
        <form action="${ctx}/resource/doEdit" method="post" class="layui-form">
            <input type="hidden" name="id" id="uuid" value="${(goods.id)!}">
            <div class="layui-main" style="margin-top:20px;">
                <form class="layui-form" method="post" action="javascript:;">
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型</label>
                        <div class="ygkrt" id="navList">
                            <#list list as nav>
                                <input class="nav" type="radio" name="navigationCode"
                                       value="${(nav.code)!}" <#if (nav.code)==(goods.navigationCode)>checked</#if>
                                       title="${(nav.navigationName)!}">
                            </#list>
                        </div>
                        <div class="ygkrt" id="taglist">
                            <#list tagList as tag>
                                <input <#if (tag.id) == (goods.tagId)>checked</#if> class="navs" type="radio"
                                       lay-check-type="radio" name="tagId"
                                       value="${(tag.id)!}" title="${(tag.name)!}">

                            </#list>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="name" lay-verify="" placeholder="输入名称"
                                   autocomplete="off" lay-verify="required"
                                   class="layui-input input-title-500" value="${(goods.name)!}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">描述</label>
                        <div class="layui-input-inline">
                    <textarea placeholder="资源简单介绍，如规格。。。。" name="describe"
                              class="layui-textarea input-title-500">${(goods.describe)!}</textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">数量</label>
                        <div class="layui-input-inline">
                            <input type="number" name="quantity" lay-verify="" placeholder="输入数量"
                                   autocomplete="off"
                                   class="layui-input input-number-100" value="${(goods.quantity)!}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">规格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="specification" lay-verify="" placeholder="输入规格"
                                   autocomplete="off"
                                   class="layui-input input-title-500" value="${(goods.specification)!}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">介绍</label>
                        <div class="layui-input-inline">
                    <textarea name="intro" placeholder="资源简单介绍，如规格。。。。"
                              class="layui-textarea input-title-500">${(goods.intro)!}</textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">租借价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="price" lay-verify="required" placeholder="输入租借价格"
                                   autocomplete="off"
                                   class="layui-input" value="${(goods.price)!}">
                        </div>
                        <b class="tilaf">/ 天</b>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">价格类型</label>
                        <div class="layui-input-inline">
                            <input class="nav" type="radio" name="priceType"
                                   value="0" <#if goods.priceType==0>checked </#if>
                                   title="单价">
                            <input class="nav" type="radio" name="priceType"
                                   value="1"  <#if goods.priceType==1>checked </#if>
                                   title="总价">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">是否出售</label>
                        <div class="">
                            <input class="nav" type="radio" name="sellStale"
                                   value="0" <#if goods.sellStale==0>checked </#if>
                                   title="不出售" checked>
                            <input class="nav" type="radio" name="sellStale"
                                   value="1" <#if goods.sellStale==1>checked </#if>
                                   title="可以出售">
                        </div>
                    </div>
                    <div class="layui-form-item" id="sell_price" style="display: none">
                        <label class="layui-form-label">出售价格</label>
                        <div class="layui-input-inline">
                            <input type="text" id="sellPrice" name="sellPrice" lay-verify="" placeholder="输入出售价格"
                                   autocomplete="off"
                                   class="layui-input" value="${(goods.sellPrice)!}">
                        </div>
                    </div>

                    <div class="layui-form-item" id="sell_price">
                        <label class="layui-form-label">所在位置：</label>

                        <div class="hfuiawe">
                            <button type="button" class="layui-btn layui-btn-xs dialog_param" name="sellStale"
                                    data-title="选择地址" data-url="${ctx}/toMap" data-par="" ,data-width="350"
                                    data-height="450">选择位置
                            </button>
                            <input id="lngId" type="hidden" name="lng" value="${(goods.lng)!}">
                            <input id="latId" type="hidden" name="lat" value="${(goods.lat)!}">
                            <input type="text" id="location" name="location" lay-verify="" placeholder="填写详细地址"
                                   class="layui-input input-title-500" value="${(goods.location)!}">
                            <span class="fase">选择地址后请手动补全详细地址。详细的地址有利于别人更好的找到你的资源所在位置</span>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">图片上传</label>
                        <input type="hidden" name="files" id="file_" value="${(goods.files)!}">
                        <div class="layui-inline">
                            <div class="layui-upload-drag" id="filseUpload">
                                <i class="layui-icon"></i>
                                <p>点击上传，或将文件拖拽到此处</p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <div class="layui-inline" id="upload_preview">
                            <#list fileList as path>
                                <div class='img_vem'>
                                    <img alt='预览图'
                                         src='<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(path.filePath)!}'
                                         width='230px' height='146px'/>
                                    <span id='${(path.id)!}' onclick='deleteImg("${(path.id)!}")'
                                          class='layui-icon layui-icon-close img_cz'>&#x1006;</span>
                                </div>
                            </#list>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">是否上架</label>
                        <div class="">
                            <input class="nav" type="radio" name="status"
                                   value="0" <#if goods.status==0>checked </#if>
                                   title="是" checked>
                            <input class="nav" type="radio" name="status"
                                   value="1" <#if goods.status==1>checked </#if>
                                   title="否">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>

                        <div class="layui-input-inline">
                            <button class="layui-btn" id="onsubmits" lay-submit lay-filter="submit">提交
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </form>
    </div>
    <!--end-->
</div>


<!--底部-->
    <#include "../base/footerHtml.ftl">

<!--end-->

</@body>
<@footer>
<script>

    <#--$(function () {-->
    <#--var tagId = "${(goods.tagId)!}";-->

    <#--$.post('${ctx}/resource/json?_dc=' + new Date().getTime(), {navigationCode: "${(goods.navigationCode)!}"}, function (response) {-->
    <#--if (response.code == 200 && response.data.length > 0) {-->
    <#--var html = "";-->
    <#--for (var i = 0; i < response.data.length; i++) {-->
    <#--if (response.data[i].id == tagId) {-->
    <#--html += '<input checked class="navs" type="radio" lay-check-type="radio" name="tagId" value="' + response.data[i].id + '" title="' + response.data[i].tagName + '">'-->
    <#--} else {-->
    <#--html += '<input class="navs" type="radio" lay-check-type="radio" name="tagId" value="' + response.data[i].id + '" title="' + response.data[i].tagName + '">'-->
    <#--}-->
    <#--}-->
    <#--$("#taglist").html(html);-->
    <#--var form = layui.form;-->
    <#--form.render();-->
    <#--} else {-->
    <#--$("#taglist").html("");-->
    <#--var form = layui.form;-->
    <#--form.render();-->
    <#--}-->
    <#--});-->
    <#--})-->

    layui.use('form', function () {
        var form = layui.form;
        form.on('radio', function (data) {
            var name = data.elem.getAttribute("name");
            if (name == "sellStale") {
                var gha = $(this).val();
                if (gha == 1) {
                    $("#sell_price").show();
                    $("#sellPrice").attr('lay-verify', "required");
                } else {
                    $("#sell_price").hide();
                    $("#sellPrice").attr('lay-verify', "");
                }
                return true;
            }
            if (name != "tagId" && name != "priceType") {
                var navigationCode = $(this).val();
                $.post('${ctx}/resource/json?_dc=' + new Date().getTime(), {navigationCode: navigationCode}, function (response) {
                    if (response.code == 200 && response.data.length > 0) {
                        var html = "";
                        for (var i = 0; i < response.data.length; i++) {
                            html += '<input class="navs" type="radio" lay-check-type="radio" name="tagId" value="' + response.data[i].id + '" title="' + response.data[i].tagName + '">'
                        }
                        $("#taglist").html(html);
                        form.render();
                    } else {
                        $("#taglist").html("");
                        form.render();
                    }
                });
            }
        });
    });

</script>

<script>
    function deleteImg(id) {
        $.post('${ctx}/client/tSysAttachment/deletefile/' + id, function (response) {
            if (response.status == 0) {
                var hjsgr = $("#file_").val();
                var key = response.fileName;
                var sess = (',' + hjsgr + ',').replace(',' + key + ',', ',').substr(1).replace(/,$/, '');
                $("#file_").val(sess);
                $("#" + id).parent().remove();
            } else {
                layer.msg('删除失败！', {
                    time: 1000,
                    end: function () {
                    }
                })
            }
        });

    }

    $(".dialog_param").click(function () {
        var me = this;
        var url = $(this).attr('data-url');
        var par = $(this).attr('data-par');
        width = $(me).attr('data-width') || 800,
                height = $(me).attr('data-height') || 400,
                title = $(me).attr('data-title') || '';
        x_admin_show_param(title, url, width, height, par);
    });
</script>
</@footer>