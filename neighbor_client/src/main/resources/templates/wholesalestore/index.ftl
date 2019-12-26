<#--<#macro header>-->
<!doctype html>
<html>
<head>
    <#include "../common/base.ftl">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">


    <title>商城首页</title>

    <link href="${ctx}/wholesalestore/css/css.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/wholesalestore/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/wholesalestore/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/wholesalestore/css/mobile.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/wholesalestore/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/wholesalestore/js/fanhuidibu.js"></script>     <!--返回顶部-->
    <script type="text/javascript" src="${ctx}/wholesalestore/js/banner.js"></script>
    <script type="text/javascript" src="${ctx}/wholesalestore/js/index.js"></script>

</head>


<body class="body_bg">

<!--联系我们-->
<#include "base/contact.ftl">

<!--顶部-->
<#include "base/topHtml.ftl">

<!--头部-->
<#include "base/head.ftl">

<!--导航-->
<nav>
    <ul>
        <li class="all"><a href="javascript:void(0)">产品分类</a>
            <div class="allA">
                <section class="banner_nav">
                    <div class="left_nav">
                        <ul>
                            <#list navigation as mun>
                                <li><a class="show" href="">${(mun.navigationName)!}</a>
                                    <div class="lenovo-pc">
                                        <div class="left-pc">
                                            <dl>
                                                <b class="hfuiase">${(mun.navigationName)!}</b>
                                                <div class="list">
                                                    <#list mun.tagList as tag>
                                                        <dd><a href="">${(tag.tagName)!}</a></dd>
                                                    </#list>
                                                </div>
                                            </dl>
                                        </div>
                                    </div>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </section>

            </div>
        </li>

    </ul>
    <div class="clear"></div>

</nav>
<!--end-->


<!--banner-->
<div class="banner">
    <!--轮播-->
    <div class="callbacks_container">
        <ul class="rslides" id="slider">
            <#list adv as adv>
                <#if adv_index ==0>
                    <#list adv.advList as ad>
                     <li><img src="${(ad.imgUrl)}" alt=""></li>
                    </#list>

                </#if>

            </#list>
        </ul>
    </div>
    <script type="text/javascript" src="${ctx}/wholesalestore/js/lunbo.min.js"></script>

    <div class="banner_fr">
        <a>
            <img src="${(me.avatarUrl)!}" onerror="this.src='${ctx}/base/images/default.jpg'" id="ports1">
            <h2>您好,<span id="username" style="cursor: pointer"><#if (me.nickname)??>
                ${(me.nickname)!}
            <#else >
                ${(me.userName)!}
            </#if></span></h2>
            <h2>欢迎来到简单生活 !</h2>
        </a>
        <dl>
            <dt>商城公告</dt>
            <br/>
            <div id="marquee6" style="height:142px; overflow:hidden;background:#EFEFEF;">
                <ul>
                    <#list inform as m>
                        <li><b>${(m.title)!}</b></li>
                        <p>${(m.remark)!}</p>
                    </#list>

                </ul>
            </div>
        </dl>
    </div>

    <!--end-->
</div>


<!--产品推荐-->
<div class="index_Product">
    <#if (goods.rentoutSellList?size>0)>
    <h1 class="h1">闲置物品</h1>
    <ul id="recommend">
        <#list goods.rentoutSellList as sel>
            <li class="border">
                <a href="${ctx}/resource/particulars/${(sel.id)!}" class="yir">
                    <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(sel.images)!'--'}"
                         onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                </a>
                <h3 class="fhuase">
                    <div class="vhuiase">
                        <p class="pA">${(sel.name)!}</p>
                        <p>${(sel.specification)!}</p>
                        <p>购买价：<#if sel.sellStale==0>不出售<#else >￥<span> ${(sel.sellPrice)!'--'}</span></#if></p>
                        <p>出借价：￥<span>${(sel.price)!}</span>/天</p>
                    </div>
                    <a class="gotu_daile" href="${ctx}/resource/particulars/${(sel.id)!}">立即购买</a>
                </h3>
            </li>
        </#list>
    </ul>
    </#if>
     <#if (goods.maintainList?size>0)>
    <h1 class="h1">维修</h1>
    <div class="common_div">
        <dl>
            <#list goods.maintainList as ma>
                <#if ma_index==0>
            <dt>
                <a class="vhase" id="zinxd" href="${ctx}/resource/particulars/${(ma.id)!}">
                    <img id="proimg"
                         src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(ma.images)!'--'}"
                         onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                    <div class="figure">
                        <p id="commname">${(ma.name)!}</p>
                        <b>￥<span id="price">${(ma.price)!}</span>/天</b>
                    </div>
                </a>
            </dt>
                <#else >
                    <dd>
                        <a href="${ctx}/resource/particulars/${(ma.id)!}" class="yir">
                            <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(ma.images)!'--'}"
                                 onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                        </a>
                        <h4>
                            <p>${(ma.name)!}</p>
                            <p>${(ma.specification)!}</p>
                            <p>购买价：<#if ma.sellStale==0>不出售<#else >￥<span> ${(ma.sellPrice)!'--'}</span></#if></p>
                            <p>出借价：￥<span>${(ma.price)!}</span>/天</p>
                            <a class="gotu_daile" href="${ctx}/resource/particulars/${(ma.id)!}">立即购买</a>
                        </h4>
                    </dd>
                </#if>
            </#list>
        </dl>
    </div>
     </#if>
    <#if (goods.sjList?size>0)>
    <h1 class="h1">时间财富</h1>
    <div class="common_div">
        <dl>
            <#list goods.sjList as sj>
            <#if sj_index==0>
            <dt>
                <a class="vhase" href="${ctx}/resource/particulars/${(sj.id)!}">
                    <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(sj.images)!'--'}"
                         onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                    <div class="figure">
                        <p>${(sj.name)!}</p>
                        <b>￥<span id="price">${(sj.price)!}</span>/天</b>
                    </div>
                </a>
            </dt>
            <#else >
            <dd>
                <a href="${ctx}/resource/particulars/${(sj.id)!}" class="yir">
                    <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(sj.images)!'--'}"
                         onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                </a>
                <h4>
                    <p>${(sj.name)!}</p>
                    <p>${(sj.specification)!}</p>
                    <p>购买价：<#if sj.sellStale==0>不出售<#else >￥<span> ${(sj.sellPrice)!'--'}</span></#if></p>
                    <p>出借价：￥<span>${(sj.price)!}</span>/天</p>
                    <a class="gotu_daile" href="${ctx}/resource/particulars/${(sj.id)!}">立即购买</a>
                </h4>
            </dd>
            </#if>
            </#list>
        </dl>
    </div>
    </#if>
