// 百度地图API功能
function G(id) {
    return document.getElementById(id);
}

var map = new BMap.Map("mapId");
map.centerAndZoom("南宁市",12);                   // 初始化地图,设置城市和地图级别。

var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
    {"input" : "suggestId"
        ,"location" : map
    });
ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
    var str = "";
    var _value = e.fromitem.value;
    console.log(_value);
    var value = "";
    if (e.fromitem.index > -1) {
        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    }
    str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

    value = "";
    if (e.toitem.index > -1) {
        _value = e.toitem.value;
        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    }
    str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
    G("searchResultPanel").innerHTML = str;
});

var myValue;
ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
    var _value = e.item.value;
    myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
    //解析坐标
    onlatAndLng(myValue);
});

function onlatAndLng(_address){
    // 创建地址解析器实例
    var myGeo = new BMap.Geocoder();
// 将地址解析结果显示在地图上,并调整地图视野
    myGeo.getPoint(_address, function(point){
        if (point) {
            $("#lngId").val(point.lng);
            $("#latId").val(point.lat);
        }else{
            alert("您选择地址没有解析到结果!");
        }
    }, "南宁市");
}

function setInputValue(_address){
    ac.setInputValue(_address);
}
