<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" onkeydown="if(event.keyCode==13)return false;"
    <#if (entity.id)??>
      action="/appc/oauthClients/doEdit"
    <#else>
      action="/appc/oauthClients/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
<div class="box-body">

    <div class="form-group">
        <label for="scope" class="col-sm-2 control-label">提供商</label>
        <div class="col-sm-10">
            <input type="text" id="applicationProvider" name="applicationProvider"
                   value="${(entity.applicationProvider)!}" class="form-control" placeholder="请输入提供商名称"
                   lay-verify="required"/>
        </div>
    </div>
    <div class="form-group">
        <label for="registeredRedirectUri" class="col-sm-2 control-label">回调地址</label>
        <div class="col-sm-10">
            <input type="text" id="registeredRedirectUri" name="registeredRedirectUri"
                   value="${(entity.registeredRedirectUri)!}" class="form-control" placeholder="请输入回调地址"
                   lay-verify="required"/>
        </div>
    </div>
     <#if (entity.id)??>
              <div class="form-group">
                  <label for="clientId" class="col-sm-2 control-label">APPID</label>
                  <div class="col-sm-10">
                      <input type="text" id="clientId" name="clientId"
                             value="${(entity.clientId)!}" class="form-control" placeholder="请输入clientId"
                             readonly/>
                  </div>
              </div>
     <#--<div class="form-group">-->
     <#--<label for="resourceIds" class="col-sm-2 control-label">resourceIds</label>-->
     <#--<div class="col-sm-10">-->
     <#--<input type="text" id="resourceIds" name="resourceIds"-->
     <#--value="${(entity.resourceIds)!}" class="form-control" placeholder="请输入resourceIds"-->
     <#--readonly/>-->
     <#--</div>-->
     <#--</div>-->
      <div class="form-group">
          <label for="clientSecret" class="col-sm-2 control-label">APPSecret</label>
          <div class="col-sm-10">
              <input type="text"
                     value="${(entity.clientSecretPlaintext)!}" class="form-control" placeholder="请输入clientSecret"
                     readonly/>
          </div>
      </div>
     </#if>
         <div class="form-group">
                    <label for="scope" class="col-sm-2 control-label">授权范围</label>
                    <div class="col-sm-10">
                        <#--<select name="scope" class="form-control select2 input-select-200" lay-verify="required"-->
                                <#--lay-ignore>-->
                            <input type="hidden" id="scopesId" name="scope" value="${(entity.scope)!}">
                         <@dictTag method="getDictListByType" type="oauth_scope" >
                             <#list getDictListByType as m>
                                <label><input type="checkbox" id="checkbox_${(m.value)!}" name="scopeString" class="minimal" value="${(m.value)!}"
                                              lay-ignore>${(m.label)!}</label>&nbsp;
                             </#list>
                         </@dictTag>
                        <#--</select>-->
                    </div>
                </div>
    <div class="form-group">
        <label for="resourceString" class="col-sm-2 control-label">授权内容</label>
        <div class="col-sm-10">
            <input type="hidden" id="resourcesId" name="resources" value="${(entity.resources)!}">
                        <@dictTag method="getDictListByType" type="oauth_resource" >
                            <#list getDictListByType as m>
                            <label><input type="checkbox" id="checkbox_${(m.value)!}" name="resourceString" class="minimal" value="${(m.value)!}"
                                          lay-ignore>${(m.label)!}</label>&nbsp;
                            </#list>
                        </@dictTag>
                    </div>
            </div>
                <div class="form-group">
                    <label for="authorizedGrantTypes" class="col-sm-2 control-label">授权方式</label>
                    <div class="col-sm-10">
                        <#--<input type="text" id="authorizedGrantTypes" name="authorizedGrantTypes"-->
                               <#--value="${(entity.authorizedGrantTypes)!}" class="form-control" placeholder="请输入授权方式"-->
                               <#--lay-verify="required"/>-->
                            <input type="hidden" id="authorizedGrantTypesId" name="authorizedGrantTypes" value="${(entity.authorizedGrantTypes)!}">
                         <@dictTag method="getDictListByType" type="oauth_grant_type" >
                             <#list getDictListByType as m>
                            <label><input type="checkbox" id="checkbox_${(m.value)!}" name="authorizedGrantTypesString" class="minimal" value="${(m.value)!}"
                                          lay-ignore>${(m.label)!}</label>&nbsp;
                             </#list>
                         </@dictTag>
                    </div>
                </div>

                <div class="form-group">
                    <label for="authorities" class="col-sm-2 control-label">授权角色</label>
                    <div class="col-sm-10">
                        <#--<input type="text" id="authorities" name="authorities"-->
                               <#--value="${(entity.authorities)!}" class="form-control" placeholder="请输入authorities"-->
                               <#--lay-verify="required"/>-->

                        <select name="authorities" class="form-control select2 input-select-200" lay-verify="required"
                                lay-ignore>
                         <@dictTag method="getDictListByType" type="oauth_role" >
                             <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                        <#if "${(m.value)!}"=="${(entity.authorities)!}">selected</#if>
                                                >${(m.label)!}</option>
                             </#list>
                         </@dictTag>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="accessTokenValiditySeconds" class="col-sm-2 control-label">AccessToken过期时间(单位：秒)</label>
                    <div class="col-sm-10">
                        <input type="number" id="accessTokenValiditySeconds" name="accessTokenValiditySeconds"
                               value="${(entity.accessTokenValiditySeconds)!}" class="form-control" placeholder="请输入accessTokenValiditySeconds"
                               lay-verify="required"/>
                    </div>
                </div>
                  <div class="form-group">
                    <label for="refreshTokenValiditySeconds" class="col-sm-2 control-label">刷新AccessToken时间(单位：秒)</label>
                    <div class="col-sm-10">
                        <input type="number" id="refreshTokenValiditySeconds" name="refreshTokenValiditySeconds"
                               value="${(entity.refreshTokenValiditySeconds)!}" class="form-control" placeholder="请输入refreshTokenValiditySeconds"
                               lay-verify="required"/>
                    </div>
                </div>

                 <#--<div class="form-group">-->
                    <#--<label for="verifyDomainName" class="col-sm-2 control-label">是否开启域名验证</label>-->
                    <#--<div class="col-sm-10">-->
                        <#--<label>-->
                            <#--<input name="verifyDomainName" type="radio" class="minimal"-->
                                   <#--value="1" ${((entity.verifyDomainName)?? && entity.verifyDomainName == true)?string('checked','')} lay-ignore> 开启-->
                        <#--</label>-->
                        <#--<label>-->
                            <#--<input name="verifyDomainName" type="radio" class="minimal"-->
                                   <#--value="0" ${((entity.verifyDomainName)?? && entity.verifyDomainName == false)?string('checked','')} lay-ignore> 不开启-->
                        <#--</label>-->
                    <#--</div>-->
                <#--</div>-->
    <div class="form-group">
        <label for="verifyDomainName" class="col-sm-2 control-label">是否开启IP验证</label>
        <div class="col-sm-10">
            <label>
                <input name="verifyIp" type="radio" class="minimal"
                       value="1" ${((entity.verifyIp)?? && entity.verifyIp == true)?string('checked','')} lay-ignore> 开启
            </label>
            <label>
                <input name="verifyIp" type="radio" class="minimal"
                       value="0" ${((entity.verifyIp)?? && entity.verifyIp == false)?string('checked','')} lay-ignore> 不开启
            </label>
        </div>
    </div>
    <div class="form-group">
        <label for="requestip" class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <textarea id="requestipListView" class="requestipListValue"name="requestip"></textarea>
            提示：可填写多个
        </div>
    </div>
          <div class="form-group">
        <label class="col-sm-2 control-label">&nbsp;</label>
        <div class="col-sm-10">
            <button type="submit" class="btn btn-success" id="submitBtn" lay-submit lay-filter="submit"><i class="fa fa-save"></i> 提 交
            </button>
        </div>
    </div>
