<#include "../../common/layout.ftl">
<@header>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>系统管理 > 系统配置</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="layui-tab layui-tab-brief">
                            <ul class="layui-tab-title">
                                <@dictTag method="getDictListByType" type="setting_group" >
                                    <#list getDictListByType as m>
                                        <li class="${(m.value=='1')?string('layui-this','')}"
                                            id="tab_${(m.value)!}">${(m.label)!}</li>
                                    </#list>
                                </@dictTag>
                                <li>短信设置</li>
                                <li>附件上传设置</li>
                            </ul>
                            <div class="layui-tab-content">
                                <@dictTag method="getDictListByType" type="setting_group" >
                                    <#list getDictListByType as mm>
                                        <div class="layui-tab-item ${(mm.value=='1')?string('layui-show','')}">
                                            <a class="btn btn-primary dialog" href="javascript:;"
                                               data-url="/system/setting/add/${(mm.value)!}" data-title="添加系统设置项"
                                               data-width="850"
                                               data-height="450"><i class="fa fa-plus"></i> 添加系统设置项</a>
                                            <form class="form-horizontal layui-form layui-form-pane" method="post"
                                                  action="/system/setting/doSetting">
                                                <div class="box-body">
                                                    <#list list as st>
                                                        <#if mm.value==(st.sysSettingGroup?c) >
                                                            <div class="form-group">
                                                                <label for="${(st.sysKey)!}"
                                                                       class="col-sm-2 control-label"> <a class="dialog"
                                                                                                          href="javascript:;"
                                                                                                          data-url="/system/setting/edit/${(st.id)!}?code=${(mm.value)!}"
                                                                                                          data-title="编辑系统设置"
                                                                                                          data-width="850"
                                                                                                          data-height="650">${(st.sysName)!}</a></label>
                                                                <div class="col-sm-10">
                                                                    <input type="hidden" name="id" value="${(st.id)!}"/>
                                                                    <input type="text" id="${(st.sysKey)!}"
                                                                           name="sysValue"
                                                                           value="${(st.sysValue)!}"
                                                                           class="form-control"
                                                                           data-rule="${(st.sysName)!}:required;">
                                                                    <p class="helpock ts-color">${(st.sysDesc)!}</p>
                                                                </div>
                                                            </div>
                                                        </#if>
                                                    </#list>
                                                    <#if info??>
                                                        <div class="alert alert-success alert-dismissible">
                                                            <h4 style="margin-bottom: 0px;"><i
                                                                    class="fa fa-check-circle"></i> ${info!}</h4>
                                                        </div>
                                                    </#if>
                                                </div><!-- /.box-body -->
                                            <#--<div class="box-footer">-->
                                            <#--<button type="submit" class="btn btn-success"><i-->
                                            <#--class="fa fa-save"></i> 提 交-->
                                            <#--</button>-->
                                            <#--<a class="btn btn-default" href="/system/menu/list/1"><i-->
                                            <#--class="fa fa-close"></i> 取消</a>-->
                                            <#--</div>-->
                                            </form>
                                        </div>
                                    </#list>
                                </@dictTag>
                                <div class="layui-tab-item">
                                    <form class="form-horizontal layui-form layui-form-pane" method="post"
                                          action="/system/setting/doSmsSetting" id="smsSettingId"
                                          onkeydown="if(event.keyCode==13){return false;}">
                                        <div class=" box-body ">
                                            <input type="hidden" id="smsId" name="id" value="">
                                            <div class="form-group">
                                                <label for="smsTitle" class="col-sm-2 control-label">接口名称</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="smsTitle"
                                                           name="smsTitle"
                                                           placeholder="请输入接口名称"
                                                           lay-verify="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="smsUrl" class="col-sm-2 control-label">接口地址</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="smsUrl"
                                                           name="smsUrl"
                                                           placeholder="请输入接口地址"
                                                           lay-verify="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="smsAccount" class="col-sm-2 control-label">接口账号</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="smsAccount"
                                                           name="smsAccount"
                                                           placeholder="请输入接口账号"
                                                           lay-verify="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="smsPassword" class="col-sm-2 control-label">接口key</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="smsPassword"
                                                           name="smsPassword"
                                                           placeholder="请输入接口key"
                                                           lay-verify="required">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="smsSign" class="col-sm-2 control-label">接口签名</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="smsSign"
                                                           name="smsSign"
                                                           placeholder="请输入接口签名"
                                                           lay-verify="required">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="smsTemplate" class="col-sm-2 control-label">短信模版Id</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="smsTemplate"
                                                           name="smsTemplate"
                                                           placeholder="请输入接口模版Id"
                                                           lay-verify="required">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">是否启用</label>
                                                <div class="col-sm-10">
                                                    <label>
                                                        <input id="isEnabledYes" name="isEnabled" type="radio"
                                                               class="minimal" checked
                                                               value="0" lay-ignore> 启用
                                                    </label>
                                                    <label>
                                                        <input id="isEnabledNo" name="isEnabled" type="radio"
                                                               class="minimal" value="1"
                                                               lay-ignore> 禁用
                                                    </label>
                                                </div>
                                            </div>

                                        </div><!-- /.box-body -->
                                        <div class="box-footer">
                                            <button type="button" class="btn btn-success" onclick="onUpSmsSetting()"><i
                                                    class="fa fa-save"></i> 提 交
                                            </button>
                                            <a class="btn btn-default" href="/system/menu/list/1"><i
                                                    class="fa fa-close"></i> 取消</a>
                                        </div>
                                    </form>
                                </div>

                                <div class="layui-tab-item">
                                    <form class="form-horizontal layui-form layui-form-pane" method="post"
                                          action="/system/tSysAttachmentConfig/doAdd" id="AttachmentConfigid"
                                          onkeydown="if(event.keyCode==13){return false;}">
                                        <div class=" box-body">
                                            <input type="hidden" id="attaconfigid" name="id" value="">
                                            <div class="form-group">
                                                <label for="smsTemplate"
                                                       class="col-sm-2 control-label">允许上传的附件类型：</label>
                                                <div class="col-sm-10">
                                                    <textarea id="classifyType" class="classifyType"
                                                              name="classifyType"></textarea>
                                                </div>
                                            </div>
                                        </div><!-- /.box-body -->
                                        <div class="box-footer">
                                            <button type="button" class="btn btn-success"
                                                    onclick="onUpAttachmentConfig()"><i
                                                    class="fa fa-save"></i> 提 交
                                            </button>
                                            <a class="btn btn-default" href="/system/menu/list/1"><i
                                                    class="fa fa-close"></i> 取消</a>
                                        </div>
                                    </form>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
