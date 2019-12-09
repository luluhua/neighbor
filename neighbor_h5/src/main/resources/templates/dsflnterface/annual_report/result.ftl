<#include "../../common/base.ftl">
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
    <link rel="stylesheet" type="text/css" href="${ctx}/base/css/layui.css">
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <link href="${ctx}/jh.css/iconfont_mine.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
    <link href="${ctx}/dsflnterface/resultList.css" rel="stylesheet"/>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
        }
    </script>
    <link href="${ctx}/base/layui_new/css/layui.css" rel="stylesheet"/>
    <script src="${ctx}/base/layui_new/layui.js"></script>
</head>
<body >
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class='row'>
                <div class="kb"></div>
                <div class="result_title">查询公司年报概况结果</div>
                <div class="search_info">
                    查询关键字：
                    <span>${(annualReportSummarySearchVo.keyNo)!}</span>
                </div>
                <div class="kb"></div>
                <div class="result_detail">
                    <span></span>
                    <label>结果详情</label>
                    <#if (tCompanyAnnualReportList)??>
                        <#list tCompanyAnnualReportList as list>
                        <div class="detail_info">
                                报送年度：<span>${(list.rYear)!}</span>
                        </div>
                        <div class="detail_info">
                                发布日期:<span>${(list.rPublishdate)?string("yyyy-MM-dd")!}</span>
                        </div>
                        <div style='border-bottom: 1px dashed #E3E3E3;'></div>
                        </#list>
                        <#if (resulte)??>
                           <div class="detail_info">
                                暂无结果
                            </div>
                        </#if>

                    </#if>
                </div>
            </div>
            <div style="font-size: 13px;margin-left: 10px;margin-right: 10px;position:absolute;top:95%;color: #b6b6b6;text-align: center;width: 90%">
                数据来源【企查查-接口平台】
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#ffffff'
    });
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });


</script>
</html>