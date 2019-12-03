

<head>
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <!--标准mui.css-->
    <link rel="stylesheet" href="../../static/plugins/mui/css/mui.css">
    <style>
        .mui-plus.mui-android header.mui-bar{
            display: none;
        }
        .mui-plus.mui-android .mui-bar-nav~.mui-content{
            padding: 0;
        }
        .title{
            margin: 20px 15px 10px;
            color: #6d6d72;
            font-size: 15px;
        }

        .oa-contact-cell.mui-table .mui-table-cell {
            padding: 11px 0;
            vertical-align: middle;
        }

        .oa-contact-cell {
            position: relative;
            margin: -11px 0;
        }

        .oa-contact-avatar {
            width: 75px;
        }
        .oa-contact-avatar img {
            border-radius: 50%;
        }
        .oa-contact-content {
            width: 100%;
        }
        .oa-contact-name {
            margin-right: 20px;
        }
        .oa-contact-name, oa-contact-position {
            float: left;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav" style="background-color: #0C70C4">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title" style="color: #FFFFFF">消息</h1>
</header>
<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item mui-active" href="/index">
        <span class="mui-icon mui-icon-home"></span>
        <span class="mui-tab-label">消息</span>
    </a>
    <a class="mui-tab-item" href="#">
        <span class="mui-icon mui-icon-email">
            <#--<span class="mui-badge">9</span>-->
        </span>
        <span class="mui-tab-label">事项</span>
    </a>
    <a class="mui-tab-item" href="#">
        <span class="mui-icon mui-icon-gear"></span>
        <span class="mui-tab-label">我的</span>
    </a>
</nav>
</body>
<script src="../../static/plugins/mui/js/mui.js"></script>
<script>
    mui.init({
        swipeBack:true //启用右滑关闭功能
    });
    //这里引用mui的子页面和预加载的逻辑
    //先缓存首页，下面菜单中用到的其余菜单页面作为预加载的子页面放在缓存中
    //这里的预加载存在数据同步的问题，
    //所以每个子页面上需要加入上划手势刷新页面内容的逻辑
    //设置默认打开首页显示的子页序号；
    var Index=0;
    //把子页的路径写在数组里面
    var subpages = ['/indexApp','/index','/indexApp'];

    function plusReady(){
        //获取当前页面所属的Webview窗口对象
        var self = plus.webview.currentWebview();
        for (var i = 0; i < 3; i++) {
            //创建webview子页
            var sub = plus.webview.create(
                    subpages[i], //子页url
                    subpages[i], //子页id
                    {
                        top: '45px',//设置距离顶部的距离
                        bottom: '50px'//设置距离底部的距离
                    }
            );
            //如不是我们设置的默认的子页则隐藏，否则添加到窗口中
            if (i != Index) {
                sub.hide();
            }
            //将webview对象填充到窗口
            self.append(sub);
            console.log("---------检测开始----------");
            console.log(sub);
            console.log(self);
            console.log("---------检测结束----------");
        }
    }

    if(window.plus){
        plusReady();
    }else{
        document.addEventListener('plusready',plusReady,false);
    }

    //当前激活选项
    var activeTab = subpages[Index],title=document.querySelector(".mui-title");
    //选项卡点击事件
    mui('.mui-bar-tab').on('tap', 'a', function(e) {
        //获取目标子页的id
        var targetTab = this.getAttribute('href');
        if (targetTab == activeTab) {
            return;
        }
        //更换标题
        title.innerHTML = this.querySelector('.mui-tab-label').innerHTML;
        //显示目标选项卡
        plus.webview.show(targetTab);
        //隐藏当前选项卡
        plus.webview.hide(activeTab);
        //更改当前活跃的选项卡
        activeTab = targetTab;
    });

</script>