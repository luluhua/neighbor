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
    <link href="${ctx}/base/css/layui.css" rel="stylesheet" type="text/css" >
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
    <link href="${ctx}/base/layui_new/css/layui.css" rel="stylesheet"/>
    <!-- 百度地图 -->
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=GMGAvOCI4vHHUdYINMC54wp9"></script>
</head>
<body>
<p id="allmap"></p>
</body>
<script type="text/javascript">
    mui.init({
        statusBarBackground: '#f7f7f7',
        gestureConfig: {
            longtap: true, //默认为false
            release: false //默认为false，不监听
        }
    });
    //获取客户端用户定位坐标
    nativeWeb.getCoordinate();

    //客户端回传定位坐标
    function getCoordinateCallback(lng, lat) {
        // var lnglat=lng+"-"+lat;
        // mui.toast(lnglat, {duration: '3500ms', type: 'div'});
        showPosition(lat,lng );
    }

</script>
<script type="text/javascript">
function showPosition(lat,lng) {
    var map = new BMap.Map("allmap");

    var point = new BMap.Point(22.8436080468,108.3699647116);

    map.centerAndZoom(point, 16);

    map.enableScrollWheelZoom();

    var myIcon = new BMap.Icon("myicon.png", new BMap.Size(30, 30), {

        anchor: new BMap.Size(10, 10)

    });

    var marker = new BMap.Marker(point, {icon: myIcon});

    map.addOverlay(marker);

    var geolocation = new BMap.Geolocation();

    geolocation.getCurrentPosition(function (r) {

        if (this.getStatus() == BMAP_STATUS_SUCCESS) {

            var mk = new BMap.Marker(r.point);

            map.addOverlay(mk);

            //map.panTo(r.point);//地图中心点移到当前位置

            // var latCurrent = r.point.lat;
            //
            // var lngCurrent = r.point.lng;

             location.href = "http://api.map.baidu.com/direction?origin=" + lat + "," + lng + "&destination=22.8436080468,108.3699647116&mode=driving&region=南宁&output=html";
            //location.href = "http://api.map.baidu.com/marker?location=" + lat + "," + lng + "&title=我的位置&content=南宁市青秀区茅桥路18号&output=html&src=webapp.baidu.openAPIdemo";
            //location.href = "http://api.map.baidu.com/geocoder?address=南宁市青秀区茅桥路18号&output=html&src=webapp.baidu.openAPIdemo";
        }

        else {

            alert('failed' + this.getStatus());

        }

    }, {enableHighAccuracy: true})

    map.addOverlay(marker);

    var licontent = "<b>南宁市青秀区政务服务中心</b><br>";

    licontent += "<span><strong>地址：</strong>南宁市青秀区茅桥路18号</span><br>";

    licontent += "<span><strong>电话：</strong>0771-5826925 / 0771-5826606 / 0771-5826707</span><br>";

    var opts = {

        width: 200,

        height: 80,

    };

    var infoWindow = new BMap.InfoWindow(licontent, opts);

    marker.openInfoWindow(infoWindow);

    marker.addEventListener('click', function () {

        marker.openInfoWindow(infoWindow);

    });
}
</script>
</html>