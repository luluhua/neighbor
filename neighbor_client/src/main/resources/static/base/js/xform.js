//layui模块的定义
layui.define(['layer', 'form', 'upload'], function (exports) {

    var $ = layui.jquery, upload = layui.upload, form = layui.form;
    // 验证
    form.verify({
        username: function (value, item) { // value：表单的值、item：表单的DOM对象
            if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                return '用户名不能有特殊字符';
            }
            if (/(^\_)|(\__)|(\_+$)/.test(value)) {
                return '用户名首尾不能出现下划线\'_\'';
            }
            if (/^\d+\d+\d$/.test(value)) {
                return '用户名不能全为数字';
            }
        },
        pass: function (value) {
            if (value != '') {
                if (!/^[\S]{6,12}$/.test(value)) {
                    return '密码必须6到12位，且不能出现空格';
                }
            }
        },
        brief: function (value) {
            if (value != '') {
                if (!/^[\S]{0,10}$/.test(value)) {
                    return '摘要只能填写10个字符';
                }
            }
        },
        //重复密码相等验证
        eqPwd: function (value) {
            //获取密码
            var pwd = $("#password").val();
            if (pwd != value) {
                return '两次输入的密码不一致';
            }
        },
        //重复密码相等验证-一级密码
        eqOnepassword: function (value) {
            //获取密码
            var pwd = $("#onepassword").val();
            if (pwd != value) {
                return '两次输入的密码不一致';
            }
        },
        //重复密码相等验证-二级密码
        eqTwopassword: function (value) {
            //获取密码
            var pwd = $("#twopassword").val();
            if (pwd != value) {
                return '两次输入的密码不一致';
            }
        },
        file: function (value, item) {
            if (value == '') {
                return "上传文件不能为空";
            }
        },

        //异步检测
        check: function (value, item) {
            var checkUrl = $(item).attr('check-url');
            var name = $(item).attr('name');
            var _msg = "";
            if (checkUrl != '') {
                $.ajax({
                    type: "post",
                    url: checkUrl,
                    data: name + "=" + value,
                    async: false,
                    success: function (data) {
                        if (data.code != 200) {
                            if (data.msg) {
                                _msg = data.msg;
                            } else {
                                _msg = "该字段已存在";
                            }
                        }
                    }
                });
            }
            if (_msg != '') {
                return _msg;
            }
        }
    });

    // 文件上传

    // upload.render({
    //     elem: '#file-btn',
    //     url: '/file/upload/',
    //     size: 5 * 1024, // 限制文件大小，单位 KB
    //     done: function (res) {
    //         if (res.status == 'success') {
    //             layer.msg("文件上传成功", {
    //                 icon: 1
    //             });
    //             var urls = res.urls;
    //             $("#file-txt").html(urls[0]);
    //             $("#file-val").val(urls[0]);
    //         } else {
    //             layer.msg(res.msg, {
    //                 icon: 2
    //             });
    //         }
    //     }
    // });

    // 监听提交
    form.on('submit(submit)', function (data) {
        // alert($(this))

        var values = data.field, fm = data.form;
        //获取checkbox选中的值
        var $ch = $("input:checkbox:checked");
        var name = {};
        var chvs = [];
        if ($ch && $ch[0]) {
            name = $ch[0].name;
            $ch.each(function () {
                chvs.push($(this).val());
            });
            values[name] = chvs;
        }
        var index = layer.load(3); // 换了种风格
        $.post($(fm).attr('action'), values, function (data) {
            layer.close(index);
            if (data.code == 200) {
                if (data.url) {
                    activity.timeJump(data.msg, 2000, data.url);

                    return;
                } else {
                    parent.layer.msg('注册成功', {icon: 1});
                }

            } else {
                activity.iconNoTooltip(data.msg)
            }

        });
        return false;
    });
    //监听开关
    form.on('switch(switch)', function (data) {
        layer.tips(data.elem.checked ? '是' : '否', data.othis);
    });


    exports('xform', {});
});

function Integer(value, min, max) {
    eval("var reg = /\^[1-9]\\d{" + min + "," + (max - 1) + "\}$/;");
    var re = new RegExp(reg);
    if (re.test(value)) {
        return true;
    }
    else {
        return false;
    }
}

function oncheckCode(item) {
    if (!Integer($(item).val(), 1, 10)) {
        $(item).val("10");
    }
}

function previewImg(obj) {
    var img = new Image();
    img.src = obj.src;
    var imgHtml = "<img src='" + obj.src + "' width='500px' height='500px'/>";
    //弹出层
    layer.open({
        type: 1,
        shade: 0.8,
        offset: 'auto',
        area: [500 + 'px', 550 + 'px'],
        shadeClose: true,
        scrollbar: false,
        title: "图片预览", //不显示标题
        content: imgHtml, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
        cancel: function () {
            //layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', { time: 5000, icon: 6 });
        }
    });
}


function advPreviewImg(obj) {
    var img = new Image();
    img.src = obj.src;
    var img_width;
    img.onload = function () {

        var w = img.width;
        var h = img.height;
        if (img.width > 2000) {
            img_width = img.width * 0.2;
        } else if (img.height > 1500) {
            img_width = img.width * 0.3;
        } else {
            img_width = img.width * 0.5;
        }
        var imgHtml = "<img onmousewheel='return bbimg(this)' style='margin: auto;display: block' id='imgfangda' src='" + obj.src + "' width='" + img_width + "px'/>";
        //弹出层
        layer.open({
            type: 1,
            shade: 0.8,
            offset: 'auto',
            area: [],
            shadeClose: true,
            scrollbar: false,
            title: "图片预览", //不显示标题
            content: imgHtml, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            cancel: function () {
                //layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', { time: 5000, icon: 6 });
            }
        });
    }
}

//
function recordPreviewImg(obj) {
    var img = new Image();
    img.src = obj.src;
    var img_width;
    img.onload = function () {
        var w = img.width;
        var h = img.height;
        if (img.width > 2000) {
            img_width = img.width * 0.2;
        } else if (img.height > 1500) {
            img_width = img.width * 0.3;
        } else {
            img_width = img.width * 0.5;
        }
        var imgHtml = "<img onmousewheel='return bbimg(this)' style='margin: auto;display: block' id='imgfangda' src='" + obj.src + "' width='" + img_width + "px'/>";
        //弹出层
        layer.open({
            type: 1,
            shade: 0.3,
            offset: 'auto',
            area: [],
            shadeClose: true,
            scrollbar: false,
            title: "图片预览", //不显示标题
            content: imgHtml, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            cancel: function () {
                //layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', { time: 5000, icon: 6 });
            }
        });

    }
}
