<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>咨询</title>
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
<div class='box-body table-responsive no-padding' id="consultTotal" style='border-color: #ffffff'>
    <div style="white-space: nowrap;text-align: center;margin-top: 15px;height: 40px">
        <#--<ul class='mui-pager'><li class='mui-previous'><select><option>aaaa</option></select></li><li class='mui-next'><select><option>bbbb</option></select></li></ul>-->
            <select id="consultStatusAPP" style="width: 35%;background-color: #e3e3e3">
                <option value="">答复状态</option>
                <option value="2">未答复</option>
                <option value="1">已答复</option>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <select id="consultTitleAPP" style="width: 35%;background-color: #e3e3e3">
                <option value="">主题</option>
            </select>
    </div>
    <div id="consultApp">

    </div>
</div>
</body>
<script>
    var pageNumber = 1;
    var pageTotal=0;

    //加载咨询
    consultLoad(pageNumber,"","");

    $("#consultStatusAPP").unbind().bind().on("change",function(){
        consultLoad(pageNumber,this.value,"");
    });

    //咨询数据加载
    function consultLoad(num,consultStatus,consultTitle) {
        $("#consultApp").empty();
        var url = "/consultApp/consultLoad?pageNumber=" + num+"&consultStatus="+consultStatus+"&consultTitle="+consultTitle;
        $.ajax(url, {
            dataType: 'json',
            type: 'get',
            async: false,
            headers: {'Content-Type': 'application/json'},
            success: function (jsondata) {
                console.log(jsondata);
                if (jsondata != null && jsondata.data!=null && jsondata.data.dataList != null && jsondata.data.dataList.length > 0) {
                    pageTotal=jsondata.data.total;
                    var dataVS = "<div class='row'>";
                    dataVS += "<div class='' style='background-color: #ffffff'>";
                    dataVS += "<div class='box' style='padding: 10px;background-color: #ffffff;box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);border-color: #ffffff'>";
                    dataVS += "<div class='box-body table-responsive no-padding ' style='border-color: #ffffff'>";
                    for (var i = 0; i < jsondata.data.dataList.length; i++) {
                        var realData = jsondata.data.dataList[i];
                        dataVS += " <div class='layui-row' ";
                        dataVS += " style='background-color: #ffffff;margin-bottom: 15px;margin-top: 10px;margin-left: 10px;margin-right:10px;margin-bottom: 10px;box-shadow: 0px 20px ";
                        dataVS += " 62px 0px #dfe8f4;border-radius: 6px;'> ";
                        dataVS += " <div style='padding: 10px;'> ";
                        dataVS += " <span class='mui-icon mine-icon icon-anjianfengexian' ";
                        dataVS += " style='color: #0C70C4;width: 10px;'></span>&nbsp;&nbsp; ";
                        dataVS += " <lable style='width:300px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'><b>"+realData.title+"</b></lable>";
                        dataVS += " <div style='margin-top: 10px;border-bottom: 1px dashed #E3E3E3;'></div> ";
                        dataVS += " <div style='margin-left: 10px;margin-top: 10px;'> ";
                        dataVS += " &nbsp;&nbsp;时间："+realData.dtCreate;
                        dataVS += " </div> ";
                        dataVS += " <div style='margin-left: 10px;margin-top: 10px;width:350px;white-space:nowrap;" +
                                "text-overflow:ellipsis;overflow:hidden;'> ";
                        dataVS += " &nbsp;&nbsp;主题："+realData.themeName;
                        dataVS += " </div> ";
                        dataVS += " <div style='margin-left: 10px;margin-top: 10px;width:350px;white-space:nowrap;" +
                                "text-overflow:ellipsis;overflow:hidden;'> ";
                        dataVS += " &nbsp;&nbsp;内容："+realData.content;
                        dataVS += " </div> ";
                        dataVS += " <div style='margin-left: 50px;margin-top: 10px;'> ";
                        dataVS += " <div class='mui-content-padded'> ";
                        dataVS += " <ul class='mui-pager'> ";
                        dataVS += " <li class='mui-previous consultRespond' consultId='"+realData.id+"'><a href='#'>回复</a></li> ";
                        dataVS += " <li class='mui-next'><a href='#' style='background-color: #e3e3e3;padding: 5px'> ";
                        if(realData.consultStatus==0||realData.consultStatus==2){
                            dataVS += " <label style='color: #007DDB'>未回复</label></a></li> ";
                        }else{
                            dataVS += " <label>已回复</label></a></li> ";
                        }
                        dataVS += " </ul> ";
                        dataVS += " </div> ";
                        dataVS += " </div> ";
                        dataVS += " </div> ";
                        dataVS += " </div> ";
                    }
                    dataVS += "<div class='mui-content-padded'><ul class='mui-pager'><li class='mui-previous' id='item_before'><a href='#' >上一页</a></li><li class='mui-next' id='item_after'><a href='#' >下一页</a></li></ul></div>";
                    dataVS += "</div>";
                    dataVS += "</div>";
                    dataVS += "</div>";
                    dataVS += "</div>";
                    $("#consultApp").append(dataVS);
                    //回复点击事件
                    $("#consultApp").find('.consultRespond').unbind().bind('click', function(e) {
                        var consultId=this.getAttribute('consultId');
                        var consultDetailUrl = "/consultApp/gotoConsultAppDetail/"+consultId;
                        var webview = mui.openWindow({
                            url:consultDetailUrl
                        });
                    });
                    //翻页点击事件
                    //上一页
                    $("#item_before").unbind().bind('tap', function(e) {
                        if(pageNumber>1){
                            pageNumber--;
                        }
                        consultLoad(pageNumber,this.value,"");
                    });
                    //下一页
                    $("#item_after").unbind().bind('tap', function(e) {
                        if((pageTotal-(pageNumber*15))-15>0){
                            pageNumber++;
                        }
                        consultLoad(pageNumber,this.value,"");
                    });
                    if(pageNumber<=1){
                        $("#item_before").addClass("mui-disabled");
                        pageNumber=1;
                    }else{
                        $("#item_before").removeClass("mui-disabled");
                    }
                    if((pageTotal-(pageNumber*15))-15>0){
                        $("#item_after").removeClass("mui-disabled");
                    }else{
                        $("#item_after").addClass("mui-disabled");
                    }
                } else {
                    $("#consultTotal").empty();
                    var empty = "<div class='ui-flex justify-center center' style='background-color: #ebf0f5;width: 100%; height: 100%;'>";
                    empty += "<div class='cell'>";
                    empty += "<img alt='' src='/images/h5/empty.png' style='width: 200px;height: 200px'/>";
                    empty += "</div></div>";
                    $("#consultTotal").append(empty);
                }
            }
        });
    }
</script>
</html>