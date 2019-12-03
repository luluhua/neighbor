<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>消息</title>
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
<div class='box-body table-responsive no-padding mui-control-content mui-active' style='border-color: #ffffff' id='mineMessage'>
</div>
</body>
<script>
    var messageBtnArray = ['确认', '取消'];
    //页面初始
    initMessage();
    //查询消息
    function initMessage(){
        $("#mineMessage").empty();
        var item2Url="/h5App/messageLoad";
        $.ajax(item2Url, {
            dataType: 'json',
            type: 'get',
            async: false,
            headers: {'Content-Type': 'application/json'},
            success: function (jsondata) {
                if(jsondata!=null&&jsondata.data!=null&&jsondata.data.length>0){
                    var dataVS="<div class='row'>";
                    dataVS+="<div class='col-xs-12' style='background-color: #ffffff'>";
                    dataVS+="<div class='box' style='padding: 0px;background-color: #ffffff;box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);border-color: #ffffff'>";
                    dataVS+="<div class='box-body table-responsive no-padding mui-control-content mui-active' style='border-color: #ffffff'>";
                    for(var i=0;i<jsondata.data.length;i++){
                        var realData=jsondata.data[i];
                        console.log(realData);
                        dataVS+="<div class='layui-row taskview2' taskinfo='"+realData.recordId+"' style='background-color: #ffffff;margin-bottom: 15px;margin-top: 10px;margin-left: 0px;margin-right:0px;margin-bottom: 10px;box-shadow: 0px 20px 62px 0px #dfe8f4;border-radius: 6px;'>";
                        dataVS+="<li class='mui-table-view-cell'>";
                        dataVS+="<div class='mui-slider-right mui-disabled'>";
                        dataVS+="<a class='mui-btn mui-btn-red' messageid='"+realData.msgid+"'>删除</a>";
                        dataVS+="</div>";
                        dataVS+="<div class='mui-slider-handle'>";
                        dataVS+="";
                        dataVS+="";
                        dataVS+="<div style='padding: 10px;'>";
                        dataVS+="<span class='mui-icon mine-icon icon-yuan' style='color:#fa4b4b;width: 10px'></span>&nbsp;&nbsp;<lable style='font-size: 15px'>您有一个新的待审批事项，请及时处理！</lable>";
                        dataVS+="</div>";
                        // dataVS+="<div style='margin-left: 20px'>";
                        // dataVS+=((realData.msgContent==null||realData.msgContent=='null')?'--':realData.msgContent);
                        // dataVS+="</div>";
                        // dataVS+="<div style='margin-left: 20px;height: 35px'>";
                        // dataVS+="申请人："+realData.sender;
                        // dataVS+="</div>";
                        // dataVS+="<div style='margin-left: 10px;height: 35px'>";
                        // dataVS+="<span class='mui-icon mine-icon icon-time'></span>&nbsp;&nbsp;时&nbsp;&nbsp;&nbsp;间："+realData.dtCreate;
                        // dataVS+="</div>";
                        dataVS+="</div>";
                        dataVS+="</div>";
                        dataVS+="</li>";
                        dataVS+="";
                        dataVS+="";
                        dataVS+="";
                        dataVS+="";
                        dataVS+="";
                    }
                    dataVS+="</div>";
                    dataVS+="</div>";
                    dataVS+="</div>";
                    dataVS+="</div>";
                    $("#mineMessage").append(dataVS);

                    //页面侦听列表点击事件
                    $("#mineMessage").find('.taskview2').unbind().bind('click', function(e) {
                        var taskInfo=this.getAttribute('taskinfo');
                        if(taskInfo!=''&&taskInfo!=undefined){
                            var taskinfoUrl = "/h5Record/detail/"+this.getAttribute('taskinfo').replace("'","");
                            var webview = mui.openWindow({
                                url:taskinfoUrl
                            });
                        }else{
                            console.log("没有任务信息");
                        }
                    });
                } else {
                    var empty="<div class='ui-flex justify-center center' style='background-color: #ebf0f5;width: 100%; height: 100%;'>";
                    empty+="<div class='cell'>";
                    empty+="<img alt='' src='/images/h5/empty.png' style='width: 200px;height: 200px'/>";
                    empty+="</div></div>";
                    $("#mineMessage").append(empty);
                }
            }
        });
    }

    //删除事件
    $('#mineMessage').on('tap', '.mui-btn', function(event) {
        var elem = this;
        var messid=$(this).attr("messageid");
        var messageData={messageId:messid};
        var li = elem.parentNode.parentNode;
        mui.confirm('确认删除该条记录？', '提示', messageBtnArray, function(e) {
            if (e.index == 0) {
                $.ajax("/h5App/messageDelete", {
                    data:messageData,
                    dataType: 'json',
                    type: 'get',
                    async: false,
                    headers: {'Content-Type': 'application/json'},
                    success: function (jsondata) {
                        console.log(jsondata);
                        if(jsondata.code==200){
                            li.parentNode.removeChild(li);
                            initMessage();
                        }else{
                            console.log(jsondata.msg);
                        }
                    }
                });
            } else {
                setTimeout(function() {
                    $.swipeoutClose(elem);
                }, 0);
            }
        });
    });
</script>
</html>