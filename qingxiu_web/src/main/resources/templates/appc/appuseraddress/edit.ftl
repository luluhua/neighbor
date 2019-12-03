<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/appUserAddress/doEdit"
    <#else>
      action="/appc/appUserAddress/doAdd"
    </#if>
>
    <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label  class="col-sm-2 control-label">地址名称</label>
            <div class="col-sm-10">
                <input type="text" id="addressName" name="addressName"
                       value="${(entity.addressName)!}" class="form-control" placeholder="请输入地址名称" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">联系人<span class="xing_red">*</span></label>
            <div class="col-sm-10">
                <input type="text" id="contactName" name="contactName"
                       value="${(entity.contactPhone)!}" class="form-control" placeholder="请输入联系人"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">联系人电话<span class="xing_red">*</span></label>
            <div class="col-sm-10">
                <input type="text" id="contactPhone" name="contactPhone"
                       value="${(entity.contactPhone)!}" class="form-control" placeholder="请输入联系人电话"
                       lay-verify="required"/>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">行政区域</label>
            <input type="hidden" id="cityId"  name="cityId" value="${(entity.cityId)!}">
            <div class="col-sm-10">
                <select id="xzqhId4"   class="form-control select2 input-select-200"
                        lay-ignore>
                    <option value="">--省--</option>
                    <#list provinceSysCityList as p>
                        <option value="#{(p.id)!}" <#if "${(p.id)!}"=="${(currentProvince.id)!}">selected="selected"</#if> >${(p.name)!}</option>
                    </#list>
                </select>
                <select id="xzqhId5"   class="form-control select2 input-select-200"
                        lay-ignore>
                    <option value="">--市--</option>
                    <#list citySysCityList as c>
                        <option value="#{(c.id)!}" <#if "${(c.id)!}"=="${(currentCity.id)!}">selected="selected"</#if> >${(c.name)!}</option>
                    </#list>
                </select>
                <select id="xzqhId"   class="form-control select2 input-select-200"  lay-verify="required"
                        lay-ignore>
                    <option value="">--县（区）--</option>
                    <#list areaSysCityList as a>
                        <option value="#{(a.id)!}" <#if "${(a.id)!}"=="${(currentArea.id)!}">selected="selected"</#if> >${(a.name)!}</option>
                    </#list>
                </select>
                <span class="xing_red">*</span>
            </div>
        </div>

        <div class="form-group">
            <label for="addressDetail" class="col-sm-2 control-label">详细地址</label>
            <div class="col-sm-10">
                <input type="text" id="addressDetail" name="addressDetail"
                       value="${(entity.addressDetail)!}" class="form-control" placeholder="请输入详细地址"
                       lay-verify="required"/>
            </div>
        </div>

        <div class="form-group">
            <label for="userId" class="col-sm-2 control-label">用户id<span class="xing_red">*</span></label>
            <div class="col-sm-10">
                <select name="userId"  class="form-control select2 input-select-200" lay-ignore
                        lay-verify="required" >
                    <option value="">请选择</option>
                <#list tAppUserList as u>
                       <option value="#{(u.id)!}" ${(u.id==entity.userId)?string('selected="selected"','')}>${(u.username)!}</option>
                </#list>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="isDefault" class="col-sm-2 control-label">是否默认</label>
            <div class="col-sm-10">
                <label>
                    <input name="isDefault" type="radio" class="minimal"  value="1" lay-ignore> 是
                </label>
                <label>
                    <input name="isDefault" type="radio" class="minimal" value="0" lay-ignore checked> 否
                </label>
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
    <script type="application/javascript">
        var city_url="/system/sysCity/getCityByPid";
        $("#xzqhId4").change(function(){
            var cityId=$("#xzqhId4").val();
            //获取市区列表
            $.post(city_url,{pid:cityId},function(json){
                if(json.code==200){
                    $("#xzqhId5").empty();
                    $("#xzqhId").empty();
                    $("#xzqhId5").append("<option value='' selected>--请选择市-</option>");
                    $.each(json.data, function(i, item){
                        $("#xzqhId5").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                    })
                    $("#xzqhId")
                }else{
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons:{"好的":{ btnClass: 'btn-blue'}}
                    });
                }
            });
        })
        $("#xzqhId5").change(function(){
            var cityId=$("#xzqhId5").val();
            //获取县区列表
            $.post(city_url,{pid:cityId},function(json){
                if(json.code==200){
                    $("#xzqhId").empty();
                    $("#xzqhId").append("<option value='' selected>--县（区）-</option>");
                    $.each(json.data, function(i, item){
                        $("#xzqhId").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                    })
                }else{
                    $.alert({
                        title: '提示',
                        content: json.msg,
                        buttons:{"好的":{ btnClass: 'btn-blue'}}
                    });
                }
            });
        })
        $("#xzqhId").change(function(){
            var cityId=$("#xzqhId").val();
            $("#cityId").val(cityId);
        })
    </script>
</@footer>