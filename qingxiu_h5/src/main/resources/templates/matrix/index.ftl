<#include "../common/base.ftl">
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Hello MUI</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <!--标准mui.css-->
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>

    <script src="${ctx}/base/js/mui.min.js"></script>
    <link href="${ctx}/jh.css/iconfont_mine.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
    <style>
        .mui-card .mui-control-content {
            padding: 10px;
        }
        .mui-control-content {
            height: 150px;
        }
    </style>
</head>
<body style="background-color:#FFFFFF">
<div class="mui-content" id="matrix_content" style="background-color:#FFFFFF">
    <div>
        <div id="segmentedControl" class="mui-segmented-control mui-segmented-control-inverted mui-segmented-control-primary">
            <a class="mui-control-item mui-active" href="#item1">
                微信
            </a>
            <a class="mui-control-item" href="#item2">
                微博
            </a>
            <#--<a class="mui-control-item" href="#item3">-->
                <#--客户端-->
            <#--</a>-->
            <#--<a class="mui-control-item" href="#item4">-->
                <#--小程序-->
            <#--</a>-->
        </div>
    </div>
    <div>
        <div id="item1" class="mui-control-content mui-active" style="margin-top: 10px;">
            <#if (weChat_group)??>
                <#list weChat_group as g1>
                    <div style="height: 32px; line-height: 32px; padding: 0 10px;">
                        <span  style="display:block; height: 20px; margin-top: 4px; float:left; margin-right: 8px; border-left: 3px solid #0C70C4;"></span>
                        <h3 style="font-size: 20px; float: left;">${(g1.name)!}</h3>
                    </div>
                    <ul class="mui-table-view mui-grid-view mui-grid-9" style="background-color: #FFFFFF;margin-top: 0px;border: 0px">
                    <#list weChat_app as weChat>
                        <#if g1.id==weChat.pid>
                            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3" style="border: 0px">
                                <a name="imageShare" imgaction="${(weChat.actionType)!}" imgActionPage1="${(weChat.actionPage1)!}" imgActionPage2="${(weChat.actionPage2)!}" imgcode="<@commonTags method='tagHtpImgURL' type='1' value='1'>${(tagHtpImgURL)!}</@commonTags>${(weChat.qrcode)!}">
                                    <img src="<@commonTags method='tagHtpImgURL' type='1' value='1'>${(tagHtpImgURL)!}</@commonTags>${(weChat.icon)!}" height="50px" width="50px">
                                    <div class="mui-media-body">${(weChat.titile)!}</div>
                                </a>
                            </li>
                        </#if>
                    </#list>
                    </ul>
                </#list>
            </#if>
        </div>
        <div id="item2" class="mui-control-content" style="margin-top: 10px;">
            <#if (blog_group)??>
                <#list blog_group as g2>
                    <div style="height: 32px; line-height: 32px; padding: 0 10px;">
                        <span  style="display:block; height: 20px; margin-top: 4px; float:left; margin-right: 8px; border-left: 3px solid #0C70C4;"></span>
                        <h3 style="font-size: 20px; float: left;">${(g2.name)!}</h3>
                    </div>
                    <ul class="mui-table-view mui-grid-view mui-grid-9" style="background-color: #FFFFFF;margin-top: 0px;border: 0px">
                    <#list blog_app as blog>
                        <#if g2.id==blog.pid>
                            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3" style="border: 0px">
                                <a name="imageShare" imgaction="${(blog.actionType)!}" imgActionPage1="${(blog.actionPage1)!}" imgActionPage2="${(blog.actionPage2)!}" imgcode="<@commonTags method='tagHtpImgURL' type='1' value='1'>${(tagHtpImgURL)!}</@commonTags>${(blog.qrcode)!}">
                                    <img src="<@commonTags method='tagHtpImgURL' type='1' value='1'>${(tagHtpImgURL)!}</@commonTags>${(blog.icon)!}" height="50px" width="50px">
                                    <div class="mui-media-body">${(blog.titile)!}</div>
                                </a>
                            </li>
                        </#if>
                    </#list>
                    </ul>
                </#list>
            </#if>
        </div>
        <#--<div id="item3" class="mui-control-content" style="margin-top: 10px;">-->
            <#--<#if (client_group)??>-->
                <#--<#list client_group as g3>-->
                    <#--<div style="height: 32px; line-height: 32px; padding: 0 10px;">-->
                        <#--<span  style="display:block; height: 20px; margin-top: 4px; float:left; margin-right: 8px; border-left: 3px solid #0C70C4;"></span>-->
                        <#--<h3 style="font-size: 20px; float: left;">${(g3.name)!}</h3>-->
                    <#--</div>-->
                    <#--<ul class="mui-table-view mui-grid-view mui-grid-9" style="background-color: #FFFFFF;margin-top: 0px;border: 0px">-->
                    <#--<#list client_app as client>-->
                        <#--<#if g3.id==client.pid>-->
                            <#--<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3" style="border: 0px">-->
                                <#--<a name="imageShare" imgcode="<@commonTags method='tagHtpImgURL' type='1' value='1'>${(tagHtpImgURL)!}</@commonTags>${(client.qrcode)!}">-->
                                    <#--<img src="<@commonTags method='tagHtpImgURL' type='1' value='1'>${(tagHtpImgURL)!}</@commonTags>${(client.icon)!}" height="50px" width="50px">-->
                                    <#--<div class="mui-media-body">${(client.titile)!}</div>-->
                                <#--</a>-->
                            <#--</li>-->
                        <#--</#if>-->
                    <#--</#list>-->
                    <#--</ul>-->
                <#--</#list>-->
            <#--</#if>-->
        <#--</div>-->
        <#--<div id="item4" class="mui-control-content" style="margin-top: 10px;">-->
            <#--<#if (smallProgram_group)??>-->
                <#--<#list smallProgram_group as g4>-->
                    <#--<div style="height: 32px; line-height: 32px; padding: 0 10px;">-->
                        <#--<span  style="display:block; height: 20px; margin-top: 4px; float:left; margin-right: 8px; border-left: 3px solid #0C70C4;"></span>-->
                        <#--<h3 style="font-size: 20px; float: left;">${(g4.name)!}</h3>-->
                    <#--</div>-->
                    <#--<ul class="mui-table-view mui-grid-view mui-grid-9" style="background-color: #FFFFFF;margin-top: 0px;border: 0px">-->
                    <#--<#list smallProgram_app as smallProgram>-->
                        <#--<#if g4.id==smallProgram.pid>-->
                            <#--<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3" style="border: 0px">-->
                                <#--<a name="imageShare" imgcode="<@commonTags method='tagHtpImgURL' type='1' value='1'>${(tagHtpImgURL)!}</@commonTags>${(smallProgram.qrcode)!}">-->
                                    <#--<img src="<@commonTags method='tagHtpImgURL' type='1' value='1'>${(tagHtpImgURL)!}</@commonTags>${(smallProgram.icon)!}" height="50px" width="50px">-->
                                    <#--<div class="mui-media-body">${(smallProgram.titile)!}</div>-->
                                <#--</a>-->
                            <#--</li>-->
                        <#--</#if>-->
                    <#--</#list>-->
                    <#--</ul>-->
                <#--</#list>-->
            <#--</#if>-->
        <#--</div>-->
    </div>
