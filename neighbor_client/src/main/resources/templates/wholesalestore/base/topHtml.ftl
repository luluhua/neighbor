<div class="header_bg">

    <div class="header">
        <p class="welcome">您好，欢迎来到简单生活 ！</p>

        <ul>
            <li class="login">
                <#if me??>
                    <a href="javascript:void{0}">
                    <@commonTags method="getDecrypt3DEs" type="1" value="${(me.username)!}">${(getDecrypt3DEs)!}</@commonTags>
                    </a>|
                    <a class="bat-logout" href="javascript:;" data-toggle=" tooltip" title="退出"
                       data-placement="bottom"
                       data-tiggle="ajax"
                       data-submit-url="${ctx}/logout"
                       data-confirm="您确定要推出登录吗?">退出</a>
                <#else >
               <a href="${ctx}/login">登陆</a>
                </#if>
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
<script src="${ctx}/base/js/init.js"></script>
<script type="text/javascript" src="${ctx}/base/js/jquery-confirm/jquery-confirm.min.js"></script>