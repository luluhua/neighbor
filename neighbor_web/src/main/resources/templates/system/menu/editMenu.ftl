<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
 <form role="form" class="layui-form layui-form-pane" method="post" action="/system/menu/doEdit">
  <input type="hidden" name="id" value="${(sysMenu.id)!}" />
     <input type="hidden" name="serviceType" value="${(sysMenu.serviceType)!}" />
     <input type="hidden" name="deep" value="${(sysMenu.deep)!}" />
  <div class="box-body">
       <div class="form-group">
          <label>父级菜单</label>
          <select name="pid" class="form-control select2" style="width: 100%;" lay-verify="required" lay-ignore>
               <#list list as m>
                   <option value="${(m.id)!}" ${(m.id==sysMenu.pid)?string('selected="selected"','')} > ${(m.code)!}-${(m.menuName)!}</option>
               </#list>
           </select>
        </div><!-- /.form-group -->
        <div class="form-group">
	       <label for="uname">编码</label>
	       <input type="text" name="code" class="form-control" 
	      	value="${(sysMenu.code)!}"	readonly lay-verify="required">
     </div>
  	 <div class="form-group">
       <label for="uname">菜单名称</label>
      	<input type="text" name="menuName" value="${(sysMenu.menuName)!}" class="form-control" placeholder="请输入菜单名称"  lay-verify="required">
     </div>
     <div class="form-group">
       <label for="uname">菜单URL</label>
      	<input type="text" name="url" class="form-control" value="${(sysMenu.url)!}" placeholder="请输入菜单URL" lay-verify="required">
     </div>
      <div class="form-group">
          <label for="uname">是否显示</label>
           <@dictTag method="getDictListByType" type="is_yes_no" >
               <#list getDictListByType as m>
                                <input type="radio" name="isEnabled" class="minimal" value="${(m.value)!}" lay-ignore checked>
                   ${(m.label)!}
                            &nbsp;
               </#list>
           </@dictTag>
      </div>
     <div class="form-group">
       <label for="uname">排序</label>
      	<input type="text" name="sort" class="form-control" value="${(sysMenu.sort)!}" placeholder="请输入排序"  lay-verify="required|number">
     </div>  
     <div class="form-group">
       <label for="uname">图标 <i class="fa ${(sysMenu.icon)!}"></i></label>
      	<input type="text" name="icon" class="form-control" value="${(sysMenu.icon)!}" placeholder="请输入图标,如:fa-user" >
     </div>
      <div class="form-group">
	    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
	    <a  class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i class="fa fa-close"></i>  取消</a>
	  </div>
  </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>