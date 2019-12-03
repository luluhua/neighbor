<!DOCTYPE html>
<#include "../common/base.ftl">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui"/>
    <title>手上青秀</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <script src="${ctx}/activity/js/jquery.min.js"></script>
    <link href="${ctx}/activity/css/activity1.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/base/css/mui.picker.css" rel="stylesheet"/>
    <link href="${ctx}/base/css/mui.poppicker.css" rel="stylesheet"/>
    <script type="text/javascript" src="${ctx}/base/js/mui.picker.js"></script>
    <script type="text/javascript" src="${ctx}/base/js/mui.poppicker.js"></script>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/layui.css">
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
    <script src="${ctx}/activity/js/activity.js?v=40"></script>
    <script>
        $(function () {
            // 判断运行环境
            activity.verApp();
            showLevel1();


        })

        function showLevel1() {
            var picker = new mui.PopPicker({
                layer: 1,
                buttons: ['取消', '确认']
            });
            picker.setData([{value: 'cybc', text: '创意编程'}, {value: 'cyfm2', text: '创意发明'}, {
                value: 'cyys22',
                text: '创意艺术'
            }]);

            document.querySelector("#yijixuanz").addEventListener("tap", function () {
                picker.show(function (items) {
                    $("#yiji").html(items[0].text);
                    $("#fenlei1").val(items[0].text);
                    // dasesd();
                });
            });
        }

    </script>
</head>
<body style="background-size:auto;">
<div id="bodyDivId" class="foasheff slide" style="height:100%;overflow:initial;background-image: none;">
    <div class="hfuawe">
        <div class="title_yt">
            <b class="dhoiwae">报名信息</b>
        </div>
        <div class="fjioaj" style="height: auto;">
            <div class="info_user">
                <input class="idsp" type="text" name="name" id="name" placeholder="请填写姓名"/>
            <#--<span class="tsSpan">* 必填</span>-->
            </div>
            <div class="info_user">
                <input class="idsp" type="text" oninput="value=value.replace(/[^\d]/g,'')" name="age" id="age"
                       placeholder="请填写年龄"/>
            <#--<span class="tsSpan">* 必填</span>-->
            </div>
            <div class="info_user">
                <input class="idsp" type="text" name="phone" id="phone" placeholder="请填写联系方式"/>
            <#--<span class="tsSpan">* 必填</span>-->
            </div>
            <div class="info_user">
                <input type="text" name="instructor" id="instructor" placeholder="请填写指导老师"/>
            <#--<span class="tsSpan">* 必填</span>-->
            </div>
            <div class="info_user">
                <input type="text" name="affiliation" id="affiliation" placeholder="请填写学校"/>
            <#--<span class="tsSpan">* 必填</span>-->
            </div>

        </div>
    <#--<div class="title_yt">-->
    <#--<b class="dhoiwae">作品信息</b>-->
    <#--</div>-->
        <div class="fjioaj" style="height: 100%;">
            <div class="fwegg">
                <!--<input type="radio" />-->
                <div class="hduiawhe fsdgd">
                    <input name="workClass" checked type="radio" value="A组（小学组）">
                    <span>A组（小学组）</span>
                </div>
                <div class="hduiawhe casas">
                    <span>B组（中学组）</span>
                    <input name="workClass" type="radio" value="B组（中学组）">
                </div>
                <br style="clear：both">
                <div class="foahsoea">
                    <a class="ty1" id="yijixuanz" href="javascript:;">
                        <input type="hidden" id="fenlei1">
                        <text id="yiji">--请选择--</text>
                        <span class="mui-icon mui-icon-arrowdown fkash"></span></a>
                    <a class="ty2" id="erjixuanz" href="javascript:;">
                        <input type="hidden" id="fenlei2">
                        <text id="erji">--请选择--</text>
                        <span class="mui-icon mui-icon-arrowdown fkash"></span></a>
                </div>
            <#--<span class="tsSpan" style="clear:both;">* 必选</span>-->
                <div class="info_user">
                    <input type="text" id="workName" name="workName" placeholder="请填写作品名称"/>
                <#--<span class="tsSpan">* 必填</span>-->
                </div>
                <div class="info_user fofsg">
                    <textarea name="workDescription" id="workDescription" placeholder="请填写作品阐述"></textarea>
                <#--<span class="tsSpan">* 必填</span>-->
                </div>
                <div class="fhosaho hfuiashe">
                    <button type="button" class="fasf" id="text1"><a class="fjdso" href="javascript:;"></a>作品上传</button>

                </div>
                <span class="tsSpan">* 上传一个作品视频或9张以内作品图片</span>
                <div class="imgofe box" style="display: none;overflow:inherit;">
                    <span id="videoSpan" class="mui-icon mui-icon-closeempty fhase"
                          style="background-color: red;width:20px;height:20px;" onclick="delMp4()"></span>
                    <video id="file_mp4" src="" controls="controls"
                           style="border: 1px white solid;width: 100px;border: 1px solid #fff;"></video>
                    <input type="hidden" id="fileTypeId">
                    <input type="hidden" id="fileNumId" value="0">
                    <input type="hidden" id="workPath" name="workPath" placeholder="作品名称"/>
                    <ul id="imgsUlId"></ul>
                </div>

                <span></span>
                <div class="info_user subfor" style="margin-bottom: 20px;">
                    <button type="submit" onclick="fome_tijiao()">提交</button>
                </div>

            </div>
        </div>
    </div>

