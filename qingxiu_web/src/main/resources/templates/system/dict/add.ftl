<#include "../../common/layout_dl.ftl">
<@header>
</@header>
  <@body>
    <form role="form"  class="form-horizontal layui-form layui-form-pane " method="post" action="/tSysDict/dict/doAdd">
      <input type="hidden" name="moduleId" value="${(dictGroup.id)!''}">
      <div class="box-body">
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
                 placeholder="请输入字典代码">
          </div>
        </div>
        <div class="form-group">
          <label for="type" class="col-sm-2 control-label">字典标识<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="type" name="type" class="form-control input-select-200" lay-verify="required"
                 placeholder="请输入字典标识">
          </div>
        </div>
        <div class="form-group">
          <label for="label" class="col-sm-2 control-label">字典标签名称<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="label" name="label" class="form-control input-select-200" lay-verify="required"
                 placeholder="请输入标签名称">
          </div>
        </div>
        <div class="form-group">
          <label for="value" class="col-sm-2 control-label">字典标签值<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="value" name="value" class="form-control input-select-200" lay-verify="required"
                 placeholder="请输入标签值">
          </div>
        </div>

        <div class="form-group">
          <label for="sortIndex" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="sortIndex" name="sortIndex" class="form-control input-select-200" lay-verify="required"
                 value="${(sortIdex)!'1'}"  placeholder="请输入排序编号">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">字典描述</label>
          <div class="col-sm-10">
          <textarea class="form-control " name="remark" rows="3" placeholder="请输入描述，最多300个字符 ..." ></textarea>
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