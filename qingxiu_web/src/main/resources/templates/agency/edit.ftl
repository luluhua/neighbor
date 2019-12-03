<#include "../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
      <#if (entity.id)??>action="/tGovAgency/doEdit/${(entity.id)!}"<#else>action="/tGovAgency/doAdd"</#if>>
    <div class="box-body">
        <input type="hidden" name="id" value="${(entity.id)!}"/>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">公司名称<span
                    class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" name="name" value="${(entity.name)!}" class="form-control input-title-500"
                       placeholder="请输入公司名称" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="themeType" class="col-sm-2 control-label">联系电话<span
                    class="xing_red"> *</span></label>
            <div class="col-sm-4">
                <input type="text" name="mobile" value="${(entity.mobile)!}" class="form-control input-title-500"
                       placeholder="请输入联系电话" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">公司地址</label>
            <div class="col-sm-10">
                <input type="text" name="address" value="${(entity.address)!}" class="form-control input-title-500"
                       placeholder="请输入公司地址" />
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <input type="text" name="remark" value="${(entity.remark)!}" class="form-control input-title-500"
                       placeholder="请输入备注" />
            </div>
        </div>
        <div class="form-group">
            <label for="isEnabled" class="col-sm-2 control-label">是否可用<span
                    class="xing_red"> *</span>
            </label>
            <div class="col-sm-10">
                <@dictTag method="getDictListByType" type="is_enabled" >
                    <#list getDictListByType as m>
                         <label>
                             <input name="isEnabled" type="radio" class="minimal"
                                    <#if "${(m.value)!}"=="${(entity.isEnabled)!}">checked</#if> value="${(m.value)!}"
                                    lay-ignore> ${(m.label)!}
                         </label>
                    </#list>
                </@dictTag>
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
  <script>
      $(document).ready(function () {

      });

  </script>
<style>
    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;
    }
</style>
</@footer>