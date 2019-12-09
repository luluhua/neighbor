<#include "../../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="/plugins/json-viewer/css/jquery.json-viewer.css">
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" >
    <div class="box-body">
        <div class="form-group">
            <label for="vName" class="col-sm-2 control-label">客户端类型</label>
            <div class="col-sm-10">
                <#if entity.appType??>
                                                <#if entity.appType==1>
                                                    Android
                                                <#elseif entity.appType==2>
                                                    IOS
                                                <#else>

                                                </#if>
                </#if>
            </div>
        </div>
        <div class="form-group">
            <label for="vCode" class="col-sm-2 control-label">Android标识</label>
            <div class="col-sm-10">
                ${(entity.clientId)!''}
            </div>
        </div>
        <div class="form-group">
            <label for="aType" class="col-sm-2 control-label">IOS标识</label>
            <div class="col-sm-10">
                ${(entity.deviceToken)!''}
            </div>
        </div>
        <div class="form-group" style="display: none">
            <label for="vDownloadUrl" class="col-sm-2 control-label">操作系统版本</label>
            <div class="col-sm-10">
                ${(entity.mobileSystemVersion)!}
            </div>
        </div>
        <div class="form-group">
            <label for="vDownloadUrl" class="col-sm-2 control-label">手机型号</label>
            <div class="col-sm-10">
                ${(entity.mobileModel)!}
            </div>
        </div>
        <div class="form-group">
            <label for="vStatus" class="col-sm-2 control-label">app版本</label>
            <div class="col-sm-10">
                ${(entity.appVersion)!}
            </div>
        </div>
        <div class="form-group">
            <label for="vStatus" class="col-sm-2 control-label">app包名</label>
            <div class="col-sm-10">
                <@dictTag method="dictValueByType" type="app_push_package" value="${(entity.packageName)!}"> ${(dictValueByType)!}</@dictTag>
            </div>
        </div>
    </div>
</form>
    <form role="form" class="form-horizontal layui-form layui-form-pane" >
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-2 control-label">请求参数</label>
                <div class="col-sm-10">  <pre id="json-renderer"></pre>
                    <textarea class="form-control" id="json-input" rows="15" style="display: none;" >${(entity.parameter)!''}</textarea></div></div>

        </div>
    </form>
<#if entity.isOk==0&&entity.errmsg??>
<form class="form-horizontal layui-form layui-form-pane" >
<div class="box-body">
        <div class="form-group">
            <label for="vName" class="col-sm-2 control-label">错误信息</label>
            <div class="col-sm-10">
                <textarea class="form-control"readonly>${(entity.errmsg)!}</textarea>
            </div>
        </div>
</div>
    </form>
</#if>
</@body>
<@footer>
    <script src="/plugins/json-viewer/js/jquery.json-viewer.js"></script>
    <script type="text/javascript">
        $(function() {
            try {
                var input = eval('(' + $('#json-input').text() + ')');
            }
            catch (error) {
                return alert("Cannot eval JSON: " + error);
            }
            var options = {
            };
            console.log(input)
            $('#json-renderer').jsonViewer(input, options);
        });
    </script>
</@footer>