</div>


<script>
    mui.init({
        swipeBack:true //启用右滑关闭功能
    });
    (function($) {
        $('#scroll').scroll({
            indicators: true //是否显示滚动条
        });
        var segmentedControl = document.getElementById('segmentedControl');
        $('.mui-input-group').on('change', 'input', function() {
            if (this.checked) {
                var styleEl = document.querySelector('input[name="style"]:checked');
                var colorEl = document.querySelector('input[name="color"]:checked');
                if (styleEl && colorEl) {
                    var style = styleEl.value;
                    var color = colorEl.value;
                    segmentedControl.className = 'mui-segmented-control' + (style ? (' mui-segmented-control-' + style) : '') + ' mui-segmented-control-' + color;
                }
            }
        });
    })(mui);
    $("#matrix_content").find("a[name='imageShare']").unbind().bind("click",function(){
        var code=$(this).attr("imgcode");
        var imgaction=$(this).attr("imgaction");
        var imgActionPage1=$(this).attr("imgActionPage1");
        if(imgaction!=null&&parseInt(imgaction)==1){
            //根据动作类型，跳转到指定页面
            window.top.location.href = imgActionPage1;
        }else{
            // mui.alert('<img src="'+code+'" width="100px" height="100px"><br><br>先保存图片，用微信识别二维码', '二维码', function() {
            // });
            var btnArray = ['保存', '取消'];
            mui.confirm('<img src="'+code+'" width="100px" height="100px"><br><br>先保存图片，用微信识别二维码', '二维码', btnArray, function(e) {
                if (e.index == 0) {
                    downLoadFile(code);
                }
            });
        }
    });

    function downLoadFile(fileUrl) {
        nativeWeb.saveImage(fileUrl);
    }
</script>

</body>

</html>