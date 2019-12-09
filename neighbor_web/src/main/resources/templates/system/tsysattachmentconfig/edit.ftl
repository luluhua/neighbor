<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/system/tSysAttachmentConfig/doEdit"
    <#else>
      action="/system/tSysAttachmentConfig/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
<div class="box-body">
                                                                        <div class="form-group">
                    <label for="classify" class="col-sm-2 control-label">附件分类</label>
                    <div class="col-sm-10">
                        <input type="text" id="classify" name="classify"
                               value="${(entity.classify)!}" class="form-control" placeholder="请输入附件分类"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="classifyType" class="col-sm-2 control-label">可上传的附件类型</label>
                    <div class="col-sm-10">
                        <input type="text" id="classifyType" name="classifyType"
                               value="${(entity.classifyType)!}" class="form-control" placeholder="请输入可上传的附件类型"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                        <div class="form-group">
        <label class="col-sm-2 control-label">&nbsp;</label>
        <div class="col-sm-10">
            <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i> 提 交
            </button>
        </div>
    </div>
</div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>