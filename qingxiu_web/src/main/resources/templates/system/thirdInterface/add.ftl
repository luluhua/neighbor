<#include "../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.min.css">
</@header>
<@body>
    <form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/tThirdInterfaceConfig/doAdd">
        <div class="box-body">
            <div class="form-group">
                <label for="interfaceGroup" class="col-sm-2 control-label">接口分组<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <select name="interfaceGroup" class="form-control select2 input-select-200" lay-ignore
                            lay-verify="required">
                        <@dictTag method="getDictListByType" type="third_Interface_group" >
                            <#list getDictListByType as m>
                                <option value="${(m.value)!}" ${(m.value==(third.interfaceGroup?c))?string('selected','')} >${(m.label)!}</option>
                            </#list>
                        </@dictTag>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="interfaceName" class="col-sm-2 control-label">接口名称<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="interfaceName" name="interfaceName" class="form-control input-select-200" placeholder="请输入接口地址"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label for="interfaceCode" class="col-sm-2 control-label">接口标识<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="interfaceCode" name="interfaceCode" class="form-control input-select-200" placeholder="请输入接口标识"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label for="interfaceType" class="col-sm-2 control-label">接口类型<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <select name="interfaceType" class="form-control input-select-200" lay-ignore   lay-verify="required">
                        <@dictTag method="getDictListByType" type="third_interface_type" >
                            <#list getDictListByType as m>
                                <option value="${(m.value)!}">${(m.label)!}</option>
                            </#list>

                        </@dictTag>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="interfaceOrigin" class="col-sm-2 control-label">接口来源<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <select name="interfaceOrigin" class="form-control input-select-200" lay-ignore   lay-verify="required">
                        <@dictTag method="getDictListByType" type="third_interface_origin" >
                            <#list getDictListByType as m>
                                <option value="${(m.value)!}">${(m.label)!}</option>
                            </#list>

                        </@dictTag>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="interfaceIcon" class="col-sm-2 control-label">接口图标</label>
                <div class="col-sm-10">
                    <input type="hidden" value="" id="fileId" name="fileId">
                    <input type="hidden" value="" id="interfaceIcon" name="interfaceIcon">
                    <input name="file" type="file" class="file-loading" id="systemLogo">
                </div>
            </div>

            <div class="form-group">
                <label for="interfaceStatus" class="col-sm-2 control-label">接口状态<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <label>
                        <input name="interfaceStatus" type="radio" class="minimal"  checked  value="0" lay-ignore>正在使用
                    </label>
                    <label>
                        <input name="interfaceStatus" type="radio" class="minimal"  value="1" lay-ignore> 已停用
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="sortIndex" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="sortIndex" name="sortIndex" class="form-control input-select-200" placeholder="请输入排序"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label for="interfaceHref" class="col-sm-2 control-label">接口地址<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="interfaceHref" name="interfaceHref" class="form-control" placeholder="请输入接口地址"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label for="interfaceVersion" class="col-sm-2 control-label">接口版本<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="interfaceVersion" name="interfaceVersion" class="form-control input-select-200" placeholder="请输入接口版本"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label for="requestMode" class="col-sm-2 control-label">请求方式<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <select name="requestMode" class="form-control input-select-200" lay-ignore    lay-verify="required">
                        <@dictTag method="getDictListByType" type="third_interface_request_mode" >
                            <#list getDictListByType as m>
                                <option value="${(m.value)!}">${(m.label)!}</option>
                            </#list>
                        </@dictTag>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="interfaceParameter" class="col-sm-2 control-label">接口参数<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <textarea class="form-control" name="interfaceParameter" rows="3" placeholder="请输入接口参数，最多300个字符 ...">
                    </textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="remark" class="col-sm-2 control-label">备注</label>
                <div class="col-sm-10">
                    <textarea class="form-control" name="remark" rows="3" placeholder="请输入备注，最多300个字符 ...">
                    </textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                                class="fa fa-save"></i> 提 交
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
                    {caption: "", size: 930321, width: "120px", key: 'thridInterface', showDelete: false}
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
            console.log(result.status);
            console.log(result.urls);
            console.log(result.fileIds);
            $('#interfaceIcon').val(result.urls[0]);
            $('#fileId').val(result.fileIds[0]);
        });
        //获得额外参数的方法
        groupId = function() {
            return 1;//0头像 1图标 2办事材料 3 其他
        };
        //获得额外参数的方法
        saveTypeId = function() {
            return 0;//0添加附件表 1不添加只返回图片相对路径地址
        };
    </script>
</@footer>