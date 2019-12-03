<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tAppAuthorizationApplication/doEdit"
    <#else>
      action="/appc/tAppAuthorizationApplication/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
                    <label for="appName" class="col-sm-2 control-label">应用名称</label>
                    <div class="col-sm-10">
                        <input type="text" id="appName" name="appName"
                               value="${(entity.appName)!}" class="form-control" placeholder="请输入应用名称"
                               lay-verify="required"/>
                    </div>
                </div>
    <div class="form-group">
                    <label for="appCompany" class="col-sm-2 control-label">应用公司</label>
                    <div class="col-sm-10">
                        <input type="text" id="appCompany" name="appCompany"
                               value="${(entity.appCompany)!}" class="form-control" placeholder="请输入应用公司"
                               lay-verify="required"/>
                    </div>
                </div>
    <#if (entity.id)??>
        <div class="form-group">
            <label for="appSecret" class="col-sm-2 control-label">appSecret</label>
            <div class="col-sm-10">
                <input type="text" id="appSecret" name="appSecret"
                       value="${(entity.appSecret)!}" class="form-control" placeholder="请输入appSecret"
                       readonly/>
            </div>
        </div>
        <div class="form-group">
            <label for="appId" class="col-sm-2 control-label">appId</label>
            <div class="col-sm-10">
                <input type="text" id="appId" name="appId"
                       value="${(entity.appId)!}" class="form-control" placeholder="请输入appId"
                       readonly/>
            </div>
        </div>
    </#if>
                                                                                                                                <div class="form-group">
                    <label for="isEnabled" class="col-sm-2 control-label">是否启用</label>
                    <div class="col-sm-10">
                        <#if (entity.isEnabled)??>
                            <label>
                                <input name="isEnabled" type="radio" class="minimal"
                                       value="1" ${(entity.isEnabled ==1)?string('checked','')} lay-ignore> 启用
                            </label>
                            <label>
                                <input name="isEnabled" type="radio" class="minimal"
                                       value="0" ${(entity.isEnabled == 0)?string('checked','')} lay-ignore> 禁用
                            </label>
                        <#else >
                            <label>
                                <input name="isEnabled" type="radio" class="minimal"
                                       value="1" checked lay-ignore> 启用
                            </label>
                            <label>
                                <input name="isEnabled" type="radio" class="minimal"
                                       value="0" lay-ignore> 禁用
                            </label>
                        </#if>

                    </div>
                </div>
                                                                                                        <div class="form-group">
                    <label for="legalDomainName" class="col-sm-2 control-label">合法域名</label>
                    <div class="col-sm-10">
                        <input type="text" id="legalDomainName" name="legalDomainName"
                               value="${(entity.legalDomainName)!}" class="form-control" placeholder="请输入合法域名"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="callbackUrl" class="col-sm-2 control-label">回调地址</label>
                    <div class="col-sm-10">
                        <textarea name="callbackUrl" cols="80" rows="100"
                                  style="height:100px;">${(entity.callbackUrl)!}</textarea>
                    </div>
                </div>
    <div class="form-group">
        <label for="remark" class="col-sm-2 control-label">备注</label>
        <div class="col-sm-10">
                        <textarea name="remark" cols="80" rows="100"
                                  style="height:100px;">${(entity.remark)!}</textarea>
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