<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>事项</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="shortcut icon" href="/base/images/iPhone1024@2x.png">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
    <!-- jquery-confirm -->
    <link rel="stylesheet" href="/plugins/jquery-confirm/jquery-confirm.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="/plugins/select2/select2.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker-bs3.css">
    <link rel="stylesheet" href="/plugins/iCheck/all.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/app/css/AdminLTE.css">
    <link rel="stylesheet" href="/app/css/skins/skin-blue.css">
    <!-- kindeditor -->
    <link href="/plugins/kindeditor/themes/default/default.css" rel="stylesheet">
    <!-- tagEditor -->
    <link href="/plugins/tagEditor/jquery.tag-editor.css" rel="stylesheet">

    <!-- mycss -->
    <link href="/app/css/my_base.css" rel="stylesheet">
    <!-- REQUIRED JS SCRIPTS -->
    <!-- jQuery 2.1.4 -->
    <script src="/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="/plugins/bootstrap/js/bootstrap.min.js"></script>

    <!-- date -->
    <script src="/plugins/daterangepicker/moment.min.js"></script>
    <script src="/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- jquery.cookie -->
    <script src="/plugins/jquery.cookie.js"></script>

    <!-- MUI -->
    <link rel="stylesheet" href="/plugins/mui/css/mui.css">
    <script src="/plugins/mui/js/mui.js"></script>
    <link rel="stylesheet" href="/plugins/mui/css/iconfont_mine.css">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <script src="/plugins/layui/layui.js"></script>
    <style>
        .mui-input-group .mui-input-row {
            height: 40px;
        }
        .ui-flex {
            display: -webkit-box !important;
            display: -webkit-flex !important;
            display: -ms-flexbox !important;
            display: flex !important;
            -webkit-flex-wrap: wrap;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap
        }

        .ui-flex, .ui-flex *, .ui-flex :after, .ui-flex :before {
            box-sizing: border-box
        }

        .ui-flex.justify-center {
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -ms-flex-pack: center;
            justify-content: center
        }
        .ui-flex.center {
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -ms-flex-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center
        }
    </style>
</head>


