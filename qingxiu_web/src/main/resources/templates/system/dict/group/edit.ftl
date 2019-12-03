<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
  <@body>
    <form role="form"  class="form-horizontal layui-form layui-form-pane " method="post" action="/tSysDict/dict/doEditGroup">
      <input type="hidden" name="id" value="${(dict.id)!}" />
      <div class="box-body">
        <div class="form-group">
          <label for="code"  class="col-sm-2 control-label">分组代码<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="code" disabled name="code" class="form-control input-select-200" lay-verify="required"
                 value="${(dict.code)!}"
                 placeholder="请输入分组代码">
          </div>
        </div>
        <div class="form-group">
          <label for="type"  class="col-sm-2 control-label">分组标识<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="type" name="type" class="form-control input-select-200" lay-verify="required"
                 value="${(dict.type)!}"
                 placeholder="请输入分组标识">
          </div>
        </div>
        <div class="form-group">
          <label for="label"  class="col-sm-2 control-label">分组名称<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="label" name="label" class="form-control input-select-200" lay-verify="required"
                 value="${(dict.label)!}"
                 placeholder="请输入分组名称">
          </div>
        </div>
        <div class="form-group">
          <label for="value"  class="col-sm-2 control-label">分组值<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="value" name="value" class="form-control input-select-200" lay-verify="required"
                 value="${(dict.value)!}"
                 placeholder="请输入分组值">
          </div>
        </div>

        <div class="form-group">
          <label for="sortIndex"  class="col-sm-2 control-label">分组排序<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="sortIndex" name="sortIndex" class="form-control input-select-200" lay-verify="required"
                 value="${(dict.sortIndex)!}"
                 placeholder="请输入排序编号">
          </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2 control-label">分组描述</label>
          <div class="col-sm-10">
          <textarea class="form-control" name="remark" rows="3" placeholder="请输入描述，最多300个字符 ..." >
            ${(dict.remark)!}
          </textarea>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">&nbsp;</label>
          <div class="col-sm-10">
            <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
          </div>
        </div>
      </div>
    </form>
  </@body>
<@footer>
</@footer>