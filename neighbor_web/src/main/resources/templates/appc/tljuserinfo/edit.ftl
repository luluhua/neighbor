<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tLjUserInfo/doEdit"
    <#else>
      action="/appc/tLjUserInfo/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
<div class="box-body">
                                                                        <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">用户表id</label>
                    <div class="col-sm-10">
                        <input type="text" id="userId" name="userId"
                               value="${(entity.userId)!}" class="form-control" placeholder="请输入用户表id"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="nickname" class="col-sm-2 control-label">昵称</label>
                    <div class="col-sm-10">
                        <input type="text" id="nickname" name="nickname"
                               value="${(entity.nickname)!}" class="form-control" placeholder="请输入昵称"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-10">
                        <input type="text" id="email" name="email"
                               value="${(entity.email)!}" class="form-control" placeholder="请输入邮箱"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                                <div class="form-group">
                    <label for="gender" class="col-sm-2 control-label">0:未填写，1：男，2：女</label>
                    <div class="col-sm-10">
                        <input type="number" id="gender" name="gender"
                               value="${(entity.gender)!}" class="form-control" placeholder="请输入0:未填写，1：男，2：女"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                        <div class="form-group">
                    <label for="avatarUrl" class="col-sm-2 control-label">头像</label>
                    <div class="col-sm-10">
                        <input type="text" id="avatarUrl" name="avatarUrl"
                               value="${(entity.avatarUrl)!}" class="form-control" placeholder="请输入头像"
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