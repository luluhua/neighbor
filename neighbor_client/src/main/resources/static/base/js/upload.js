﻿$(function () {
    layui.use(['layer', 'element', 'form', 'upload'], function () {
        var layer = layui.layer,
            element = layui.element,
            form = layui.form,
            upload = layui.upload;

        //创建监听函数
        var xhrOnProgress = function (fun) {
            xhrOnProgress.onprogress = fun; //绑定监听
            //使用闭包实现监听绑
            return function () {
                //通过$.ajaxSettings.xhr();获得XMLHttpRequest对象
                var xhr = $.ajaxSettings.xhr();
                //判断监听函数是否为函数
                if (typeof xhrOnProgress.onprogress !== 'function')
                    return xhr;
                //如果有监听函数并且xhr对象支持绑定时就把监听函数绑定上去
                if (xhrOnProgress.onprogress && xhr.upload) {
                    xhr.upload.onprogress = xhrOnProgress.onprogress;
                }
                return xhr;
            }
        }
        var demoCount = 0, vaetg = 0, demoFlag = false
        var uuid = $("#uuid").val();
        var uploadFile = upload.render({
            elem: '#filseUpload', //绑定元素
            url: '/m/client/tSysAttachment/file/upload', //上传接口
            exts: 'jpg|png|jpeg',//限定上传类型
            accept: 'images',//指定允许上传时校验的文件类型 images（图片）、file（所有文件）、video（视频）、audio（音频）
            acceptMime: 'image/jpg, image/png, image/jpeg',//只筛选上述类型图片
            number: 3,//0为不限制上传数量
            xhr: xhrOnProgress,
            data: {"uuid": uuid}, //可选项 额外的参数，如：{id: 123, abc: 'xxx'}
            multiple: true,// 开启多文件上传
            drag: true, //是否允许拖拽上传
            size: 1024 * 3,//为0为不限制大小
            bindAction: '#fileAction',
            //监听xhr进度，并返回给进度条
            progress: function (value) { //上传进度回调 value进度值,由于是进度条同时又是多文件上传不只一个进度条，所以要保证每次进度条的类名不一致，demoCount控制类名，demoFlag保证上下一致，所以该方法一直在被调用
                if (demoFlag) {
                    vaetg++;
                    var se = "demo" + vaetg;
                    element.progress(se, value + '%')
                }
            },
            before: function (obj) {
                layer.load(1);
            },
            auto: false, //选择文件后不自动上传 默认值为true
            choose: function (obj) {
                var files = obj.pushFile();
                obj.preview(function (index, file, result) {
                    demoCount++
                    var html = $(["<div class='img_vem'><img alt='预览图' src='" + result + "' width='230px' height='146px' /><span id='" + index + "' class='layui-icon layui-icon-close img_cz'>&#x1006;</span>" +
                    "<div class='layui-progress' lay-showpercent='true' lay-filter='demo" + demoCount + "'>" +
                    "<div class='layui-progress-bar layui-bg-red' lay-percent='0%'></div>" +
                    "</div>" +
                    "</div>"].join(''))
                    $("#upload_preview").append(html);
                    demoFlag = true
                    html.find('.img_cz').on("click", function () {
                        var sr = $(this).attr('id');
                        delete files[sr];
                        html.remove();
                        uploadFile.config.elem.next()[0].value = '';
                    });
                    obj.preview(function (index, file, result) {
                        //对上传失败的单个文件重新上传，一般在某个事件中使用
                        //obj.upload(index, file);
                    });
                });
            },
            allDone: function (obj) { //当文件全部被提交后，才触发
                // layer.msg("上传成功！");
                $("#onsubmits").click();
            },
            done: function (res, index, upload) {
                layer.close(layer.index);
                if (res.code == 0) {
                    var file_ = $("#file_").val();
                    if (file_ == "" || file_ == null) {
                        $("#file_").val(res.urls);
                    } else {
                        $("#file_").val(file_ + "," + res.urls);
                    }
                    // layer.msg("上传成功！");
                }
                if (res.code == 101) {
                    layer.msg("请登录！");
                }
            },
            error: function (index, upload) {
                //请求异常回调
                layer.close(layer.index);
                layer.confirm("上传失败，您是否要重新上传？", {
                    btn: ['确定', '取消'],
                    icon: 3,
                    title: "提示"
                }, function () {
                    //关闭询问框
                    layer.closeAll();
                    //重新调用上传方法
                    uploadFile.upload();
                })
            }
        });


    }) //layui

})
