<#include "../../common/layout_dl.ftl">
<@header>
<style>
    td > label {
        padding: 3px;
    }
</style>
</@header>
<@body>
     <div class="row">
         <div class="col-md-12">
             <!-- general form elements -->
             <form action="/system/role/doAuth" method="post" class="layui-form layui-form-pane">
                 <input type="hidden" value="${(sysRole.id)!}" name="roleId"/>
                 <div class="box">
                     <!-- form start -->
                     <div class="box-body">
                         <table class="table table-hover">
	          <#list treeMenuAllowAccesses as vo>
                  <tr>
                      <td width="150px">
                          <label><input name="mid" type="checkbox" ${(vo.allowAccess)?string('checked','')}
                                        value="${(vo.sysMenu.id)!}" class="minimal checkbox-tr" lay-ignore> <i
                                  class="fa ${(vo.sysMenu.icon)!}"></i> ${(vo.sysMenu.menuName)!} ></label></td>
                      <td>
	             	<#list vo.children as ch>
                        <label><input name="mid" type="checkbox" ${(ch.allowAccess)?string('checked','')}
                                      value="${(ch.sysMenu.id)!}" class="minimal checkbox-td" lay-ignore> <i
                                class="fa ${(ch.sysMenu.icon)!}"></i> ${(ch.sysMenu.menuName)!}</label>&nbsp; > &nbsp;
		             	<#list ch.children as it>
		                	<label style="font-weight: normal;"><input name="mid"
                                                                       type="checkbox" ${(it.allowAccess)?string('checked','')}
                                                                       value="${(it.sysMenu.id)!}"
                                                                       class="minimal checkbox-td"
                                                                       lay-ignore> ${(it.sysMenu.menuName)!}</label>&nbsp;
                            <#list it.children as il>
							<label style="font-weight: normal;"><input name="mid"
                                                                       type="checkbox" ${(il.allowAccess)?string('checked','')}
                                                                       value="${(il.sysMenu.id)!}"
                                                                       class="minimal checkbox-td"
                                                                       lay-ignore> ${(il.sysMenu.menuName)!}</label>&nbsp;

                            </#list>
                        </#list>
                        <br>
                    </#list>
                      </td>
                  </tr>
              </#list>
                         </table>
                     </div>
                     <div class="box-footer">
                         <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                                 class="fa fa-save"></i> 确认授权
                         </button>
                         <a class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i
                                 class="fa fa-angle-left"></i> 返回</a>
                     </div>
                 </div><!-- /.box -->
             </form>
         </div><!--/.col (left) -->
     </div>
</@body>
<@footer>
<script type="text/javascript">

    $(".checkbox-tr").on('ifClicked', function () {
        $(this).parents('tr').find('.checkbox-td').iCheck('check');
    }).on('ifUnchecked', function () {
        $(this).parents('tr').find('.checkbox-td').iCheck('uncheck');
    });

</script>
</@footer>