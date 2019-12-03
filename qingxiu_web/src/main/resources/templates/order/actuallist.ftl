<#include "../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/steps/steps.css">
<link rel="stylesheet" href="/plugins/layui/css/layui.css">
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>物流管理 > 物流实时查询</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/tLogisticsOrderTask/actuallist" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       style="width: 300px;"
                                       placeholder="输入物流订单号">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                                &nbsp;&nbsp;注：顺丰请输入单号:收件人或寄件人手机号后四位。例如：123456789:1234
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>订单编号</th>
                                <th>是否签收</th>
                                <th>物流状态</th>
                                <th>物流公司名称</th>
                                <th>物流公司官网</th>
                                <th>物流客服电话</th>
                                <th>快递员</th>
                                <th>快递员电话</th>
                            </tr>
                            <#if (order??)>
                                <tr>
                                    <td>${order.number!}</td>
                                    <td>
                                        <@dictTag method="dictValueByType" type="logisticsorder_issign" value="${order.issign!}">
                                            <span>${(dictValueByType)!}</span>
                                        </@dictTag>
                                    </td>
                                    <td>
                                        <@dictTag method="dictValueByType" type="logisticsorder_deliverystatus" value="${order.deliverystatus!}">
                                            <span>${(dictValueByType)!}</span>
                                        </@dictTag>
                                    </td>
                                    <td>${order.expName!}</td>
                                    <td>${order.expSite!}</td>
                                    <td>${order.expPhone!}</td>
                                    <td>${order.courier!}</td>
                                    <td>${order.courierPhone!}</td>
                                </tr>
                            </#if>
                        </table>
                        &nbsp;&nbsp;物流信息如下：
                        <div id="actualSteps"></div>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">

                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script src="/plugins/steps/steps.js"></script>
<script src="/plugins/layui/lay/modules/layer.js"></script>
<script>
    var message = "${(msg)!}";
    if (message != undefined && message != null && message != "") {
        console.log("-------ttttt--------");
        layer.msg(message, {icon: 2});
    }
    var actualResult = '${(actualResult!)}';
    if (actualResult != "null" && actualResult.length > 0) {
        var actualJson = JSON.parse(actualResult);
        var listArr = actualJson.result.list;
        var dataArr = [];
        if (listArr.length > 0) {
            for (var i = 0; i < listArr.length; i++) {
                var task;
                if (i == 0) {
                    task = {title: listArr[i].status, description: listArr[i].time, status: 1};
                } else {
                    if (i % 2 == 1) {
                        task = {title: listArr[i].status, description: listArr[i].time, side: "start-single"};
                    } else {
                        task = {title: listArr[i].status, description: listArr[i].time};
                    }
                }
                dataArr.push(task);
            }
        }
        var actualSteps = steps({
            el: "#actualSteps",
            data: dataArr,
            direction: "vertical",
            dataOrder: ["title", "line", "description"],
            dataWidth: ["0 0 900px", "none", "0 0 200px"],
            iconType: "bullets"
        });
    }
</script>
</@footer>