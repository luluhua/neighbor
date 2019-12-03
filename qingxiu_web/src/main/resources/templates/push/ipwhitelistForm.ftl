<#include "../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/push/ipwhitelist/save">
    <div class="box-body">
        <input type="hidden" name="id" value="${(entity.id)!}"/>
        <div class="form-group">
            <label for="source" class="col-sm-2 control-label">来源<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="source" name="source" value="${(entity.source)!}" class="form-control"
                       placeholder="请输入来源" maxlength="25" lay-verify="required">
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名称<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="name" name="name" value="${(entity.name)!}" class="form-control"
                       placeholder="请输入名称" maxlength="25" lay-verify="required">
            </div>
        </div>
        <div class="form-group">
            <label for="ipAddr" class="col-sm-2 control-label">IP地址<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="ipAddr" name="ipAddr" value="${(entity.ipAddr)!}" class="form-control"
                       placeholder="请输入IP地址" maxlength="25" lay-verify="required">
            </div>
        </div>

        <div class="form-group">
            <label for="monthMax" class="col-sm-2 control-label">推送次数<span class="xing_red"> *（0表示不限）</span></label>
            <div class="col-sm-10">
                <input type="number" id="monthMax" name="monthMax" value="${(entity.monthMax)!}" class="form-control"
                       placeholder="请输入推送次数" maxlength="5" lay-verify="required">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">是否启用</label>
            <div class="col-sm-10">
                <select name="isEnable" class="form-control select2" style="width: 100%;" lay-ignore>
                    <option value="1" <#if (entity.isEnable==1)>selected</#if>>是</option>
                    <option value="0" <#if (entity.isEnable==0)>selected</#if>>否</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                        class="fa fa-save"></i> 提 交
                </button>
                <a class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i
                        class="fa fa-close"></i> 取消</a>
            </div>
        </div>
    </div>
</form>
</@body>
<@footer>
</@footer>