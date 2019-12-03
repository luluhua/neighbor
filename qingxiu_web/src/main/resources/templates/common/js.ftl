
<!-- 确认提示组件 -->
<div id="confirm-modal" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false"
     style="display: none;">
    <div class="modal-body">
        <p>您确定要删除该条记录吗?</p>
    </div>
    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
        <button type="button" class="btn btn-primary del">删除</button>
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
<!-- nice-validator-1.0.8 -->
<script src="/plugins/nice-validator-1.0.8/jquery.validator.js?local=zh-CN"></script>
<!--jquery-confirm  -->
<script src="/plugins/jquery-confirm/jquery-confirm.min.js"></script>
<!-- Select2 -->
<script src="/plugins/select2/select2.full.min.js"></script>
<!-- date -->
<script src="/plugins/daterangepicker/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<!-- jquery.cookie -->
<script src="/plugins/jquery.cookie.js"></script>

<!-- xlsx -->
<script src="/plugins/jquery.table2excel.js"></script>

<!-- AdminLTE App -->
<script src="/app/js/app.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/app/js/demo.js"></script>
<!-- 自定义系统初始化话JS -->
<script src="/app/js/init.js"></script>

<script src="/plugins/layui/layui.js" charset="utf-8"></script>
<script src="/app/js/x-layui.js" charset="utf-8"></script>
<!-- 百度地图 -->
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=GMGAvOCI4vHHUdYINMC54wp9"></script>
<#--<script src="/app/js/baidui-search.js"></script>-->
<!-- kindeditor -->
<script charset="utf-8" src="/plugins/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="/plugins/kindeditor/lang/zh-CN.js"></script>
<!-- tagEditor -->
<script charset="utf-8" src="/plugins/tagEditor/jquery.tag-editor.js"></script>
<!-- Tree -->
<link rel="stylesheet" href="/plugins/zTreeStyle/zTreeStyle.css">
<script src="/plugins/zTreeStyle/jquery.ztree.all.js"></script>
<script src="/plugins/plupload-2.3.6/js/plupload.full.min.js"></script>
<script type="text/javascript">
    //检测用户是否登录
    $.post('/login/checkLogin',function(res){
        if(res.code==1){
            window.location.href="/login";
        }
    });

</script>
<script type="text/javascript">

    // KindEditor
    KindEditor.ready(function (K) {
        window.editor = K.create('#editor_id', {
            filePostName: "file",
            allowPreviewEmoticons: true,
            resizeType: 1,
            width: "100%",
            height: "300px",
            allowImageUpload: true,//允许上传图片
            allowFileManager: true, //允许对上传图片进行管理
            uploadJson: '/img/fileUpload',
            fileManagerJson: '/img/fileManager',

            //上传文件后运行的回调函数,获取上传图片的路径
            afterUpload: function (url) {
            <#--var sae = "<@commonTags method='tagHtpImgURL' type='1' value='1'>${(tagHtpImgURL)!}</@commonTags>" + url + " onerror=this.src='../../../images/default.png'"-->
            <#--// this.sync(sae);-->
            }
            ,
            afterBlur: function () {
                this.sync();
            }
            ,
        })
        ;
        K('#image').click(function () {
            editor.loadPlugin('image', function () {
                //图片弹窗的基本参数配置
                editor.plugin.imageDialog({
                    showRemote: false,
                    imageUrl: K('#url').val(), //如果图片路径框内有内容直接赋值于弹出框的图片地址文本框
                    //点击弹窗内”确定“按钮所执行的逻辑
                    clickFn: function (url, title, width, height, border, align) {
                        K('#url').val(url);//获取图片地址
                        editor.hideDialog(); //隐藏弹窗
                    }
                });
            });
        });
    });


    $(function () {
        //select2
        $(".select2").select2();
        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });
    });


    // 关闭过滤模式，保留所有标签
    KindEditor.options.filterMode = true;

</script>

<script type="text/javascript">
    layui.config({
        version: true,
        debug: true,
        base: '/app/js/modules/'
    }).use('xform'); //加载入口

</script>



