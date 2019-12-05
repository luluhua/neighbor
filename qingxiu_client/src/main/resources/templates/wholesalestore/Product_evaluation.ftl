<!doctype html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">


<title>产品评价</title>

<link rel="stylesheet" type="text/css" href="css/css.css"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/mobile.css"/>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/fanhuidibu.js"></script>     <!--返回顶部-->
<script type="text/javascript" src="js/My_shopping_car.js"></script>
<script type="text/javascript" src="../store/js/login.js"></script>
<script type="text/javascript" src="../js/user_info.js"></script>
<script type="text/javascript" src="../js/public.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/numberQueries.js"></script>
<script type="text/javascript" src="js/Product_evaluation.js"></script>

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
				<a href="../store/login.html" target="_blank">登陆</a>|
				<a href="../store/register.html" target="_blank">注册</a>
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

	<!--订单进度-->
	<div class="order_progress">
		<ol>
			<li class="curtA">
				<b class="curtA">1</b>
				<p class="curtB">我的购物车</p>
			</li>
			<li class="curtA">
				<b class="curtA">2</b>
				<p class="curtB">确认订单</p>
			</li>
			<li class="curtA">
				<b class="curtA">3</b>
				<p class="curtB">付款</p>
			</li>
			<li class="curtA">
				<b class="curtA">4</b>
				<p class="curtB">交易成功</p>
			</li>
		</ol>
		<div class="clear"></div>
	</div>
<!--end-->
</div>





<div class="content_car">

<!--订单信息-->
	<h1 class="car_h1">订单信息</h1>

	<div class="car_div">
		<div class="ddxx_div">
			<p>订单编号:<span id="orderNo"></span></p>
			<!-- 
			<p>发货时间:2017-05-08 09:48:32</p>
			 -->	
			<p>付款时间:<span id="paymentTime"></span></p>
			<!-- 
			<p>成交时间:2017-05-11 18:48:04</p>
			 -->		
		</div>

		<ul class="car_ul">
			<li class="liA">商品详情</li>
			<li>单价/元</li>
			<li>数量/件</li>
			<li class="li_hidden">状态</li>
		</ul>

		<ul class="car_ul car_ulA">
			<li class="liA">
				<img id="picture" src="">

				<p><a href="product_details.html" id="productName"></a></p>
			</li>

			<li id="price">0</li>

			<li class="liB" id="quantity">0</li>

			<li class="liC" id="tradingStatus"></li>
		</ul>				
	</div>

	<div class="eva_div">
		<h2>产品评价</h2>

		<div class="eva_divA">
			<h4>
				<b>产品评分</b>
				<p class="productRating">
					<span class="span" grade="1"></span>

					<span grade="2"></span>
					
					<span grade="3"></span>
						
					<span grade="4"></span>
						
					<span grade="5"></span>
						
				</p>
				<input type="text" id="productRating" value="1" style="display: none">
			</h4>

			<h5>
				<b>产品评价</b>
				<textarea id="content" placeholder="评论字数不能超过60个..."></textarea>
			</h5>

            <!-- 
            <h6>
				<b>晒图片</b>
				<span>（最多3张）</span>
				<p>
					<img src="images/icon_43.png" class="img">

					<img src="images/pr_01.jpg">

					<img src="images/pr_01.jpg">

					<img src="images/pr_01.jpg">
				</p>
			</h6>
             -->					
		</div>
		<button onclick="evaluationGoods()">提交</button>
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
