<#include "../../../common/layout.ftl">
<@header>
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="/plugins/bootstrap-table/css/bootstrap-table.min.css">
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small><a href="/appc/tGovProjectCityOrgAdress/jcbsList/1">基层办事</a> > 批量添加</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-7">
                <div class="box">
                    <div class="box-header">
                        <div class="row">
                            <div class="col-md-3">
                                <input type="hidden" id="cityId" name="cityId" value="${(cityId?c)!}">
                                <select id="xzqhId" class="form-control ">
                                    <option value="">--行政区域--</option>
                                <#list sysCityList as m>
                                <option value="#{(m.id)!}" <#if "${(m.id)!}"=="${(cityId)!}">selected</#if> >${(m.name)!}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <select id="xzqhId2" class="form-control  input-select-200">
                                    <option value="">--请选择乡镇、街道--</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <select id="xzqhId3" class="form-control  input-select-200">
                                    <option value="">--请选择社区、村委--</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <input type="hidden" id="deptId" name="deptId" value="${(deptId?c)!}">
                                <select id="xzqhId4" class="form-control ">
                                    <option value="">--请选择部门--</option>
                                </select>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-12" style="margin-top: 10px;">
                                <div class="input-group input-group-big">
                                    <input type="text" id="searchId" name="search" value="${search!}" class="form-control" placeholder="事项名称">
                                    <span class="input-group-btn">
                                <button type="button" class="btn btn-info btn-flat" onclick="onBtn();">搜索</button>
                                 </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-hover" id="tableId" data-toolbar="#toolbar">
                    </table>
                </div><!-- /.box-body -->
            </div>
            <div class="col-xs-5">
                <div class="box">
                <form class="form-horizontal "  >
                    <input type="hidden" name="serviceType" value="${(serviceType)!}" id="serviceTypeId">
                    <input type="hidden" name="projectIds" value="" id="projectIds">
                    <div class="box-body">
                        <div class="form-group">
                                <label class="col-sm-2 control-label">流程模型<span class="xing_red"> *</span></label>
                                <div class="col-sm-10">
                                    <select id="processId" class="form-control select2 "
                                            lay-verify="required" lay-ignore>
                                        <option value="">--请选择流程模型--</option>
                                    <#list processList as m>
                                        <option value="${(m.id)!}">key：${(m.modelKey)!}-名称:${(m.description)!}</option>
                                    </#list>
                                    </select>
                                </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">&nbsp;</label>
                            <div class="col-sm-10">
                                <button type="button" class="btn btn-success" onclick="onSubmit()"><i
                                        class="fa fa-save"></i> 提 交
                                </button>
                            </div>
                        </div>
                    </div><!-- /.box-body -->
                </form>
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
                    url: '/appc/tGovProjectCityOrgAdress/projectCifgJson',         //请求后台的URL（*）
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
                            serviceType: $("#serviceTypeId").val(),
                            search: $("#searchId").val(),
                            cityId:$("#xzqhId").val(),
                            streeId:$("#xzqhId2").val(),
                            communityId:$("#xzqhId3").val(),
                            deptId:$("#xzqhId4").val()

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
                            title: 'ID'
                        },
                        {
                            field: 'projectTitle',
                            title: '事项名称'
                        }
                    ]
                });
            }
            //得到查询的参数
            oTableInit.queryParams = function (params) {
                var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                    serviceType: $("#serviceTypeId").val(),
                    search: $("#searchId").val(),
                    cityId:$("#xzqhId").val(),
                    streeId:$("#xzqhId2").val(),
                    communityId:$("#xzqhId3").val(),
                    deptId:$("#xzqhId4").val()
                };
                return temp;
            };
            return oTableInit;
        }


        function onBtn() {
            $('#tableId').bootstrapTable('refresh');
        }

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
            console.log("ids=="+ids)
            $("#projectIds").val(ids);
        }

        function onSubmit() {
            onSelectProject();
                var onBatchAdd = "/appc/tGovProjectCityOrgAdress/doBatchProcess";
                var serviceType = $("#serviceTypeId").val();
                var projectIds = $("#projectIds").val();
                var processId=$("#processId").val();
                if(serviceType==null||serviceType==""||
                        projectIds==null||projectIds==""||processId==null||processId==""){
                    return;
                }
                $.post(onBatchAdd, {projectIds: projectIds, serviceType: serviceType,
                            processId:processId},
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
  <script type="application/javascript">
      var city_url="/system/sysCity/getCityByPid";
      $("#xzqhId").change(function(){
          var cityId=$("#xzqhId").val();
          //获取乡镇、街道
          $.post(city_url,{pid:cityId},function(json){
              if(json.code==200){
                  $("#xzqhId2").empty();
                  if(json.data.length==0){
                      $.alert({
                          title: '提示',
                          content: "当前选择的县（市、区）,未关联相关乡镇、街道",
                          buttons:{"好的":{ btnClass: 'btn-blue'}}
                      });
                      return;
                  }
                  $("#xzqhId2").append("<option value='' selected>--请选择乡镇、街道--</option>");
                  $.each(json.data, function(i, item){
                      $("#xzqhId2").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                  })
              }else{
                  $.alert({
                      title: '提示',
                      content: json.msg,
                      buttons:{"好的":{ btnClass: 'btn-blue'}}
                  });
              }
          });
          //获取部门
          $.post(dept_url,{id:cityId},function(json){
              console.log(json);
              if(json.code==200){
                  $("#xzqhId4").empty();
                  if(json.data.length==0){
                      $.alert({
                          title: '提示',
                          content: "当前选择的行政区域,未关联相关办理部门",
                          buttons:{"好的":{ btnClass: 'btn-blue'}}
                      });
                      return;
                  }
                  $("#xzqhId4").append("<option value='' selected>--请选择办理部门--</option>");
                  $.each(json.data, function(i, item){
                      $("#xzqhId4").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                  })
                  $("#deptId").show();
              }else{
                  $.alert({
                      title: '提示',
                      content: json.msg,
                      buttons:{"好的":{ btnClass: 'btn-blue'}}
                  });
              }
          });
      })

      var city_url="/system/sysCity/getCityByPid";
      $("#xzqhId2").change(function() {
          var cityId = $("#xzqhId2").val();
          //获取乡镇、街道
          $.post(city_url, {pid: cityId}, function (json) {
              if (json.code == 200) {
                  $("#xzqhId3").empty();
                  if (json.data.length == 0) {
                      $.alert({
                          title: '提示',
                          content: "当前选择的乡镇、街道）,未关联相关社区、村委",
                          buttons: {"好的": {btnClass: 'btn-blue'}}
                      });
                      return;
                  }
                  $("#xzqhId3").append("<option value='' selected>--请选择社区、村委--</option>");
                  $.each(json.data, function (i, item) {
                      $("#xzqhId3").append("<option value='" + item.id + "'>" + item.name + "</option>");
                  })
              } else {
                  $.alert({
                      title: '提示',
                      content: json.msg,
                      buttons: {"好的": {btnClass: 'btn-blue'}}
                  });
              }
          });
      })

      var dept_url="/appc/tGovProjectCityOrgAdress/getDeptByCityId";
      $("#xzqhId2").change(function(){
          var cityId=$("#xzqhId2").val();
          //获取部门
          $.post(dept_url,{id:cityId},function(json){
              console.log(json);
              if(json.code==200){
                  $("#xzqhId4").empty();
                  if(json.data.length==0){
                      $.alert({
                          title: '提示',
                          content: "当前选择的行政区域,未关联相关办理部门",
                          buttons:{"好的":{ btnClass: 'btn-blue'}}
                      });
                      return;
                  }
                  $("#xzqhId4").append("<option value='' selected>--请选择办理部门--</option>");
                  $.each(json.data, function(i, item){
                      $("#xzqhId4").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                  })
                  $("#deptId").show();
              }else{
                  $.alert({
                      title: '提示',
                      content: json.msg,
                      buttons:{"好的":{ btnClass: 'btn-blue'}}
                  });
              }
          });
      })
      $("#xzqhId3").change(function(){
          var cityId=$("#xzqhId3").val();
          //获取部门
          $.post(dept_url,{id:cityId},function(json){
              console.log(json);
              if(json.code==200){
                  $("#xzqhId4").empty();
                  if(json.data.length==0){
                      $.alert({
                          title: '提示',
                          content: "当前选择的行政区域,未关联相关办理部门",
                          buttons:{"好的":{ btnClass: 'btn-blue'}}
                      });
                      return;
                  }
                  $("#xzqhId4").append("<option value='' selected>--请选择办理部门--</option>");
                  $.each(json.data, function(i, item){
                      $("#xzqhId4").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                  })
                  $("#deptId").show();
              }else{
                  $.alert({
                      title: '提示',
                      content: json.msg,
                      buttons:{"好的":{ btnClass: 'btn-blue'}}
                  });
              }
          });
      })

      var _cityId=${(cityId)!''};
      if(_cityId!=''){
          //获取乡镇、街道
          $.post(city_url,{pid:_cityId},function(json){
              if(json.code==200){
                  $("#xzqhId2").empty();
                  if(json.data.length==0){
                      $.alert({
                          title: '提示',
                          content: "当前选择的县（市、区）,未关联相关乡镇、街道",
                          buttons:{"好的":{ btnClass: 'btn-blue'}}
                      });
                      return;
                  }
                  $("#xzqhId2").append("<option value='' selected>--请选择乡镇、街道--</option>");
                  $.each(json.data, function(i, item){
                      $("#xzqhId2").append("<option value='"+ item.id+"'>"+item.name+"</option>");
                  })
              }else{
                  $.alert({
                      title: '提示',
                      content: json.msg,
                      buttons:{"好的":{ btnClass: 'btn-blue'}}
                  });
              }
          });
      }

  </script>
</@footer>