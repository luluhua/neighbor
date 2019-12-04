<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tLjUserAddress/doEdit"
    <#else>
      action="/appc/tLjUserAddress/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
<div class="box-body">
                                                                        <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">用户Id</label>
                    <div class="col-sm-10">
                        <input type="text" id="userId" name="userId"
                               value="${(entity.userId)!}" class="form-control" placeholder="请输入用户Id"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="province" class="col-sm-2 control-label">省份</label>
                    <div class="col-sm-10">
                        <input type="text" id="province" name="province"
                               value="${(entity.province)!}" class="form-control" placeholder="请输入省份"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">城市</label>
                    <div class="col-sm-10">
                        <input type="text" id="city" name="city"
                               value="${(entity.city)!}" class="form-control" placeholder="请输入城市"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="region" class="col-sm-2 control-label">区域</label>
                    <div class="col-sm-10">
                        <input type="text" id="region" name="region"
                               value="${(entity.region)!}" class="form-control" placeholder="请输入区域"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="detailedAddress" class="col-sm-2 control-label">详细地址</label>
                    <div class="col-sm-10">
                        <input type="text" id="detailedAddress" name="detailedAddress"
                               value="${(entity.detailedAddress)!}" class="form-control" placeholder="请输入详细地址"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                                <div class="form-group">
                    <label for="state" class="col-sm-2 control-label">是否删除 0:默认</label>
                    <div class="col-sm-10">
                        <input type="number" id="state" name="state"
                               value="${(entity.state)!}" class="form-control" placeholder="请输入是否删除 0:默认"
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