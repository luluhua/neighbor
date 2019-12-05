<!doctype html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">


<title>确定订单</title>

<link rel="stylesheet" type="text/css" href="css/css.css"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/mobile.css"/>
<link rel="stylesheet" type="text/css" href="css/msgbox.css"/>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../store/js/login.js"></script>
<script type="text/javascript" src="../js/user_info.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/fanhuidibu.js"></script>     <!--返回顶部-->
<script type="text/javascript" src="js/shippingRess.js"></script> 
<script type="text/javascript" src="js/OrderInfo.js"></script>
<script type="text/javascript" src="js/Make_sure_order.js"></script>
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
					<a href="member_Allorders.html">待付款<span>0</span></a>
					<a href="member_Allorders.html">待收货<span>0</span></a>
					<a href="member_Allorders.html">待评论<span>0</span></a>
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
				<p class="curtB">确认订单</p>
			</li>
			<li>
				<b>2</b>
				<p>付款</p>
			</li>
			<li>
				<b>3</b>
				<p>交易成功</p>
			</li>
		</ol>
		<div class="clear"></div>
	</div>
<!--end-->
</div>





<div class="content_car">

	<h1 class="car_h1">配送信息</h1>

	<ul class="add_information">
	<!-- 
		<li class="liA">
			<p>姓名：小赖同学</p>

			<p>电话：12359656555</p>

			<p class="p">地址：广西南宁市青秀区昌泰东盟园昌泰大厦999</p>
		</li>
		<li>
			<p>姓名：小赖同学</p>

			<p>电话：12359656555</p>

			<p class="p">地址：广西南宁市青秀区昌泰东盟园昌泰大厦999</p>
		</li>
		<li class="liB">
			<span>新增地址</span>
		</li>
		 -->
	</ul>

<!--购物车-内容	-->
	<h1 class="car_h1">订单信息</h1>

	<div class="car_div">
		<ul class="car_ul">
			<li class="liA">商品详情</li>
			<li>单价/元(会员价)</li>
			<li>数量/件</li>
			<li class="li_hidden">颜色/尺寸</li>
		</ul>
	<div id="Order">
		<ul class="car_ul car_ulA">
			<li class="liA">
				<img id="indentimg" src="">

				<p><a href="javascript:void{0}" id="indentname" onclick=""></a></p>
			</li>

			<li id="indentprice"></li>

			<li class="liB" id="indentquantity"></li>

			<li class="liC" id="indentmessage"></li>
		</ul>
				<ul class="car_ul car_ulA">
			<li class="liA">
				<img id="indentimg" src="">

				<p><a href="javascript:void{0}" id="indentname" onclick=""></a></p>
			</li>

			<li id="indentprice"></li>

			<li class="liB" id="indentquantity"></li>

			<li class="liC" id="indentmessage"></li>
		</ul>	
	</div>	
	</div>
	<form action="/MhlSOR/zfb/wholesalealiipayapi.jsp" onsubmit="return goldBuy()"  method="GET">
	<h1 class="car_h1" style="margin-top:5%;">订单备注</h1>

	<textarea placeholder="给商家留言..." id="remark" name ="remark"  class="note"></textarea>
				<div style="display:none">
					<div class="etitle">商户订单号:</div>
                    <div class="einput"><input type="text" name="WIDout_trade_no" id="out_trade_no"></div>
					<div class="etitle">商品名称:</div>
                    <div class="einput"><input type="text" name="WIDsubject" id="comname" value=""></div>
                    <div class="etitle">付款金额:</div>
                    <div class="einput"><input type="text" name="WIDtotal_fee" id="WIDtotal_fee" value=""></div>
					<div class="etitle">商品描述:</div>
                    <div class="einput"><input type="text" name="WIDbody" id="prodescribe" value=""></div>
					<div class="etitle">商品id:</div>
                    <div class="einput"><input type="text" name="proid" id="proid" value=""></div>
					<div class="etitle">用户id:</div>
                    <div class="einput"><input type="text" name="userid" id="userid" value=""></div>
					<div class="etitle">配送地址:</div>
                    <div class="einput"><input type="text" name="site" id="site" value=""></div>
					<div class="etitle">购买数量:</div>
                    <div class="einput"><input type="text" name="amount" id="amount" value=""></div>
                    <div class="etitle">订单颜色:</div>
                    <div class="einput"><input type="text" name="tinctas" id="tinctas" value=""></div>
                    <div class="etitle">使用积分:</div>
                    <div class="einput"><input type="text" name="usingIntegral" id="usingIntegral" value="0"></div>
                    <div class="etitle">使用折扣劵:</div>
                    <div class="einput"><input type="text" name="UseCoupons" id="useCoupons" value="0"></div>
					<div class="etitle">单价:</div>
                    <div class="einput"><input type="text" name="univalence" id="univalence" value=""></div>
                    <div class="etitle">商品尺寸:</div>
                    <div class="einput"><input type="text" name="size" id="size" value=""></div>
                    <div class="etitle">里程数:</div>
                    <div class="einput"><input type="text" name="Theretailprice" id="Theretailprice" value=""></div>
				    <div class="etitle">虚拟订单号:</div>
                    <div class="einput"><input type="text" name="cacheid" id="cacheid" value=""></div>
                    <div class="etitle">订单号类型:</div>
                    <div class="einput"><input type="text" name="protype" id="protype" value="1"></div>
				</div>
				
	<h1 class="car_h1" style="margin-top:5%;">结算信息</h1>

	<div class="settlement">
	  	<div class="checkboxFive checkboxFiveA">
	  		<input type="checkbox" value="1" onclick="goldBuckle()" id="goldBuckle" class="checkboxFiveInput" name="" />
		  	<label for="checkboxFiveInput"></label>
		  	<p>可用<b id="gold"> 0 </b>金币 抵扣<b id="deductionMoney"> 0 </b>元</p>
	  	</div>

		<h5>共<b id="count"></b> 件商品</h5>

		<h6>合计（含运费）/元： <b class="b" id="rental"></b></h5>

		<button type="submit" class="tj_a" >提交订单</button>
	</div>
	</form>
<!--end-->
</div>

<div class="new_add">
	<div class="new_addA">
		<h1 class="xz_add">新增收货地址</h1>

		<ol class="add_ol">
			<li>
				<p>收货人 ：</p>
				<input type="text" id="adduname" value="">
			</li>

			<li>
				<p>收货地址 ：</p>
				<div class="common_fl info add_info new_info">
					<select id="s_province" name="s_province"></select> 
					 
					<select id="s_city" name="s_city" ></select>  

					<select id="s_county" name="s_county"></select>

					<textarea id="addsite" placeholder="输入详细地址"></textarea>
				</div>
				<script class="resources library" src="js/area.js" type="text/javascript"></script>	

				<script type="text/javascript">_init_area();</script>
	
			</li>

			<li>
				<p>联系电话 ：</p>
				<input type="text" id="addphone" value="">
			</li>

			<li>
				<p>邮政编码 ：</p>
				<input type="text" id="addpostcode" value="">
			</li>

			<li>
				<button onclick="add_address()">确定</button>
				<button  class="new_add_but">取消</button>
			</li>
		</ol>
	</div>
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
</html>
