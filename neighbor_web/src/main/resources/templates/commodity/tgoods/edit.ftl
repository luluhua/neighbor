<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/commodity/tGoods/doEdit"
    <#else>
      action="/commodity/tGoods/doAdd"
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
            <label for="name" class="col-sm-2 control-label">物品名称</label>
            <div class="col-sm-10">
                <input type="text" id="name" name="name"
                       value="${(entity.name)!}" class="form-control" placeholder="请输入物品名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="describe" class="col-sm-2 control-label">描述</label>
            <div class="col-sm-10">
                <input type="text" id="describe" name="describe"
                       value="${(entity.describe)!}" class="form-control" placeholder="请输入描述"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="quantity" class="col-sm-2 control-label">数量</label>
            <div class="col-sm-10">
                <input type="number" id="quantity" name="quantity"
                       value="${(entity.quantity)!}" class="form-control" placeholder="请输入数量"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="specification" class="col-sm-2 control-label">规格</label>
            <div class="col-sm-10">
                <input type="text" id="specification" name="specification"
                       value="${(entity.specification)!}" class="form-control" placeholder="请输入规格"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="intro" class="col-sm-2 control-label">介绍</label>
            <div class="col-sm-10">
                <input type="text" id="intro" name="intro"
                       value="${(entity.intro)!}" class="form-control" placeholder="请输入介绍"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="Images" class="col-sm-2 control-label">图片</label>
            <div class="col-sm-10">
                <input type="text" id="Images" name="Images"
                       value="${(entity.Images)!}" class="form-control" placeholder="请输入图片"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="priceType" class="col-sm-2 control-label">价格类型 0单价 1总价</label>
            <div class="col-sm-10">
                <input type="number" id="priceType" name="priceType"
                       value="${(entity.priceType)!}" class="form-control" placeholder="请输入价格类型 0单价 1总价"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="sortIndex" class="col-sm-2 control-label">sortIndex</label>
            <div class="col-sm-10">
                <input type="number" id="sortIndex" name="sortIndex"
                       value="${(entity.sortIndex)!}" class="form-control" placeholder="请输入sortIndex"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="navigationCode" class="col-sm-2 control-label">导航code</label>
            <div class="col-sm-10">
                <input type="text" id="navigationCode" name="navigationCode"
                       value="${(entity.navigationCode)!}" class="form-control" placeholder="请输入导航code"
                       lay-verify="required"/>
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
</@footer>