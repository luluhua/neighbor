<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.min.css">
</@header>
<@body>
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
              <li class="active"><a href="#tab_1" data-toggle="tab">个人信息</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
               	 <div class="row">
		         	<div class="col-md-6">
			       	  <form role="form" data-validator-option="{theme:'bootstrap', timely:2, stopOnError:true}" method="post" action="/system/me/updateUser">
			            <div class="box-body">
			              <input type="hidden" value="${(sysUser.id)!}" id="id" name="id">
			              <div class="form-group">
			                <label for="userName">用户名</label>
			               	<input type="text" name="username" value="${(sysUser.username)!}" class="form-control" readonly="readonly">
			              </div>
                        <div class="form-group">
                            <label >真实姓名</label>
                            <input type="text"  value="${(realname)!'--'}" class="form-control" disabled="disabled">
                        </div>
                        <div class="form-group">
                            <label >所在部门</label>
                            <input type="text"  value="${(sysOrg.name)!'--'}" class="form-control" disabled="disabled">
                        </div>
                        <div class="form-group">
                            <label >角色信息</label>
                            <input type="text"  value="${(sysRole)!}" class="form-control" disabled="disabled">
                        </div>
                            <div class="form-group">
                                <label >手机号码</label>
                                <input type="text"  value="${(mobile)!}" class="form-control" disabled="disabled">
                            </div>
                            <div class="form-group">
                                <label >昵称</label>
                                <input type="text"  value="${(sysUser.nickname)!}" name="nickname" class="form-control" >
                            </div>
			              <input type="hidden" value="${(sysUser.avatarUrl)!}" id="avatarUrl" name="avatarUrl">
			              <div class="form-group">
		                     <label for="systemLogo">头像</label>
		                     <input name="file" type="file" class="file-loading" id="systemLogo">
		                   </div>
		                  <#if info??>
			              <div class="form-group">
			              	<div  class="alert alert-success alert-dismissible">
						       <h4 style="margin-bottom: 0px;"><i class="fa fa-info"></i> ${info!}</h4>
						    </div>
			              </div>
			              </#if>
			            </div><!-- /.box-body -->
			            <div class="box-footer">
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
             '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(sysUser.avatarUrl)!}'
         ],
         initialPreviewAsData: true,
         initialPreviewConfig: [
             {caption: "<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(sysUser.avatarUrl)!}", size: 930321, width: "120px", key: '${(sysUser.id)!}', showDelete: false}
         ],
         deleteUrl: "/file/delete",
    	
        language: 'zh', //设置语言
        uploadUrl: uploadUrl, //上传的地址
        allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
        showUpload: false, //是否显示上传按钮
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary",
        uploadExtraData: function(previewId, index) {   //额外参数的关键点
            var obj = {};
            obj.groupId = groupId();
            obj.saveTypeId = saveTypeId();
            return obj;
        }
    });
}
	
initFileInput("systemLogo", "/file/upload");

//上传成功回调函数
$('#systemLogo').on("fileuploaded", function(event, data, previewId, index) {
    var result = data.response;
    $('#avatarUrl').val(result.urls[0]);
});
//获得额外参数的方法
groupId = function() {
    return 0;//0头像 1图标 2办事材料 3 其他
};
//获得额外参数的方法
saveTypeId = function() {
    return 0;//0添加附件表 1不添加只返回图片相对路径地址
};
</script>
</@footer>