<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <form role="form" id="formId"  class="form-horizontal layui-form layui-form-pane " >
        <input type="hidden" name="moduleId" value="${(dictGroup.id)!''}">
        <input type="hidden" name="labelAs" value="" id="labelAId">
        <input type="hidden" name="valueAs" value="" id="valueAId">
        <div class="box-body">
            <#--<#if dictGroup.type=="jcsx">-->
            <#--<div class="form-group">-->
                <#--<label for="code" class="col-sm-2 control-label">基础事项</label>-->
                <#--<div class="col-sm-10">-->
                    <#--<select name="projectId" class="form-control select2" style="width: 100%;"-->
                            <#--lay-verify="required"  lay-ignore>-->
                        <#--<option value="">--请选择事项--</option>-->
                                <#--<#list projectList as m>&ndash;&gt;-->
                                       <#--<option value="#{(m.id)!}">${(m.projectTitle)!}</option>-->
                                <#--</#list>-->
                    <#--</select>-->
                <#--</div>-->
            <#--</div>-->
            <#--</#if>-->
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">字典分组</label>
                <div class="col-sm-10">
                    ${(dictGroup.label)!''}
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">字典代码<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="code" name="code" class="form-control input-select-200" lay-verify="required"
                           value="${(dict.code)!}"
                           placeholder="请输入字典代码">
                    <p class="helpock ts-color">* 唯一</p>
                </div>
            </div>
            <div class="form-group">
                <label for="type " class="col-sm-2 control-label">字典标识<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="type" name="type" class="form-control input-select-200" lay-verify="required"
                           value="${(dict.type)!}"
                           placeholder="请输入字典标识">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">字典标签<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="label" class=" control-label">标签名</label>
                            <input type="text"  name="labelA" class="form-control " lay-verify="required"
                                   value="${(dict.label)!}"
                                   placeholder="请输入标签名称">
                        </div>
                        <div class="col-sm-6">
                            <label for="value" class=" control-label">标签值</label>
                            <input type="text"  name="valueA" class="form-control " lay-verify="required"
                                   value="${(dict.value)!}"
                                   placeholder="请输入标签值">

                        </div>
                    </div>
                    <div id="adddivId"></div>
                    <a  style="margin-top: 10px;" class="layui-btn layui-btn-xs " id="onaddtable">添加标签</a>
                </div>
            </div>

            <div class="form-group">
                <label for="sortIndex" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="sortIndex" name="sortIndex" class="form-control input-select-200" lay-verify="required"
                           value="10"
                           placeholder="请输入排序编号">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">字典描述</label>
                <div class="col-sm-10">
          <textarea class="form-control" name="remark" rows="3" placeholder="请输入描述，最多300个字符 ..." >${(dict.remark)!}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button type="button" class="btn btn-success" onclick="onsub();"><i class="fa fa-save"></i>  提 交</button>
                </div>
            </div>
        </div>
    </form>
</@body>
<@footer>
<script type="application/javascript">
    var _vaid=0;
    $("#onaddtable").click(function () {
        _vaid++;
        var _html="";
        _html=" <div class=\"row\" id=\"row_"+_vaid+"\">" +
                "                        <div class=\"col-sm-6\">" +
                "                            <label for=\"label\" class=\" control-label\">标签名</label>" +
                "                            <input type=\"text\" id=\"label\" name=\"labelA\" class=\"form-control \" lay-verify=\"required\"" +
                "                                   value=\"\"placeholder=\"请输入标签名称\">" +
                "                        </div>" +
                "                        <div class=\"col-sm-6\">" +
                "                            <label for=\"value\" class=\" control-label\">标签值</label>" +
                "                            <input type=\"text\" id=\"value\" name=\"valueA\" class=\"form-control \" lay-verify=\"required\"" +
                "                                   value=\"\"" +
                "                                   placeholder=\"请输入标签值\">" +
                "    <a  style=\"margin-top: 10px;\" class=\"layui-btn layui-btn-xs \" onclick=\"ondel("+_vaid+");\">删除</a>"+
                "                        </div>" +
                "                    </div>";
        $("#adddivId").append(_html);

    })
function ondel(_id) {
    $("#row_"+_id).remove();
}
function af() {
    var labelAs=[];
    $(".row").find("input[name='labelA']").each(function(){
        if($(this).val()!=""){
            labelAs.push($(this).val());
        }

    })
    $("#labelAId").val(labelAs);
    var valueAs=[];
    $(".row").find("input[name='valueA']").each(function(){
        if($(this).val()!="") {
            valueAs.push($(this).val());
        }{}
    })
    $("#valueAId").val(valueAs);
}

function onsub(){
    af();
    var data = $("#formId").serializeArray();
    $.post("/tSysDict/dict/doAddBatch",data,function(json){
        if(json.code==200){
            window.parent.location.reload();//刷新父页面
            x_admin_close();
        }else{
            $.alert({
                title: '提示',
                content: json.msg,
                buttons:{"好的":{ btnClass: 'btn-blue'}}
            });
        }
    });

    // $("#formId").submit();
    // return true;
}
</script>
</@footer>