<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/commodity/tGoodsParameter/doEdit"
    <#else>
      action="/commodity/tGoodsParameter/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
<div class="box-body">
                                                                        <div class="form-group">
                    <label for="goods Id" class="col-sm-2 control-label">物品id</label>
                    <div class="col-sm-10">
                        <input type="text" id="goods Id" name="goods Id"
                               value="${(entity.goods Id)!}" class="form-control" placeholder="请输入物品id"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="keyName" class="col-sm-2 control-label">参数名称</label>
                    <div class="col-sm-10">
                        <input type="text" id="keyName" name="keyName"
                               value="${(entity.keyName)!}" class="form-control" placeholder="请输入参数名称"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="valueName" class="col-sm-2 control-label">说明</label>
                    <div class="col-sm-10">
                        <input type="text" id="valueName" name="valueName"
                               value="${(entity.valueName)!}" class="form-control" placeholder="请输入说明"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="sortIndex" class="col-sm-2 control-label">排序</label>
                    <div class="col-sm-10">
                        <input type="text" id="sortIndex" name="sortIndex"
                               value="${(entity.sortIndex)!}" class="form-control" placeholder="请输入排序"
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