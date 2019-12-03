<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>${projectName}</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/qxwz/css/civmbackForm.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/mui.picker.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/mui.dtpicker.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/layui.css">
    <script type="text/javascript" src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/base/js/mui.picker.min.js"></script>
    <script src="${ctx}/base/js/mui.dtpicker.js"></script>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
        }
    </script>
</head>
<body>

<!-- 主界面菜单同时移动 -->
<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 页眉导航 -->
        <!--
   <header class="mui-bar mui-bar-nav">
       <a id="nav-add" class="mui-icon mui-icon mui-icon-back" style="color:#000000;" href="javascript:mui.back()"></a>
       <h1 class="mui-title">市政反馈</h1>
   </header>-->

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper bus_defined">
            <div class="mui-scroll" id="boodylie">
                <!-- 主界面具体展示内容 -->
                <hr style="margin:0px;height:12px;border:0px;background-color:#EBF0F5;color:#EBF0F5;"/>
                <form class="form-horizontal" id="form-recird" action="${ctx}/qingxiuh5/qxwz/domewantpolitics"
                      method="post"
                      onsubmit="return banduan()">
                    <input name="tokens" id="tokens" type="hidden" value="${(tokens)!''}"/>
                    <div class="report_info">
                        <ul class="report_info_vessel">
                            <li>
                                <div class="tytpe_di">
                                    <span>标题</span>
                                    <input name="title" id="title" type="text" placeholder="请输入问政标题，20字内">
                                </div>
                            </li>
                            <li>
                                <div class="tytpe_di">
                                    <span>问政对象</span>
                                    <input name="dep" id="dep" type="hidden" value=""/>
                                    <div class="type-xuanz" id="typexuanz">
                                        <a href="javascript:void(0)" id="repot_type">请选择问政对象</a>
                                        <span class="mui-icon mui-icon-arrowdown"></span>
                                    </div>
                                    <br style="clear:both">
                                </div>
                            </li>
                            <li>
                                <div class="tytpe_di">
                                    <span>问政类型</span>

                                    <div class="type-yuror wenzdx">
                                        <input name="ctypeText" id="ctypeText" type="hidden" value="咨询"/>
                                        <a class="xuanzog" href="javascript:void(0)">咨询</a>
                                        <a href="javascript:void(0)">投诉</a>
                                        <a href="javascript:void(0)">建议</a>
                                    </div>
                                    <br style="clear:both">
                                </div>
                            </li>
                            <li>
                                <div class="tytpe_di sfgk">
                                    <span>是否公开</span>
                                    <input name="postUsername" id="postUsername" type="hidden" value="gk"/>
                                    <div class="type-yuror">
                                        <a class="gongkaixa" href="javascript:void(0)">公开</a>
                                        <a href="javascript:void(0)">不公开</a>
                                    </div>
                                    <br style="clear:both">
                                </div>
                            </li>
                        </ul>
                        <hr style="margin:0px;height:12px;border:0px;background-color:#EBF0F5;color:#EBF0F5;"/>
                        <div class="report_info_remark">
                            <div class="report_info_remark_content">
                                <span>详细描述</span>
                            </div>
                            <textarea id="dwar" name="postContent" placeholder="请输入详细描述，300字以内"></textarea>
                        </div>
                    </div>
                    <div class="report_info_img">
                        <div class="report_info_img_contet">
                            <input name="postFiles" id="postFiles" type="hidden" value=""/>
                            <span>上传照片</span>
                            <button type="button" class="layui-btn mui-icon mui-icon-camera" id="test1"></button>

                        </div>
                    </div>
                    <div class="report_info_img">
                        <div class="report_info_img_contet" id="imglie">

                        </div>
                    </div>
                    <div class="import_query_dxpress">
                        <button type="submit" class="mui-btn mui-btn-success">提交问政</button>
                    </div>
                    <div style="height:60px;display:block"></div>
            </div>

            </form>

        </div>

    </div>
</div>

</body>
<script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });


    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });

    mui('.wenzdx').on('tap', 'a', function () {
        $(this).addClass("xuanzog").siblings().removeClass("xuanzog");
        $("#ctypeText").val($(this).html());


    });

    mui('.sfgk').on('tap', 'a', function () {
        $(this).addClass("gongkaixa").siblings().removeClass("gongkaixa");
        var index = $(this).index();
        if (index == 1) {
            $("#postUsername").val("gk");
        } else {
            $("#postUsername").val("bgk");
        }

    });

    function banduan() {
        var dep = $("#dep").val();
        var seer = $("#dwar").val();
        var title = $("#title").val();

        if (title == '') {
            mui.toast('请填写标题', {duration: '3500ms', type: 'div'})
            return false
        }
        if (dep == '') {
            mui.toast('请选择问政对象', {duration: '3500ms', type: 'div'})
            return false
        }
        if (seer == '') {
            mui.toast('请填写描述', {duration: '3500ms', type: 'div'})
            return false
        }
        return true

    }


    //PopPicker选择器
    var typexuanz = $("#typexuanz")[0];
    if (typexuanz) {
        var picker = new mui.PopPicker();
    <#--picker.setData(${(list)});-->
        picker.setData([{value: '教育局', text: '教育局'}, {value: '城管', text: '城管'}]);
        document.querySelector("#typexuanz").addEventListener("tap", function () {
            picker.show(function (items) {
                $("#repot_type").html(items[0].text);
                $("#dep").val(items[0].value);

            });
        });
    }


    //上传文件
    layui.use('upload', function () {
        var upload = layui.upload;    //apkUpload
        //apk文件上传
        var uploadInst = upload.render({
            elem: '#test1',
            url: '${ctx}/common/file/upload',
            auto: true,
            // bindAction: '#daw',
            accept: 'file',
            size: 10240,
            multiple: false,
            // number: 3,
            data: {
                "groupId": 2,
                "saveTypeId": 1,
            },
            before: function (obj) {
                layer.load(3);
            },
            done: function (res) {
                if (res.status == "success") {
                    layer.load(3, {time: 1});
                    $("#imglie").append(' <img src="' + res.wholeUrl + '">');
                    var a = $("#postFiles").val();
                    if (a == "") {
                        $("#postFiles").val(res.wholeUrl);
                    } else {
                        $("#postFiles").val(a + "," + res.wholeUrl);
                    }


                }
            },
        });
    });


</script>
</html>