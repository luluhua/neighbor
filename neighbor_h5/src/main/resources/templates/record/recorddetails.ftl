<#include "../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>${projectName}</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/base/css/layui.css" rel="stylesheet"/>
    <link href="${ctx}/record/css/recorddetails.css" rel="stylesheet"/>
    <link href="${ctx}/record/css/timeline.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/boxImg.css">
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
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
        <header class="mui-bar mui-bar-nav">
            <h1 class="mui-title">办事审批</h1>
        </header>
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll">
                <div class="box">
                    <div class="elsease">
                        <div class="reord_type">
                            <b href="javascript:;" class="pitch_on">信息审核</b>
                            <b href="javascript:;">审核历史</b>
                            <b href="javascript:;">办事历史</b>
                            <b href="javascript:;">消息列表</b>
                            <br style="clear:both">
                        </div>
                    </div>

                    <div id="shenhexinxi"> <!-- 审核信息 -->
                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-fuwuleix"></span>
                                <b>服务类型</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="25%">
                                        <col width="75%">
                                    </colgroup>
                                    <thead>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">服务类型</td>
                                        <td>行政审批</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">提交时间</td>
                                        <td>2019-04-19 10:28:22</td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-shixiangxinxi"></span>
                                <b>事项信息</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="25%">
                                        <col width="75%">
                                    </colgroup>
                                    <thead>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">事项信息</td>
                                        <td>户外招牌标识设置申请</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-chulibumen"></span>
                                <b>处理部门</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="25%">
                                        <col width="75%">
                                    </colgroup>
                                    <thead>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">处理部门</td>
                                        <td>南宁市青秀区城市管理局</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">行政区域</td>
                                        <td>青秀区</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-yonghuxinx"></span>
                                <b>用户信息</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="25%">
                                        <col width="75%">
                                    </colgroup>
                                    <thead>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">姓名</td>
                                        <td>18819129576</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">手机号</td>
                                        <td>18819129576</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">身份证号码</td>
                                        <td>450121199001271534</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-cailaoxinxi"></span>
                                <b>材料信息</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <!--<col width="25%">
                                        <col width="75%">-->
                                    </colgroup>
                                    <thead>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td>姓名:</td>
                                    </tr>
                                    <tr>
                                        <td>手机号:</td>
                                    </tr>
                                    <tr>
                                        <td>身份证号码:
                                            <img data-preview-src="" src="${ctx}/images/shenpishunxu.png"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-yonghuxinx"></span>
                                <b>用户信息</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="25%">
                                        <col width="75%">
                                    </colgroup>
                                    <thead>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">审核人</td>
                                        <td>admin</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">审核结果</td>
                                        <td>通过</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">意见</td>
                                        <td>哈克是否能三防空纳斯达克你分公司的那给你手动刚开始当了可是到了可能公路上但光缆大理工科男生搭理你戈萨的</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><!-- 审核信息结束 -->


                    <div id="shenhelisi" style="display: none;"><!-- 审核历史 -->
                        <div class="content">
                            <article>
                                <section>
                                    <span class="point-time point-times"></span>
                                    <time datetime="2013-03">
                                        <span>2019-05-05 21:55:41</span>
                                    </time>
                                    <aside>
                                        <div style="margin-top: 30px;">


                                            <table class="layui-table">
                                                <colgroup>
                                                    <col width="30%">
                                                    <col width="70%">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">审核人</td>
                                                    <td>18819129576</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">结果</td>
                                                    <td>通过</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">意见</td>
                                                    <td>撒娇考虑到放缓士大夫山大佛收到粉红色的发送</td>
                                                </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </aside>
                                </section>
                                <section>
                                    <span class="point-time point-times"></span>
                                    <time datetime="2013-03">
                                        <span>2019-05-05 21:55:41</span>
                                    </time>
                                    <aside>
                                        <div style="">
                                            <table class="layui-table">
                                                <colgroup>
                                                    <col width="30%">
                                                    <col width="70%">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">审核人</td>
                                                    <td>18819129576</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">结果</td>
                                                    <td>通过</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">意见</td>
                                                    <td>450121199001271534</td>
                                                </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </aside>
                                </section>
                            </article>
                        </div>
                    </div><!-- 审核历史结束 -->

                    <div id="banshilishi" style="display: none;"><!-- 办事历史 -->
                        <div class="content">
                            <article>
                                <section>
                                    <span class="point-time point-times"></span>
                                    <time datetime="2013-03">
                                        <span>提交材料</span>
                                    </time>
                                    <aside>
                                        <p class="things">15177198241</p>
                                        <p class="brief">提交时间<span class="text-blue">2019-05-05 21:54:44</span></p>
                                    </aside>
                                </section>
                                <section>
                                    <span class="point-time point-times"></span>
                                    <time datetime="2013-03">
                                        <span>申请驳回</span>
                                    </time>
                                    <aside>
                                        <p class="things">admin</p>
                                        <p class="brief">提交时间<span class="text-blue">2019-05-05 21:54:44</span></p>

                                    </aside>
                                </section>
                            </article>
                        </div>
                    </div><!-- 办事历结束-->


                    <div id="xiaoxiliebiao" style="display: none;"><!-- 消息列表 -->
                        <div class="reord_info">
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="25%">
                                        <col width="50%">
                                        <col width="25%">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>发送人</th>
                                        <th>内容</th>
                                        <th>发送时间</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>admin</td>
                                        <td>审核人</td>
                                        <td>admin</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div><!-- 消息列表结束 -->


                    <!-- 审核-->
                    <div class="reord_info submit_record">
                        <div class="yueor">
                            <div class="info_title">
                                <span class="icon-shenhe"></span>
                                <b>审核</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <form class="form-horizontal" id="form-recird" method="post"
                                      action="${ctx}/appc/tGovProjectAudit/doAdd" onsubmit="return uploadaud()">
                                    <table class="layui-table">
                                        <colgroup>
                                            <col width="25%">
                                            <col width="75%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <td style="text-align: right; background: #ebf5ff">审核</td>
                                            <td>
                                                <div class="mui-input-row mui-radio">
                                                    <label>通过</label>
                                                    <input name="radio1" type="radio">
                                                </div>
                                                <div class="mui-input-row mui-radio">
                                                    <label>不通过</label>
                                                    <input name="radio1" type="radio">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right; background: #ebf5ff">审核结果</td>
                                            <td>通过</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right; background: #ebf5ff">意见</td>
                                            <td>
                                                <textarea class="texta"></textarea>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="open_submit">
                                        <button type="submit">提交</button>
                                    </div>
                                </form>
                            </div>
                            <!-- 审核结束 -->
                        </div>
                    </div>
                    <div class="kong">

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
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });

    mui('.elsease').on('tap', 'b', function () {
        $(this).addClass("pitch_on").siblings().removeClass("pitch_on");
        var index = $(this).index();
        if (index == 0) {
            $("#shenhexinxi").css({'display': 'block'});
            $("#shenhelisi").css({'display': 'none'});
            $("#banshilishi").css({'display': 'none'});
            $("#xiaoxiliebiao").css({'display': 'none'});
        } else if (index == 1) {
            $("#shenhelisi").css({'display': 'block'});
            $("#shenhexinxi").css({'display': 'none'});
            $("#banshilishi").css({'display': 'none'});
            $("#xiaoxiliebiao").css({'display': 'none'});
        } else if (index == 2) {
            $("#banshilishi").css({'display': 'block'});
            $("#shenhelisi").css({'display': 'none'});
            $("#shenhexinxi").css({'display': 'none'});
            $("#xiaoxiliebiao").css({'display': 'none'});
        } else if (index == 3) {
            $("#xiaoxiliebiao").css({'display': 'block'});
            $("#banshilishi").css({'display': 'none'});
            $("#shenhelisi").css({'display': 'none'});
            $("#shenhexinxi").css({'display': 'none'});
        }
    });


</script>
<script src="${ctx}/base/js/boxImg.js"></script>
</html>