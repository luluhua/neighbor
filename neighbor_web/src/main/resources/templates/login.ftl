<!DOCTYPE html>
<html>
  <#include "common/head.ftl">
<link rel="stylesheet" href="/plugins/layui/css/layui.css">
<style type="text/css">
    .has-feedback .form-control {
        height: 50px;
    }

    body {
        font-family: "Verdana", "Tahoma", "Lucida Grande", "Microsoft YaHei", "Hiragino Sans GB", sans-serif;
        background: url(/images/login_background.png) no-repeat center fixed !important;
        background-repeat: no-repeat;
        background-size: cover !important
    }


</style>
<body class="hold-transition login-page">

<div class="login-box">
    <div class="login_divd ">
        <div class="yrise">
            <div class="login-logo">
                <b>简单生活网管理系统</b>
            </div>
            <!-- /.login-logo -->
            <form action="/login/doLogin" data-validator-option="{theme:'bootstrap', timely:2, theme:'simple_bottom'}"
                  method="post" class="layui-form layui-form-pane" id="submitForm" onsubmit="return toVaild()">
                <div class="login-box-body">
	      <#if error??>
	      	<div class="alert alert-danger alert-dismissible">
                <h4 style="margin-bottom: 0px;"><i class="fa fa-exclamation-triangle"></i> ${error!}</h4>
            </div>

          </#if>
             <#if success??>
	      	<div class="alert alert-success alert-dismissible">
                <h4 style="margin-bottom: 0px;"><i class="fa fa-exclamation-triangle"></i> ${success!}</h4>
            </div>

             </#if>
                    <div class="form-group has-feedback mg">
                        <input type="hidden" name="return_url" value="${return_url!}">
                        <input type="text" class="form-control log_user" name="userName" id="userName" placeholder="用户名"
                               data-rule="用户名:required;" value="">
                    <#--<span class="glyphicon glyphicon-user form-control-feedbacks"></span>-->
                    </div>
                    <div class="form-group has-feedback mg">
                        <input type="password" class="form-control log_user" name="password" id="password"
                               placeholder="密码"
                               data-rule="密码:required;password;" value="">
                    <#--<span class="glyphicon glyphicon-lock form-control-feedbacks"></span>-->
                    </div>
                    <div class="form-group has-feedback">
                        <div class="row">
                            <input type="hidden" name="ticket" id="ticket"/>
                            <input type="hidden" name="rand" id="rand"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-8">
                            <div class="checkbox icheck">

                            </div>
                        </div>
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
<!-- jQuery 1.12.4 -->
<script src="/base/js/jquery-1.12.4.min.js"></script>
<!--jquery 兼容js -->
<script src="/base/js/jquery-migrate-1.4.1.min.js"></script>
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
    var captcha1 = new TencentCaptcha('2034271606', function (res) {
        console.log(res);
        /* callback */
        if (res.ret === 0) {
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
        if (ticket) {
            return true;
        } else if (name && password) {
            captcha1.show();
        }
        return false;
    }

    //在登陆过期后，拦截通过layui的data-url访问的页面加载，阻止弹窗内页面跳转
    $(function () {
        if (top != window) {
            top.location.href = window.location.href;
        }
    })
</script>
</body>
</html>
