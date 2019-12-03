<#include "../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/push/template/save">
    <div class="box-body">
        <input type="hidden" name="id" value="${(entity.id)!}" />
        <input type="hidden" name="versionNo" value="${(entity.versionNo)!}" />
        <div class="form-group">
            <label for="label"  class="col-sm-2 control-label">模板名称<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="label" name="label" value="${(entity.label)!}" class="form-control" placeholder="请输入模板名称" maxlength="25" lay-verify="required">
            </div>
        </div>
        <div class="form-group">
            <label for="coded"  class="col-sm-2 control-label">模板编号<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="coded" name="coded" value="${(entity.coded)!}" class="form-control" placeholder="请输入模板编号" maxlength="64" lay-verify="required">
            </div>
        </div>
        <div class="form-group">
            <label for="pid"  class="col-sm-2 control-label">app导航<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <select  name="actionId" class="form-control select2" style="width: 100%;" lay-ignore>
                    <option value="0">无动作</option>
                    <#list treeList as item>
                        <option value="${(item.id)!}" <#if (item.id==entity.actionId)>selected</#if>>
                            ${(item.navigates)!}
                        </option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">通知优先级</label>
            <div class="col-sm-10">
                <select  name="priority" class="form-control select2" style="width: 100%;" lay-ignore>
                    <option value="1" <#if (entity.priority==1)>selected</#if>>1 高</option>
                    <option value="2" <#if (entity.priority==2)>selected</#if>>2</option>
                    <option value="3" <#if (entity.priority==3)>selected</#if>>3 中</option>
                    <option value="4" <#if (entity.priority==4)>selected</#if>>4</option>
                    <option value="5" <#if (entity.priority==5)>selected</#if>>5 低</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="title"  class="col-sm-2 control-label">通知标题<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="title" name="title" value="${(entity.title)!}" class="form-control" placeholder="请输入通知标题" maxlength="25" lay-verify="required">
            </div>
        </div>
        <div class="form-group">
            <label for="content"  class="col-sm-2 control-label">通知内容<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="content" name="content" value="${(entity.content)!}" class="form-control" placeholder="请输入通知内容" maxlength="100" lay-verify="required">
            </div>
        </div>

        <div class="form-group">
            <label for="remarks"  class="col-sm-2 control-label">模板备注</label>
            <div class="col-sm-10">
                <input type="text" id="remarks" name="remarks" value="${(entity.remarks)!}" class="form-control" maxlength="100">
            </div>
        </div>



        <div class="form-group">
            <label   class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
                <a  class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i class="fa fa-close"></i>  取消</a>
            </div>
        </div>
    </div>
</form>
</@body>
<@footer>
</@footer>