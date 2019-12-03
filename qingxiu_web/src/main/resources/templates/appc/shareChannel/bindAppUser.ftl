<#include "../../common/layout.ftl">
<@header>
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="/plugins/bootstrap-table/css/bootstrap-table.min.css">
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small><a href="/appc/tAppUserShareChannel/list/1">分享渠道</a> > 用户绑定</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-5">
                <div class="box">
                    <div class="box-header">
                        <div class="input-group">
                            <input type="text" id="searchId" name="search" value="${search!}" class="form-control"
                                   placeholder="精确手机号码查询">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="button" id="searchBtnId" onclick="onBtn();"><i
                                        class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <table class="table table-hover" id="tableId" data-toolbar="#toolbar">
                    </table>
                </div><!-- /.box-body -->
            </div>
            <div class="col-xs-7">
                <div class="box">
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">&nbsp;</label>
                            <div class="col-sm-10">
                                <input type="hidden" id="userIds" value="">
                                <input type="hidden" id="channelId" value="${(entity.id)!}">
                                <h4 style="color: green;font-size: 15px; padding: 10px;padding-left: 0px;">选择需绑定用户后点击保存即可</h4>
                                <button type="button" class="btn btn-success" onclick="onSubmit()"><i
                                        class="fa fa-save"></i> 提 交
                                </button>
                                <button type="button" class="btn btn-primary btn-flat" onclick="window.location.href='/appc/tAppUserShareChannel/channelUserList/1?id=${(entity.id)!}'" style="margin-right: 10px;"><i
                                        class="fa"></i> 返回上页
                                </button>
                            </div>
                        </div>

                    </div><!-- /.box-body -->
                <#--</form>-->
                </div>
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
    <script src="/plugins/bootstrap-table/js/bootstrap-table.min.js"></script>
    <script type="application/javascript">
        $(function () {
            //1.初始化Table
            var oTable = new TableInit();
            oTable.Init();

        });
        var TableInit = function () {
            var oTableInit = new Object();
            //初始化Table
            oTableInit.Init = function () {
                $('#tableId').bootstrapTable({
                    url: '/appc/tAppUser/appUserJson',         //请求后台的URL（*）
                    method: 'get',                      //请求方式（*）
                    toolbar: '#toolbar',                //工具按钮用哪个容器
                    striped: true,                      //是否显示行间隔色
                    cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pagination: false,                   //是否显示分页（*）
                    sortable: false,                     //是否启用排序
                    sortOrder: "asc",                   //排序方式
                    sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                    //得到查询的参数
                    queryParams: function (params) {
                        //这里的键的名字和控制器的变量名必须一致，这边改动，控制器也需要改成一样的
                        var temp = {
                            search: $("#searchId").val()
                        };
                        return temp;
                    },
                    pageNumber: 1,                       //初始化加载第一页，默认第一页
                    pageSize: 50,                       //每页的记录行数（*）
                    pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                    search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                    contentType: "application/x-www-form-urlencoded",
                    strictSearch: true,
                    showColumns: false,                  //是否显示所有的列
                    showRefresh: false,                  //是否显示刷新按钮
                    minimumCountColumns: 2,             //最少允许的列数
                    clickToSelect: true,                //是否启用点击选中行
                    height: 750,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                    columns: [
                        {checkbox: true},
                        {
                            field: 'id',
                            title: '用户ID'
                        },
                        {
                            field: 'nickname',
                            title: '用户昵称'
                        },
                        {
                            field: 'mobile',
                            title: '手机号码'
                        }
                    ]
                });
            }
            //得到查询的参数
            oTableInit.queryParams = function (params) {
                var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    search: $("#searchId").val()
                };
                return temp;
            };
            return oTableInit;
        }


        function onBtn() {
            $('#tableId').bootstrapTable('refresh');
        }


        /**
         * 选中id
         */
        function onSelectProject() {
            var rows = $("#tableId").bootstrapTable('getSelections');// 获得要删除的数据
            if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
                alert("请先选择要配置的事项的信息!");
                return;
            } else {
                var ids = new Array();// 声明一个数组
                $(rows).each(function () {// 通过获得别选中的来进行遍历
                    ids.push(this.id);// cid为获得到的整条数据中的一列
                });
            }
            $("#userIds").val(ids);
        }


        function onSubmit() {
            onSelectProject();
            var onBatchAdd = "/appc/tAppUserShareChannel/doAddBatch";
            var channelId = $("#channelId").val();
            var userIds=$("#userIds").val();
            if(channelId==null||channelId==""||
                    userIds==null||userIds==""){
                alert("请选择相关用户");
                return;
            }
            $.post(onBatchAdd, {userIds: userIds, channelId: channelId},
                    function (json) {
                        if (json.code == 200) {
                            $.alert({
                                title: '提示',
                                content: "保存成功",
                                buttons: {"好的": {btnClass: 'btn-blue'}}
                            });
                            window.location.reload();
                        } else {
                            $.alert({
                                title: '提示',
                                content: json.msg,
                                buttons: {"好的": {btnClass: 'btn-blue'}}
                            });
                        }
                    });
        }


    </script>
</@footer>