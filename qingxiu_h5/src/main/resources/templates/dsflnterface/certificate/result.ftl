<#include "../../common/base.ftl">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>${projectName}</title>
    <link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
    <link href="${ctx}/dsflnterface/resultList.css" rel="stylesheet"/>
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
        <!--<header class="mui-bar mui-bar-nav">
            <h1 class="mui-title">手上清秀</h1>
        </header>-->

        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="boodylie">
                <div class="box">
                    <div class="kb"></div>
                    <div class="result_title">查询企业证书结果</div>
                    <div class="search_info">
                        公司名称
                        <span>${(certificateSearcgVo.searchKey)!}</span>
                    </div>
                    <div class="kb"></div>
                    <div class="result_detail">
                        <span></span>
                        <label>结果详情</label>
                        <#if (tEnterpriseCertificateList)??>
                            <#list tEnterpriseCertificateList as list>
                            <div class="detail_info">
                                产品名称：<span>${(list.cName)!}</span>
                            </div>
                            <div class="detail_info">
                                证书类型：<span>${(list.cType)!}</span>
                            </div>
                            <div class="detail_info">
                                证书生效时间：<span>${(list.cStartdate?string('yyyy-MM-dd'))!''}</span>
                            </div>
                            <div class="detail_info">
                                证书截止日期：<span>${(list.cEnddate?string('yyyy-MM-dd'))!''}</span>
                            </div>
                            <div class="detail_info">
                                证书编号：<span> ${(list.cNo)!}</span>
                            </div>
                            <div style='border-bottom: 1px dashed #E3E3E3;'></div>
                            </#list>

                            <#if (resulte)??>
                              <div class="detail_info">
                                    暂无结果
                                </div>
                            </#if>
                        <#else>
                            <div class="detail_info">暂无结果</div>
                        </#if>
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


</script>
</html>