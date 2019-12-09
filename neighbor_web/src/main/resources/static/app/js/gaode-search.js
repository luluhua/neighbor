// //地图加载
// var map = new AMap.Map("container", {
//     resizeEnable: true
// });
// //输入提示
// var autoOptions = {
//     input: "address"
// };
// var auto = new AMap.Autocomplete(autoOptions);
// var placeSearch = new AMap.PlaceSearch({
//     map: map
// });  //构造地点查询类
// AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
// function select(e) {
//     console.log(e);
//     if (e.poi.location!='') {
//         $("#lngId").val(e.poi.location.lng);
//         $("#latId").val(e.poi.location.lat);
//     }else{
//         alert("当前地址无法获取坐标");
//     }
//     placeSearch.setCity(e.poi.adcode);
//     placeSearch.search(e.poi.name);  //关键字查询查询
// }