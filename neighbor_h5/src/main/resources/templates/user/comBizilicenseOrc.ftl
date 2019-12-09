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
                        <b>营业执照识别</b>
                        <span>请上传营业执照代码照片，保证字体清晰无遮挡</span>
                        <img style="display: none" id="imgse" src=""/>
                    </div>

                    <div class="discern-result" style="display: none">
                        <text>识别结果</text>
                        <table class="layui-table" style="margin: 10px;width: auto !important;">
                            <tr>
                                <td>注册号</td>
                                <td id="zch"></td>
                            </tr>
                            <tr>
                                <td>法定代表人</td>
                                <td id="fddb"></td>
                            </tr>
                            <tr>
                                <td>注册资本</td>
                                <td id="zczb"></td>
                            </tr>
                            <tr>
                                <td>公司名称</td>
                                <td id="gsmc"></td>
                            </tr>
                            <tr>
                                <td>地址</td>
                                <td id="dizhi"></td>
                            </tr>
                            <tr>
                                <td>营业期限</td>
                                <td id="yyqx"></td>
                            </tr>
                            <tr>
                                <td>经营范围</td>
                                <td id="jyfw"></td>
                            </tr>
                            <tr>
                                <td>主体类型</td>
                                <td id="ztlx"></td>
                            </tr>
                        </table>
                    </div>


                    <div class="img_open" id="">
                        <button type="button" class="layui-btn" id="test1" >选取图片</button>
                        <button type="button" class="layui-btn" id="test2" style="display: none;">认证成功</button>
                    </div>

                    <div class="img_ingse"  id="img_ingse_Id">
                        <b>选取示例图</b>
                        <div class="img_living">
                            <img src="${ctx}/user/images/yyzz.jpg"/>
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
                    doComBizlicenseOrc("'" + res.urls + "'");
                }else{
                    mui.toast(res.msg, {duration: '3500ms', type: 'div'});
                }
            },
        });
    });

    function doComBizlicenseOrc(imgurl) {
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
            url: "${ctx}/qingxiuh5/appUser/doComBizlicenseOrc",
            data: {
                "imgUrl": _imgurl
            },
            dataType: "json",
            success: function (json) {
                layer.load(1,{time:1});
                if(json.code==200){
                    $("#zch").html(json.data.zch);
                    $("#fddb").html(json.data.fddb);
                    $("#zczb").html(json.data.zczb);
                    $("#gsmc").html(json.data.gsmc);
                    $("#dizhi").html(json.data.dizhi);
                    $("#yyqx").html(json.data.yyqx);
                    $("#jyfw").html(json.data.jyfw);
                    $("#ztlx").html(json.data.ztlx);
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
</script>
</html>