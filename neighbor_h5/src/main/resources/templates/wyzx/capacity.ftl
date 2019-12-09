<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>${projectName}</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <link href="${ctx}/wyzx/css/capacity.css" rel="stylesheet"/>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
        }
    </script>
</head>
<body>

<!-- 主界面菜单同时移动 -->
<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 页眉导航 -->
        <!--<header class="mui-bar mui-bar-nav">
            <a id="nav-add" class="mui-icon mui-icon mui-icon-back" style="color:#218AE3;" href="javascript:mui.back()"></a>
            <h1 class="mui-title">24小时客服大厅</h1>
        </header>-->

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <div class="serae">
                        <div class="cap_title">
                            <b>关于政务中心</b>
                        </div>
                        <div class="type_option ">
                            <div class="option">
                                <div>
                                    <a class="pitch_on" href="javascript:;">中心地址</a>
                                </div>
                                <div>
                                    <a href="javascript:;">上班时间</a>
                                </div>
                                <div>
                                    <a href="javascript:;">联系方式</a>
                                </div>
                                <div>
                                    <a href="javascript:;">公交路线</a>
                                </div>
                                <div>
                                    <a href="javascript:;">所有部门</a>
                                </div>
                                <div>
                                    <a href="javascript:;">可办理事项</a>
                                </div>
                                <br style="clear:both">
                            </div>
                        </div>
                        <div class="cap_title">
                            <b>社会保障</b>
                        </div>
                        <div class="type_option">
                            <div class="option">
                                <div class="">
                                    <a href="javascript:;">法律援助</a>
                                </div>
                                <div>
                                    <a href="javascript:;">医疗机构</a>
                                </div>
                                <div>
                                    <a href="javascript:;">取水许可</a>
                                </div>
                                <div>
                                    <a href="javascript:;">旧城改造</a>
                                </div>
                                <div>
                                    <a href="javascript:;">就业创业</a>
                                </div>
                                <div>
                                    <a href="javascript:;">劳动保障</a>
                                </div>
                                <br style="clear:both">
                            </div>
                        </div>
                        <div class="cap_title">
                            <b>交通出行</b>
                        </div>
                        <div class="type_option">
                            <div class="option">
                                <div class="">
                                    <a href="javascript:;">公路建设</a>
                                </div>
                                <div>
                                    <a href="javascript:;">港口经营</a>
                                </div>
                                <div>
                                    <a href="javascript:;">出租汽车</a>
                                </div>
                                <div>
                                    <a href="javascript:;">车辆运营证</a>
                                </div>
                                <div>
                                    <a href="javascript:;">航标设置</a>
                                </div>
                                <div>
                                    <a href="javascript:;">公路运输</a>
                                </div>
                                <br style="clear:both">
                            </div>
                        </div>
                        <div class="cap_title">
                            <b>教育科研</b>
                        </div>
                        <div class="type_option">
                            <div class="option">
                                <div class="">
                                    <a href="javascript:;">学校注册</a>
                                </div>
                                <div>
                                    <a href="javascript:;">优秀教师</a>
                                </div>
                                <div>
                                    <a href="javascript:;">三号学生</a>
                                </div>
                                <div>
                                    <a href="javascript:;">义务教育</a>
                                </div>
                                <div>
                                    <a href="javascript:;">我要问政</a>
                                </div>
                                <div>
                                    <a href="javascript:;">助学贷款</a>
                                </div>
                                <br style="clear:both">
                            </div>
                        </div>
                    </div>
                    <div class="submit_open">
                        <div class="op">
                            <a href="avascript:;">
                                <span class="icon"></span>
                                <b>我要提问</b>
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });
    mui('.serae').on('tap', 'a', function () {
        $("body a").removeClass("pitch_on");
        $(this).addClass("pitch_on");
    });

    mui('.op').on('tap', 'a', function () {
        var title = $(".pitch_on").html();
        window.top.location.href = "${ctx}/qingxiuh5/wozx/capacityopen/" + title;
    });
</script>


</html>