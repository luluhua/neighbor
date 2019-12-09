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
    <link href="${ctx}/user/css/attestation.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/js/layui/css/layui.css">
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/public.js"></script>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
    <#--识别公用js-->
    <script src="${ctx}/user/js/discriminate_common.js"></script>
</head>
<body>

<!-- 主界面菜单同时移动 -->
<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 页眉导航 -->
        <!--<header class="mui-bar mui-bar-nav">
            <h1 class="mui-title">手上清秀</h1>
        </header>-->

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <div class="top-background">
                        <b>行驶证识别</b>
                        <span>请上传行驶证照片，保证字体清晰无遮挡</span>
                        <img style="display: none" id="imgse" src=""/>
                    </div>

                    <div class="discern-result" style="display: none">
                        <text>识别结果</text>
                        <table class="layui-table" style="margin: 10px;width: auto !important;">
                            <tr>
                                <td>车牌号码</td>
                                <td id="p_car_code"></td>
                            </tr>
                            <tr>
                                <td>车辆类型</td>
                                <td id="p_car_type"></td>
                            </tr>
                            <tr>
                                <td>所有人</td>
                                <td id="p_car_own"></td>
                            </tr>
                            <tr>
                                <td>住址</td>
                                <td id="p_address"></td>
                            </tr>
                            <tr>
                                <td>使用性质</td>
                                <td id="p_usage_characteristics"></td>
                            </tr>
                            <tr>
                                <td>品牌型号</td>
                                <td id="p_brand_model"></td>
                            </tr>
                            <tr>
                                <td>车辆识别代号</td>
                                <td id="p_car_wpmi"></td>
                            </tr>
                            <tr>
                                <td>发动机号码</td>
                                <td id="p_engine_number"></td>
                            </tr>
                            <tr>
                                <td>注册日期</td>
                                <td id="p_register_date"></td>
                            </tr>
                            <tr>
                                <td>发证日期</td>
                                <td id="p_certificate_date"></td>
                            </tr>
                        </table>

                    </div>


                    <div class="img_open" id="">
                        <button type="button" class="layui-btn" id="test1" >选取图片</button>
                        <button type="button" class="layui-btn" id="test2" style="display: none;">确认提交</button>
                    </div>

                    <div class="img_ingse" id="img_ingse_Id">
                        <b>选取示例图</b>
                        <div class="img_living">
                            <img src="${ctx}/user/images/xsz.jpg"/>
                        </div>
                    </div>
                </div>
                <div style="height: 60px;display: block">

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //获取token
    var _gToken ='';
    $(function () {
        nativeWeb.getToken();
    });
    function  getTokenCallback(_token){
        _gToken=_token;
    }
    //上传文件
    layui.use('upload', function () {

        var upload = layui.upload;    //apkUpload
        //apk文件上传
         upload.render({
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
            },before: function(obj){
                 if(_gToken==''){
                     mui.toast("未登录", {duration: '3500ms', type: 'div'});
                     return;
                 }
                //文件提交上传前的回调。返回一个object参数
                layer.load(1, {
                    shade: [0.4, '#fff'] //0.1透明度的白色背景
                });
            },choose:function () {
                //选择文件后的回调函数。返回一个object参数
            },
            done: function (res) {
                if (res.status == "success") {
                    $("#imgse").css({'display': 'block'}).attr('src', res.wholeUrl);
                    doDrivingPermitOrc("'" + res.urls + "'");
                }else{
                    mui.toast(res.msg, {duration: '3500ms', type: 'div'});
                }
            }
        });
    });

    function doDrivingPermitOrc(imgurl) {
        if(_gToken==''){
            mui.toast("未登录", {duration: '3500ms', type: 'div'});
            return;
        }
        if(imgurl==null||imgurl==''){
            mui.toast("上传失败", {duration: '3500ms', type: 'div'});
            return;
        }
        var _imgurl=imgurl.replace("\'", "").replace("\'", "");
        $.ajax({
            async: true,
            type: "POST",
            url: "${ctx}/qingxiuh5/appUser/doDrivingPermitOrc",
            data: {
                "imgUrl": _imgurl
            },
            headers:{token:_gToken},
            dataType: "json",
            success: function (json) {
                layer.load(1,{time:1});
                console.log(json.data);
                if(json.code==200){
                    $("#p_car_code").html(json.data.pcarCode);
                    $("#p_car_type").html(json.data.pcarType);
                    $("#p_car_own").html(json.data.pcarOwn);
                    $("#p_address").html(json.data.paddress);
                    $("#p_usage_characteristics").html(json.data.pusageCharacteristics);
                    $("#p_brand_model").html(json.data.pbrandModel);
                    $("#p_car_wpmi").html(json.data.pcarWpmi);
                    $("#p_engine_number").html(json.data.pengineNumber);
                    $("#p_register_date").html(json.data.pregisterDate);
                    $("#p_certificate_date").html(json.data.pcertificateDate);
                    $(".discern-result").css({'display': 'block'});
                    $("#test1").hide();
                    $("#img_ingse_Id").hide();
                    $("#test2").show();
                    $('#test2').bind('click', function(event) {
                        nativeWeb.finish();
                    });
                }else{
                    mui.toast(json.msg, {duration: '3500ms', type: 'div'})
                }

            }
        });
    }
</script>
</html>