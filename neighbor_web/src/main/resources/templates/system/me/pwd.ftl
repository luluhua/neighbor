<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.min.css">
</@header>
<@body>
<style type="text/css">
    input{float: left; font-size: 14px; width: 250px; height: 25px; border: 1px solid #ccc; padding-left: 10px;}
    #tips{float: left; font-size: 12px; width: 400px; height: 25px; margin: 4px 0 0 20px;}
    #tips span{float: left; width: 40px; height: 20px; color: #fff; overflow:hidden; margin-right: 10px; background: #D7D9DD; line-height:20px; text-align: center; }
    #tips .s1{background: #F45A68;}/*红色*/
    #tips .s2{background: #fc0;}/*橙色*/
    #tips .s3{background: #cc0;}/*黄色*/
    #tips .s4{background: #14B12F;}/*绿色*/
</style>
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <small>系统管理 > 用户中心</small>
    </h1>
  </section>
  <!-- Main content -->
  <section class="content">
    <!-- Your Page Content Here -->
    <div class="row">
      <div class="col-xs-12">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_2" data-toggle="tab">修改密码</a></li>
            </ul>
            <div class="tab-content">
              	<div class="tab-pane active" id="tab_2">
               	 <div class="row">
		         	<div class="col-md-6">
			       	  <form role="form" data-validator-option="{theme:'bootstrap', timely:2, stopOnError:true}" method="post" action="/system/me/doChangePwd">
			            <div class="box-body">
			              <div class="form-group">
			                <label for="password">旧密码</label>
			                <input type="password" class="form-control" id="password"  name="password" placeholder="请输入旧密码" data-rule="旧密码: required; length(6~16)">
			              </div>
			              <div class="form-group">
			                <label for="newpassword">新密码</label>
			                <input type="password" class="form-control" id="newpassword"  name="newpassword" placeholder="请输入新密码" data-rule="新密码: required;密码格式：pwdRules;length(6~16)">
			              </div>
			              <div class="form-group">
			                <label for="newpassword2">重复密码</label>
			                <input type="password" class="form-control" id="newpassword2"  name="newpassword2" placeholder="请重复输入新密码" data-rule="重复新密码: required;match(newpassword); length(6~16)">
			              </div>
			              <#if msg??>
			              <div class="form-group">
			              	<div  class="alert alert-danger alert-dismissible">
						       <h4 style="margin-bottom: 0px;"><i class="fa fa-exclamation-triangle"></i> ${msg!}</h4>
						    </div>
			              </div>
			              </#if>
			              <#if info??>
			              <div class="form-group">
			              	<div  class="alert alert-success alert-dismissible">
						       <h4 style="margin-bottom: 0px;"><i class="fa fa-info"></i> ${info!}</h4>
						    </div>
			              </div>
			              </#if>
			            </div><!-- /.box-body -->
			            <div class="box-footer">
							<span style="display: block;margin: 5px 0;">
								密码强度规则说明：密码长度大于6位，必须包含数字、大小写字母与特殊字符。
							</span>
			              <button type="submit" class="btn btn-success"><i class="fa fa-save"></i>  提 交</button>
			            </div>
			          </form>
			        </div>
	         	   </div>
              	</div><!-- /.tab-pane -->
              	
              </div><!-- /.tab-pane -->
            </div><!-- /.tab-content -->
      </div>
    </div>
  </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script src="/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<script>
//初始化fileinput控件（第一次初始化）
function initFileInput(ctrlName, uploadUrl) {    
    var control = $('#' + ctrlName); 

    control.fileinput({
    	
    	 initialPreview: [
             '${(sysUser.userImg)!}'
         ],
         initialPreviewAsData: true,
         initialPreviewConfig: [
             {caption: "${(sysUser.userImg)!}", size: 930321, width: "120px", key: '${(sysUser.id)!}', showDelete: false}
         ],
         deleteUrl: "/file/delete",
    	
        language: 'zh', //设置语言
        uploadUrl: uploadUrl, //上传的地址
        allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
        showUpload: false, //是否显示上传按钮
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary"       
    });
}
	
initFileInput("systemLogo", "/file/upload");

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
</@footer>