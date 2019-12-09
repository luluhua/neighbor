<#include "../../common/base.ftl">
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
    <link href="${ctx}/jh.css/iconfont_mine.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
        }
    </script>
    <link href="${ctx}/base/layui_new/css/layui.css" rel="stylesheet"/>
    <script src="${ctx}/base/layui_new/layui.js"></script>
</head>
<body >
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class='row'>
                <div class='box' style='padding: 0px;box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);border-color: #ffffff'>
                    <div class='layui-row' style='background-color: #ffffff;margin-bottom: 15px;margin-top: 10px;margin-bottom: 10px;box-shadow: 0px 20px 62px 0px #dfe8f4;'>
                        <div style='padding: 10px;'>
                            <lable style="margin-left: 10px;">备案域名查询</lable>
                            <div style='margin-top: 5px;margin-bottom:10px;border-bottom: 1px dashed #E3E3E3;'></div>
                            <lable style="margin-left: 10px;">查询条件：${(type)}</lable>
                            <div style='margin-top: 5px;margin-bottom:10px;border-bottom: 1px dashed #E3E3E3;'></div>
                            <lable style="margin-left: 10px;">查询关键字：${(keyword)}</lable>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mui-scroll">
                <div class='row'>
                    <div class='box' style='padding: 0px;box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);border-color: #ffffff'>
                        <div class='box-body table-responsive no-padding mui-control-content mui-active' style='border-color: #ffffff'>
                            <div class='layui-row' style='background-color: #ffffff;margin-bottom: 15px;margin-top: 10px;margin-bottom: 10px;box-shadow: 0px 20px 62px 0px #dfe8f4;'>
                                <div style='padding: 10px;'>
                                    <span class='mui-icon mine-icon icon-anjianfengexian' style='color: #0C70C4;width: 5px'></span><lable style="margin-left: 10px">结果详情</lable>
                                    <div style='margin-top: 5px;border-bottom: 1px dashed #E3E3E3;'></div>
                                </div>
                                <#if (thirdKeepRecord)??>
                                    <#list thirdKeepRecord as list>
                                    <div style='margin-left: 20px;margin-right: 20px'>
                                        主办单位名称
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px'>
                                        ${(list.cpy)}
                                        <div style='margin-top: 5px;border-bottom: 1px dashed #E3E3E3;'></div>
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px;margin-top:10px'>
                                        网站备案/许可证号
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px'>
                                        ${(list.license)}
                                        <div style='margin-top: 5px;border-bottom: 1px dashed #E3E3E3;'></div>
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px;margin-top:10px'>
                                        网站名称
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px'>
                                        ${(list.name)}
                                        <div style='margin-top: 5px;border-bottom: 1px dashed #E3E3E3;'></div>
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px;margin-top:10px'>
                                        审核时间
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px'>
                                        ${(list.time)}
                                        <div style='margin-top: 5px;border-bottom: 1px dashed #E3E3E3;'></div>
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px;margin-top:10px'>
                                        主办单位性质
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px'>
                                        ${(list.type)}
                                        <div style='margin-top: 5px;border-bottom: 1px dashed #E3E3E3;'></div>
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px;margin-top:10px'>
                                        网站首页网址
                                    </div>
                                    <div style='margin-left: 20px;margin-right: 20px'>
                                        ${(list.url)}
                                        <div style='margin-top: 5px;border-bottom: 1px dashed #E3E3E3;'></div>
                                    </div>
                                    </#list>
                                <#else>
                                    <div style='margin-left: 20px;margin-right: 20px;margin-top:10px'>
                                         暂无数据
                                    </div>
                                    <div style="margin-top: 10px">&nbsp;</div>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="font-size: 13px;margin-left: 10px;margin-right: 10px;position:absolute;top:95%;color: #b6b6b6;text-align: center;width: 90%">
                数据来源【聚合数据】
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#ffffff'
    });
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });


</script>
</html>