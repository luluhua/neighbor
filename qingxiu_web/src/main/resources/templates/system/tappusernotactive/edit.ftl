<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tAppUserNotactive/doEdit"
    <#else>
      action="/appc/tAppUserNotactive/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="mobile" class="col-sm-2 control-label">手机号码</label>
            <div class="col-sm-10">
                <input type="text" id="mobile" name="mobile" disabled
                       value="${(entity.mobile)!}" class="form-control input-select-200" placeholder="请输入mobile"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="dtActivation" class="col-sm-2 control-label">激活时间</label>
            <div class="col-sm-10">
                <input type="text" id="mobile" name="mobile" disabled
                       value="${(entity.dtActivation?string('yyyy-MM-dd HH:mm:ss'))!'--'}"
                       class="form-control input-select-200"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="headerReferer" class="col-sm-2 control-label">request Referer</label>
            <div class="col-sm-10">
                <input type="text" id="headerReferer" name="headerReferer" disabled
                       value="${(entity.headerReferer)!}" class="form-control" placeholder="请输入request Referer"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="source" class="col-sm-2 control-label">来源</label>
            <div class="col-sm-10">
                <input type="text" id="source" name="source" disabled
                       value="<#if entity.source==1>联通公众号<#else >未知</#if>" class="form-control input-select-200"
                       placeholder="请输入来源 1联通公众号"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="reIp" class="col-sm-2 control-label">请求IP</label>
            <div class="col-sm-10">
                <input type="text" id="reIp" name="reIp" disabled
                       value="${(entity.reIp)!}" class="form-control input-select-200" placeholder="请输入请求IP"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="state" class="col-sm-2 control-label">是否激活</label>
            <div class="col-sm-10">
                <input type="text" id="state" name="state" disabled
                       value=" <#if entity.state==0>未激活<#else >已激活</#if>"
                       class="form-control input-select-200"
                       placeholder="请输入状态 0未激活 1已激活"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="gid" class="col-sm-2 control-label">app用户gid</label>
            <div class="col-sm-10">
                <input type="text" id="gid" name="gid" disabled
                       value="${(entity.gid)!}" class="form-control input-select-200" placeholder="请输入app用户gid"
                       lay-verify="required"/>
            </div>
        </div>
    <#--<div class="form-group">-->
    <#--<label class="col-sm-2 control-label">&nbsp;</label>-->
    <#--<div class="col-sm-10">-->
    <#--<button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>-->
    <#--提 交-->
    <#--</button>-->
    <#--</div>-->
    <#--</div>-->
    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>