<body style="background-color: #ffffff">
<div class="mui-content" id="taskAppList">
    <div  class="mui-segmented-control mui-segmented-control-inverted" style="box-shadow: 0px 20px 62px 0px #dfe8f4;background-color: #ffffff">
        <a class="mui-control-item mui-active" href="#item1" val="1">
            待审批
        </a>
        <a class="mui-control-item" href="#item2" val="2">
            全部事项
        </a>
        <a class="mui-control-item" href="#item3" val="3">
            领导交办
        </a>
        <a class="mui-control-item" href="#item4" val="4">
            任务指派
        </a>
    </div>
    <div id="item1" class="mui-control-content mui-active">

    </div>
    <div id="item2" class="mui-control-content">
    </div>
    <div id="item3" class="mui-control-content">
        <div class="ui-flex justify-center center" style="background-color: #ebf0f5;width: 100%; height: 100%;">
            <div class="cell">
                <img alt="" src="/images/h5/empty.png" style="width: 200px;height: 200px"/>
            </div>
        </div>
    </div>
    <div id="item4" class="mui-control-content">
        <div class="ui-flex justify-center center" style="background-color: #ebf0f5;width: 100%; height: 100%;">
            <div class="cell">
                <img alt="" src="/images/h5/empty.png" style="width: 200px;height: 200px"/>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    $('#dmsg').html('start1');
    var page_num_1=1;
    var page_num_2=1;
    var page_total_1=0;
    var page_total_2=0;
    var current_1=0;
    var current_2=0;


    // 【事项】内顶部tab页切换侦听事件
    $(".mui-control-item").each(function(i, item){
        item.addEventListener('tap', function () {
            var type = item.getAttribute('val');
            if(type==1){
                queryItem1(page_num_1);
            } else if(type==2){
                queryItem2(page_num_2);
            } else if(type==3){
                //事项数据加载——领导交办
            } else {
                //事项数据加载——任务指派
            }
        });
    });


    //事项数据加载——待审批
    function queryItem1(num){
        $("#item1").empty();
        var item1Url="/h5App/taskMyListApp?pageNumber="+num;
        $.ajax(item1Url, {
            dataType: 'json',
            type: 'get',
            async: false,
            headers: {'Content-Type': 'application/json'},
            success: function (jsondata) {
                //console.log(jsondata);
                if(jsondata!=null&&jsondata.data!=null&&jsondata.data.records!=null&&jsondata.data.records.length>0){
                    page_total_1=jsondata.data.total;
                    current_1=0;
                    var dataVS="<div class='row'>";
                    dataVS+="<div class='' style='background-color: #ffffff'>";
                    dataVS+="<div class='box' style='padding: 0px;background-color: #ffffff;box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);border-color: #ffffff'>";
                    dataVS+="<div class='box-body table-responsive no-padding mui-control-content mui-active' style='border-color: #ffffff'>";
                    for(var i=0;i<jsondata.data.records.length;i++){
                        current_1++;
                        var realData=jsondata.data.records[i];
                        if(realData.processInstanceId=='-1'){
                            dataVS+="<div class='layui-row taskview1' recoreId='"+realData.id+"' taskinfo='' style='background-color: #ffffff;margin-bottom: 15px;margin-top: 10px;margin-left: 10px;margin-right:10px;margin-bottom: 10px;box-shadow: 0px 20px 62px 0px #dfe8f4;border-radius: 6px;'>";
                        }else{
                            dataVS+="<div class='layui-row taskview1' taskinfo='?taskId="+realData.id+"&procInstId="+realData.processInstanceId +"&procDefId="+realData.processDefinitionId+"' style='background-color: #ffffff;margin-bottom: 15px;margin-top: 10px;margin-left: 10px;margin-right:10px;margin-bottom: 10px;box-shadow: 0px 20px 62px 0px #dfe8f4;border-radius: 6px;'>";
                        }
                        dataVS+="<div style='padding: 10px;'>";
                        dataVS+="<span class='mui-icon mine-icon icon-anjianfengexian' style='color: #0C70C4;width: 5px'></span>&nbsp;&nbsp;<lable>"+realData.processName+"</lable>";
                        dataVS+="<div style='margin-top: 5px;border-bottom: 1px dashed #E3E3E3;'></div>";
                        dataVS+="</div>";
                        dataVS+="<div style='margin-left: 10px'>";
                        dataVS+="<span class='mui-icon mine-icon icon-wode'></span>&nbsp;&nbsp;申请人："+((realData.handleUserName==null||realData.handleUserName=='null')?'--':realData.handleUserName);
                        dataVS+="</div>";
                        dataVS+="<div style='margin-left: 10px;height: 35px'>";
                        dataVS+="<span class='mui-icon mine-icon icon-time'></span>&nbsp;&nbsp;时&nbsp;&nbsp;&nbsp;间："+realData.createTime;
                        dataVS+="</div>";
                        dataVS+="</div>";
                    }
                    dataVS+="<div class='mui-content-padded'><ul class='mui-pager'><li class='mui-previous' id='item1_before'><a href='#' >上一页</a></li><li class='mui-next' id='item1_after'><a href='#' >下一页</a></li></ul></div>";
                    dataVS+="</div>";
                    dataVS+="</div>";
                    dataVS+="</div>";
                    dataVS+="</div>";
                    $("#item1").append(dataVS);
                    //页面侦听列表点击事件
                    $("#item1").find('.taskview1').unbind().bind('click', function(e) {
                        var tmpUrl=this.getAttribute('taskinfo');
                        var taskinfoUrl ="";
                        if(tmpUrl==''){
                            var recoreId=this.getAttribute('recoreId');
                            taskinfoUrl = "/h5Record/detail/"+recoreId;
                        }else{
                            taskinfoUrl = "/h5Record/to_approval"+tmpUrl.replace("'","");
                        }
                        var webview = mui.openWindow({
                            url:taskinfoUrl
                        });
                    });
                    //翻页点击事件
                    //上一页
                    $("#item1_before").unbind().bind('tap', function(e) {
                        if(page_num_1>1){
                            page_num_1--;
                        }
                        queryItem1(page_num_1);
                    });
                    //下一页
                    $("#item1_after").unbind().bind('tap', function(e) {
                        if((page_total_1-(page_num_1*15))-15>0){
                            page_num_1++;
                        }
                        queryItem1(page_num_1);
                    });
                    if(page_num_1<=1){
                        $("#item1_before").addClass("mui-disabled");
                        page_num_1=1;
                    }else{
                        $("#item1_before").removeClass("mui-disabled");
                    }
                    if((page_total_1-(page_num_1*15))-15>0){
                        $("#item1_after").removeClass("mui-disabled");
                    }else{
                        $("#item1_after").addClass("mui-disabled");
                    }
                } else {
                    var empty="<div class='ui-flex justify-center center' style='background-color: #ebf0f5;width: 100%; height: 100%;'>";
                    empty+="<div class='cell'>";
                    empty+="<img alt='' src='/images/h5/empty.png' style='width: 200px;height: 200px'/>";
                    empty+="</div></div>";
                    $("#item1").append(empty);
                }
            }
        });
    }

    //事项数据加载——全部事项
    function queryItem2(num){
        $("#item2").empty();
        var item2Url="/h5Record/listApp/"+num;
        $.ajax(item2Url, {
            dataType: 'json',
            type: 'get',
            async: false,
            headers: {'Content-Type': 'application/json'},
            success: function (jsondata) {
                if(jsondata!=null&&jsondata.data.pageData!=null&&jsondata.data.pageData.records!=null&&jsondata.data.pageData.records.length>0){
                    page_total_2=jsondata.data.pageData.total;
                    var dataVS="<div class='row'>";
                    dataVS+="<div class='' style='background-color: #ffffff'>";
                    dataVS+="<div class='box' style='padding: 0px;background-color: #ffffff;box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);border-color: #ffffff'>";
                    dataVS+="<div class='box-body table-responsive no-padding mui-control-content mui-active' style='border-color: #ffffff'>";
                    console.log(jsondata.data.pageData);
                    current_2=0;
                    for(var i=0;i<jsondata.data.pageData.records.length;i++){
                        current_2++;
                        var realData=jsondata.data.pageData.records[i];
                        //console.log(realData);
                        dataVS+="<div class='layui-row taskview2' taskinfo='"+realData.id+"' style='background-color: #ffffff;margin-bottom: 15px;margin-top: 10px;margin-left: 10px;margin-right:10px;margin-bottom: 10px;box-shadow: 0px 20px 62px 0px #dfe8f4;border-radius: 6px;'>";
                        dataVS+="<div style='padding: 10px;'>";
                        dataVS+="<span class='mui-icon mine-icon icon-anjianfengexian' style='color: #0C70C4;width: 5px'></span>&nbsp;&nbsp;<lable>"+realData.projectTitle+"</lable>";
                        dataVS+="<div style='margin-top: 5px;border-bottom: 1px dashed #E3E3E3;'></div>";
                        dataVS+="</div>";
                        dataVS+="<div style='margin-left: 10px'>";
                        dataVS+="<span class='mui-icon mine-icon icon-wode'></span>&nbsp;&nbsp;申请人："+((realData.apuName==null||realData.apuName=='null')?'--':realData.apuName);
                        dataVS+="</div>";
                        dataVS+="<div style='margin-left: 10px;height: 35px'>";
                        dataVS+="<span class='mui-icon mine-icon icon-time'></span>&nbsp;&nbsp;时&nbsp;&nbsp;&nbsp;间："+realData.postDatetime.substr(0,realData.postDatetime.length-2);
                        dataVS+="</div>";
                        dataVS+="</div>";
                    }
                    dataVS+="<div class='mui-content-padded'><ul class='mui-pager'><li class='mui-previous' id='item2_before'><a href='#' >上一页</a></li><li class='mui-next' id='item2_after'><a href='#' >下一页</a></li></ul></div>";
                    dataVS+="</div>";
                    dataVS+="</div>";
                    dataVS+="</div>";
                    dataVS+="</div>";
                    $("#item2").append(dataVS);
                    //页面侦听列表点击事件
                    $("#item2").find('.taskview2').unbind().bind('click', function(e) {
                        var taskinfoUrl = "/h5Record/detail/"+this.getAttribute('taskinfo').replace("'","");
                        var webview = mui.openWindow({
                            url:taskinfoUrl
                        });
                    });
                    //上一页
                    $("#item2_before").unbind().bind('tap', function(e) {
                        if(page_num_2>1){
                            page_num_2--;
                        }
                        queryItem2(page_num_2);
                    });
                    //下一页
                    $("#item2_after").unbind().bind('tap', function(e) {
                        if((page_total_2-(page_num_2*15))-15>0){
                            page_num_2++;
                        }
                        queryItem2(page_num_2);
                    });
                    if(page_num_2<=1){
                        $("#item2_before").addClass("mui-disabled");
                        page_num_2=1;
                    }else{
                        $("#item2_before").removeClass("mui-disabled");
                    }
                    if((page_total_2-(page_num_2*15))-15>0){
                        $("#item2_after").removeClass("mui-disabled");
                    }else{
                        $("#item2_after").addClass("mui-disabled");
                    }
                } else {
                    var empty="<div class='ui-flex justify-center center' style='background-color: #ebf0f5;width: 100%; height: 100%;'>";
                    empty+="<div class='cell'>";
                    empty+="<img alt='' src='/images/h5/empty.png' style='width: 200px;height: 200px'/>";
                    empty+="</div></div>";
                    $("#item2").append(empty);
                }
            }
        });
    }


    //加载页面的时候先做待审核数据的加载
    queryItem1(1);
</script>
</html>
