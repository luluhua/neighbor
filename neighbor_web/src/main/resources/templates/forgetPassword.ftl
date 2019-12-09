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
        background-size: 100% 100%;
    }

    .form-control-feedback {
        top: 8px;
        important !
    }
</style>
<body class="hold-transition login-page">

<div class="login-box">
    <div class="login_divd ">
        <div class="yrise">
            <div class="login-logo">
                <b>忘记密码</b>
            </div>
            <!-- /.login-logo -->
            <form action="/login/forgetPassword" data-validator-option="{theme:'bootstrap', timely:2, theme:'simple_bottom', stopOnError:true}"
                  method="post" class="layui-form layui-form-pane" id="submitForm">
                <div class="login-box-body">
	      <#if error??>
	      	<div class="alert alert-danger alert-dismissible">
                <h4 style="margin-bottom: 0px;"><i class="fa fa-exclamation-triangle"></i> ${error!}</h4>
            </div>

          </#if>
                    <div class="form-group has-feedback mg">
                        <input type="text" class="form-control log_user" name="userName" id="userName" placeholder="用户名"
                               data-rule="用户名:required;" value="">
                        <span class="glyphicon glyphicon-user form-control-feedbacks"></span>
                    </div>
                    <div class="form-group has-feedback mg">
                        <input type="text" class="form-control log_user" maxlength="11" name="mobile" id="mobile" placeholder="手机号码"
                               data-rule="手机号码:required;" value="">
                        <span class="glyphicon glyphicon-phone form-control-feedbacks"></span>
                    </div>
                    <div class="form-group has-feedback mg">
                        <div style="width: 50%; float: left;">
                            <input type="text" class="form-control log_user" maxlength="6" name="verifCode" id="verifCode" placeholder="验证码"
                                   data-rule="验证码:required;数字:length(6);digits" value="">
                            <span class="glyphicon glyphicon-lock form-control-feedbacks"></span>
                        </div>
                        <div style="height: 50px;text-align: -webkit-center;text-align:center">
                        <button type="button" id="verif-code" class="btn btn-info" style="height: 50px; width: 40%;">
                            发送验证码
                        </button>
                        </div>
                    </div>
                    <div class="form-group has-feedback mg">
                        <input type="password" class="form-control log_user" name="password" id="password" placeholder="新密码"
                               data-rule="新密码: required;新密码：pwdRules" value="">
                        <span class="glyphicon glyphicon-lock form-control-feedbacks"></span>
                    </div>
                    <div class="form-group has-feedback mg">
                        <input type="password" class="form-control log_user" name="confirmpassword" id="confirmpassword" placeholder="确认密码"
                               data-rule="确认密码:match(password)" value="">
                        <span class="glyphicon glyphicon-lock form-control-feedbacks"></span>
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
                        <!-- /.col -->
                        <div class="login_submit">
                            <button type="submit" class="">
                                提交
                            </button>
                        </div>
                        <!-- /.col -->
                        <div class="login_jiz" style="text-align: right; margin-top: 25px;">
                            <div class="form-group has-feedback">
                                <a href="/login">去登录</a>
                            </div>
                        </div>
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
    layui.use(['form'], function () {
        var form = layui.form;
        form.render();
    });
    //方法1: 直接生成一个验证码对象
    var captcha1 = new TencentCaptcha('2034271606', function(res) {
        console.log(res);
        /* callback */
        if(res.ret === 0){
            $("#ticket").val(res.ticket);
            $("#rand").val(res.randstr);
            smsutils();
        }
    });

    // 发送短信
    function smsutils(){
        var url = '/login/sendVerifCode';
        var data = {
            mobile :$('#mobile').val(),
            userName:$('#userName').val(),
            ticket:$("#ticket").val(),
            rand: $("#rand").val()
        }
        console.log(data);
        $.ajax({
            type: "post",
            url: url,
            data: data,
            dataType: "json",
            async:false,
            success:function(d) {
                curCount = count;
                $("#verif-code").removeClass('btn-info').addClass("btn-secondary").attr("disabled", "true");
                InterValObj = window.setInterval(SetRemainTimes, 1000);
                console.log(d);
                if(d.code == 200){
                    layer.msg('验证码发送成功', {icon: 1});
                }else{
                    layer.msg(d.msg, {icon: 2});
                }
            }
        });
    }
    //timer处理函数
    var InterValObj; //timer变量，控制时间
    var count = 60; //间隔函数，1秒执行
    var curCount; //当前剩余秒数
    function SetRemainTimes() {
        if(curCount == 0) {
            window.clearInterval(InterValObj); //停止计时器
            $("#verif-code").removeClass('btn-secondary').addClass("btn-info").removeAttr("disabled"); //启用按钮
            $("#verif-code").text("重新发送验证码");
            code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效  
        } else {
            curCount--;
            $("#verif-code").text("请在" + curCount + "秒后输入");
        }
    }


    $('#verif-code').on('click',function(){
        // 必须填写用户名和手机号
        mobile  = $('#mobile').val();
        userName = $('#userName').val();
        if(mobile === '' || userName === ''){
            layer.msg('用户名或手机号不能为空', {icon: 2});
            return;
        }

        captcha1.show();
    });

    //校验密码强度 add zyj 20190619
    function simplPwd(value){
        if(value.length < 7){
            //必须大于6位
            return true;
        }
        if(/^\d{7,}$/.test(value) || /^[a-z]{7,}$/.test(value) || /^[A-Z]{7,}$/.test(value) || /^\W{7,}$/.test(value) ){
            //不能是单纯的一种格式
            return true;
        }
        return false;
    }

    function checkPassWord(value){
        // 0： 表示第一个级别 1：表示第二个级别 2：表示第三个级别
        // 3： 表示第四个级别 4：表示第五个级别
        var modes = 0;
        if(value.length > 6){
            modes = 1;
        }
        if(!simplPwd(value)){//最初级别
            modes = 0;
            if(/[0-9]/.test(value)){//如果用户输入的密码 包含了小写的数字
                modes++;
            }
            if(/[a-z]/.test(value)){//如果用户输入的密码 包含了小写的a到z
                modes++;
            }
            if(/[A-Z]/.test(value)){//如果用户输入的密码 包含了大写的A到Z
                modes++;
            }
            if(/\W/.test(value)){//如果是非数字 字母 下划线
                modes++;
            }
        }
        showStrong(modes)
        return modes;
    }
    // 显示密码强度
    function showStrong(index){
        var spanDoms = $("#tips").find("span");
        for(var i = 0; i <spanDoms.length; i++){
            spanDoms[i].className = "";//清空span标签所有的class样式
            if(modes){//0 代表false 其余代表true
                spanDoms[modes-1].className = "s" + modes ;
            }
        }
    }
</script>
</body>
</html>