</div><!-- /.box-body -->
</form>
</@body>
<@footer>
<script>
    var resources='${(entity.resources)!}';
    if(resources!=''){
        console.log(resources);
        var _resources=resources.split(",");
        if(_resources.length>0){
            for(var i=0;i<_resources.length;i++){
                $("#checkbox_"+_resources[i]).attr("checked","checked");
            }
        }
    }
    var authorizedGrantTypes='${(entity.authorizedGrantTypes)!}';
    if(authorizedGrantTypes!=''){
        var _authorizedGrantTypes=authorizedGrantTypes.split(",");
        if(_authorizedGrantTypes.length>0){
            for(var i=0;i<_authorizedGrantTypes.length;i++){
                $("#checkbox_"+_authorizedGrantTypes[i]).attr("checked","checked");
            }
        }
    }
    var scopes='${(entity.scope)!}';
    if(scopes!=''){
        var _scopess=scopes.split(",");
        if(_scopess.length>0){
            for(var i=0;i<_scopess.length;i++){
                $("#checkbox_"+_scopess[i]).attr("checked","checked");
            }
        }
    }

    //批量处理
    $("#submitBtn").on("click", function () {
        var str = "";
        $("input[name='resourceString']:checked").each(function (index, item) {
            if ($("input[name='resourceString']:checked").length-1==index) {
                str += $(this).val();
            } else {
                str += $(this).val() + ",";
            }
        });
        $("#resourcesId").val(str);

        var str2 = "";
        $("input[name='authorizedGrantTypesString']:checked").each(function (index, item) {
            if ($("input[name='authorizedGrantTypesString']:checked").length-1==index) {
                str2 += $(this).val();
            } else {
                str2 += $(this).val() + ",";
            }
        });
        $("#authorizedGrantTypesId").val(str2);

        var str3 = "";
        $("input[name='scopeString']:checked").each(function (index, item) {
            if ($("input[name='scopeString']:checked").length-1==index) {
                str3 += $(this).val();
            } else {
                str3 += $(this).val() + ",";
            }
        });
        $("#scopesId").val(str3);

    });

    $(function () {
            var requestIpList="${entity.requestip!}";
            if (requestIpList != null&& requestIpList!="") {
                $(".requestipListValue").html(requestIpList);
                $(".requestipListValue").tagEditor({
                    placeholder: '添加IP后按Enter',
                    val: requestIpList,
                });
            } else {
                $(".requestipListValue").tagEditor({
                    placeholder: '添加IP后按Enter',
                });
            }

        })

</script>
</@footer>