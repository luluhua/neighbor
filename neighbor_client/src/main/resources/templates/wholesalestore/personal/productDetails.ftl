<!doctype html>
<html>
<head>
    <#include "../../common/base.ftl">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/style.css"/>
</head>


<body class="body_bg">

<!--联系我们-->
<#include "../base/contact.ftl">

<!--顶部-->
<#include "../base/topHtml.ftl">

<!--头部-->
<div class="head">
    <a href="index.html" class="logo">
        <img src="images/logo.png">
    </a>

    <!--搜索-->
    <div class="search">
        <!--
       <div class="drop-down">
           <div class="box">分类</div>

           <span  class="span"></span>

           <div class="chose">
               <div class="curt">自行车</div>
               <div class="curt">配件</div>
               <div class="curt">零件</div>
           </div>
       </div>
        -->

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
                    <!--
                        <div class="cartB">
                            <img src="images/pr_img_01.jpg">
                            <h3>
                                <p>CycleDesign 自行车包自行车骑行包便携水.....</p>

                                <b>数量：1</b>

                                <b class="jg_b">￥310</b>
                            </h3>
                        </div>

                        <div class="cartB">
                            <img src="images/pr_img_01.jpg">
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
        <li class="all"><a href="javascript:void(0)">全部产品分类</a>
            <div class="allA" id="allA">
                <a href="product.html#product">自行车</a>

                <a href="product.html#product">自行车把带</a>

                <a href="product.html#product">自行车把套</a>

                <a href="product.html#product">自行车包包</a>

                <a href="product.html#product">自行车配件</a>

                <a href="product.html#product">自行车零件</a>
            </div>
        </li>
        <li><a href="">优惠活动</a></li>

        <li><a href="">领优惠券</a></li>

        <li><a href="">优惠活动</a></li>

        <!--<li><a href="">优惠活动</a></li>

        <li><a href="">优惠活动</a></li>-->
    </ul>
    <div class="clear"></div>

    <div class="nav_sign" onclick="mysifn()">签到送积分</div>
</nav>
<!--end-->


<input type="text" id="yuanjia" style="display: none"/>