</div>

</div>
<div class="ajsfsaf" id="tsDiv" style="display: none;">
    <a href="javascript:;" id="hgoashe">您已报名,感谢参与!</a>
</div>
</body>
<script type="text/javascript">

    //上传
    layui.use('upload', function () {
        var upload = layui.upload;    //apkUpload
        //apk文件上传
        var uploadInst = upload.render({
            elem: '#text1',
            url: '${ctx}/common/file/upload',
            auto: true,
            // bindAction: '#daw',
            accept: 'file',
            exts: 'jpg|png|jpeg|mp4|MOV',
            size: 10240,
            multiple: true,
            number: 9,
            data: {
                "groupId": 2,
                "saveTypeId": 1,
            },
            before: function (obj) {
                console.log(obj);
                layer.load(3);
                var filenum = $("#fileNumId").val();
                var fileType = $("#fileTypeId").val();
                if (fileType == 1 && filenum >= 9) {
                    layer.alert("作品只能上传9张图片");
                    layer.load(3, {time: 1});
                    return;
                } else if (fileType == 2 && filenum == 1) {
                    layer.alert("作品只能上传1个不超过3分钟视频");
                    layer.load(3, {time: 1});
                    return;
                }
            },
            done: function (res) {
                if (res.status == "success") {
                    var filenum = $("#fileNumId").val();
                    layer.load(3, {time: 1});
                    //上传规则 一个视频或9张以内图片、
                    //显示 已上传显示区域
                    $(".imgofe").css({'display': 'block'});
                    //判断 第一个作品类型
                    if (res.suffix == "mp4" || res.suffix == "MP4" || res.suffix == "MOV") {
                        $("#workPath").val("");
                        //清空图片
                        $("#imgsUlId").hide();
                        $("#imgsUlId").find("li").remove();
                        //显示删除
                        $("#videoSpan").show();
                        //视频类 显示 视频显示区域
                        // $("#file_mp4").css({'display': 'block'});
                        $("#file_mp4").show();
                        $("#file_mp4").attr('src', res.wholeUrl);
                        //隐藏图片区域
                        $("#imgise").css({'display': 'none'});
                        //隐藏上传按钮
                        $(".hfuiashe").css({'display': 'none'});

                        $("#fileTypeId").val(2)
                        $("#fileNumId").val(1);
                        //添加作品地址
                        $("#workPath").val(res.urls);
                    } else {
                        //图片类
                        //隐藏视频区域
                        $("#videoSpan").hide();
                        $("#imgsUlId").show();
                        var _numId = Number(filenum) + 1;
                        $("#file_mp4").hide();
                        var _img = "<li id='delImgId" + _numId + "' style='margin-left: 5px;'> <span class='mui-icon mui-icon-closeempty fhase' style='background-color: red;width:20px;height:20px;' onclick='fhuiae(" + _numId + ")'></span><img class='upimgs' data-preview-src='" + res.wholeUrl + "' title='" + res.urls[0] + "' data-preview-group='img1'  src='" + res.wholeUrl + "' style='border: 1px solid #fff;margin: 5px;' /></li>";
                        $("#imgsUlId").append(_img);
                        $("#fileNumId").val(_numId);

                        $("#fileTypeId").val(1);
                        if (_numId == 9) {
                            $(".fhosaho").hide();
                        }
                    }

                } else {
                    nativeWeb.toast(res.msg);
                    layer.load(3, {time: 1});
                }
            },
        });
    });


    //保存提交-上传作品 -开始
    function fome_tijiao() {
        layer.load(3);
        var workClass = "";
        var fenlei1 = $("#fenlei1").val();
        var fenlei2 = $("#fenlei2").val();
        if (fenlei1 != "") {
            workClass = fenlei1;
        } else if (fenlei2 != "") {
            workClass = fenlei2;
        }
        var workName = $("#workName").val();  //作品名称
        var group = $('input:radio[name="workClass"]:checked').val();  //分组
        var workClass = workClass;  //分类
        var name = $("#name").val();  //名称
        var age = $("#age").val();  //年龄
        var affiliation = $("#affiliation").val(); //学校
        var instructor = $("#instructor").val();  //指导老师
        var phone = $("#phone").val();  //联系方式
        var workDescription = $("#workDescription").val();  // 阐述
        if (name == "") {
            nativeWeb.toast("请填写姓名");
            layer.load(3, {time: 1});
            return false;
        }
        if (age == "" || age.length > 2) {
            nativeWeb.toast("请填写正确年龄");
            layer.load(3, {time: 1});
            return false;
        }
        if (phone == "" || phone.length != 11) {
            nativeWeb.toast("请输入正确的联系方式");
            layer.load(3, {time: 1});
            return false;
        }
        if (instructor == "") {
            nativeWeb.toast("请填写指导老师");
            layer.load(3, {time: 1});
            return false;
        }
        if (affiliation == "") {
            nativeWeb.toast("请填写学校/机构");
            layer.load(3, {time: 1});
            return false;
        }
        if (workClass == "") {
            nativeWeb.toast("请选择作品分类");
            layer.load(3, {time: 1});
            return false;
        }
        if (workName == "") {
            nativeWeb.toast("请填写作品名称");
            layer.load(3, {time: 1});
            return false;
        }
        //去除最后一个逗号
        var fileType = $("#fileTypeId").val();
        if (fileType == 1) {
            var _s = "";
            $("#workPath").val("");
            $(".upimgs").each(function () {
                var _imgUrl = $(this).attr("title");
                if (_s == '') {
                    _s = _imgUrl + ",";
                } else {
                    _s = _s + _imgUrl + ",";
                }
            });
            if (_s != "") {
                $("#workPath").val(_s.substring(0, _s.length - 1));
            }
        }
        var workPath = $("#workPath").val();  //文件
        if (workPath == "") {
            nativeWeb.toast("请上传作品");
            layer.load(3, {time: 1});
            return false;
        }
        $.ajax({
            async: true,
            type: "POST",
            url: "${ctx}/activity/form_gjacti",
            headers: {token: window._gToken},
            data: {
                "workGroup": group,
                "workName": workName,
                "workClass": workClass,
                "name": name,
                "age": age,
                "affiliation": affiliation,
                "instructor": instructor,
                "phone": phone,
                "workDescription": workDescription,
                "workPath": workPath
            },
            dataType: "json",
            success: function (json) {
                if (json.code == 0) {
                    layer.load(3, {time: 1});
                    nativeWeb.toast("提交成功！");
                    $("#bodyDivId").hide();
                    $("#tsDiv").show()
                } else if (json.code == 506) {
                    nativeWeb.toast(json.msg);
                    layer.load(3, {time: 1});
                } else {
                    nativeWeb.gotoLogin();
                }
                layer.load(3, {time: 1});
            }

        });
    }

    //删除已上传图片
    function fhuiae(_id) {
        var filenum = $("#fileNumId").val();
        if (filenum > 0) {
            var _numId = Number(filenum) - 1;
            $("#fileNumId").val(_numId);
            if (_numId == 0) {
                $("#fileTypeId").val(0);
                $(".imgofe").hide();
            }
            if (_numId < 9) {
                $(".fhosaho").show();
            } else if (_numId == 0) {
                $("#workPath").val("");
            }
        } else if (filenum == 0) {
            $("#workPath").val("");
        }
        $("#delImgId" + _id).remove();

    }

    //删除视频
    function delMp4() {
        $("#file_mp4").attr('src', '');
        $("#workPath").val("");
        $(".imgofe").hide();
        $(".fhosaho").show();
        $("#fileNumId").val(0);
        $("#videoSpan").hide();

    }

    //二级类别选择
    var repot_types = $("#erjixuanz")[0];
    if (repot_types) {
        var pickers = new mui.PopPicker();
        document.querySelector("#erjixuanz").addEventListener("tap", function () {
            var sdhf = $("#yiji").html();
            if (sdhf == "创意艺术") {
                pickers.setData([{value: 'cyhh', text: '创意绘画'}, {value: 'cysgy', text: '创意手工艺'}, {
                    value: 'cyfs',
                    text: '创意服装'
                }, {value: 'cyfz', text: '创意服装'}, {value: '3ddy', text: '3D 打印'}, {
                    value: 'qcmx',
                    text: '汽车模型'
                }, {value: 'cyqj', text: '创意情景剧表演'}]);
                $("#erji").html("创意绘画");
            } else if (sdhf == "创意编程") {
                pickers.setData([{value: 'hdyxl', text: '互动游戏类'}, {value: 'sycxgjl', text: '实用程序工具类'}, {
                    value: 'kpl',
                    text: '科普类'
                }, {value: 'jqrbc', text: '机器人编程'}]);
                $("#erji").html("互动游戏类");
            } else if (sdhf == "创意发明") {
                pickers.setData([{value: 'shwyxfm', text: '生活中实用的小发明'}]);
                $("#erji").html("生活中实用的小发明");
            } else {
                pickers.setData([]);
            }
            pickers.show(function (items) {
                $("#erji").html(items[0].text);
                $("#fenlei2").val(items[0].text);
            });
        });
    }
    //类别级联 -结束
</script>

</html>