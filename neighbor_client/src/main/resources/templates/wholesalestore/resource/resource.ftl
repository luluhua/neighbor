<!doctype html>
<html>
<head>
        <#include "../../common/base.ftl">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>信息发布</title>
    <link href="${ctx}/wholesalestore/css/css.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/wholesalestore/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/style.css"/>
    <link href="${ctx}/base/js/layui/css/layui.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/upload.js" type="text/javascript"></script>


</head>

<body class="body_bg">

<!--联系我们-->
<div class="contact_us">
    <div class="QQ">
        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=206599540&site=qq&menu=yes">在线咨询</a>
    </div>

    <div class="calls">
        <p>0771-5710902</p>
    </div>
    <!--end-->
</div>


<!--顶部-->
<#include "../base/topHtml.ftl">
<div class="content_foot">
    <dl>
        <dd>
            <a href="Shopping_guide.html">返回首页</a>
            <a href="Rights_members.html">我的资源</a>
            <a href="aboutus.html" class="curt_bg">信息发布</a>
        </dd>
    </dl>
    <div class="">
        <form action="${ctx}/resource/doAdd" method="post" class="layui-form">
            <input type="hidden" name="id" id="uuid" value="${(uuId)!}">
            <div class="layui-main" style="margin-top:20px;">
                <form class="layui-form" method="post" action="javascript:;">
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型</label>
                        <div class="ygkrt" id="navList">
                            <#list list as nav>
                                <input class="nav" type="radio" name="navigationCode"
                                       value="${(nav.code)!}"
                                       title="${(nav.navigationName)!}">
                            </#list>
                        </div>
                        <div class="ygkrt" id="taglist">
                        </div>
                    </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" lay-verify="" placeholder="输入名称"
                           autocomplete="off" lay-verify="required"
                           class="layui-input input-title-500">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">描述</label>
                <div class="layui-input-inline">
                    <textarea placeholder="资源简单介绍，如规格。。。。" name="describe"
                              class="layui-textarea input-title-500"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">数量</label>
                <div class="layui-input-inline">
                    <input type="number" name="quantity" lay-verify="required" placeholder="输入数量"
                           autocomplete="off"
                           class="layui-input input-number-100">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">规格</label>
                <div class="layui-input-inline">
                    <input type="text" name="specification" lay-verify="" placeholder="输入规格"
                           autocomplete="off"
                           class="layui-input input-title-500">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">介绍</label>
                <div class="layui-input-inline">
                    <textarea name="intro" placeholder="资源简单介绍，如规格。。。。"
                              class="layui-textarea input-title-500"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">租借价格</label>
                <div class="layui-input-inline">
                    <input type="text" name="price" lay-verify="required" placeholder="输入租借价格"
                           autocomplete="off"
                           class="layui-input">
                </div>
                <b class="tilaf">/ 天</b>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">价格类型</label>
                <div class="layui-input-inline">
                    <input class="nav" type="radio" name="priceType"
                           value="0"
                           title="单价">
                    <input class="nav" type="radio" name="priceType"
                           value="1"
                           title="总价">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否出售</label>
                <div class="">
                    <input class="nav" type="radio" name="sellStale"
                           value="0"
                           title="不出售" checked>
                    <input class="nav" type="radio" name="sellStale"
                           value="1"
                           title="可以出售">
                </div>
            </div>
            <div class="layui-form-item" id="sell_price" style="display: none">
                <label class="layui-form-label">出售价格</label>
                <div class="layui-input-inline">
                    <input type="text" id="sellPrice" name="sellPrice" lay-verify="" placeholder="输入出售价格"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">图片上传</label>
                <input type="hidden" name="files" id="file_" value="">
                <div class="layui-inline">
                    <div class="layui-upload-drag" id="filseUpload">
                        <i class="layui-icon"></i>
                        <p>点击上传，或将文件拖拽到此处</p>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <div class="layui-inline" id="upload_preview"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"></label>

                <div class="layui-input-inline">
                    <button class="layui-btn" id="onsubmits" lay-submit lay-filter="submit">提交表单
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
<script>
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
</script>
</body>
</html>
