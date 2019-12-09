<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/user/doAdd">
        <div class="box-body">
            <div class="form-group">
                <label for="uname" class="col-sm-2 control-label">用户名<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="uname" name="username" class="form-control input-select-200"
                           placeholder="请输入用户名"
                           lay-verify="required|username|check" check-url="/system/user/checkName">
                </div>
            </div>
            <div class="form-group">
                <label for="realname" class="col-sm-2 control-label">真实姓名<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="realname" name="realname" class="form-control input-select-200"
                           placeholder="请输入真实姓名"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">邮箱地址<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="email" name="email" class="form-control input-select-200"
                           placeholder="请输入邮箱地址"
                           lay-verify="required|email">
                </div>
            </div>
            <div class="form-group">
                <label for="mobile" class="col-sm-2 control-label">手机号码<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="mobile" name="mobile" class="form-control input-select-200"
                           placeholder="请输入手机号码"
                           lay-verify="required|phone">
                </div>
            </div>

            <div class="form-group">
                <label for="gender" class="col-sm-2 control-label">性别<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <label>
                        <input name="gender" type="radio" class="minimal" checked value="1" lay-ignore> 男
                    </label>
                    <label>
                        <input name="gender" type="radio" class="minimal" value="2" lay-ignore> 女
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">登录密码<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="password" class="form-control input-select-200" id="password" name="password"
                           placeholder="请输入密码"
                           lay-verify="required|pwdRules">
                </div>
            </div>
            <div class="form-group">
                <label for="password2" class="col-sm-2 control-label">确认密码<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="password" class="form-control input-select-200" id="password2" name="password2"
                           placeholder="请再次输入密码"
                           lay-verify="required|pass|eqPwd">
                </div>
            </div>
            <div class="form-group">
                <label for="mobile" class="col-sm-2 control-label">联系地址<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="address" name="address" class="form-control" placeholder="请输入联系地址"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">部门<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <select name="deptId" id="deptId" class="form-control select2 input-select-200" lay-ignore
                            lay-verify="required">
                        <option value="">----选择部门---</option>
                        <#list deptList as dept>
                            <option value="${(dept.id)!}">${(dept.name)!}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">角色<span class="xing_red"> *</span></label>
                <div class="col-sm-10" id="role_div">

                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-sm-2 control-label">状态<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <label>
                        <input name="status" type="radio" class="minimal" checked value="0" lay-ignore> 启用
                    </label>
                    <label>
                        <input name="status" type="radio" class="minimal" value="1" lay-ignore> 禁用
                    </label>
                </div>
            </div>
            <div id="role-demo" hidden>
                <label><input type="checkbox" id="checkbox_#id" name="roleId" class="minimal" value="#id" onclick="checked_box(#id)" lay-ignore>#name</label>&nbsp;
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                            class="fa fa-save"></i> 提 交
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
    $("#deptId").change(function () {
        var deptId = $("#deptId").val();
        $.post(role_url, {deptId: deptId}, function (json) {
            if (json.code == 200) {
                $('#role_div').empty();
                var replaceStr = $('#role-demo').html();
                $.each(json.data, function (i, item) {
                    $('#role_div').append(replaceStr.replace("#id",item.id)
                            .replace("#id",item.id).replace("#name",item.name)
                            .replace("#id",item.id))
                })
            }
        })
    });
   function checked_box(id) {
       var checkbox=$("#checkbox_" + id).attr('checked');
       if(typeof(checkbox)=='undefined'){
           $("#checkbox_" + id).parent().removeClass('checked');
           $("#checkbox_" + id).attr('checked', false);
       }else{
           $("#checkbox_" + id).parent().addClass('checked');
           $("#checkbox_" + id).attr('checked', true);
       }
   }
    //校验密码强度 add zyj 20190619
    function simplPwd(value){
        if(value.length < 7){
            //必须大于6位
            return true;
        }
        if(/^\d{7,}$/.test(value) || /^[a-z]{7,}$/.test(value) || /^[A-Z]{7,}$/.test(value) || /^\W{7,}$/.test(value) ){
            //不能是单纯的一种格式
            return true;
        }
        return false;
    }

    function checkPassWord(value){
        // 0： 表示第一个级别 1：表示第二个级别 2：表示第三个级别
        // 3： 表示第四个级别 4：表示第五个级别
        var modes = 0;
        if(value.length > 6){
            modes = 1;
        }
        if(!simplPwd(value)){//最初级别
            modes = 0;
            if(/[0-9]/.test(value)){//如果用户输入的密码 包含了小写的数字
                modes++;
            }
            if(/[a-z]/.test(value)){//如果用户输入的密码 包含了小写的a到z
                modes++;
            }
            if(/[A-Z]/.test(value)){//如果用户输入的密码 包含了大写的A到Z
                modes++;
            }
            if(/\W/.test(value)){//如果是非数字 字母 下划线
                modes++;
            }
        }
        showStrong(modes)
        return modes;
    }
    // 显示密码强度
    function showStrong(index){
        var spanDoms = $("#tips").find("span");
        for(var i = 0; i <spanDoms.length; i++){
            spanDoms[i].className = "";//清空span标签所有的class样式
            if(modes){//0 代表false 其余代表true
                spanDoms[modes-1].className = "s" + modes ;
            }
        }
    }
</script>