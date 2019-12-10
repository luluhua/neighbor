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
                <div class="curt">自行车</div>
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
        <a href="My_shopping_car.html">购物车<b id="cartNum">0</b></a>
        <div class="cartA">
            <p class="cartA_p">购物车还没有商品，快去选购吧！</p>

            <div class="cart_pr">
                <span class="span">最近加入的产品</span>

                <div class="cart_none">

                    <div class="cartB">
                        <img src="${ctx}/wholesalestore/images/pr_img_01.jpg">
                        <h3>
                            <p>CycleDesign 自行车包自行车骑行包便携水.....</p>

                            <b>数量：1</b>

                            <b class="jg_b">￥310</b>
                        </h3>
                    </div>

                    <div class="cartB">
                        <img src="${ctx}/wholesalestore/images/pr_img_01.jpg">
                        <h3>
                            <p>CycleDesign 自行车包自行车骑行包便携水.....</p>

                            <b>数量：1</b>

                            <b class="jg_b">￥310</b>
                        </h3>
                    </div>

                    <a href="My_shopping_car.html" class="js_cart">去购物车</a>
                    -->
                </div>
            </div>
        </div>
    </div>
    <!--end-->
</div>


<!--导航-->
<nav>
    <ul>
        <li class="all"><a href="javascript:void(0)">产品分类</a>
            <div class="allA">
                <a href="javascript:void(0)" onclick="pitchon('all')">全部商品</a>

                <a href="javascript:void(0)" onclick="pitchon('bike')">自行车</a>

                <a href="javascript:void(0)" onclick="pitchon('把带')">自行车把带</a>

                <a href="javascript:void(0)" onclick="pitchon('把套')">自行车把套</a>

                <a href="javascript:void(0)" onclick="pitchon('包包')">自行车包包</a>

                <a href="javascript:void(0)" onclick="pitchon('Cordee')">自行车配件</a>

            </div>
        </li>
        <li><a href="">优惠活动</a></li>

        <li><a href="">领优惠券</a></li>

        <li><a href="">优惠活动</a></li>

        <li><a href="">优惠活动</a></li>

        <li><a href="">优惠活动</a></li>
    </ul>
    <div class="clear"></div>

</nav>
<!--end-->


<!--banner-->
<div class="banner">
    <!--轮播-->
    <div class="callbacks_container">
        <ul class="rslides" id="slider">
            <li><img src="${ctx}/wholesalestore/images/banner01.jpg" alt=""></li>
            <li><img src="${ctx}/wholesalestore/images/banner02.jpg" alt=""></li>
            <li><img src="${ctx}/wholesalestore/images/banner03.jpg" alt=""></li>
        </ul>
    </div>
    <script type="text/javascript" src="${ctx}/wholesalestore/js/lunbo.min.js"></script>

    <div class="banner_fr">
        <img src="${ctx}/wholesalestore/images/icon_05.png" id="ports1" onclick="GOuser_home()">
        <h2>您好,<span id="username" onclick="GOuser_home()" style="cursor: pointer"></span></h2>
        <h2>欢迎来到简单生活 !</h2>

        <dl>
            <dt>商城公告</dt>
            <br/>
            <div id="marquee6" style="height:142px; overflow:hidden;background:#EFEFEF;">
                <ul id="sakjw">

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
                <img src="${ctx}/wholesalestore/images/pr_01.jpg">
                <p class="pA">CycleDesign 自行车包自行车骑行包便携水袋包双肩背包 </p>
                <p>CDBG0057</p>
                <p>会员价：￥<span>310</span></p>
                <p>销售价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/pr_01.jpg">
                <p class="pA">CycleDesign 自行车包自行车骑行包便携水袋包双肩背包 </p>
                <p>CDBG0057</p>
                <p>会员价：￥<span>310</span></p>
                <p>销售价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/pr_01.jpg">
                <p class="pA">CycleDesign 自行车包自行车骑行包便携水袋包双肩背包 </p>
                <p>CDBG0057</p>
                <p>会员价：￥<span>310</span></p>
                <p>销售价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/pr_01.jpg">
                <p class="pA">CycleDesign 自行车包自行车骑行包便携水袋包双肩背包 </p>
                <p>CDBG0057</p>
                <p>会员价：￥<span>310</span></p>
                <p>销售价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

    </ul>

    <ul id="recommends">

        <li class="border">
            <h3>
                <img src="${ctx}/wholesalestore/images/pr_01.jpg">
                <p class="pA">CycleDesign 自行车包自行车骑行包便携水袋包双肩背包 </p>
                <p>CDBG0057</p>
                <p>会员价：￥<span>310</span></p>
                <p>销售价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/pr_01.jpg">
                <p class="pA">CycleDesign 自行车包自行车骑行包便携水袋包双肩背包 </p>
                <p>CDBG0057</p>
                <p>会员价：￥<span>310</span></p>
                <p>销售价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/pr_01.jpg">
                <p class="pA">CycleDesign 自行车包自行车骑行包便携水袋包双肩背包 </p>
                <p>CDBG0057</p>
                <p>会员价：￥<span>310</span></p>
                <p>销售价：￥<span>310</span></p>
                <a href="product_details.html">立即购买</a>
            </h3>
        </li>

        <li>
            <h3>
                <img src="${ctx}/wholesalestore/images/pr_01.jpg">
                <p class="pA">CycleDesign 自行车包自行车骑行包便携水袋包双肩背包 </p>
                <p>CDBG0057</p>
                <p>会员价：￥<span>310</span></p>
                <p>销售价：￥<span>310</span></p>
                <a href="">立即购买</a>
            </h3>
        </li>

    </ul>

    <h1 class="h1">自行车</h1>

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
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>
            </div>
            <div>

                <dd style="border-left:none">
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

            </div>

        </dl>

    </div>


    <h1 class="h1">自行车·零件</h1>

    <div class="common_div">

        <div class="tab">
            <b class="b">零件</b>
            <b>零件</b>
            <b>零件</b>
        </div>

        <dl>
            <dt>
                <a href="">
                    <img src="${ctx}/wholesalestore/images/pr_02.jpg">

                    <div class="figure">
                        <p>RALEIGH-铝合金20速公路车</p>
                        <span>6061铝合金公路跑车车架-碳纤前叉</span>
                        <b>￥3998</b>
                    </div>
                </a>
            </dt>
            <div id="">
                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd style="border-left:none">
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

            </div>
        </dl>
    </div>


    <h1 class="h1">自行车·配件</h1>

    <div class="common_div">

        <div class="tab">
            <b class="b">配件</b>
            <b>配件</b>
            <b>配件</b>
        </div>

        <dl>
            <dt>
                <a id="onc" href="javascript:void(0)" onclick="">
                    <img id="accimg" src="">

                    <div class="figure">
                        <p id="accbrand"></p>
                        <span id="acccommname"></span>
                        <b>￥<span id="accprice"></span></b>
                    </div>
                </a>
            </dt>
            <div id="cordee">

                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd style="border-left:none">
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>


                <dd>
                    <h4>
                        <img src="${ctx}/wholesalestore/images/pr_03.jpg">
                        <p>Duke Tourney 公爵</p>
                        <p>铬钼钢小径跑車</p>
                        <p>会员价：￥<span>2598</span></p>
                        <p>销售价：￥<span>2598</span></p>
                        <a href="">立即购买</a>
                    </h4>
                </dd>

            </div>
        </dl>

    </div>

    <!--end-->
