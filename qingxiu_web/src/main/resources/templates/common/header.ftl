<header class="main-header">
    <!-- Logo -->
    <a href="javascript:void(0)" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>${(systemSubName)!'AA'}</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg">
           <img id="img_icon" style="width: 30px;height:30px;border-radius: 150px;margin-bottom: 8px"
                src="/base/images/iPhone1024@2x.png">
            <b>${(systemName)!''}</b></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"></a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Notifications Menu -->
                <li class="dropdown notifications-menu">
                    <!-- Menu toggle button -->
                <#--<a href="/tSmsSendLog/sms/list?uId=${(me.id)}" class="dropdown-toggle" data-toggle="dropdown">-->
                <#--<i class="fa fa-bell-o"></i>-->
                <#--<span class="label label-warning">${(msgCount)!'0'}</span>-->
                <#--</a>-->
                <#--<ul class="dropdown-menu">-->
                <#--<li class="header">您有0条消息</li>-->
                <#--<li>-->
                <#--<!-- Inner Menu: contains the notifications &ndash;&gt;-->
                <#--<ul class="menu">-->
                <#--<li><!-- start notification &ndash;&gt;-->
                <#--<a href="#">-->
                <#--<i class="fa fa-comment-o"></i> 1 new members joined today-->
                <#--</a>-->
                <#--</li><!-- end notification &ndash;&gt;-->
                <#--</ul>-->
                <#--</li>-->
                <#--<li class="footer"><a href="#"><i class="fa fa-angle-double-down"></i>查看全部</a></li>-->
                <#--</ul>-->
                </li>
                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="/system/me/info" class="dropdown-toggle" data-toggle="tooltip" title="Admnin"
                       data-placement="bottom">
                        <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(me.avatarUrl)!}"
                             class="user-image" alt="User Image">
                        <span class="hidden-xs">${(me.username)!'游客'}</span>
                    </a>
                </li>
                <li>
                    <a href="/logout" class="dropdown-toggle" data-toggle="tooltip" title="退出" data-placement="bottom">
                        <i class="fa fa-sign-out"></i>
                    </a>
                </li>
                <li style="width: 30px;">
                </li>
            </ul>
        </div>
    </nav>
</header>