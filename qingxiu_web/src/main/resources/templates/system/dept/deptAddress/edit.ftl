<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/system/tSysOrgAddress/doEdit"
    <#else>
      action="/system/tSysOrgAddress/doAdd"
    </#if>
>
    <input type="hidden" name="orgId" value="${(dept.id)!}">
    <input id="lngId" type="hidden" name="lng" value="${(dept.lng)!}">
    <input id="latId" type="hidden" name="lat" value="${(dept.lat)!}">
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
        <div class="box-body">
                 <div class="form-group">
                    <label for="orgId" class="col-sm-2 control-label">部门名称</label>
                    <div class="col-sm-10 line-height-35">
                        ${(dept.name)!}
                    </div>
                </div>
                 <div class="form-group">
                    <label for="address" class="col-sm-2 control-label">地址<span class="xing_red"> *</span></label>
                    <div class="col-sm-10">
                        <input type="text" id="address"  name="address"
                               value="${(entity.address)!}" class="form-control dialog_param" placeholder="请输入地址"
                               lay-verify="required"
                               data-title="选择地址"
                               data-url="/toMap" data-par="${(entity.lng?c)!},${(entity.lat?c)!}"
                                ,data-width="300" data-height="400" readonly/>

                    </div>
                </div>
                <div class="form-group">
                    <label for="mobile" class="col-sm-2 control-label">联系电话<span class="xing_red"> *</span></label>
                    <div class="col-sm-10">
                        <input type="text" id="mobile" name="mobile"
                               value="${(entity.mobile)!}" class="form-control input-select-200" placeholder="请输入联系电话"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                                                                                                                                                                                                    <div class="form-group">
                    <label for="busRoute" class="col-sm-2 control-label">公交路线</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="busRoute" rows="3"  placeholder="请输入公交路线">${(entity.busRoute?trim)!}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="officeHours" class="col-sm-2 control-label">办公时间</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="officeHours" rows="3" placeholder="请输入办公时间">${(entity.officeHours)!}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="officeWindow" class="col-sm-2 control-label">办理窗口</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="officeWindow" rows="3" placeholder="请输入办理窗口">${(entity.officeWindow)!}</textarea>
                    </div>
                </div>
    <div class="form-group">
        <label for="status" class="col-sm-2 control-label">是否启用:</label>
        <div class="col-sm-10">
            <label>
                <input name="isEnabled" type="radio" class="minimal" checked value="1" lay-ignore> 启用
            </label>
            <label>
                <input name="isEnabled" type="radio" class="minimal" value="0" lay-ignore> 禁用
            </label>
        </div>
    </div>
    <div class="form-group">
        <label for="remark" class="col-sm-2 control-label">备注</label>
        <div class="col-sm-10">
            <textarea class="form-control" name="remark" rows="3" placeholder="请输入备注">${(entity.remark)!}</textarea>
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