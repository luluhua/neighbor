<html>

<head>
    <meta charset="utf-8">
    <title>默认展示页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="shortcut icon" href="/base/images/iPhone1024@2x.png">
    <link rel="stylesheet" href="/plugins/mui/css/iconfont_mine.css">

    <link rel="stylesheet" href="/plugins/mui/css/mui.css">
    <style>
        html,
        body {
            background-color: #efeff4;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav" style="background-color: #298ee4">
    <h1 id="title" class="mui-title" style="color:#ffffff">消息</h1>
    <#--<a class="mui-icon mui-icon-gear" style="color: #ffffff;position: fixed;right: 10px" href="/logOutApp"></a>-->
</header>
<nav class="mui-bar mui-bar-tab">
    <a class="mui-tab-item mui-active" href="/h5App/message">
        <span class="mui-icon mine-icon icon-iconfront-"></span>
        <span class="mui-tab-label">消息</span>
    </a>
    <a class="mui-tab-item" href="/h5App/gotoTaskApp">
        <span class="mui-icon mine-icon icon-file">
            <#--<span class="mui-badge">9</span>-->
        </span>
        <span class="mui-tab-label">事项</span>
    </a>
    <a class="mui-tab-item" href="/h5App/gotoConsultApp">
        <span class="mui-icon mine-icon icon-file">
        <#--<span class="mui-badge">9</span>-->
        </span>
        <span class="mui-tab-label">咨询</span>
    </a>
    <a class="mui-tab-item" href="/h5App/infoApp">
        <span class="mui-icon mine-icon icon-wode"></span>
        <span class="mui-tab-label">我的</span>
    </a>
</nav>
<div class="mui-content"></div>

<script src="/plugins/mui/js/mui.js"></script>
<script type="text/javascript" charset="utf-8">
    /*浏览器的兼容处理方法*/
    var createIframe = function (el, opt) {
        var elContainer = document.querySelector(el);
        var wrapper = document.querySelector(".mui-iframe-wrapper");
        if(!wrapper){
            // 创建wrapper 和 iframe
            wrapper = document.createElement('div');
            wrapper.className = 'mui-iframe-wrapper';
            for(var i in opt.style){
                wrapper.style[i] = opt.style[i];
            }
            var iframe = document.createElement('iframe');
            iframe.src = opt.url;
            iframe.id = opt.id || opt.url;
            iframe.name = opt.id;
            iframe.style = "border:0px";
            wrapper.appendChild(iframe);
            elContainer.appendChild(wrapper);
        }else{
            var iframe = wrapper.querySelector('iframe');
            iframe.src = opt.url;
            iframe.id = opt.id || opt.url;
            iframe.name = iframe.id;
        }
    }

    // mui初始化
    mui.init();

    var subpages = ['/h5App/message', '/h5App/gotoTaskApp', '/h5App/gotoConsultApp','/h5App/infoApp'];
    var subpage_style = {
        top: '45px',
        bottom: '51px'
    };
    var aniShow = {};
    // 当前激活选项
    var activeTab = subpages[0];
    var title = document.getElementById("title");

    // if(mui.os.plus){
    //     // 创建子页面，首个选项卡页面显示，其它均隐藏；
    //     mui.plusReady(function() {
    //         var self = plus.webview.currentWebview();
    //         for (var i = 0; i < 3; i++) {
    //             var temp = {};
    //             var sub = plus.webview.create(subpages[i], subpages[i], subpage_style);
    //             if (i > 0) {
    //                 sub.hide();
    //             }else{
    //                 temp[subpages[i]] = "true";
    //                 mui.extend(aniShow,temp);
    //             }
    //             self.append(sub);
    //         }
    //     });
    // }else{
    //     // 创建iframe代替子页面
    //     createIframe('.mui-content',{
    //         url: activeTab,
    //         style: subpage_style
    //     });
    // }

    // 创建iframe代替子页面
    createIframe('.mui-content',{
        url: activeTab,
        style: subpage_style
    });

    // 选项卡点击事件
    mui('.mui-bar-tab').on('tap', 'a', function(e) {
        var targetTab = this.getAttribute('href');

        //if (targetTab == activeTab) {return;}
        //更换标题
        title.innerHTML = this.querySelector('.mui-tab-label').innerHTML;
        //显示目标选项卡
        if(mui.os.plus){
            //若为iOS平台或非首次显示，则直接显示
            if(mui.os.ios||aniShow[targetTab]){
                plus.webview.show(targetTab);
            }else{
                //否则，使用fade-in动画，且保存变量
                var temp = {};
                temp[targetTab] = "true";
                mui.extend(aniShow,temp);
                plus.webview.show(targetTab,"fade-in",300);
            }
            //隐藏当前;
            plus.webview.hide(activeTab);
        }else{
            // 创建iframe代替子页面
            createIframe('.mui-content',{
                url: targetTab,
                style: subpage_style
            });
        }
        //更改当前活跃的选项卡
        activeTab = targetTab;
    });
</script>
</body>
</html>