<!--产品-->
<div class="product">

    <div class="pr_infor">
        <dl>
            <dt><img id="proimg" src=""></dt>

            <dd><img onclick="" src=""></dd>

            <dd><img onclick="" src=""></dd>

            <dd><img onclick="" src=""></dd>

            <dd><img onclick="" src=""></dd>

        </dl>

        <div class="infor_fr">
            <h1 id="comname"></h1>

            <h2 id="model"></h2>

            <div class="com_div">
                <p>价格：</p>
                <span>￥</span><span id="price"></span>
            </div>
            <div class="clear"></div>


            <!--选择颜色-->
            <div class="com_div">
                <p>颜色：</p>
                <div class="color_box">
                    <div class="colorA" id="fortinct">请选择</div>

                    <div class="go"></div>

                    <div class="colorB">
                        <!--
                            <div class="color_curt">白色</div>

                            <div class="color_curt">黑色</div>

                            <div class="color_curt">白色</div>

                            <div class="color_curt">黑色</div>

                            <div class="color_curt">白色</div>

                            <div class="color_curt">黑色</div>

                            <div class="color_curt">白色</div>

                            <div class="color_curt">黑色</div>

                            <div class="color_curt">黑色</div>

                            <div class="color_curt">某色</div>

                            <div class="color_curt">黑色</div>

                            <div class="color_curt">某色</div>
                            -->
                    </div>
                </div>
            </div>
            <div class="clear"></div>

            <!--选择尺寸-->
            <div class="com_div">
                <p>尺寸：</p>
                <div class="color_box">
                    <div class="colorA" id="forsize">请选择</div>

                    <div class="go"></div>

                    <div class="colorB chicun" id="sizehtml">
                        <!--
                            <div class="color_curt">100米</div>

                            <div class="color_curt">黑色</div>

                            <div class="color_curt">某色</div>
                             -->
                    </div>
                </div>
            </div>
            <div class="clear"></div>

            <div class="numbers">
                <p>数量：</p>
                <div class="number">
                    <input type="submit" value="-" onclick="sub()" class="input_fl">
                    <span id="count">1</span>
                    <input type="submit" value="+" onclick="add()" class="input_fr">
                </div>
            </div>

            <div class="infor_cart" id="infor_cart">
                <a href="javascript:void(0)" onclick="buyimmediately()">立即购买</a>
                <a href="javascript:void(0)" class="color" onclick="addcar()">加入购物车</a>
            </div>

            <div class="share jiathis_style">

                <img src="images/icon_15.png" onclick="CollectionGoods()" title="收藏商品">
                <a class="jiathis_button_tsina"></a>
                <a class="jiathis_button_weixin"></a>
                <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
                <style type="text/css">
                    .jiathis_style a {
                        width: 43px;
                        height: 42px;
                        margin: 0px 5px;
                    }

                    .jiathis_style .jiathis_button_tsina span {
                        background: url(images/icon_17.png) no-repeat top center;
                        width: 43px;
                        height: 42px !important;
                        padding-left: 0px !important
                    }

                    .jiathis_style .jiathis_button_weixin span {
                        background: url(images/icon_18.png) no-repeat top center;
                        width: 43px;
                        height: 42px !important;
                        padding-left: 0px !important
                    }
                </style>

            </div>


        </div>
    </div>

    <div class="productA">
        <div class="datails">
            <h6>
                <a href="">产品详情</a>/
                <a href="#datails_h5">温馨提示</a>/
                <a href="#comments_h5">产品评价</a>
            </h6>

            <div class="datailsA">
                <ul>
                    <li><p>品牌：</p><span id="brand"></span></li>

                    <li><p>型号：</p><span id="models"></span></li>

                    <li><p>颜色：</p><span id="tinct"></span></li>

                    <li><p>尺寸：</p><span id="size"></span></li>

                </ul>

                <div class="datails_img">
                    <!--
                        <img src="images/img_01.jpg">

                        <img src="images/img_01.jpg">

                        <img src="images/img_01.jpg">
                         -->
                </div>
            </div>


            <!--温馨提示-->
            <h5 id="datails_h5" class="datails_h5">温馨提示</h5>

            <dl>
                <dt>
                    <img src="images/icon_19.png">
                    <p>无忧购物</p>
                </dt>
                <dd>
                    <span>正品保障</span>
                    <span>包装精美</span>
                    <span>服务优良</span>
                    <span>全店商品均实物拍摄</span>
                    <span>七天无理由退换</span>
                </dd>
            </dl>

            <dl>
                <dt>
                    <img src="images/icon_19.png">
                    <p>购物须知</p>
                </dt>
                <dd>
                    <span>在非工作时间，您可以自由购物，如有问题可以备注留言，我们会尽快回复您！</span>
                </dd>
            </dl>

            <dl>
                <dt>
                    <img src="images/icon_19.png">
                    <p>发货须知</p>
                </dt>
                <dd>
                    <span>本店承诺48小时内发出产品，部分偏远地区（内蒙古、西藏、陕西、甘肃、青海、宁夏、新疆）及港澳台不包邮，需补齐邮费才能发货，如有问题请联系客服。</span>
                </dd>
            </dl>

            <dl>
                <dt>
                    <img src="images/icon_19.png">
                    <p>收货须知</p>
                </dt>
                <dd>
                    <span>收货时请您先验货再签收，如快递原因造成产品损坏请您拒收并在快递员面联系客服。收到货后如您对我们产品满意请确认收货并给予我们最真实的评价。</span>
                </dd>
            </dl>

            <h5 id="comments_h5" class="datails_h5">产品评价</h5>

            <!--产品评价-->
            <ul id="comments">
                <!--
                    <li>
                        <div class="comments_left">
                            <p>自行车包自行车骑行包便...自行车包自行车骑行包便...自行车包自行包自行车骑行包便...自行车包自行车骑行自行车包自行车......</p>
                            <h3>
                                <span>2017-12-12</span>
                                <span class="span">颜色：军绿色</span>
                            </h3>
                        </div>
                        <div class="comments_right">
                            <p>赖****（匿名）</p>
                        </div>
                    </li>

                    <li>
                        <div class="comments_left">
                            <p>自行车包自行车骑行包便...自行车包自行车骑行包便...自行车包自行包自行车骑行包便...自行车包自行车骑行自行车包自行车......</p>
                            <h3>
                                <span>2017-12-12</span>
                                <span class="span">颜色：军绿色</span>
                            </h3>
                        </div>

                        <div class="comments_right">
                            <h5>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                            </h5>

                            <p>赖****（匿名）</p>
                        </div>
                    </li>

                    <li>
                        <div class="comments_left">
                            <p>自行车包自行车骑行包便...自行车包自行车骑行包便...自行车包自行包自行车骑行包便...自行车包自行车骑行自行车包自行车......</p>
                            <h3>
                                <span>2017-12-12</span>
                                <span class="span">颜色：军绿色</span>
                            </h3>

                            <h4>
                                <img src="images/pr_img_01.jpg">
                                <img src="images/pr_img_01.jpg">
                                <img src="images/pr_img_01.jpg">
                            </h4>
                        </div>

                        <div class="comments_right">
                            <h5>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                            </h5>

                            <p>赖****（匿名）</p>
                        </div>
                    </li>

                    <li>
                        <div class="comments_left">
                            <p>自行车包自行车骑行包便...自行车包自行车骑行包便...自行车包自行包自行车骑行包便...自行车包自行车骑行自行车包自行车......</p>
                            <h3>
                                <span>2017-12-12</span>
                                <span class="span">颜色：军绿色</span>
                            </h3>

                            <h4>
                            </h4>
                        </div>

                        <div class="comments_right">
                            <h5>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                            </h5>

                            <p>赖****（匿名）</p>
                        </div>
                    </li>

                    <li>
                        <div class="comments_left">
                            <p>自行车包自行车骑行包便...自行车包自行车骑行包便...自行车包自行包自行车骑行包便...自行车包自行车骑行自行车包自行车......</p>
                            <h3>
                                <span>2017-12-12</span>
                                <span class="span">颜色：军绿色</span>
                            </h3>

                        </div>

                        <div class="comments_right">
                            <h5>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                            </h5>

                            <p>赖****（匿名）</p>
                        </div>
                    </li>
                     -->
            </ul>

            <!--翻页-->
            <div class="page pageA" style="display: none" id="pages">
                <a href="javascript:void(0)" id="first">首页</a>
                <a href="javascript:void(0)" id="pre">上一页</a>
                <a href="javascript:void(0)" id="next">下一页</a>
                <a href="javascript:void(0)" id="end">尾页</a>
            </div>
        </div>

        <div class="right_recomm">
            <h4>产品推荐</h4>
            <span id="recommendpro">
			<!-- 
			<a href="">
				<img src="images/pr_01.jpg">

				<h3 class="h3A">CycleDesign-CDBG0057</h3>

				<h3 class="h3B">自行车包自行车骑行包便携水袋包双肩背包</h3>

				<p>￥<span>310</span></p>
			</a>

			<a href="">
				<img src="images/pr_01.jpg">

				<h3 class="h3A">CycleDesign-CDBG0057</h3>

				<h3 class="h3B">自行车包自行车骑行包便携水袋包双肩背包</h3>

				<p>￥<span>310</span></p>
			</a>

			<a href="">
				<img src="images/pr_01.jpg">

				<h3 class="h3A">CycleDesign-CDBG0057</h3>

				<h3 class="h3B">自行车包自行车骑行包便携水袋包双肩背包</h3>

				<p>￥<span>310</span></p>
			</a>

			<a href="" class="a_border">
				<img src="images/pr_01.jpg">

				<h3 class="h3A">CycleDesign-CDBG0057</h3>

				<h3 class="h3B">自行车包自行车骑行包便携水袋包双肩背包</h3>

				<p>￥<span>310</span></p>
			</a>
			 -->
			</span>
        </div>
    </div>
    <!--end-->