</@body>
<@footer>
    <script type="application/javascript">
        $(function () {

        })

        //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function () {
            var element = layui.element;
            console.log(element);
            console.log(element);
            var dataUrl = "/system/setting/selectSmsSetting";
            $.post(dataUrl, {}, function (json) {
                if (json.code == 200) {
                    console.log(json);
                    if (json.data != null) {
                        $("#smsId").val(json.data.id);
                        $("#smsTitle").val(json.data.smsTitle);
                        $("#smsUrl").val(json.data.smsUrl);
                        $("#smsAccount").val(json.data.smsAccount);
                        $("#smsPassword").val(json.data.smsPassword);
                        $("#smsTemplate").val(json.data.smsTemplate);
                        $("#smsSign").val(json.data.smsSign);
                        if (json.data.isEnabled == 0) {
                            $('#isEnabledYes').attr("checked", true);
                            $('#isEnabledNo').attr("checked", false);
                        } else {
                            $('#isEnabledYes').attr("checked", false);
                            $('#isEnabledNo').attr("checked", true);
                        }
                    }
                } else {
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons: {"好的": {btnClass: 'btn-blue'}}
                    });
                }
            });
            var attaconfigUrl = "/system/setting/selectAttachmentConfig";
            $.post(attaconfigUrl, {}, function (json) {
                if (json.code == 200) {
                    console.log(json);
                    if (json.data != null) {
                        $("#attaconfigid").val(json.data.id);
                        $(".classifyType").html(json.data.classifyType);
                        $(".classifyType").tagEditor({
                            placeholder: '添加规格后按Enter',
                            val: json.data.classifyType,
                        });
                    } else {
                        $(".classifyType").tagEditor({
                            placeholder: '添加规格后按Enter',
                        });
                    }

                } else {
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons: {"好的": {btnClass: 'btn-blue'}}
                    });
                }

            });
        });

        /**
         * 更短信配置
         */
        function onUpSmsSetting() {
            var dataUrl = "/system/setting/doSmsSetting";
            var data = $("#smsSettingId").serialize();
            $.post(dataUrl, data, function (json) {
                console.log(json);
                if (json.code == 200) {
                    $.alert("操作成功");
                    //window.location.reload();
                } else {
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons: {"好的": {btnClass: 'btn-blue'}}
                    });
                }
            });
        }


        /**
         * 更新附件配置
         */
        function onUpAttachmentConfig() {
            var dataUrl = "/system/tSysAttachmentConfig/doAdd";
            var data = $("#AttachmentConfigid").serialize();
            $.post(dataUrl, data, function (json) {
                console.log(json);
                if (json.code == 200) {
                    $.alert("操作成功");
                    //window.location.reload();
                } else {
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons: {"好的": {btnClass: 'btn-blue'}}
                    });
                }
            });
        }

        /**
         * 更新手机白名单
         */
        function onUpdateWhiteList() {
            var dataUrl = "/system/setting/updateWhiteList";
            var data = $("#WhiteList").serialize();
            $.post(dataUrl, data, function (json) {
                console.log(json);
                if (json.code == 200) {
                    $.alert("操作成功");
                    //window.location.reload();
                } else {
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons: {"好的": {btnClass: 'btn-blue'}}
                    });
                }
            });
        }
    </script>
</@footer>