<#if (goods.zydbewList?size>0)>
    <h1 class="h1">牛B的技术</h1>
    <div class="common_div">
        <dl>
            <#list goods.zydbewList as zyd>
                <#if zyd_index==0>
            <dt>
                <a class="vhase" href="${ctx}/resource/particulars/${(zyd.id)!}">
                    <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(zyd.images)!'--'}"
                         onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                    <div class="figure">
                        <p>${(zyd.name)!}</p>
                        <b>￥<span id="price">${(zyd.price)!}</span>/天</b>
                    </div>
                </a>
            </dt>
                <#else >
            <dd>
                <a href="${ctx}/resource/particulars/${(zyd.id)!}" class="yir">
                    <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(zyd.images)!'--'}"
                         onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                </a>
                <h4>
                    <p>${(zyd.name)!}</p>
                    <p>${(zyd.specification)!}</p>
                    <p>购买价：<#if zyd.sellStale==0>不出售<#else >￥<span> ${(zyd.sellPrice)!'--'}</span></#if></p>
                    <p>出借价：￥<span>${(zyd.price)!}</span>/天
                    <p>
                        <a class="gotu_daile" href="${ctx}/resource/particulars/${(zyd.id)!}">立即购买</a>
                </h4>
            </dd>
                </#if>
            </#list>
        </dl>

    </div>
</#if>
    <#if (goods.carryewList?size>0)>
    <h1 class="h1">搬运/力气活</h1>
    <div class="common_div">
        <dl>
            <#list goods.carryewList as car>
                <#if car_index==0>
            <dt>
                <a class="vhase" href="${ctx}/resource/particulars/${(car.id)!}">
                    <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(car.images)!'--'}"
                         onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                    <div class="figure">
                        <p>${(car.name)!}</p>
                        <b>￥<span id="price">${(car.price)!}</span>/天</b>
                    </div>
                </a>
            </dt>
                <#else >
            <dd>
                <a href="${ctx}/resource/particulars/${(car.id)!}" class="yir">
                    <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(car.images)!'--'}"
                         onerror="this.src='${ctx}/wholesalestore/images/logo.png'">
                </a>

                <h4>
                    <p>${(car.name)!}</p>
                    <p>${(car.specification)!}</p>
                    <p>购买价：<#if car.sellStale==0>不出售<#else >￥<span> ${(car.sellPrice)!'--'}</span></#if></p>
                    <p>出借价：￥<span>${(car.price)!}</span>/天
                    <p>
                        <a class="gotu_daile" href="${ctx}/resource/particulars/${(car.id)!}">立即购买</a>
                </h4>
            </dd>
                </#if>
            </#list>
        </dl>

    </div>
    </#if>
    <!--end-->
</div>


<!--底部-->
<#include "base/footerHtml.ftl">
<!--end-->


</body>
<script type="text/javascript" src="${ctx}/wholesalestore/js/passbyvalue.js"></script>
<script type="text/javascript" src="${ctx}/base/js/jquery.kxbdmarquee.js"></script>
<script>
    $("#marquee6").kxbdMarquee({direction: "up", isEqual: false});
</script>
</html>
<#--</#macro>-->