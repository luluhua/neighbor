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
                                <input class="nav" type="checkbox" lay-check-type="radio" name="navigationCode"
                                       value="${(nav.navigationId)!}"
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
                    <input type="text" name="specification" lay-verify="required" placeholder="输入规格"
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
                <label class="layui-form-label">价格</label>
                <div class="layui-input-inline">
                    <input type="text" name="price" lay-verify="required" placeholder="输入名称"
                           autocomplete="off" lay-verify=""
                           class="layui-input input-number-100">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">价格类型</label>
                <div class="layui-input-inline">
                    <input class="nav" type="checkbox" lay-check-type="radio" name="priceType"
                           value="0"
                           title="单价">
                    <input class="nav" type="checkbox" lay-check-type="radio" name="priceType"
                           value="1"
                           title="总价">
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
                    <a class="layui-btn" id="fileAction">提交</a>
                    <button class="layui-btn" style="display: none" id="onsubmits" lay-submit lay-filter="submit">提交表单
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
        form.on('checkbox', function (data) {
            var name = data.elem.getAttribute("name");
            if (data.elem.getAttribute("lay-check-type") === "radio" && name) {
                var domArr = document.getElementsByName(name);
                var checked = false;
                for (var i = 0; i < domArr.length; i++) {

                    if (domArr[i] !== data.elem && domArr[i].getAttribute("lay-check-type") === "radio") {
                        if (data.elem.checked) {
                            domArr[i].checked = false;
                        } else if (domArr[i].checked) {
                            checked = true;
                        }
                    }
                }
                data.elem.checked = !checked ? true : data.elem.checked;
                form.render('checkbox');
            }
            if (name != "tagId" && name != "priceType") {
                $("#navList").find("div").removeClass("layui-form-checked")
                $(this).next('div').addClass("layui-form-checked");
                var navigationId = $(this).val();
                $.post('${ctx}/resource/json?_dc=' + new Date().getTime(), {navigationId: navigationId}, function (response) {
                    if (response.code == 200 && response.data.length > 0) {
                        var html = "";
                        for (var i = 0; i < response.data.length; i++) {
                            html += '<input class="nav" type="checkbox" lay-check-type="radio" name="tagId" value="' + response.data[i].id + '" title="' + response.data[i].tagName + '">'
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

</script>
</body>
</html>