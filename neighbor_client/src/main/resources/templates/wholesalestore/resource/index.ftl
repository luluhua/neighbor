<!doctype html>
<html>
<head>
    <#include "../../common/base.ftl">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>资源上传</title>
    <link href="${ctx}/base/js/layui/css/layui.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/upload.js" type="text/javascript"></script>

</head>
<body>
<div class="form">
    <form action="" method="get">
        <div class="layui-main" style="margin-top:100px;">
            <form class="layui-form" method="post" action="javascript:;">
                <div class="layui-form-item">
                    <label class="layui-form-label">名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" lay-verify="required" placeholder="输入名称" autocomplete="off"
                               class="layui-input input-title-500">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">图片上传</label>
                    <div class="layui-inline">
                        <div class="layui-upload-drag" id="upload">
                            <i class="layui-icon"></i>
                            <p>点击上传，或将文件拖拽到此处</p>
                        </div>
                    </div>
                    <div class="layui-inline" id="upload_preview"></div>
                </div>
                <div class="layui-form-item layui-hide" id="upload_progress">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline" style="width:21%;">
                        <div class="layui-progress" lay-showpercent="true" lay-filter="upload_progress">
                            <div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-hide" id="upload_progress">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline" style="width:21%;">
                        <div class="layui-progress" lay-showpercent="true" lay-filter="upload_progress">
                            <div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <button class="layui-btn" lay-submit>提交表单</button>
                    </div>
                </div>
            </form>
        </div>
    </form>
</div>


</body>

</html>