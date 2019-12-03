<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>${projectName}</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/layui.css">
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <link href="${ctx}/qxt/css/qxt.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=GMGAvOCI4vHHUdYINMC54wp9"></script>
    <script src="${ctx}/base/js/baidui-search.js"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
            mui.previewImage();
        }


    </script>
    <link href="${ctx}/base/layui_new/css/layui.css" rel="stylesheet"/>
    <script src="${ctx}/base/layui_new/layui.js"></script>

    <link href="${ctx}/qxt/css/my.previewimage.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.previewimage.js"></script>
    <script src="${ctx}/base/js/mui.zoom.js"></script>
</head>
<body>

<!-- 主界面菜单同时移动 -->
<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable" >
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap" >
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper" style="background-color: #FFFFFF">
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <div class="layui-row" style="margin-top: 30px;margin-left: 20px;margin-right: 20px;text-align: center">
                        <img src="${ctx}/base/images/shouquantubiao@3x.png" width="60px" height="60px">
                    </div>
                    <div class="layui-row" style="margin-top: 10px;margin-left: 20px;margin-right: 20px;">
                        <span style="text-align:center;font-size: 18px;color:#7B7B7B">该服务有广西政务服务中心提供，向其提供以下权限并确认协议即可继续操作</span>
                    </div>
                    <div class="layui-row" style="margin-top: 10px;margin-left: 20px;margin-right: 20px;">
                        <div style="margin-top: 10px;border-bottom: 1px dashed #E3E3E3;"></div>
                    </div>
                    <div class="layui-row" style="height: 20px;margin-top: 10px;margin-left: 20px;margin-right: 20px;">
                        <div style="width:10px;height:10px;border-radius:50%;background-color:#E3E3E3;float: left;margin-top: 2px;margin-right: 10px"></div>
                        <h5 style="margin-left: 10px">获取你的手机号码</h5>
                    </div>
                    <div class="layui-row" style="height: 20px;margin-top: 10px;margin-left: 20px;margin-right: 20px;">
                        <div style="width:10px;height:10px;border-radius:50%;background-color:#E3E3E3;float: left;margin-top: 2px;margin-right: 10px"></div>
                        <h5 style="margin-left: 10px">获取你的公共信息（头像、昵称、性别等）</h5>
                    </div>
                    <div class="layui-row"
                         style="background-color: #FFFFFFF;margin-right: -10px;margin-left: -10px">
                        <div class="layui-col-xs4" style="background-color: solid #EBF0F5">
                            &nbsp;
                        </div>
                        <div class="" style="background-color: solid #FFFFFFF;width:80%;margin: auto">
                            <button type="button" class="layui-btn layui-btn-normal"
                                    style="margin-top: 10px;width: 100%"><span style="font-size: 20px">确定</span>
                            </button>
                            <div style="height: 100px;margin-top: 10px">
                                确认授权并表示同意<a href="#" style="color: #007DDB">《用户授权协议》</a>
                            </div>
                        </div>
                        <div class="layui-col-xs4" style="background-color: solid #EBF0F5">
                            &nbsp;
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
<script type="text/javascript">
    mui.init({
        statusBarBackground: '#f7f7f7',
    });
</script>
</html>