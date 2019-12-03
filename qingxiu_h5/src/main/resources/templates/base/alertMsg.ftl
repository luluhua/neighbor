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
    <link href="${ctx}/gywm/css/introduce.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.min.js"></script>
    <script src="${ctx}/base/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
        }


    </script>
    <style>

        .text-indent-15{text-indent:15px;}
        .color000{
            color: #000;
        }
        .margin-bottom-0{
            margin-bottom: 0px;
        }
        .padding-top-10{padding-top: 10px;}
        /**line-height: 28px;*/
    </style>
</head>
<body>

<!-- 主页面内容容器 -->
<div class="mui-content">
    <div class="box" style="line-height: 28px; padding:10px;text-align: justify;text-justify:inter-ideograph;">
        <p  style="text-align: center;font-size: 20px;font-weight: bold;color: #000;">南宁市青秀区政务服务中心搬迁公告</p>
        <p class="text-indent-15 color000" style="padding-top: 10px;">为进一步提升政务服务水平，优化政务服务环境，经青秀区人民政府同意，青秀区新政务服务中心将于2019年7月15日正式启用。现将有关事宜公告如下：</p>
        <p class="text-indent-15 color000 margin-bottom-0"><b>一、启用时间</b></p>
        <p class="text-indent-15 color000 margin-bottom-0">新址于2019年7月15日（星期一）起对外办公。</p>
        <p class="text-indent-15 color000 margin-bottom-0 padding-top-10"><b>二、青秀区政务服务中心新址地点及相关事项</b></p>
        <p class="text-indent-15 color000 margin-bottom-0">地址：南宁市青秀区茅桥路18号（南宁市水泥厂安置回建综合住宅楼ABC栋）。</p>
        <p class="text-indent-15 color000 margin-bottom-0">新政务服务中心启用后，原青秀区政务服务中心(悦宾路1号1楼）、青秀区政务服务工商质监分中心（金洲路34号1～2楼）、青秀区民政局婚姻登记处（竹溪大道7号）将整体搬迁至新址，原址一律停止对外服务。青秀区内企业工商登记相关业务集中在新址办理（除个体工商户、农民专业合作社外），各工商所不再办理企业登记业务。</p>
        <p class="text-indent-15 color000 margin-bottom-0 padding-top-10"><b>三、办公时间</b></p>
        <p class="text-indent-15 color000 margin-bottom-0">周一至周五（法定节假日除外）上午9：00-12：00，下午13：30-16：30。</p>
        <p class="text-indent-15 color000 margin-bottom-0 padding-top-10"><b>四、交通指引</b></p>
        <p class="text-indent-15 color000 margin-bottom-0">公交路线：可乘坐20路、52路、76路、85路、601路、604路、607路公交车到东葛茅桥路口A站台下车，沿茅桥路往清厢快速路方向前行500米左拐50米到达，距茅桥农贸市场100米。</p>
        <p class="text-indent-15 color000 margin-bottom-0">自驾路线：可选择清厢快速路和东葛路两条线路前往。从清厢快速路茅桥出口往西200米后左拐到达；从建政路进入清厢快速路辅路向东前行1公里到达；从东葛路延长线往东行驶至东葛茅桥路口左拐进入茅桥路后直行500米左拐到达。</p>
        <p>
            <img  id="alertImgId" style="z-index: 999999999;" src="${ctx}/base/images/alert.png" width="100%" />

        </p>
        <p class="text-indent-15 color000 margin-bottom-0 padding-top-10"><b>五、咨询服务电话</b></p>
        <p class="text-indent-15 color000 margin-bottom-0">0771-5826925，0771-5826606，0771-5826707。</p>
        <p class="text-indent-15 color000 margin-bottom-0">如因搬迁和试运行给您带来不便，敬请谅解！</p>
        <div style="text-align: right;padding-right: 10px;margin-top: 10px;">
            <p class="color000">南宁市青秀区人民政府办公室<br/>2019年7月10日</p>
        </div>
    </div>
    <#--<button type="button" id="saveImgeBtn">下载图片到相册</button>-->
    <#--<button type="button" id="sysbtn" style="width: 100px;height: 100px;">扫一扫</button>-->
</div>

<script type="text/javascript">

    $('#alertImgId').click(function () {
        nativeWeb.gotoMap(22.8365998463,108.3634221554,"南宁市青秀区茅桥路18号");
    });
    // $('#saveImgeBtn').click(function () {
    //     nativeWeb.saveImage("https://ssqxapp.qingxiu.gov.cn/2019-05-23/6qjn5idmjlrahnzwwsqv0zxvosrumbp4.png");
    // });
    // $("#sysbtn").click(function () {
    //     nativeWeb.scanQRCode("onScanQRCode");
    // })
</script>

</body>
</html>