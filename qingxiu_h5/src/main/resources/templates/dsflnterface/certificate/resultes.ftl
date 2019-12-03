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
                <div class="result_title">查询企业证书结果</div>
                <div class="search_info">
                    公司名称
                    <span>${(certificateSearcgVo.searchKey)!}</span>
                </div>
                <div class="kb"></div>
                <div class="result_detail">
                    <span></span>
                    <label>结果详情</label>
                    <div >
                        <ul id="accordion" class="mui-table-view mui-table-view-chevron">
                            <#if (tEnterpriseCertificateList)??>

                                <#list tEnterpriseCertificateList as list>
                                <li class="mui-table-view-cell mui-collapse">
                                    <span class="mui-navigate-right">
                                        证书编号:${(list.cNo)!}
                                    </span>
                                    <ul class="mui-table-view mui-table-view-chevron">
                                        <li class="mui-table-view-cell">
                                            <#--<a href="#">主键:${(list.cId)!}</a>-->
                                            <#--<div style='border-bottom: 1px dashed #E3E3E3;'></div>-->
                                            <span >产品名称:${(list.cName)!}</span><br>
                                            <span >证书类型:${(list.cType)!}</span><br>
                                            <span >证书生效时间:${(list.cStartDate?date("yyyy-MM-dd"))!}</span><br>
                                            <span >证书截止日期:${(list.cEndDate?date("yyyy-MM-dd"))!}</span>
                                        </li>
                                    </ul>
                                </li>
                                </#list>
                                <#if (resulte)??>
                                    <li>
                                        <div class="link">
                                            <i class="fa fa-paint-brush"></i>
                                            暂无结果
                                            <i class="fa fa-chevron-down"></i>
                                        </div>
                                    </li>
                                </#if>
                            </#if>
                        </ul>
                    </div>
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

    $(function() {
        var Accordion = function(el, multiple) {
            this.el = el || {};
            this.multiple = multiple || false;

            // Variables privadas
            var links = this.el.find('.link');
            // Evento
            links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
        }

        Accordion.prototype.dropdown = function(e) {
            var $el = e.data.el;
            $this = $(this),
                    $next = $this.next();

            $next.slideToggle();
            $this.parent().toggleClass('open');

            if (!e.data.multiple) {
                $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
            };
        }

        var accordion = new Accordion($('#accordion'), false);
    });


</script>
</html>