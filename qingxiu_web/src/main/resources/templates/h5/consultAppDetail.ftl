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
    <div id="consultDetailApp">
        <div class='row'>
            <div class='' style='background-color: #ffffff'>
                <!-- 块状 -->
                <div class='box'
                     style='padding: 0px;background-color: #ffffff;box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);border-color: #ffffff'>
                    <div class='box-body table-responsive no-padding ' style='border-color: #ffffff'>
                        <div class='layui-row'
                             style='background-color: #ffffff;margin-bottom: 15px;margin-top: 10px;margin-left: 10px;margin-right:10px;margin-bottom: 10px;box-shadow: 0px 20px 62px 0px #dfe8f4;border-radius: 6px;'>
                            <div style='padding: 10px;'>
                                <lable style='margin-left: 10px;width:300px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;'>
                                    &nbsp;&nbsp;<span style="font-size: 25px"><b>${(consult.title)!}</b></span></lable>
                                <div style='margin-left: 10px;margin-top: 10px;'>
                                    &nbsp;&nbsp;<span
                                        style="background-color: #c1ebff;padding: 5px">${(consult.themeName)!}</span>
                                </div>
                                <div style='margin-left: 10px;margin-top: 10px;'>
                                    &nbsp;&nbsp;时间：${(consult.dtCreate)!}
                                </div>
                                <div style='margin-top: 5px;border-bottom: 1px dashed #E3E3E3;'></div>
                                <div style='margin-left: 10px;margin-top: 10px;'>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    ${(consult.content)!}
                                </div>
                            </div>
                        </div>
                        <div class='layui-row'
                             style='background-color: #ffffff;margin-bottom: 15px;margin-top: 10px;margin-left: 10px;margin-right:10px;margin-bottom: 10px;box-shadow: 0px 20px 62px 0px #dfe8f4;border-radius: 6px;'>
                            <div class="chat" id="chat-box"
                                 style="overflow: auto; width: auto; height: auto;padding-top: 20px">
                                <#list msgList as m>
                                    <#if m.userType==1>
                                        <div class="item">
                                            <div style='margin-bottom: 10px;border-bottom: 1px dashed #E3E3E3;'></div>
                                            <img src='<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(m.avatarUrl)!}'
                                                 class='online' onerror=src="/images/default.png">
                                            <p class="message">
                                                <a href="#" class="name">
                                                    我的回复
                                                </a>
                                                <a href="#" class="name">
                                                    <#if (m.dtCreate)?string("yyyy-MM-dd") == .now?string("yyyy-MM-dd")>
                                                        <small class="text-muted">今天 ${(m.dtCreate?time)}</small>
                                                    <#else>
                                                        <small class="text-muted">${(m.dtCreate?string('yyyy-MM-dd HH:mm:ss'))}
                                                        </small>
                                                    </#if>
                                                </a>
                                            </p>
                                            <div class="attachment" style="margin-left: 50px;background-color: #EFF7FF;">
                                                ${(m.content)!}
                                            </div>
                                        </div>
                                    <#else >
                                        <div class="item">
                                            <div style='margin-bottom: 10px;border-bottom: 1px dashed #E3E3E3;'></div>
                                            <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(m.avatarUrl)!}"
                                                 class="offline" onerror=src="/images/default.png">
                                            <p class="message">
                                                <a href="#" class="name">
                                                    ${(m.userName)!}
                                                </a>
                                                <a href="#" class="name">
                                                <#if (m.dtCreate)?string("yyyy-MM-dd") == .now?string("yyyy-MM-dd")>
                                                        <small class="text-muted">${(m.dtCreate?time)}</small>
                                                <#else>
                                                        <small class="text-muted">${(m.dtCreate?string('yyyy-MM-dd HH:mm:ss'))}
                                                        </small>
                                                </#if>
                                                </a>
                                                ${(m.content)!}
                                            </p>
                                        </div>
                                    </#if>
                                </#list>
                            </div>
                            <div class='mui-content-padded' style="padding-bottom: 10px;">
                                <ul class='mui-pager' style="margin-right: 10px">
                                    <li class='mui-next'><a href='#sendMessageDiv' >回复</a></li>
                                </ul>
                            </div>
                            <div id="sendMessageDiv" class="box mui-popover mui-popover-action mui-popover-bottom no-padding">
                                <div class="mui-input-row no-padding" style="white-space: nowrap;text-align: center;">
                                    <textarea rows="3" style="width: 80%;height: 63px" id="consult_content_app"></textarea>
                                    <button type="button" style="width: 20%;height: 63px"
                                            class="mui-btn mui-btn-primary mui-btn-block" onclick="sendMessage()">发送</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 块状 -->
            </div>
        </div>
    </div>
</div>
<script>
    //发丝消息
    function sendMessage(){
        var consultId="${(consult.id)!}";
        var content=$("#consult_content_app").val();
        if(consultId.length==0){
            mui.toast('咨询标识为空！');
            return false;
        }
        if(content.trim().length==0){
            mui.toast('发送的内容不能为空！');
            return false;
        }
        //调用发送消息接口
        //发送成功后关闭模板
        var message={consultId:consultId,content:content};
        $.ajax("/consultApp/doReply", {
            dataType: 'json',
            type: 'post',
            async: false,
            data:JSON.stringify(message),
            headers: {'Content-Type': 'application/json'},
            success: function (jsondata) {
                location.reload();
            },
            error: function(){
                $("#sendMessageDiv").removeClass("mui-active");
                $(".mui-backdrop").remove();
                mui.toast('发送失败');
            }
        });
    }
</script>
</body>
</html>