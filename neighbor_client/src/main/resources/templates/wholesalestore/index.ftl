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
<div class="contact_us">
    <div class="QQ">
        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=206599540&site=qq&menu=yes">在线咨询</a>
    </div>

    <div class="calls">
        <p>0771-5710902</p>
    </div>

    <!--end-->
</div>


<!--顶部-->
<#include "base/topHtml.ftl">

<!--头部-->
<div class="head">
    <a href="index.html" class="logo">
        <img src="${ctx}/wholesalestore/images/logo.png">
    </a>

    <!--搜索-->
    <div class="search">

        <div class="drop-down">
            <div class="box">分类</div>

            <span class="span"></span>

            <div class="chose">
                <div class="curt">东西</div>
                <div class="curt">配件</div>
                <div class="curt">零件</div>
            </div>
        </div>


        <input type="text" id="SearchGoods" onkeypress="if (event.keyCode == 13) searchSkip();" placeholder="Search"
               class="text"/>
        <input type="button" value="搜索" class="button" onclick="searchSkip()" title="搜索">
    </div>


    <!--加入购物车-->
    <div class="cart">
        <a href="${ctx}/resource/form">我有资源</a>
    </div>
    <!--end-->
</div>


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
    <#--<li><a href="">优惠活动</a></li>-->

    <#--<li><a href="">领优惠券</a></li>-->

    <#--<li><a href="">优惠活动</a></li>-->

    <#--<li><a href="">优惠活动</a></li>-->

    <#--<li><a href="">优惠活动</a></li>-->
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

    <h1 class="h1">产品推荐</h1>

    <ul id="recommend">

        <li class="border">
            <h3>
                <img src="${ctx}/wholesalestore/images/logo.png">
                <p class="pA">商品名称 </p>
                <p>CDBG0057</p>
                <p>购买价：￥<span>310</span></p>
                <p>出借价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/logo.png">
                <p class="pA">商品名称 </p>
                <p>CDBG0057</p>
                <p>购买价：￥<span>310</span></p>
                <p>出借价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/logo.png">
                <p class="pA">商品名称 </p>
                <p>CDBG0057</p>
                <p>购买价：￥<span>310</span></p>
                <p>出借价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/logo.png">
                <p class="pA">商品名称 </p>
                <p>CDBG0057</p>
                <p>购买价：￥<span>310</span></p>
                <p>出借价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

    </ul>

    <ul id="recommends">

        <li class="border">
            <h3>
                <img src="${ctx}/wholesalestore/images/logo.png">
                <p class="pA">商品名称 </p>
                <p>CDBG0057</p>
                <p>购买价：￥<span>310</span></p>
                <p>出借价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/logo.png">
                <p class="pA">商品名称 </p>
                <p>CDBG0057</p>
                <p>购买价：￥<span>310</span></p>
                <p>出借价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/logo.png">
                <p class="pA">商品名称 </p>
                <p>CDBG0057</p>
                <p>购买价：￥<span>310</span></p>
                <p>出借价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/logo.png">
                <p class="pA">商品名称 </p>
                <p>CDBG0057</p>
                <p>购买价：￥<span>310</span></p>
                <p>出借价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

    </ul>

    <h1 class="h1">分类名称</h1>

    <div class="common_div">

        <div class="tab">
            <b class="b">RALEIGH</b>
            <b>GIOS</b>
        </div>

        <dl>
            <dt>
                <a id="zinxd" href="javascript:void(0)" onclick="">
                    <img id="proimg" src="">

                    <div class="figure">
                        <p id="commname"></p>
                        <span id="model"></span>
                        <b>￥<span id="price"></span></b>
                    </div>
                </a>
            </dt>

            <div id="bike">

                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>
            </div>
            <div>

                <dd style="border-left:none">
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

            </div>

        </dl>

    </div>


    <h1 class="h1">分类名称</h1>

    <div class="common_div">

        <div class="tab">
            <b class="b">零件</b>
            <b>零件</b>
            <b>零件</b>
        </div>

        <dl>
            <dt>
                <a href="">
                    <img src="${ctx}/wholesalestore/images/logo.png">
                    <div class="figure">
                        <p>商品名称</p>
                        <span>商品简介</span>
                        <b>￥10/天</b>
                    </div>
                </a>
            </dt>
            <div id="">
                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd style="border-left:none">
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

            </div>
        </dl>
    </div>


    <h1 class="h1">分类名称</h1>

    <div class="common_div">

        <div class="tab">
            <b class="b">配件</b>
            <b>配件</b>
            <b>配件</b>
        </div>

        <dl>
            <dt>
                <a id="onc" href="javascript:void(0)" onclick="">
                    <img src="${ctx}/wholesalestore/images/logo.png">
                    <div class="figure">
                        <p id="accbrand">商品名称</p>
                        <span id="acccommname">商品简介</span>
                        <b>￥<span id="accprice">120</span></b>
                    </div>
                </a>
            </dt>
            <div id="cordee">

                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd style="border-left:none">
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/logo.png">
                        <p>商品名称</p>
                        <p>商品简介</p>
                        <p>购买价：￥<span>2598</span></p>
                        <p>出借：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

            </div>
        </dl>

    </div>

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