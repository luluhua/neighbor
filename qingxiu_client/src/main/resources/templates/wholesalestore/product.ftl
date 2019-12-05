<!doctype html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">


<title>批发商城产品中心</title>

<link rel="stylesheet" type="text/css" href="css/css.css"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/mobile.css"/>
<link rel="stylesheet" type="text/css" href="css/msgbox.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../store/js/login.js"></script>
<script type="text/javascript" src="../js/user_info.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/public.js"></script>
<script type="text/javascript" src="js/reminder.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/fanhuidibu.js"></script>     <!--返回顶部-->
<script type="text/javascript" src="js/productcentre.js"></script>
<script type="text/javascript" src="js/numberQueries.js"></script>
<script type="text/javascript" src="js/productSearch.js"></script>
<script type="text/javascript" src="js/addshoppingcart.js"></script>
<script type="text/javascript" src="js/jquery.page.js"></script>

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
<div class="header_bg">
	
	<div class="header">
		<p class="welcome">您好，欢迎来到简单生活 ！</p>

		<ul>
			<li class="login" >
			<span class = "header_content1">
				<a href="/store/login.html" target="_blank">登陆</a>|
				<a href="/store/register.html" target="_blank">注册</a>
				</span>
				<span id="land1" style="display: none">
				
				<a href="javascript:void{0}" id="username" onclick="GOuser_home()"></a>|				
				<a href="javascript:void{0}" onclick="logout()">退出</a>
				</span>
			</li>

			<li class="order"><a href="member_Allorders.html">我的订单</a>
				<div class="orders">
					<a href="member_Allorders.html">待付款<span id=obligationNum>0</span></a>
					<a href="member_Allorders.html">待收货<span id="waitReceiving">0</span></a>
					<a href="member_Allorders.html">待评论<span id="commentOn">0</span></a>
				</div>
			</li>

			<li><a href="Shopping_guide.html">帮助中心</a></li>

			<li class="fh_index"><a href="index.html">商城首页</a></li>
		</ul>
	</div>
<!--end-->
</div>


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
			
		<input type="text" id="SearchGoods" onkeypress="if (event.keyCode == 13) searchSkip();" placeholder="Search" class="text"/>
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
		<li class="all"><a href="javascript:void(0)">产品分类</a>
			<div class="allA">
				<a href="javascript:void(0)" onclick="classify('all')">全部商品</a>
				
				<a href="javascript:void(0)" onclick="classify('bike')">自行车</a>

				<a href="javascript:void(0)" onclick="classify('把带')">自行车把带</a>

				<a href="javascript:void(0)" onclick="classify('把套')">自行车把套</a>

				<a href="javascript:void(0)" onclick="classify('包包')">自行车包包</a>

				<a href="javascript:void(0)" onclick="classify('Cordee')">自行车配件</a>
			</div>
		</li>
		<li><a href="">优惠活动</a></li>

		<li><a href="">领优惠券</a></li>

		<li><a href="">优惠活动</a></li>

		<!--<li><a href="">优惠活动</a></li>

		<li><a href="">优惠活动</a></li>-->
	</ul>
	<div class="clear"></div>

</nav>
<!--end-->




<!--banner-->
<div class="banner">
	<!--轮播--> 
	<div class="callbacks_container">
		<ul class="rslides" id="slider">
			<li><img src="images/banner01.jpg" alt=""></li>
			<li><img src="images/banner02.jpg" alt=""></li>
			<li><img src="images/banner03.jpg" alt=""></li>
		</ul>
	</div>
	<script type="text/javascript" src="js/lunbo.min.js"></script>
    
    <div class="banner_fr">
		<img src="images/icon_05.png" id="ports1" onclick="GOuser_home()">
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


<!--产品-->
<div class="product" id="product">

	<!--筛选-->
	<div class="screening">
		<div class="price">
			<p>价格</p>
			<input id="price1" type="text" placeholder="￥" onclick="JavaScript:this.value=''">
			<span>-</span>
			<input id="price2" type="text" placeholder="￥" onclick="JavaScript:this.value=''">
			<input type="button" value="确定" class="button" onclick="confirm()">
		</div>

		<dl>
			<dt>品牌</dt>
			<dd onclick="Bybrand('GIOS')">GIOS</dd>
			<dd onclick="Bybrand('MHL')">MHL</dd>
			<dd onclick="Bybrand('CYCLEDESIGN')">CYCLEDESIGN</dd>
			<!-- 
			<dd>把带</dd>
			<dd>把带</dd>
			 -->
		</dl>
		<p class="total">共有 <b id="amount">120</b> 个商品</p>
	</div>

	<div class="productA">
		<div class="left">
			<ul id="prolist">
			<!-- 
				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>

						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>

				<li>
					<a href="">
						<img src="images/pr_01.jpg">

						<h3 class="h3">自行车包自行车骑行包便携水袋包双肩背包</h3>

						<h3>CycleDesign-CDBG0057</h3>
						
						<div class="bott">
							<div class="lefts">
								<p>会员价：￥<span>310</span></p>
								<p>销售价：￥<span>310</span></p>
							</div>

							<div class="rights">
								<p class="p">收藏</p>
								<p>库存<span>110</span>件</p>
							</div>
						</div>
					</a>
				</li>
				 -->
			</ul>

			<!--翻页-->
			<div class="page" style="display: none">
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





</body>
<script type="text/javascript" src="../js/public.js"></script>
<script type="text/javascript" src="js/reminder.js"></script>
<script type="text/javascript" src="js/notice.js"></script>
<script type="text/javascript" src="js/Marquee.js"></script>
</html>
