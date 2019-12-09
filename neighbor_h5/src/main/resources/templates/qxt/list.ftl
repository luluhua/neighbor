<#include "../common/base.ftl">
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
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=GMGAvOCI4vHHUdYINMC54wp9"></script>
    <script src="${ctx}/base/js/baidui-search.js"></script>
    <script type="text/javascript" charset="utf-8">
        mui.init();
        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
            mui.previewImage();
        }


    </script>
    <link href="${ctx}/base/layui_new/css/layui.css" rel="stylesheet"/>
    <script src="${ctx}/base/layui_new/layui.js"></script>

    <link href="${ctx}/qxt/css/my.previewimage.css" rel="stylesheet"/>
    <script src="${ctx}/base/js/mui.previewimage.js"></script>
    <script src="${ctx}/base/js/mui.zoom.js"></script>
</head>
<body>

<!-- 主界面菜单同时移动 -->
<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll" id="boodylie">
                <div class="box">

                    <form class="form-horizontal" id="form-recird" action="${ctx}/qxt/doAdd"
                          method="post">
                        <div style="border-top: 10px solid #EBF0F5;">
                            <div class="fuser" style="margin-top: 10px;margin-bottom: 10px" id="photogr">
                                <span style="margin-left: 10px">拍照上传</span>
                                <button type="button" class="layui-btn mui-icon mui-icon-camera" id="test1"></button>
                            </div>
                            <input name="cFiles" id="cFiles" type="hidden" value=""/>
                            <div class="report_info_img" id="dawd" style="display: none">
                                <div class="report_info_img_contet" id="imglie">

                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-form-item" style="margin-top: 10px;margin-left: 10px;"
                                     id="qxt_pic_info">
                                </div>
                            </div>
                        </div>
                        <div class="layui-row" style="border-top: 10px solid #EBF0F5;">
                            <div class="layui-form-item" style="margin-top: 10px;margin-left: 10px;" id="qxt_type">
                                <span>类型选择</span>

                                <input type="hidden" name="cTitle" id="cTitle">
                                <input type="hidden" name="cDeptId" id="cDeptId">
                                <input type="hidden" name="cCaseTypeId" id="cCaseTypeId">
                                <input type="hidden" name="casename" id="cCasename">
                            </div>
                            <div class="layui-form-item typeseur" id="casetype_div" style="margin-left: 10px;">
                            <#if volist??>
                                <#list volist as list>
                                    <button  qxtcode="${(list.value)}" qxtname="${(list.label)}" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"
                                             class="layui-btn layui-btn-primary layui-btn"
                                    >${(list.label)}
                                    </button>
                                </#list>
                            </#if>
                            </div>

                            <div class="layui-form-item" style="margin-top: 10px;margin-left: 10px;" id="qxt_type">
                                <span>案发区域选择</span>
                                <input type="hidden" name="areaType" id="areaType">
                            </div>
                            <div class="layui-form-item typeseur1" id="area_type" style="margin-left: 10px;">
                                <#--<button  qxtcode="0" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"-->
                                         <#--class="layui-btn layui-btn-primary layui-btn"-->
                                <#-->未知-->
                                <#--</button>-->
                                <button  qxtcode="1" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"
                                         class="layui-btn layui-btn-primary layui-btn"
                                >主干道
                                </button>
                                <button  qxtcode="2" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"
                                         class="layui-btn layui-btn-primary layui-btn"
                                >次干道
                                </button>
                                <button  qxtcode="3" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"
                                         class="layui-btn layui-btn-primary layui-btn"
                                >背街小巷
                                </button>
                                <button  qxtcode="4" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"
                                         class="layui-btn layui-btn-primary layui-btn"
                                >居住小区
                                </button>
                                <button  qxtcode="5" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"
                                         class="layui-btn layui-btn-primary layui-btn"
                                >城中村
                                </button>
                                <button  qxtcode="6" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"
                                         class="layui-btn layui-btn-primary layui-btn"
                                >建筑工地
                                </button>
                                <button  qxtcode="7" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"
                                         class="layui-btn layui-btn-primary layui-btn"
                                >农贸市场
                                </button>
                                <button  qxtcode="8" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"
                                         class="layui-btn layui-btn-primary layui-btn"
                                >广场公园
                                </button>
                                <button  qxtcode="9" style="margin-top: 5px;margin-left: 0px;margin-right: 5px"
                                         class="layui-btn layui-btn-primary layui-btn"
                                >公园广场绿地
                                </button>
                            </div>

                            <div class="layui-row" style="border-top: 10px solid #EBF0F5;padding: 10px">
                                <div class="layui-col-xs1" style="width: 12%;float: left;">
                                    地址
                                </div>
                                <input type="hidden" name="lat" id="lat">
                                <input type="hidden" name="lng" id="lng">
                                <input type="hidden" name="cStreet" id="cStreet">
                                <input type="hidden" name="cAddressName" id="cAddressName">
                                <input type="hidden" name="cAddress" id="cAddress">
                                <div class="layui-col-xs10" style="width:76%" id="dingwei"></div>
                                <div class="layui-col-xs1 mui-icon mui-icon-location"
                                     style="width: 6%;float: right"></div>
                            </div>

                            <div class="layui-row" style="border-top: 10px solid #EBF0F5;padding: 10px">
                                <div class="layui-form-item" style="margin-top: 10px;">
                                    <span>事件描述（选填）</span>
                                </div>
                                <div class="layui-form-item" style="margin-top: 10px;">
                                    <textarea name="cExplain" placeholder="请输入详细描述，300个字以内"
                                              class="layui-textarea" cursor-spacing="15"></textarea>
                                </div>
                            </div>

                            <div class="layui-row"
                                 style="background-color: #EBF0F5;margin-right: -10px;margin-left: -10px">
                                <div class="layui-col-xs4" style="background-color: solid #EBF0F5">
                                    &nbsp;
                                </div>
                                <div class="" style="background-color: solid #EBF0F5;width:80%;margin: auto">
                                    <button type="button" id="qxt_submit"
                                            class="layui-btn layui-btn-normal layui-btn-radius"
                                            style="margin-top: 10px;width: 100%">提交
                                    </button>
                                    <div style="height: 100px">

                                    </div>
                                </div>
                                <div class="layui-col-xs4" style="background-color: solid #EBF0F5">
                                    &nbsp;
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${ctx}/base/js/nativeWeb.js?v=101"></script>
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
        showPosition(lng, lat);
    }

    var options = {
        onSearchComplete: function(results){
            // 判断状态是否正确
            if (local.getStatus() == BMAP_STATUS_SUCCESS){
                $("#cAddress").val(results.getPoi(0).address);
                $("#cAddressName").val(results.getPoi(0).title);
            }
        }
    };
    var local = new BMap.LocalSearch(map, options);

    function showPosition(lng, lat) {
        if (lng == "" || lat == "") {
            return;
        }
        var point = new BMap.Point(lng, lat);
        var gc = new BMap.Geocoder();
        $("#lng").val(lng)
        $("#lat").val(lat)
        gc.getLocation(point, function (rs) {
            var addComp = rs.addressComponents;
            var mapAddress = addComp.province + addComp.city + addComp.district
                    + addComp.street + addComp.streetNumber;
            $("#dingwei").html(mapAddress);
            $("#cStreet").val(addComp.street);
            local.search(mapAddress);
        });
    }


    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });
    mui('.typeseur').on('tap', 'button', function () {
        $("#casetype_div").find("button").each(function(){
            $(this).removeClass("xuanzhong");
        });
        $(this).addClass("xuanzhong");
        // var cDeptId = $(this).attr('deptId');
        var cCaseTypeId = $(this).attr('qxtcode');
        var cCasename = $(this).attr('qxtname');
        $("#cDeptId").val(null);
        $("#cCaseTypeId").val(cCaseTypeId);
        $("#cCasename").val(cCasename);
        $("#cTitle").val($(this).text().replace(/[\r\n]/g,""));

    });

    //获取选取的案发区域
    mui('.typeseur1').on('tap', 'button', function () {
        $("#area_type").find("button").each(function(){
            $(this).removeClass("xuanzhong");
        });
        $(this).addClass("xuanzhong");
        // var cDeptId = $(this).attr('deptId');
        var areaType = $(this).attr('qxtcode');
        $("#areaType").val(areaType);
    });

    //长按删除
    mui(".report_info_img_contet").on('longtap','img', function(e) {
        var imageInfo=e.target;
        mui.confirm('是否删除图片','',['否','是'],function(e){
            if(e.index==1){
                var fileinfos = $("#cFiles").val();
                if (fileinfos.indexOf(",")>=0) {
                    var arr=[];
                    var newArr=[];
                    var newFileInfo="";
                    arr=fileinfos.split(",");
                    for(var i=0;i<arr.length;i++){
                        if(imageInfo.src.indexOf(arr[i])<0){
                            newArr.push(arr[i]);
                        }
                    }
                    if(newArr.length>0){
                        if(newArr.length==1){
                            newFileInfo=newArr[0];
                        }else{
                            newFileInfo=newArr.join(",");
                        }
                    }
                    $("#cFiles").val(newFileInfo);
                } else {
                    $("#cFiles").val("");
                }
                imageInfo.remove();
            }
        });
    });

    //上传文件
    layui.use('upload', function () {
        var upload = layui.upload;    //apkUpload
        //apk文件上传
        var uploadInst = upload.render({
            elem: '#test1',
            url: '${ctx}/common/file/upload',
            auto: true,
            // bindAction: '#daw',
            accept: 'file',
            size: 10240,
            multiple: false,
            // number: 3,
            data: {
                "groupId": 2,
                "saveTypeId": 1,
            },
            before: function (obj) {
                layer.load(3);
            },
            done: function (res) {
                if (res.status == "success") {
                    layer.load(3, {time: 1});
                    $("#dawd").css({'display': 'block'})
                    $("#imglie").append('<img class="uploadpic" data-preview-src="" data-preview-group="1" src="' + res.wholeUrl + '">');
                    var a = $("#cFiles").val();
                    if (a == "") {
                        $("#cFiles").val(res.wholeUrl);
                    } else {
                        $("#cFiles").val(a + "," + res.wholeUrl);
                    }
                }
            },
        });
    });

    //提交前需要验证照片是否已经选取，案件类型是否已经选取；如果两个关键属性有一个未选，上报案件接口将报错
    mui('#form-recird').on('tap', '#qxt_submit', function () {
        var cFiles=$("#cFiles").val();
        var cCaseTypeId=$("#cCaseTypeId").val();
        if(cFiles==""){
            layer.msg("请先选取照片信息！");
            return false;
        }
        if(cCaseTypeId==""){
            layer.msg("请先选取案件类型！");
            return false;
        }
        $("#form-recird").submit();
    });

</script>
</html>