</div>


<!--底部-->
<footer>
    <div class="footer">
        <ul>
            <li><img src="images/icon_07.png"></li>
            <li>
                <p>购物指南</p>
                <a href="Shopping_guide.html#shopping_introduced">购物介绍</a>
                <a href="Shopping_guide.html#logistics_distribution">物流配送</a>
                <a href="Shopping_guide.html#method_payment">支付方式</a>
            </li>
        </ul>

        <ul>
            <li><img src="images/icon_08.png"></li>
            <li>
                <p>售后服务</p>
                <a href="After_service.html#shopping_introduced">退款说明</a>
                <a href="After_service.html#logistics_distribution">退换货流程</a>
                <a href="After_service.html#method_payment">自行车保修</a>
            </li>
        </ul>

        <ul>
            <li><img src="images/icon_09.png"></li>
            <li>
                <p>会员权益</p>
                <a href="Rights_members.html#shopping_introduced">会员积分规则</a>
            </li>
        </ul>

        <ul>
            <li><img src="images/icon_10.png"></li>
            <li>
                <p>关于商城</p>
                <a href="aboutus.html#shopping_introduced">商城介绍</a>
                <a href="aboutus.html#logistics_distribution">联系我们</a>
                <a href="aboutus.html#method_payment">加入我们</a>
            </li>
        </ul>

        <ul class="footer_ul">
            <li><img src="images/icon_11.png"></li>
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
                <img src="images/icon_12.png">
                <img src="images/yst-vip.png" class="wx_img">
            </a>

            <a href="javascript:void" class="app">
                <!--<img src="images/icon_13.png">-->
                <!--<img src="images/app.png" class="app_img">-->
            </a>
        </div>
        <div class="clear"></div>

    </div>
</footer>

<!--end-->

<script type="text/javascript">

    /*选择数量*/
    function add() {
        var ss = document.getElementById("count").innerText;
        document.getElementById('count').innerHTML++;

    }

    function sub() {
        var ss = document.getElementById("count").innerText;
        if (ss == 1) {
        } else {
            document.getElementById('count').innerHTML--;
        }
    }

    function fengxcj() {
        $(".jiathis_style").css({'display': 'block'});
    }

</script>


</body>
<script type="text/javascript" src="../js/public.js"></script>
<script type="text/javascript" src="js/reminder.js"></script>
</html>
