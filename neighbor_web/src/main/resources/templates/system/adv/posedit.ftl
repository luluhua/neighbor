<#include "../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
 <form role="form" class="form-horizontal layui-form layui-form-pane" method="post" action="/tCmsAdvpos/doEdit">
     <div class="box-body">
         <input type="hidden" name="id" value="${(advpos.id)!}"/>
         <div class="form-group">
             <label for="name" class="col-sm-2 control-label">名称：<span
                     class="xing_red">*</span></label>
             <div class="col-sm-10">
                 <input type="text" name="name" class="form-control input-select-200"
                        value="${(advpos.name)}"
                        lay-verify="required">
             </div>
         </div>
         <div class="form-group">
             <label for="code" class="col-sm-2 control-label">代码：<span
                     class="xing_red">*</span></label>
             <div class="col-sm-10">
                 <input type="text" name="code" class="form-control input-select-200"
                        value="${(advpos.code)}"
                        lay-verify="required">
             </div>
         </div>
         <div class="form-group">
             <label for="remark" class="col-sm-2 control-label">备注</label>
             <div class="col-sm-10">
                <textarea name="remark" class="form-control textar-remark"
                >${(advpos.remark)}</textarea>
             </div>
         </div>
         <div class="form-group">
             <label class="col-sm-2 control-label">&nbsp;</label>
             <div class="col-sm-10">
                 <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>
                     提 交
                 </button>
                 <a class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i
                         class="fa fa-close"></i>
                     取消</a>
             </div>
         </div>
     </div>
     </div><!-- /.box-body -->
 </form>
</@body>
<@footer>
<script src="/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<script src="/app/js/file-upload.js?v=11"></script>
<script>
    //初始化fileinput控件（第一次初始化）
    deleteUrl = '/tCmsAdvpos/file/delete';
    autoReplace = false;  //自动替换
    maxFileCount = 5;  //最大文件数
    baseUrl = '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>';
    //获得额外参数的方法
    groupId = function () {
        return 3;//0头像 1图标 2办事材料 3 其他
    };
    //获得额外参数的方法
    saveTypeId = function () {
        return 1;//0添加附件表 1不添加只返回图片相对路径地址
    };
    //业务id
    serviceId = function () {
        var id = ${(advpos.id)};
        return id;
    };
    initFileInput("layoutPic", "/file/upload", "${(advpos.layoutPicUrl)!}", saveTypeId());
    //上传成功回调函数
    $('#layoutPic').on("fileuploaded", function (event, data, previewId, index) {
        var result = data.response;
        $('#layoutPicUrl').val(result.urls[0]);
    });
    //删除文件回调函数
    $('#layoutPic').on('fileclear', function (event) {
        $('#layoutPicUrl').val('');
    });
    $('#layoutPic').on('filedeleted', function (event, key) {
        $('#layoutPicUrl').val('');
    });
</script>
</@footer>