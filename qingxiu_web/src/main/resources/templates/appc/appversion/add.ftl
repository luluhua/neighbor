<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>app管理 > App版本管理</small>
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
<form id="formId" class="form-horizontal layui-form layui-form-pane" method="post" action="/tApp/version/doAdd" enctype="multipart/form-data"
      onkeydown="if(event.keyCode==13){return false;}" onsubmit="return onSubmit();">
    <div class="box-body" id="tApp_form">

        <div class="form-group">
            <label for="vName" class="col-sm-2 control-label">版本名称<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="vName" name="vName" class="form-control" placeholder="请输入版本名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="aType" class="col-sm-2 control-label">平台<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <@dictTag method="getDictListByType" type="app_type" >
                    <#list getDictListByType as m>
                                <input type="radio" name="vType" class="minimal" value="${(m.value)!}" lay-ignore
                                       checked>
                        ${(m.label)!}
                            &nbsp;
                    </#list>
                </@dictTag>
            </div>
        </div>
        <div class="form-group">
            <label for="vCode" class="col-sm-2 control-label">版本号<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="vCode" name="vCode" class="form-control input-select-200" placeholder="请输入版本号"
                       lay-verify="required|number" onblur="onCheckCode()"/>
            </div>
        </div>
        <div class="form-group" style="display: none">
            <label for="vDownloadUrl" class="col-sm-2 control-label">下载地址<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="vDownloadUrl" name="vDownloadUrl" class="form-control" placeholder="请输入下载地址"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="vDownloadUrl" class="col-sm-2 control-label">安装包选择<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <#--<button type="button" class="layui-btn" >-->
                    <#--<i class="layui-icon">&#xe67c;</i>上传安装包-->
                <#--</button>-->
                <input type="file" id="fileId" name="file" value=""/>
            </div>
        </div>


        <div class="form-group">
            <label for="vStatus" class="col-sm-2 control-label">强制更新<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                    <@dictTag method="getDictListByType" type="is_yes_no" >
                        <#list getDictListByType as m>
                                <input type="radio" name="vStatus" class="minimal" value="${(m.value)!}" lay-ignore
                                       checked>
                            ${(m.label)!}
                            &nbsp;
                        </#list>

                    </@dictTag>
            </div>
        </div>
        <div class="form-group">
            <label for="upDescription" class="col-sm-2 control-label">更新说明<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <textarea class="form-control tag" rows="3" id="upDescriptionId" name="upDescription" placeholder="请输入更新说明 ..."
                          lay-verify="required"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <button type="submit" id="btnId" class="btn btn-success"><i class="fa fa-save"></i>
                    提 交
                </button>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
                </div>     </div></div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>


    <script type="application/javascript">
        $(function () {
            $(".tag").tagEditor({
                placeholder: '添加规格后按Enter'
            });
        })
        function onCheckCode(){
            var _type=$("input[name='vType']:checked").val();
            var _code=$("#vCode").val();
            if(_type==''||_type==null){
                layer.msg('请先选择平台类型');
                return ;
            }
            $.ajax({
                type: "post",
                url: "/tApp/version/checkVNO",
                data: $('#formId').serialize(),
                success: function (data) {
                    console.log(data);
                    if (data.code!= 200) {
                        layer.msg('版本号已存在');
                        $("#vCode").focus();
                        $("#vCode").val("");
                    }
                }
            });
        }

        function onSubmit(){
            var _vName=$("#vName").val();
            var _type=$("input[name='vType']:checked").val();
            var _vCode=$("#vCode").val();
            var _fileId=$("#fileId").val();
            var _upDescriptionId=$("#upDescriptionId").val();
            if(_vName==null||_vName==''){
                layer.msg('请填写版本名称');
                return false;
            }
            if(_type==null||_type==''){
                layer.msg('请选择平台类型');
                return false;
            }
            if(_vCode==null||_vCode==''){
                layer.msg('请填写版本号');
                return false;
            }
            if(_type!=2&&(_fileId==null||_fileId=='')){
                layer.msg('请上传安装包');
                return false;
            }
            if(_upDescriptionId==null||_upDescriptionId==''){
                layer.msg('请填写更新说明');
                return false;
            }
            layer.load(1);
            $('#btnId').attr('disabled',true);
            return true;
        }
        // layui.use('upload', function () {
        //
        //     var upload = layui.upload;
        //     //执行实例
        //     var uploadInst = upload.render({
        //         elem: '#test1',
        //         url: '/file/uploadApp',
        //         accept: "file",
        //         exts: 'apk|ipa|',
        //         // auto: false,
        //         data: {},
        //         size:0,
        //         choose:function(){
        //             var flag = true;
        //             var version=$("#tApp_form").find("input[name=vCode]").val();
        //             if(version==""||version==null){
        //                 layer.msg('请先填写版本名称和版本号');
        //                 flag=false;
        //             }
        //             return flag;
        //         },
        //         before: function (obj) {
        //             var fileType=$("#tApp_form").find("input[name=vType]:checked").val();
        //             var version=$("#tApp_form").find("input[name=vCode]").val();
        //             if(fileType=="2"){
        //                 //如果选择的是IOS，必须要填写版本号
        //                 if(version.trim()==""||parseFloat(version)<=0){
        //                     return false;
        //                 }
        //             }
        //             this.data["fileType"]=fileType;
        //             this.data["version"]=version;
        //             layer.load(1);
        //         },
        //         done:function (res) {
        //                     if (res.status == 0) {
        //                         layer.load(3, {time: 1});
        //                         layer.msg('上传成功');
        //                         $("#vDownloadUrl").val(res.urls);
        //                     }else{
        //                         layer.msg(res.msg);
        //                         layer.load(3, {time: 1});
        //                     }
        //                 },
        //         error: function () {
        //             //请求异常回调
        //             layer.load(3, {time: 1});
        //         }
        //     });
        // });

    </script>
</@footer>