<#include "layout_dl.ftl">
<@header>
  <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css"/>
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css"/>

<style>
    html,
    body,
    #container {
        width: 100%;
        height: 100%;
    }

    .btnsubmit {
        position: absolute;
        bottom: 0px;
        right: 10px;
        background: #fff none repeat scroll 0 0;
        border: 1px solid #ccc;
        margin: 10px auto;
        padding: 6px;
        font-size: 14px;
    }

    .inputdiv {
        position: absolute;
        bottom: 0px;
        right: 100px;
        background: #fff none repeat scroll 0 0;
        border: 1px solid #ccc;
        margin: 10px auto;
        padding: 6px;
        font-size: 14px;
    }
</style>
</@header>
<@js>
</@js>
<@body>
     <div id="container"></div>
<div id="myPageTop" style="position: absolute;top: 5px;left: 10px;width: 180px">
    <table>
        <tr>
            <td>
                <label>请输入关键字(地址)：</label>
            </td>
        </tr>
        <tr>
            <td>
                <input id="tipinput" autocomplete="off"/>
            </td>
        </tr>
    </table>
</div>
     <div class="inputdiv">
         <input id="lat" value="">
         <input id="lng" value="">
         <input id="address" value="">
     </div>
 <button type="button" onclick="toSubmit();" class="btn btn-success btnsubmit"><i class="fa fa-save"></i>确认选择</button>

</@body>
<@footer>
<!-- 高德地图 -->
<script type="text/javascript"
        src="https://webapi.amap.com/maps?v=1.4.14&key=7eff452849b27f57131cb249d1f0e3c1&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder"></script>
<!-- 点击地图获取坐标-->
<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<!--搜索 下拉提示-->
<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
<!--坐标解析地址-->
<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script>
    //初始化地图对象，加载地图
    var geocoder, marker, map;

    function child(obj) {
        if (obj != '' && obj != ',') {
            var lnglat = obj.split(",");
            if (lnglat.length > 0 && lnglat != '' && lnglat != ',') {
                addMarker(lnglat[0], lnglat[1]);
                $("#lng").val(lnglat[0]);
                $("#lat").val(lnglat[1]);
            }
        }
    }

    geocoder, marker, map = new AMap.Map("container", {
        zoom: 15,
        resizeEnable: true
    });
    //坐标解析地址
    if (!geocoder) {
        geocoder = new AMap.Geocoder({
            map: map
        });
    }
    //输入提示
    var autoOptions = {
        input: "tipinput"
    };
    var auto = new AMap.Autocomplete(autoOptions);
    var placeSearch = new AMap.PlaceSearch({
        map: map
    });
    //构造地点查询类
    AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
    function select(e) {
        console.log(e);
        placeSearch.setCity(e.poi.adcode);
        placeSearch.search(e.poi.name);  //关键字查询查询
        $("#lng").val(e.poi.location.lng);
        $("#lat").val(e.poi.location.lat);
        addMarker(e.poi.location.lng, e.poi.location.lat);
    }

    //添加点击地图获取坐标事件
    map.on('click', showInfoClick);

    function showInfoClick(e) {
        console.log(e);
        $("#lng").val(e.lnglat.getLng());
        $("#lat").val(e.lnglat.getLat());
        addMarker(e.lnglat.getLng(), e.lnglat.getLat());

    }

    // 实例化点标记
    function addMarker(lng, lat) {

        clearMarker();
        marker = new AMap.Marker({
            icon: "//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-default.png",
            position: [lng, lat],
            offset: new AMap.Pixel(-13, -30)
        });
        marker.setMap(map);
        //坐标转换地址
        regeoCode(lng, lat);
        //
        map.setCenter([lng, lat]);
    }

    // 清除 marker
    function clearMarker() {
        if (marker) {
            marker.setMap(null);
            marker = null;
        }
    }

    //坐标转换地址
    function regeoCode(lng, lat) {
        var latlng = lng + "," + lat;
        geocoder.getAddress(latlng, function (status, result) {
            if (status === 'complete' && result.regeocode) {
                console.log(result);
                var city = result.regeocode.addressComponent.city;
                var district = result.regeocode.addressComponent.district;
                var street = result.regeocode.addressComponent.street;
                var streetNumber = result.regeocode.addressComponent.streetNumber;
                var neighborhood = result.regeocode.addressComponent.neighborhood;
                var address = city + district + street + streetNumber + neighborhood;
                console.log(address);
                $('#address').val(address);
            } else {
                log.error('根据经纬度查询地址失败')
            }
        });
    }

    //保存
    function toSubmit() {
        var index = parent.layer.getFrameIndex(window.name);
        parent.$("#lngId").val($("#lng").val());
        parent.$("#latId").val($("#lat").val());
        parent.$("#location").val($("#address").val());
        parent.layer.close(index);

    }


</script>
</@footer>
