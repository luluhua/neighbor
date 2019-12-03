<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
 <form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/user/doEdit">
     <div class="box-body">
         <input type="hidden" name="id" value="${(sysUser.id)!}">
         <div class="form-group">
             <label for="uname" class="col-sm-2 control-label">用户名<span class="xing_red"> *</span></label>
             <div class="col-sm-10">
                 <input type="text" id="uname" name="username" class="form-control input-select-200"
                        placeholder="请输入用户名"
                        lay-verify="required|username|check" value="${(sysUser.username)!}"
                        check-url="/system/user/checkName">
             </div>
         </div>
         <div class="form-group">
             <label for="realname" class="col-sm-2 control-label">真实姓名<span class="xing_red"> *</span></label>
             <div class="col-sm-10">
                 <input type="text" id="realname" name="realname" value="${(sysUser.realname)!}"
                        class="form-control input-select-200" placeholder="请输入真实姓名"
                        lay-verify="required">
             </div>
         </div>
         <div class="form-group">
             <label for="email" class="col-sm-2 control-label">邮箱地址<span class="xing_red"> *</span></label>
             <div class="col-sm-10">
                 <input type="text" id="email" name="email" value="${(sysUser.email)!}"
                        class="form-control input-select-200" placeholder="请输入邮箱地址"
                        lay-verify="required|email">
             </div>
         </div>
         <div class="form-group">
             <label for="mobile" class="col-sm-2 control-label">手机号码<span class="xing_red"> *</span></label>
             <div class="col-sm-10">
                 <input type="text" id="mobile" name="mobile"
                        value="<@commonTags method="getDecrypt3DEs" type="1" value="${(sysUser.mobile)!}">${(getDecrypt3DEs)!}</@>"
                        class="form-control input-select-200" placeholder="请输入手机号码"
                        lay-verify="required|phone">
             </div>
         </div>

         <div class="form-group">
             <label for="gender" class="col-sm-2 control-label">性别<span class="xing_red"> *</span></label>
             <div class="col-sm-10">
                 <label>
                     <input name="gender" type="radio" class="minimal" ${(sysUser.gender==1)?string('checked','')}
                            value="1" lay-ignore> 男
                 </label>
                 <label>
                     <input name="gender" type="radio" class="minimal" ${(sysUser.gender==2)?string('checked','')}
                            value="2" lay-ignore> 女
                 </label>
             </div>
         </div>

         <div class="form-group">
             <label class="col-sm-2 control-label">状态<span class="xing_red"> *</span></label>
             <div class="col-sm-10">
                 <label>
                     <input name="status" type="radio" class="minimal" ${(sysUser.status == 0)?string('checked','')}
                            value="0" lay-ignore> 启用
                 </label>
                 <label>
                     <input name="status" type="radio" class="minimal" ${(sysUser.status == 1)?string('checked','')}
                            value="1" lay-ignore> 禁用
                 </label>
             </div>
         </div>
         <div class="form-group">
             <label for="mobile" class="col-sm-2 control-label">联系地址<span class="xing_red"> *</span></label>
             <div class="col-sm-10">
                 <input type="text" id="address" name="address" value="${(sysUser.address)!}" class="form-control"
                        placeholder="请输入联系地址"
                        lay-verify="required|address">
             </div>
         </div>
         <div class="form-group">
             <label class="col-sm-2 control-label">部门<span class="xing_red"> *</span></label>
             <div class="col-sm-10">
                 <select name="deptId" id="deptId" class="form-control select2" style="width: 200px;"
                         lay-verify="required" lay-ignore>
                  <#list deptList as dept>
                      <option value="${(dept.id)!}"  ${(sysUser.deptId?? && dept.id==sysUser.deptId)?string('selected="selected"','')} >${(dept.name)!}</option>
                  </#list>
                 </select>
             </div>
         </div>
         <div class="form-group">
             <label class="col-sm-2 control-label">角色<span class="xing_red"> *</span></label>
             <div class="col-sm-10" id="role_div">
             </div>
         </div>
         <div id="role-demo" hidden>
             <label><input type="checkbox" id="checkbox_#id" name="roleId" class="minimal" value="#id"
                           onclick="checked_box(#id)" lay-ignore>#name</label>&nbsp;
         </div>
         <div class="form-group">
             <label class="col-sm-2 control-label"></label>
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
<script type="application/javascript">
    var role_url = "/system/role/getRoleList";
    getRoleList('${(sysUser.deptId?c)!}');
    $("#deptId").change(function () {
        var deptId = $("#deptId").val();
        getRoleList(deptId);
    });

    function getRoleList(deptId) {
        $.post(role_url, {deptId: deptId}, function (json) {
            if (json.code == 200) {
                $('#role_div').empty();
                var replaceStr = $('#role-demo').html();
                $.each(json.data, function (i, item) {
                    $('#role_div').append(replaceStr.replace("#id", item.id)
                            .replace("#id", item.id).replace("#name", item.name)
                            .replace("#id", item.id))
                });
                if (deptId == '${(sysUser.deptId?c)!}') {
                    <#list myRolds as role>
                        checked_box2('${role!}');
                    </#list>
                }
            }
        })
    }

    function checked_box(id) {
        var checkbox = $("#checkbox_" + id).attr('checked');
        console.log(checkbox);
        if (typeof(checkbox) == 'undefined') {
            $("#checkbox_" + id).parent().removeClass('checked');
            $("#checkbox_" + id).attr('checked', false);
        } else {
            $("#checkbox_" + id).parent().addClass('checked');
            $("#checkbox_" + id).attr('checked', true);
        }
    }
    function checked_box2(id) {
        var checkbox = $("#checkbox_" + id).attr('checked');
        if (typeof(checkbox) == 'undefined') {
            $("#checkbox_" + id).parent().addClass('checked');
            $("#checkbox_" + id).attr('checked', true);
        }
    }
</script>