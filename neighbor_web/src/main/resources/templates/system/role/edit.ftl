<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane"  method="post" action="/system/role/doEdit">
  <div class="box-body">
      <input type="hidden" name="id" id="id" value="${(sysRole.id)!}"/>
      <div class="form-group">
          <label for="uname"  class="col-sm-2 control-label">角色名<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
              <input type="text" id="uname"value="${(sysRole.name)!}" name="name" class="form-control" placeholder="请输入角色名"  lay-verify="required">
          </div>
      </div>
      <div class="form-group">
          <label for="code"  class="col-sm-2 control-label">角色代码<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
              <input type="text" id="code"  value="${(sysRole.code)!}" name="code" class="form-control" placeholder="请输入角色代码" readonly  lay-verify="required">
          </div>
      </div>
      <div class="form-group">
          <label for="sortIndex"  class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
              <input type="text" id="sortIndex" value="${(sysRole.sortIndex)!}" name="sortIndex" class="form-control" placeholder="请输入排序数字(数字越大越靠前)"  lay-verify="required">
          </div>
      </div>
      <div class="form-group">
          <label  class="col-sm-2 control-label">描述</label>
          <div class="col-sm-10">
              <textarea class="form-control" name="remark" rows="3" placeholder="请输入描述，最多300个字符 ..." >${(sysRole.remark)!}</textarea>
          </div>
      </div>
    <div class="form-group">
        <label  class="col-sm-2 control-label">状态<span class="xing_red"> *</span></label>
        <div class="col-sm-10">
         <label>
           <input name="roleState" type="radio" class="minimal" ${(sysRole.roleState == 1)?string('checked','')} value="1" lay-ignore> 启用
         </label>
         <label>
           <input name="roleState" type="radio" class="minimal" ${(sysRole.roleState == -1)?string('checked','')}  value="-1" lay-ignore> 禁用
         </label>
        </div>
      </div>
     <div class="form-group">
     	<label  class="col-sm-2 control-label"></label>
     	  <div class="col-sm-10">
      <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
      <a  class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i class="fa fa-close"></i>  取消</a>
    </div>
     </div>
  </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>