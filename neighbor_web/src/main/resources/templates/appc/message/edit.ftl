<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tMessage/doEdit"
    <#else>
      action="/appc/tMessage/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
<div class="box-body">
                                                                        <div class="form-group">
                    <label for="sender" class="col-sm-2 control-label">sender</label>
                    <div class="col-sm-10">
                        <input type="text" id="sender" name="sender"
                               value="${(entity.sender)!}" class="form-control" placeholder="请输入sender"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">用户id</label>
                    <div class="col-sm-10">
                        <input type="text" id="userId" name="userId"
                               value="${(entity.userId)!}" class="form-control" placeholder="请输入用户id"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                                <div class="form-group">
                    <label for="type" class="col-sm-2 control-label">类型 0系统消息  1用户消息</label>
                    <div class="col-sm-10">
                        <input type="number" id="type" name="type"
                               value="${(entity.type)!}" class="form-control" placeholder="请输入类型 0系统消息  1用户消息"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                        <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-10">
                        <input type="text" id="title" name="title"
                               value="${(entity.title)!}" class="form-control" placeholder="请输入标题"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="content" class="col-sm-2 control-label">内容</label>
                    <div class="col-sm-10">
                        <input type="text" id="content" name="content"
                               value="${(entity.content)!}" class="form-control" placeholder="请输入内容"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="files" class="col-sm-2 control-label">附件 多个,隔开</label>
                    <div class="col-sm-10">
                        <input type="text" id="files" name="files"
                               value="${(entity.files)!}" class="form-control" placeholder="请输入附件 多个,隔开"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                                <div class="form-group">
                    <label for="status" class="col-sm-2 control-label">是否已读 0：未读 1：已读</label>
                    <div class="col-sm-10">
                        <input type="number" id="status" name="status"
                               value="${(entity.status)!}" class="form-control" placeholder="请输入是否已读 0：未读 1：已读"
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