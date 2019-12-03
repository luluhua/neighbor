<#include "../../common/layout_dl.ftl">
<@header>
<style>

    .td1{
        font-weight: bold;
        font-size: 15px;
    }
    .td2{
        color: #0d6aad;
        font-size: 14px;
        padding: 5px;
    }
</style>
</@header>
<@body>
    <div class="box-body" style="padding: 20px;">
        <div class="form-group">
            <label  class="td1 control-label">引流分享码</label>
            <div class="td2 ">${(entity.shareCode)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">用户设备标识</label>
            <div class="td2">${(entity.equipmentToken)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">客户端操作系统版本</label>
            <div class="td2">${(entity.mobileSystemVersion)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">app版本</label>
            <div class="td2">${(entity.appVersion)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">app客户端手机型号</label>
            <div class="td2">${(entity.mobileModel)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">app客户端类型</label>
            <div class="td2">
             <@dictTag method="dictValueByType" type="app_type" value="${(entity.mobilePlatform)!}"> ${(dictValueByType)!}</@dictTag>
            </div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">当前版本app客户端包名</label>
            <div class="td2">
             <@dictTag method="dictValueByType" type="app_push_package" value="${(entity.packageName)!}"> ${(dictValueByType)!}</@dictTag>
            </div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">客户端ip</label>
            <div class="td2">${(entity.clientIp)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">屏幕宽度</label>
            <div class="td2">${(entity.screenWidth)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">屏幕高度</label>
            <div class="td2">${(entity.screenHeight)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">webgl版本</label>
            <div class="td2">${(entity.webglVersion)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">Web版本</label>
            <div class="td2">${(entity.webglSlVersion)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">最大纹理尺寸</label>
            <div class="td2">${(entity.maxTextureSize)!}</div>
        </div>
        <div class="form-group">
            <label  class=" control-label">显卡版本</label>
            <div class="td2">${(entity.renderer)!}</div>
        </div>
        <div class="form-group">
            <label  class=" control-label">浏览器版本</label>
            <div class="td2">${(entity.vendor)!}</div>
        </div>
        <div class="form-group">
            <label  class="td1 control-label">context</label>
            <div class="td2">${(entity.context)!}</div>
        </div>
    </div><!-- /.box-body -->
</@body>
<@footer>


</@footer>