</div>


<!--底部-->
<footer>
    <div class="footer">
        <ul>
            <li><img src="${ctx}/wholesalestore/images/icon_07.png"></li>
            <li>
                <p>购物指南</p>
                <a href="Shopping_guide.html#shopping_introduced">购物介绍</a>
                <a href="Shopping_guide.html#logistics_distribution">物流配送</a>
                <a href="Shopping_guide.html#method_payment">支付方式</a>
            </li>
        </ul>

        <ul>
            <li><img src="${ctx}/wholesalestore/images/icon_08.png"></li>
            <li>
                <p>售后服务</p>
                <a href="After_service.html#shopping_introduced">退款说明</a>
                <a href="After_service.html#logistics_distribution">退换货流程</a>
                <a href="After_service.html#method_payment">自行车保修</a>
            </li>
        </ul>

        <ul>
            <li><img src="${ctx}/wholesalestore/images/icon_09.png"></li>
            <li>
                <p>会员权益</p>
                <a href="Rights_members.html#shopping_introduced">会员积分规则</a>
            </li>
        </ul>

        <ul>
            <li><img src="${ctx}/wholesalestore/images/icon_10.png"></li>
            <li>
                <p>关于商城</p>
                <a href="aboutus.html#shopping_introduced">商城介绍</a>
                <a href="aboutus.html#logistics_distribution">联系我们</a>
                <a href="aboutus.html#method_payment">加入我们</a>
            </li>
        </ul>

        <ul class="footer_ul">
            <li><img src="${ctx}/wholesalestore/images/icon_11.png"></li>
            <li>
                <p>客服电话</p>
                <span>周一至周五：9:00-18:00</span>
                <span class="call">0771-5710902</span>
            </li>
        </ul>
    </div>

    <div id="footer">
        <div class="link">
            <p>伊恩伯格企业集团</p>

            <a href="/index.html" target="_Blank">简单生活网</a>

            <a href="/pointsMall/product_list.html" target="_Blank">积分商城</a>

            <a href="/mall/index.html">电子商城</a>

            <a href="/raleigh/index.html" target="_blank">RALEIGH</a>

            <a href="/gios/index.html" target="_Blank">GIOS</a>

            <a href="/mhl/index.html" target="_blank">MHL</a>

            <a href="/cycledesign/index.html" target="_Blank">CYCLEDESIGN</a>

            <a href="/frontier/index.html" target="_blank">FRONTIER</a>

        </div>

        <h3 class="footer_h3">Copyright©南宁伊恩伯格商贸有限公司 <a href="">桂ICP备17002166号</a></h3>

        <div class="focus">
            <p>关注我们</p>

            <a href="javascript:void" class="wx-a">
                <img src="${ctx}/wholesalestore/images/icon_12.png">
            <#--<img src="${ctx}/wholesalestore/images/yst-vip.png" class="wx_img">-->
            </a>


            <a href="javascript:void" class="app">
                <img src="${ctx}/wholesalestore/images/icon_13.png">
                <img src="${ctx}/wholesalestore/images/app.png" class="app_img">
            </a>
        </div>
        <div class="clear"></div>

    </div>
</footer>

<!--end-->


</body>
<script type="text/javascript" src="${ctx}/wholesalestore/js/passbyvalue.js"></script>

</html>
<#--</#macro>-->