<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>${projectName}</title>
    <link rel="shortcut icon" href="/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/user/css/certificate.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/iconfont.css">
    <script type="text/javascript" src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/nativeWeb.js"></script>
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
            <a id="nav-add" class="mui-icon mui-icon mui-icon-back" style="color:#000000;" href="javascript:mui.back()"></a>
            <h1 class="mui-title">电子证件照</h1>
        </header>-->

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="">
                <!-- 主界面具体展示内容 -->
                <div class="certificate_list">
                    <ul class="">
                        <li class="qazs" id="sfzLiId">
                            <b id="sfz" name="sfz"
                               title="${(tAppUserIdcard.idcard)!}">身份证</b>
                            <b class="cer_number">
                                <#if (tAppUserIdcard)??>
                                    ${(tAppUserIdcard.idcard)!}
                                <#else >

                                </#if>
                            </b>
                            <#if (tAppUserIdcard)??>
                            <span class="not_rz">已认证</span>
                            <#else >
                              <span class="not_rz">去认证</span>
                            </#if>
                            <!-- already_rz iconfont icon-zhengjian   -->
                        </li>
                        <li class="qazs">
                            <b name="jsz" title="${(tDriverLicense.dDode)!}">驾驶证电子信息</b>
                            <b class="cer_number">
                                <#if (tDriverLicense)??>
                                    ${(tDriverLicense.dDode)!}
                                <#else >
                                </#if>
                            </b>
                            <#if (tDriverLicense)??>
                                <span class="not_rz">已认证</span>
                            <#else >
                                <span class="not_rz">去认证</span>
                            </#if>
                        </li>

                        <li class="qazs">
                            <b name="xsz" title="${(tDrivingPermit.pCarCode)!}">行驶证电子信息</b>
                            <b class="cer_number">
                                <#if (tDrivingPermit)??>
                                    ${(tDrivingPermit.pCarCode)!}
                                <#else >

                                </#if>
                            </b>
                            <#if (tDrivingPermit)??>
                                <span class="not_rz">已认证</span>
                            <#else >
                                <span class="not_rz">去认证</span>
                            </#if>
                        </li>
                        <li class="qazs">
                            <b name="yyzz" title="${(tCompanyBizlicense.zch)!}">营业执照</b>
                            <b class="cer_number">
                                <#if (tCompanyBizlicense)??>
                                    ${(tCompanyBizlicense.zch)!}
                                <#else >

                                </#if>
                            </b>
                            <#if (tCompanyBizlicense)??>
                                <span class="not_rz">已认证</span>
                            <#else >
                                <span class="not_rz">去认证</span>
                            </#if>
                        </li>


                        <li class="qazs">
                            <b name="qyzzdm" title="${(tCompanyZzdmz.code)!}">企业组织代码证</b>
                            <b class="cer_number">
                            <#if (tCompanyZzdmz)??>
                                ${(tCompanyZzdmz.code)!}
                            <#else >
                            </#if>
                            </b>
                        <#if (tCompanyZzdmz)??>
                        <span class="not_rz">已认证</span>
                        <#else >
                        <span class="not_rz">去认证</span>
                        </#if>
                        </li>
                    <#--<li class="qazs">-->
                    <#--<b name="社保卡">电子社保卡</b>-->
                    <#--<b>- -</b>-->
                    <#--<span class="not_rz">去认证</span>-->
                    <#--</li>-->
                    <#--<li class="qazs">-->
                    <#--<b name="电动车牌照">电动车电子信息</b>-->
                    <#--<b>- -</b>-->
                    <#--<span class="not_rz">去认证</span>-->
                    <#--</li>-->
                    <#--<li class="qazs">-->
                    <#--<b name="公积金卡">公积金</b>-->
                    <#--<b>- -</b>-->
                    <#--<span class="not_rz">去认证</span>-->
                    <#--</li>-->
                    <#--<li class="qazs">-->
                    <#--<b name="英才卡">英才卡</b>-->
                    <#--<b>- -</b>-->
                    <#--<span class="not_rz">去认证</span>-->
                    <#--</li>-->
                    </ul>
                </div>


            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    mui.init({
        statusBarBackground: '#f7f7f7'
    });
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });
    mui('.certificate_list').on('tap', 'li', function () {
        var parameter = $(this).find("b").attr('name');
        var title = $(this).find("b").attr('title');
        var sfz = $("#sfz").attr("title");
        if (title == '') {
            if (parameter == 'sfz') {
                nativeWeb.gotoRealNameAuthentication();
            } else {
                if (sfz == '') {
                    mui.toast('请先进行身份认证', {duration: '3500ms', type: 'div'})
                } else {
                    window.top.location.href = "${ctx}/qingxiuh5/appUser/discriminate/" + parameter;
                }
            }
        } else {
            //身份证已认证
            if (parameter == 'sfz') {
                window.top.location.href = "${ctx}/qingxiuh5/appUser/papersverify";
            }
        }

    });


</script>
</html>