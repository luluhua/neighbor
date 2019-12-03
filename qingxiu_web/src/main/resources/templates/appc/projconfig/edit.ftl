<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
       <#if (entity.id)??>action="/appc/tGovProjConfig/doEdit"<#else>action="/appc/tGovProjConfig/doAdd"</#if>>
    <div class="box-body">
        <input type="hidden" value="${(entity.formId)!}" name="formId"/>
        <input type="hidden" value="${(entity.projectId)!}" name="projectId"/>
        <input type="hidden" id="formName" name="formName" value="${(entity.formName)!}"/>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
        <#--<div class="form-group">-->
        <#--<label for="configName" class="col-sm-2 control-label">表单名称</label>-->
        <#--<div class="col-sm-10">-->
        <#--<input type="text" id="formName" name="formName" value="${(entity.formName)!}"-->
        <#--class="form-control input-select-200" placeholder="请输入表单名称" lay-verify="required"/>-->
        <#--</div>-->
        <#--</div>-->
        <div class="form-group">
            <label for="configType" class="col-sm-2 control-label">配置类型</label>
            <div class="col-sm-10">
                <select name="configSource" id="configSource" class="form-control input-select-200"
                        lay-verify="required" lay-ignore>
                    <option value="0"> --请选择配置类型--</option>
                    <@dictTag method="getDictListByType" type="config_source" >
                        <#list getDictListByType as m>
                        <option value="${(m.value)!}"
                                <#if "${(m.value)!}"=="${(entity.configSource)!}">selected</#if>> ${(m.label)!}</option>
                        </#list>
                    </@dictTag>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="configName" class="col-sm-2 control-label">字段名称<span
                    class="xing_red"> *</span>
            </label>
            <div class="col-sm-10">
                <input type="text" id="configName" name="configName" value="${(entity.configName)!}"
                       class="form-control" placeholder="请输入字段名称" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="configName" class="col-sm-2 control-label">字段关联</label>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-6">
                        <input type="hidden" id="defaultValueFieldTypeId" name="defaultValueFieldType"/>
                        <label for="" class=" control-label">关联表</label>
                        <select name="defaultValueTableId" class="form-control input-select-200"
                                     lay-ignore id="glbId">
                                <option value=""> --请选择关联表--</option>
                                <option value="t_app_user_idcard" <#if (entity.defaultValueTableId)??&&entity.defaultValueTableId=='t_app_user_idcard'>selected</#if>> --个人身份证信息表--</option>
                                <option value="t_app_user_address" <#if (entity.defaultValueTableId)??&&entity.defaultValueTableId=='t_app_user_address'>selected</#if>> --个人地址表--</option>
                                <option value="t_company_info" <#if (entity.defaultValueTableId)??&&entity.defaultValueTableId=='t_company_info'>selected</#if>> --企业信息表--</option>
                                <option value="t_company_bizlicense" <#if (entity.defaultValueTableId)??&&entity.defaultValueTableId=='t_company_bizlicense'>selected</#if>> --营业执照信息表--</option>
                                <option value="t_company_zzdmz" <#if (entity.defaultValueTableId)??&&entity.defaultValueTableId=='t_company_zzdmz'>selected</#if>> --企业组织代码证信息表--</option>
                                <option value="t_app_user_other_info" <#if (entity.defaultValueTableId)??&&entity.defaultValueTableId=='t_app_user_other_info'>selected</#if>> --个人其他信息表--</option>
                        </select>

                    </div>
                    <div class="col-sm-6">
                        <label for="" class="control-label">关联字段</label>
                            <select name="defaultValueField" class="form-control input-select-200"
                                     lay-ignore id="fieldsId">
                                <option value=""> --请选择关联字段--</option>
                            </select>

                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="configType" class="col-sm-2 control-label">字段类型</label>
            <div class="col-sm-10">
                <select name="configType" id="configType" class="form-control input-select-200"
                        lay-verify="required" lay-ignore>
                    <option value="0"> --请选择字段类型--</option>
                    <@dictTag method="getDictListByType" type="config_type" >
                        <#list getDictListByType as m>
                        <option value="${(m.value)!}"
                                <#if "${(m.value)!}"=="${(entity.configType)!}">selected</#if>> ${(m.label)!}</option>
                        </#list>
                    </@dictTag>
                </select>
            </div>
        </div>
        <div  id="dictKeyId" style="display: none;">
        <div class="form-group" >
            <label for="isEnabled" class="col-sm-2 control-label">字典</label>
            <div class="col-sm-10">
                <select name="dictKey" id="dictKey" class="form-control select2" lay-ignore
                        style="width: 100%;">
                    <option value=""> --请选择字典--</option>
                    <#if (getDictList)??>
                        <#list getDictList as m>
                            <#if (entity.dictKey)??>
                              <option value="${(m.type)!}"
                                <#if "${(m.type)!''}"=="${(entity.dictKey)!''}">selected</#if>> ${(m.remark)!}</option>
                            <#else>
                               <option value="${(m.type)!}"> ${(m.remark)!}</option>
                            </#if>
                        </#list>
                    </#if>
                </select>

            </div>
        </div>
        <div class="form-group">
            <label for="dictType" class="col-sm-2 control-label">字典類型<span
                    class="xing_red"> *</span>
            </label>
            <div class="col-sm-10">
                <select name="dictType" id="dictType" class="form-control" lay-ignore>
                    <#if (entity.dictType)?? >
                        <option value="0" <#if entity.dictType==0>selected</#if> > --单选--</option>
                        <option value="1" <#if entity.dictType==1>selected</#if> > --多选--</option>
                    <#else>
                        <option value="0"  > --单选--</option>
                        <option value="1" > --多选--</option>
                    </#if>

                </select>
            </div>
        </div>
        </div>
        <div class="form-group">
            <label for="isEnabled" class="col-sm-2 control-label">最大数量<span
                    class="xing_red"> *</span>
            </label>
            <div class="col-sm-10">
                <input type="number" id="maxLength" name="maxLength" value="${(entity.maxLength)!}"
                       class="form-control input-select-200" placeholder="请输入" lay-verify="required"/>
                <p class="helpock ts-color">请输入字符串最大长度或图片最大数量</p>
            </div>
        </div>
        <div class="form-group">
            <label for="isEnabled" class="col-sm-2 control-label">字段提示说明</label>
            <div class="col-sm-10">
                <input type="text" id="hint" name="hint" value="${(entity.hint)!}"
                       class="form-control input-select-200" placeholder="请输入字段提示说明" />
            </div>
        </div>
        <div class="form-group">
            <label for="isMust" class="col-sm-2 control-label">是否必填</label>
            <div class="col-sm-10">
                <@dictTag method="getDictListByType" type="is_must" >
                    <#list getDictListByType as m>
                         <label>
                             <input name="isMust" type="radio" class="minimal"
                                    <#if "${(m.value)!}"=="${(entity.isMust)!}">checked</#if> value="${(m.value)!}"
                                    lay-ignore> ${(m.label)!}
                         </label>
                    </#list>
                </@dictTag>
            </div>
        </div>

        <div class="form-group">
            <label for="isEnabled" class="col-sm-2 control-label">是否启用</label>
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
            <label for="sortIndex" class="col-sm-2 control-label">排序</label>
            <div class="col-sm-10">
                <input type="number" id="sortIndex" name="sortIndex" <#if (entity.id)??>
                       value="${(entity.sortIndex)!}" <#else>value="${sortIndex!1}" </#if>
                       class="form-control input-number-100"
                       placeholder="请输入排序（越大越前）"/>
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
<script type="application/javascript">
    var _configType='${(entity.dictKey)!''}';
    if(_configType!=''){
        $("#dictKeyId").show();
    }
    $("#configType").change(function () {
        var _id=$("#configType").val();
        if(_id==5){
            $("#dictKeyId").show();
        }else{
            $("#dictKeyId").hide();
            $("#dictKey").val("");
        }
    });

    var _defaultValueTableId='${(entity.defaultValueTableId)!''}';
    if(_defaultValueTableId!=''){
        _getField(_defaultValueTableId);

    }
    $("#glbId").change(function () {
        var _id=$("#glbId").val();
        _getField(_id);

    })

    var _defaultValueField='${(entity.defaultValueField)!''}';

    function _getField(_var){
        $("#fieldsId").empty();
        $.post("/appc/tGovProjConfig/getField", {tables: _var},
                function (json) {
                    console.log(json.data);
                    if (json.code == 200) {
                        var bd="";
                        var _type="";
                        $.each(json.data, function (i, item) {
                            if(_defaultValueField!=''&&item.key==_defaultValueField){
                                bd= "<option value='"+item.key+"'  selected title='"+item.fieldType+"'> "+item.title+"</option>";
                                _type=item.fieldType;
                            }else{
                                bd= "<option value='"+item.key+"' title='"+item.fieldType+"'  > "+item.title+"</option>";
                            }
                            $("#fieldsId").append(bd);

                        })
                        $("#defaultValueFieldTypeId").val(_type);
                    } else {
                        $.alert({
                            title: '提示',
                            content: json.msg,
                            buttons: {"好的": {btnClass: 'btn-blue'}}
                        });
                    }
                });
    }
    $("#fieldsId").change(function () {
       var _fieldType= $("#fieldsId").find("option:selected").attr("title");
       $("#defaultValueFieldTypeId").val(_fieldType);
    })

</script>
</@footer>