<#include "../../common/layout_dl.ftl">
<@header>
 <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.min.css">
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/appc/tProjectEntrance/doAdd">
    <div class="box-body">
        <div class="form-group">
            <label for="apuId" class="col-sm-2 control-label">分类</label>
            <div class="col-sm-10">
                <select name="apuId" class="form-control select2" lay-ignore style="width: 100%;"
                        lay-verify="required">
                    <option>--请选择分类--</option>
                        <#list classifyList as classify>
                            <option value="${(classify.id)!}" <#if "${(classify.id)!}"=="${(entity.apuId)!}">selected</#if>>${(classify.classifyName)!}</option>
                        </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="deptId" class="col-sm-2 control-label">部门</label>
            <div class="col-sm-10">
                <select name="deptId" class="form-control select2" lay-ignore style="width: 100%;"
                        lay-verify="required">
                    <option>--请选择部门--</option>
                        <#list deptList as dept>
                            <option value="${(dept.id)!}" <#if "${(dept.id)!}"=="${(entity.deptId)!}">selected</#if> >${(dept.name)!}</option>
                        </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="themeId" class="col-sm-2 control-label">主题</label>
            <div class="col-sm-10">
                <select name="themeId" class="form-control select2" lay-ignore style="width: 100%;"
                        lay-verify="required">
                    <option>--请选择主题--</option>
                        <#list themeList as theme>
                            <option value="${(theme.id)!}" <#if "${(theme.id)!}"=="${(entity.themeId)!}">selected</#if> >${(theme.themeTitle)!}</option>
                        </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="entranceUrl" class="col-sm-2 control-label">名称</label>
            <div class="col-sm-10">
                <input type="text" id="entranceName" name="entranceName" value="${(entity.entranceName)!}" class="form-control" placeholder="请输入口名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="entranceIcon" class="col-sm-2 control-label">图标</label>
            <input type="hidden"  id="entranceIcon" name="entranceIcon" value="${(entity.entranceIcon)!}">
            <div class="form-group col-sm-10">
                <input name="file" type="file" class="file-loading" id="systemLogo">
            </div>
        </div>
        <div class="form-group">
            <label for="entranceUrl" class="col-sm-2 control-label">跳转地址</label>
            <div class="col-sm-10">
                <input type="text" id="entranceUrl" name="entranceUrl" value="${(entity.entranceUrl)!}"
                       class="form-control" placeholder="请输入口跳转地址" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="sortIndex" class="col-sm-2 control-label">排序（越大越靠前）</label>
            <div class="col-sm-10">
                <input type="number" id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}" class="form-control"
                       placeholder="请输入排序（越大越靠前）" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>
                    提 交
                </button>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
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
                ''
            ],
            initialPreviewAsData: true,
            initialPreviewConfig: [
                {caption: "", size: 930321, width: "30px", key: 'deptIcon', showDelete: false}
            ],
            deleteUrl: "/file/delete",

            language: 'zh', //设置语言
            uploadUrl: uploadUrl, //上传的地址
            allowedFileExtensions : ['jpg', 'png'],//接收的文件后缀
            showUpload: false, //是否显示上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary",
            uploadExtraData: function(previewId, index) {   //额外参数的关键点
                var obj = {};
                obj.groupId = serviceId();
                return obj;

            }
        });
    }
    //获得额外参数的方法
    serviceId = function() {
        return 3;
    }

    initFileInput("systemLogo", "/file/upload");

    //上传成功回调函数
    $('#systemLogo').on("fileuploaded", function(event, data, previewId, index) {
        var result = data.response;
        console.log(result.status);
        console.log(result.urls);
        $('#entranceIcon').val(result.urls[0]);
    });

</script>
</@footer>