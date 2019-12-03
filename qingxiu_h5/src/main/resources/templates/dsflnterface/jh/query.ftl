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
    <link href="${ctx}/qxt/css/qxt.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/layui/layui.js" charset="utf-8"></script>
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
<body style="background-color: #f7f7f7">
<div class="row">
    <form action="${ctx}/qingxiuh5/jh/doQuery" method="post" onsubmit="return jh_validate()">
        <div class="layui-form-item" style="margin-left: 10px;margin-right: 10px;margin-top: 10px">
            类型
        </div>
        <div class="layui-form-item" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px">
            <input type="hidden" name="type" id="jh_type">
            <ul class="mui-table-view mui-table-view-chevron">
                <li class="mui-table-view-cell mui-collapse" id="jh_type_select">
                    <a class="mui-navigate-right" href="#" id="jh_type_select_info">请选择类型</a>
                    <ul class="mui-table-view mui-table-view-chevron typeSelect" >
                        <li class="mui-table-view-cell " value="0">通过网站名称查询</li>
                        <li class="mui-table-view-cell " value="1">通过域名查询</li>
                        <li class="mui-table-view-cell " value="2">通过网站首页查询</li>
                        <li class="mui-table-view-cell " value="3">通过许可证号查询查询</li>
                        <li class="mui-table-view-cell " value="5">通过主办单位名称查询</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="layui-form-item" style="margin-left: 10px;margin-right: 10px">
            关键字
        </div>
        <div class="layui-form-item" style="margin-left: 10px;margin-right: 10px">
            <input type="text" id="jh_keyword" name="keyword" placeholder="输入关键字精确查询" style="border: 0px"/>
        </div>
        <div class="" style="background-color: solid #EBF0F5;width:80%;margin: auto">
            <button name="jhSubmit" id="jh_Submit" type="submit" class="layui-btn layui-btn-normal layui-btn-radius"
                    style="margin-top: 10px;width: 100%">提交
            </button>
            <div style="height: 20px">

            </div>
            <div style="color: #b6b6b6;font-size: 13px">查询条件提示：<br>
                通过网站名称查询，如：聚合数据平台<br>
                通过域名查询，如:juhe.cn2通过网站首页查询，如www.juhe.cn3<br>
                通过许可证号查询查询，如：苏ICP备14006450号-35<br>
                通过主办单位名称查询，如：苏州新科兰德科技有限公司
            </div>
        </div>
    </form>
</div>
<div style="font-size: 13px;margin-left: 10px;margin-right: 10px;position:absolute;top:95%;color: #b6b6b6;text-align: center;width: 90%">
    数据来源【聚合数据】
</div>
</body>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });
    // mui('body').on('tap', 'a', function () {
    //     window.top.location.href = this.href;
    // });
    //显示查询返回信息
    var message = "${(msg)!}";
    if (message!=undefined&&message!=null&&message!="") {
        mui.toast(message, {duration: '3500ms', type: 'div'});
    }
    //聚合备案接口查询表单校验
    function jh_validate() {
        var jh_keyword = $("#jh_keyword").val();

        if (jh_keyword == "") {
            mui.toast('查询关键字不能为空', {duration: '3500ms', type: 'div'})
            return false;
        }
        return true;
    }

    //类型下拉框点选事件
    mui('.typeSelect').on('tap', 'li', function () {
        var type=$(this).attr("value");
        var type_text=$(this).text();
        $("#jh_type").val(type);
        $("#jh_type_select").removeClass("mui-active");
        $("#jh_type_select_info").text(type_text);
    });
</script>
</html>