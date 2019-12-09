<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/commodity/tGoodsGrade/doEdit"
    <#else>
      action="/commodity/tGoodsGrade/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
<div class="box-body">
                                                                        <div class="form-group">
                    <label for="goodsId" class="col-sm-2 control-label">goodsId</label>
                    <div class="col-sm-10">
                        <input type="text" id="goodsId" name="goodsId"
                               value="${(entity.goodsId)!}" class="form-control" placeholder="请输入goodsId"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">userId</label>
                    <div class="col-sm-10">
                        <input type="text" id="userId" name="userId"
                               value="${(entity.userId)!}" class="form-control" placeholder="请输入userId"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                    <div class="form-group">
                    <label for="gradeUserId" class="col-sm-2 control-label">gradeUserId</label>
                    <div class="col-sm-10">
                        <input type="text" id="gradeUserId" name="gradeUserId"
                               value="${(entity.gradeUserId)!}" class="form-control" placeholder="请输入gradeUserId"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                                                <div class="form-group">
                    <label for="gradeType" class="col-sm-2 control-label">0 不匿名 1匿名</label>
                    <div class="col-sm-10">
                        <input type="number" id="gradeType" name="gradeType"
                               value="${(entity.gradeType)!}" class="form-control" placeholder="请输入0 不匿名 1匿名"
                               lay-verify="required"/>
                    </div>
                </div>
                                                                                                        <div class="form-group">
                    <label for="explain" class="col-sm-2 control-label">explain</label>
                    <div class="col-sm-10">
                        <input type="text" id="explain" name="explain"
                               value="${(entity.explain)!}" class="form-control" placeholder="请输入explain"
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