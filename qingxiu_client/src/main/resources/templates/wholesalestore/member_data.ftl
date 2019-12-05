<!doctype html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">


<title>个人资料</title>

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
<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript" src="js/numberQueries.js"></script>
<script type="text/javascript" src="js/member_collection.js"></script>
<script type="text/javascript" src="js/member_data.js"></script>
<script type="text/javascript" src="js/reminder.js"></script>
<script type="text/javascript" src="../store/js/mdialogqd.js"></script>
<script type="text/javascript" src="../store/js/sign.js"></script>
<script type="text/javascript" src="js/wholesaleCart.js"></script>

</head>





<body class="body_bg">

<!--联系我们-->
<div class="contact_us">
	<div class="QQ">
		<a href="">在线咨询</a>		
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
			<li><a href="member_Allorders.html">全部订单</a></li>

			<li><a href="member_data.html" class="menu_a">个人资料</a></li>

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
		<dl>
			<dd>
				<a href="member_picture.html"><img id="ports1" src="" title="修改头像"></a>

				<p>
					<!-- 
				   <span id="username"></span>
				    -->

					<span>金币：<b id="gold"></b></span>

					<span class="spana">邀请码：<b id="invitation"></b>
						<sub class="RegisterLink">http://www.eanburg.com/store/register.html?invitation=<b id="invitations"></b></sub>
					</span>
				</p>
			</dd>

			<dt>
				<a href="member_Allorders.html">待付款<b id="obligationCount">0</b></a>
			</dt>

			<dt>
				<a href="member_collection.html">收藏的产品<b id="collectNum">0</b></a>
			</dt>
		</dl>

		<div class="common_border">
		
			<h3 id="h3">
				<p>个人资料</p>
			</h3>

			<ol class="data_ol">
			   
				<li>
				 
				<div class="common_fl name">
						<p>昵称：</p>

						<span id="nickname">您还没有填写昵称!</span>

						<a href="javascript:xiugaininc();" >修改</a>
					</div>
									
					<div class="common_fl name_hidden">
						<p>昵称：</p>

                        <input type="text" id="modifyNickname" placeholder="输入昵称" class="text">

						<a href="javascript:name_hidden()" class="name_qx">取消</a>

						<a href="javascript:void" onclick="modifyNickname()">确定</a>
					</div>					
				</li>                

				<li>
					<div class="common_fl gender">
						<p>性别：</p>

						<span id="gender_sex"></span>

						<a href="javascript:gender()">修改</a>
					</div>

					<div class="common_fl gender_hidden">
						<p>性别：</p>

						<fieldset>
                        <input type="radio" name="sex" value="男"/>男 

                        <input type="radio" name="sex" value="女"/>女  

                        <input type="radio" name="sex" value="保密 "/>保密  
                        </fieldset>

						<a href="javascript:gender_qx()" class="gender_qx">取消</a>

						<a href="javascript:void" onclick="modifyGender()">确定</a>
					</div>


				</li>

				<li>
					<div class="common_fl phone">
						<p>手机：</p>

						<span id="phone">您还没有绑定手机号！</span>

						<a href="javascript:phone()">绑定</a>
					</div>	

					<div class="common_fl phone_hidden">
						<h4>
							<p>手机：</p>
	                        <input type="text" id="MobileNo" placeholder="输入手机号" class="text">
                        </h4>

						<h4>
							<p>图片验证码：</p>

	                        <input type="text" id="imageVerify" placeholder="输入图片验证码" class="text text_phone">

	                        <img src="" id="su_img" onclick="flushCheckIMG(3)">
                        </h4>

						<h4>
							<p>手机验证码：</p>

	                        <input type="text" id="phoneVerification" placeholder="输入手机验证码" class="text text_phone">

							<button id="SMS_captcha" onclick="SMS_captcha()">获取</button>
                        </h4>
						<a href="javascript:phone_qx()" class="phone_qx">取消</a>

						<a href="javascript:void" onclick="ChangePhoneNumber()">确定</a>
					</div>					

				</li>

				<li>
					<div class="common_fl email">
						<p>邮箱：</p>

						<span id="email"></span>

						<a href="javascript:email()">修改</a>
					</div>	

					<div class="common_fl email_hidden">
						<h4>
							<p>邮箱：</p>

	                        <input type="text" id="newEmail" placeholder="输入邮箱" class="text">
                        </h4>
						<h4>
							<p>验证码：</p>
	                        <input type="text" id="emailCode" placeholder="输入验证码" class="text text_phone">

							<button id="emailVerificationCode" onclick="emailVerificationCode()">获取验证码</button>
                        </h4>
						<a href="javascript:email_qx()" class="email_qx">取消</a>

						<a href="javascript:void" onclick="modifyEmail()">确定</a>
					</div>					
				</li>

				<li>
					<div class="common_fl add">
						<p>地址：</p>

						<span id="site">广西南宁市青秀区昌泰东盟园昌泰大厦</span>

						<a href="javascript:add()">修改</a>
					</div>	

					<div class="common_fl add_hidden">
						<p>地址：</p>

						<!--修改地址-->
						<div class="common_fl info">
							<select id="s_province" name="s_province"></select> 
							 
							<select id="s_city" name="s_city" ></select>  

							<select id="s_county" name="s_county"></select>

							<textarea id="detailedAddress" placeholder="输入详细地址"></textarea>
						</div>
						<script class="resources library" src="js/area.js" type="text/javascript"></script>	

						<script type="text/javascript">_init_area();</script>
						<script type="text/javascript">
						var Gid  = document.getElementById ;
						var showArea = function(){
							Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" + 	
							Gid('s_city').value + " - 县/区" + 
							Gid('s_county').value + "</h3>"
													}						
						</script>
						<a href="javascript:add_qx()" class="add_qx">取消</a>

						<a href="javascript:void" onclick="modificationAddress()">确定</a>

					</div>	
				</li>
			</ol>
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
