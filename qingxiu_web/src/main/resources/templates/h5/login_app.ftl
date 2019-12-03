<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${(systemName)!'手上青秀'}</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- mycss -->
    <link href="/app/css/my_base.css" rel="stylesheet">

    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <style type="text/css">
        .has-feedback .form-control {
            height: 50px;
        }

        body {
            font-family: "Verdana", "Tahoma", "Lucida Grande", "Microsoft YaHei", "Hiragino Sans GB", sans-serif;
            background-size: 100% 100%;
        }

        .form-control-feedback {
            top: 8px;
            important !
        }
    </style>
</head>
<body class="hold-transition login-page" style="background-color: #ffffff">

<div class="login-box">
    <div class="login_app_divd">
        <div class="yrise">
            <div class="login-logo">
                <b>${(systemName)!'手上青秀'}</b>
            </div>
            <!-- /.login-logo -->
            <form action="/loginApp/doLogin" data-validator-option="{theme:'bootstrap', timely:2, theme:'simple_bottom'}"
                  method="post" class="layui-form layui-form-pane" id="submitForm" onsubmit="return toVaild()">
                <div class="login-box-body">
	      <#if error??>
	      	<div class="alert alert-danger alert-dismissible">
                <h4 style="margin-bottom: 0px;"><i class="fa fa-exclamation-triangle"></i> ${error!}</h4>
            </div>

          </#if>
                    <div class="form-group has-feedback mg">
                        <input type="hidden" name="return_url" value="${return_url!}">
                        <input type="text" class="form-control log_user" name="userName" id="userName" placeholder="用户名"
                               data-rule="用户名:required;" value="">
                        <span class="glyphicon glyphicon-user form-control-feedbacks"></span>
                    </div>
                    <div class="form-group has-feedback mg">
                        <input type="password" class="form-control log_user" name="password" id="password" placeholder="密码"
                               data-rule="密码:required;password;" value="">
                        <span class="glyphicon glyphicon-lock form-control-feedbacks"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="row">
                        <#--<div class="col-lg-7">-->
                        <#--<div class="form-group has-feedback mg">-->
                        <#--<input type="text" class="form-control" value="12345" name="captcha"-->
                        <#--placeholder="验证码"-->
                        <#--data-rule="验证码:required;length(5);" size="5">-->
                        <#--<span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>-->
                        <#--</div>-->
                        <#--</div>-->
                        <#--<div class="col-lg-5">-->
                        <#--<div class="form-group has-feedback">-->
                        <#--<img style="float: right" alt="如果看不清楚，请单击图片刷新！" class="pointer img"-->
                        <#--src="/login/captcha">-->
                        <#--</div>-->
                        <#--</div>-->
                        <#--<a style="display: block; height: 20px;float: right;"-->
                        <#--href="javascript:$('.img').attr('src','/login/captcha');">点击刷新</a>-->
                            <input type="hidden" name="ticket" id="ticket"/>
                            <input type="hidden" name="rand" id="rand"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="checkbox icheck">

                            </div>
                        </div>
                        <#--<div class="login_jiz">-->
                            <#--<div class="form-group has-feedback">-->
                                <#--<input type="checkbox" name="" title="记住用户名密码" lay-skin="primary" checked>-->
                            <#--</div>-->
                        <#--</div>-->
                        <!-- /.col -->
                        <div class="login_submit">
                            <button type="submit" class="">
                                登录
                            </button>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.social-auth-links -->
                </div>
            </form>
            <!-- /.login-box-body -->
        </div>
    </div>
</div>
<!-- REQUIRED JS SCRIPTS -->
<!-- jQuery 2.1.4 -->
<script src="/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="/plugins/iCheck/icheck.min.js"></script>

<script src="/plugins/layui/layui.js"></script>
<!-- nice-validator-1.0.8 -->
<script src="/plugins/nice-validator-1.0.8/jquery.validator.js?local=zh-CN"></script>
<script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
<script>
    //方法1: 直接生成一个验证码对象
    var captcha1 = new TencentCaptcha('2034271606', function(res) {
        console.log(res);
        /* callback */
        if(res.ret === 0){
            $("#ticket").val(res.ticket);
            $("#rand").val(res.randstr);
            $("#submitForm").submit();
        }
    });
    layui.use(['form'], function () {
        var form = layui.form;
        form.render();
    });
    function toVaild() {
        var ticket = $("#ticket").val();
        var name = $("#userName").val();
        var password = $("#password").val();
        if(ticket){
            return true;
        }else if(name&&password){
            captcha1.show();
        }
        return false;
    }
</script>
</body>
</html>
