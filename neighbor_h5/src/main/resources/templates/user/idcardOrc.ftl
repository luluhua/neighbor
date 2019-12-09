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
        <!--<header class="mui-bar mui-bar-nav">
            <h1 class="mui-title">手上清秀</h1>
        </header>-->

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <div class="top-background">
                        <b>${(parameter)!}识别</b>
                        <span>请上传${(parameter)!}正反面照片，保证字体清晰无遮挡</span>
                        <img style="display: none" id="imgse" src=""/>
                    </div>


                    <div class="discern-result" style="display: none">
                        <text>识别结果</text>
                        <table class="layui-table" style="margin: 10px;width: auto !important;">
                            <tr>
                                <td>姓名</td>
                                <td id="nameId"></td>
                            </tr>
                            <tr>
                                <td>性别</td>
                                <td id="sexId"></td>
                            </tr>
                            <tr>
                                <td>民族</td>
                                <td id="nationId"></td>
                            </tr>
                            <tr>
                                <td>出生日期</td>
                                <td id="birthId"></td>
                            </tr>
                            <tr>
                                <td>户籍地址</td>
                                <td id="addressId"></td>
                            </tr>
                            <tr>
                                <td>身份证号码</td>
                                <td id="idcardId"></td>
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
                            <img src="${ctx}/user/images/shilie1.png"/>
                            <img src="${ctx}/user/images/shilie2.png"/>
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
<script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });

    //获取token
    var _gToken ='';
    $(function () {
        nativeWeb.getToken();
    });
    function  getTokenCallback(_token){
        _gToken=_token;
    }
    /**
     * IOS 调用相册-开始
     */
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
                        doIdcardOrc("'" + res.urls + "'");
                    }else{
                        mui.toast(res.msg, {duration: '3500ms', type: 'div'});
                    }
                },
            });
        });


    function doIdcardOrc(imgurl) {
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
            url: "${ctx}/qingxiuh5/appUser/doIdcardOrc",
            data: {
                "imgUrl": _imgurl
            },
            dataType: "json",
            headers:{token:_gToken},
            success: function (json) {
                layer.load(1,{time:1});
                if(json.code==200){
                    console.log(json.data);
                    $("#nameId").html(json.data.name);
                    $("#sexId").html(json.data.sex);
                    $("#birthId").html(json.data.birth);
                    $("#addressId").html(json.data.address);
                    $("#idcardId").html(json.data.id);
                    $("#nationId").html(json.data.nation);
                    $(".discern-result").css({'display': 'block'});
                    $("#test1").hide();
                    $("#img_ingse_Id").hide();
                    $("#test2").show();
                    $('#test2').bind('click', function(event) {
                        nativeWeb.finish();
                    });
                }else{
                    mui.toast('识别失败,请按要求上传图片', {duration: '3500ms', type: 'div'})
                }

            }
        });
    }
    /**
     * IOS 调用相册-结束
     */
</script>
</html>