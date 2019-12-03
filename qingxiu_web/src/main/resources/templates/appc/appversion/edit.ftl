<#include "../../common/layout_dl.ftl">
<@header>

</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/tApp/version/doEdit"
      onkeydown="if(event.keyCode==13){return false;}">
    <input type="hidden" name="id" value="${(entity.id?c)!}">
    <div class="box-body" id="tApp_form">
        <div class="form-group">
            <label for="vName" class="col-sm-2 control-label">版本名称<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="vName" name="vName" value="${(entity.vName)!}" class="form-control"
                       placeholder="请输入版本名称" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="vCode" class="col-sm-2 control-label">版本号<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="vCode" name="vCode" value="${(entity.vCode)!}"
                       class="form-control input-select-200" placeholder="请输入版本号" lay-verify="required|number"/>
            </div>
        </div>
        <div class="form-group">
            <label for="aType" class="col-sm-2 control-label">平台<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <@dictTag method="getDictListByType" type="app_type" >
                    <#list getDictListByType as m>
                                <input type="radio" name="vType"
                                       <#if "${(m.value)!}"=="${(entity.vType)!}">checked</#if> class="minimal"
                                       value="${(m.value)!}" lay-ignore>
                        ${(m.label)!}
                            &nbsp;
                    </#list>
                </@dictTag>
            </div>
        </div>
        <div class="form-group" style="display: none">
            <label for="vDownloadUrl" class="col-sm-2 control-label">下载地址<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="vDownloadUrl" name="vDownloadUrl" value="${(entity.vDownloadUrl)!}"
                       class="form-control" placeholder="请输入下载地址" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="vDownloadUrl" class="col-sm-2 control-label">上传安装包<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <button type="button" class="layui-btn" id="test1">
                    <i class="layui-icon">&#xe67c;</i>上传安装包
                </button>
            </div>
        </div>
        <div class="form-group">
            <label for="vStatus" class="col-sm-2 control-label">强制更新<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <@dictTag method="getDictListByType" type="is_yes_no" >
                        <#list getDictListByType as m>
                            <input type="radio" name="vStatus"
                                   class="minimal" ${(entity.vStatus==(m.value?number))?string('checked','')}
                                   value="${(m.value)!}" lay-ignore>
                            ${(m.label)!}
                            &nbsp;
                        </#list>

                </@dictTag>
            </div>
        </div>
        <div class="form-group">
            <label for="upDescription" class="col-sm-2 control-label">更新说明<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <textarea class="form-control tag" rows="3" name="upDescription" placeholder="请输入更新说明 ..."
                          lay-verify="required">
                    ${(entity.upDescription)!}
                </textarea>
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
    <script type="application/javascript">
        $(function () {
            $(".tag").tagEditor({
                placeholder: '添加规格后按Enter'
            });
        })

        layui.use('upload', function () {
            var upload = layui.upload;
            //执行实例
            var uploadInst = upload.render({
                elem: '#test1',
                url: '/file/uploadApp',
                accept: "file",
                before: function (obj) {
                    layer.load(3, {time: 1});
                    var fileType=$("#tApp_form").find("input[name=vType]:checked").val();
                    var version=$("#tApp_form").find("input[name=vCode]").val();
                    if(fileType=="2"){
                        //如果选择的是IOS，必须要填写版本号
                        if(version.trim()==""||parseFloat(version)<=0){
                            return false;
                        }
                    }
                    this.data["fileType"]=fileType;
                    this.data["version"]=version;
                },
                done:
                        function (res) {
                            if (res.status == 0) {
                                layer.load(3, {time: 1});
                                layer.msg('上传成功');
                                $("#vDownloadUrl").val(res.urls);
                            }else{
                                layer.load(3, {time: 1});
                                layer.msg(res.status);
                            }
                        },
                error: function () {
                    //请求异常回调
                }
            });
        });
    </script>
</@footer>