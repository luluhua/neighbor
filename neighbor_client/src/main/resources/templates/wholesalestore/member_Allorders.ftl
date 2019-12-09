<!doctype html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">


<title>全部订单</title>

<link rel="stylesheet" type="text/css" href="css/css.css"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/mobile.css"/>
<link rel="stylesheet" type="text/css" href="css/msgbox.css" />
<link rel="stylesheet" type="text/css" href="../store/css/mdialogqd.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/fanhuidibu.js"></script>     <!--返回顶部-->
<script type="text/javascript" src="../store/js/login.js"></script>
<script type="text/javascript" src="../js/user_info.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/JsSkip.js"></script>
<script type="text/javascript" src="../store/js/mdialogqd.js"></script>
<script type="text/javascript" src="../store/js/sign.js"></script>
<script type="text/javascript" src="js/numberQueries.js"></script>
<script type="text/javascript" src="js/member_Allorders.js"></script>
<script type="text/javascript" src="js/addshoppingcart.js"></script>
<script type="text/javascript" src="js/reminder.js"></script>
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


<!--会员中心-头部-->
<div id="header">
	<div id="head">
		<p>会员中心</p>

		<a href="member.html">首页</a>

		<a href="member_message.html" class="head_a">消息<b id="inboxNum">0</b></a>

		<div class="nav_sign nav_signA" onclick="mysifn()">签到送积分</div>
	</div>
<!--end-->	
</div>

<!--会员中心-内容-->
<div class="member_cent">
	<div class="left">
		<p>个人中心</p>
		
		<ul class="menu_ul">
			<li><a href="member_Allorders.html" class="menu_a">全部订单</a></li>

			<li><a href="member_data.html">个人资料</a></li>

			<li><a href="member_add.html">收货地址</a></li>

			<li><a href="member_collection.html">我的收藏</a></li>

			<li><a href="member_Goid.html">我的金币</a></li>

			<li><a href="member_coupons.html">我的优惠券</a></li>

			<li><a href="member_message.html">我的消息</a></li>

			<li><a href="member_password.html">修改密码</a></li>

			<li><a href="member_store.html">认证信息</a></li>

			<li><a href="member_return.html">退货/退款</a></li>
		</ul>
	</div>

	<div class="right">
		<div class="common_border">
			<h3 id="h3">
				<p>全部订单</p>
			</h3>

			<!--分类-->
			<input type="text" id="types" style="display: none">
			<div class="all_tab">
				<p class="tab_p">全部订单</p>
				<p>待付款</p>
				<p>待发货</p>
				<p>待收货</p>
				<p>待评论</p>
			</div>

			<ul>
				<li class="date_li">商品详情</li>

				<li>价格/元</li>

				<li>状态</li>

				<li>操作</li>
			</ul>

			<!--没有产品时的页面-->
			<div class="order_none">
				<p>没有任何订单，<a href="index.html">去购物　！＞＞</a></p>
			</div>

			<div class="orderA_div">
			   <!-- 
			   <h4 id="h4">
					<p>2017-12-12  12:12:12</p >

					<p>订单号：<b>201712120519</b></p >

					<span></span>
				</h4>
                <div>
                   <ul class="orderA_ul">
					<li class="date_li">
						<img src="images/pr_01.jpg">
						<h6>
							<p><a href="">自行车包自行车骑行包便携水.....</a></p >
							<p>数量：1</p >
						</h6>
					</li>

					<li class="date_liA">
						<p>批发价：<span>310</span></p >
						<p class="date_pA">零售价：<span>310</span></p >
					</li>

					<li class="date_liB">待付款</li>

					<li class="date_liC">
						<a href="">删除商品</a>
					</li>
				</ul>

				<ul class="orderA_ul">
					<li class="date_li">
						<img src="images/pr_01.jpg">
						<h6>
							<p><a href="">自行车包自行车骑行包便携水.....</a></p >
							<p>数量：1</p >
						</h6>
					</li>

					<li class="date_liA">
						<p>批发价：<span>310</span></p >
						<p class="date_pA">零售价：<span>310</span></p >
					</li>

					<li class="date_liB">待付款</li>

					<li class="date_liC">
						<a href="">删除商品</a>
					</li>
				</ul>
               </div>
				
				<div class="jiesuandiv">
					<div class="jiesuanleft">共<span>2</span>件商品,实付<span>888.00</span>元</div>
					<a href="">立即支付</a>
				</div>
			    -->			
			</div>    			
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
</html>
