<#include "../../../common/base.ftl">
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
    <form action="${ctx}/qingxiuh5/qcc/judicialDoc/doQuery" method="post" onsubmit="return jh_validate()">
        <div class="layui-form-item" style="margin-left: 10px;margin-right: 10px;margin-top: 10px">
            公司名称
        </div>
        <div class="layui-form-item" style="margin-left: 10px;margin-right: 10px">
            <input type="text" id="judicialDoc_keyword" name="keyword" placeholder="输入公司名称、注册号查询" style="border: 0px"/>
        </div>
        <div class="" style="background-color: solid #EBF0F5;width:80%;margin: auto">
            <button name="judicialDoc_Submit" id="judicialDoc_Submit" type="submit" class="layui-btn layui-btn-normal layui-btn-radius"
                    style="margin-top: 10px;width: 100%">提交
            </button>
            <div style="height: 10px">

            </div>
            <div style="color: #b6b6b6;font-size: 13px">查询条件提示：<br>
                查询关键字（公司名称、注册号）
                例如：瑞幸咖啡(北京)有限公司
            </div>
        </div>
    </form>
</div>
<div style="font-size: 13px;margin-left: 10px;margin-right: 10px;position:absolute;top:95%;color: #b6b6b6;text-align: center;width: 90%">
    数据来源【企查查-接口平台】
</div>
</body>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'
    });
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });

    //接口查询表单校验
    function jh_validate() {
        var judicialDoc_keyword = $("#judicialDoc_keyword").val();

        if (judicialDoc_keyword == "") {
            mui.toast('查询公司名称不能为空', {duration: '3500ms', type: 'div'})
            return false;
        }
        return true;
    }

    //显示查询返回信息
    var message = "${(msg)!}";
    if (message!=undefined&&message!=null&&message!="") {
        mui.toast(message, {duration: '3500ms', type: 'div'});
    }
</script>
</html>