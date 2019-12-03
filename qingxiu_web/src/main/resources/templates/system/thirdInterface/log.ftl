<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
     <small>接口管理 ><a href="/system/tThirdInterfaceConfig/list/1"> 第三方接口管理</a> > [${(thirdInterface.interfaceName)!}]接口请求记录</small>

    </h1>
  </section>
  <!-- Main content -->
  <section class="content">
    <!-- Your Page Content Here -->
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
             <form class="form-inline"  action="/system/tThirdInterfaceConfig/interfaceLog/1?id=#{(thirdInterface.id)!}" method="post">
				 <div class="input-group ">
					 <button type="button" delete-batch-url="/system/tThirdInterfaceConfig/deleteAll" class="btn btn-danger btn-flat">
						 <i class="fa fa-remove"></i> 批量删除
				 </div>
			  <div class="form-group">
			    <#--<input type="text" name="daterange" value="${daterange!}" class="form-control date" id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">-->
				<input type="text" name="createTimeStart" value="${createTimeStart!}" autocomplete="off"
					   class="form-control" readonly
					   id="createTimeStart" placeholder="请求日期开始" style="width: 120px;">
			  </div>
			 <div class="form-group">
				 <input type="text" name="createTimeEnd" value="${createTimeEnd!}" autocomplete="off"
						class="form-control" readonly
						id="createTimeEnd" placeholder="请求日期结束" style="width: 120px;">
			 </div>
			 <div class="input-group">
				 <input type="text" name="search" value="${search!}" class="form-control"
						placeholder="请求标识查询">
               <div class="input-group-btn">
                 <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
               </div>
            </div>
            <div class="input-group pull-right">
                 <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('接口请求记录数据');"><i class="fa fa-file-excel-o"></i> 导出</button>
            </div>
			</form>
          </div>
          <div class="box-body table-responsive no-padding">
            <table class="table table-hover">
              <tr>
				  <th ><input type="checkbox"lay-filter="allCheck"  value="root" class="minimal  checkbox-toolbar"
							  lay-ignore  >全选
				  <th>请求标识</th>
                <th>请求参数</th>
                <th>请求结果</th>
                <th>请求时间</th>
				  <th>操作</th>
              </tr>
              <#list pageData.getRecords() as log>
              	  <tr>
					  <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids" value="${((log.id)?c)!}"
													 class="minimal checkbox-item"></td>
					  <td>${(log.groupLog)!}</td>
	                <td>${(log.reqPam)!}</td>
	                <td>
						<#if log.isOk==0><font color="red">请求失败</font><#else><font color="green">请求成功</font></#if>
					</td>
	                <td>${(log.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!}</td>
					  <td>
							  <a class="btn btn-primary btn-xs dialog" href="javascript:;"
								 data-url="/system/tThirdInterfaceConfig/interfaceLog/info/${(log.id)!}" data-title="返回结果"
								 data-width="850" data-height="650">查看返回结果</a>
					  </td>
	              </tr>
              </#list>
            </table>
          </div><!-- /.box-body -->
          <div class="box-footer row">
            <div class="col-md-6">
         	  <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/system/tThirdInterfaceConfig/interfaceLog/" urlParas="?search=${search!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}&id=#{(thirdInterface.id)!}"  />
            </div>
            <div class="col-md-6 pull-left">
	             <#include "../../common/paginate.ftl" />
	  			 <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/tThirdInterfaceConfig/interfaceLog/" urlParas="?search=${search!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}&pageSize=${pageSize!}&id=#{(thirdInterface.id)!}"  />
            </div>
          </div>
        </div><!-- /.box -->
      </div>
    </div>
  </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script>
    //下方为原有查询条件，先做保留
    // function getBoforeDate(before){
		// var now = new Date();
		// now.setDate(now.getDate()-before);
		// return now;
    // }
    //
    // function getBoforeMonth(beforeMonth,day){
		// var now = new Date();
		// now.setDate(day);
		// now.setMonth(now.getMonth()-beforeMonth);
		// return now;
    // }
    //
    // $(function(){
    //
		// var now = new Date();
    //
		// $('.date').daterangepicker({
		//     "showWeekNumbers": true,
		//     "showISOWeekNumbers": true,
		//     "ranges": {
		//         "今天": [
		//             now,
		//             now
		//         ],
		//         "昨天": [
		// 			getBoforeDate(1),
		// 			getBoforeDate(1)
		//         ],
		//         "最近7天": [
		// 			getBoforeDate(7),
		// 			now
		//         ],
		//         "最近30天": [
		//             getBoforeDate(30),
		//             now
		//         ],
		//         "本月": [
		//             getBoforeMonth(0,1),
		//             getBoforeMonth(0,31)
		//         ],
		//         "上个月": [
		// 			getBoforeMonth(1,1),
		// 			getBoforeMonth(1,31)
		//         ],
		//         "最近三个月": [
		// 				getBoforeMonth(2,1),
		// 				getBoforeMonth(0,31)
		// 	        ]
		//     },
		//     "locale": {
		//         "format": "YYYY/MM/DD",
		//         "separator": "-",
		//         "applyLabel": "应用",
		//         "cancelLabel": "取消",
		//         "fromLabel": "From",
		//         "toLabel": "To",
		//         "customRangeLabel": "自定义",
		//         "weekLabel": "W",
		//         "daysOfWeek": [
		//             "日",
		//             "一",
		//             "二",
		//             "三",
		//             "四",
		//             "五",
		//             "六"
		//         ],
		//         "monthNames": [
		//             "一月",
		//             "二月",
		//             "三月",
		//             "四月",
		//             "五月",
		//             "六月",
		//             "七月",
		//             "八月",
		//             "九月",
		//             "十月",
		//             "十一月",
		//             "十二月"
		//         ],
		//         "firstDay": 1
		//     },
		//     "alwaysShowCalendars": true,
		//     "autoUpdateInput":false,
		//     "opens": "right",
		//     "buttonClasses": "btn btn-sm"
		// }, function(start, end, label) {
		//   console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
		// });
    //
		// $('.date').on('apply.daterangepicker', function(ev, picker) {
    //         $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
    //     });
    //
    //     $('.date').on('cancel.daterangepicker', function(ev, picker) {
    //         $(this).val('');
    //     });
    //
    // });
    //上方为原有查询条件，先做保留
    //下方修复：295 优化后台管理端，更换时间控件
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#createTimeStart'
        });
        laydate.render({
            elem: '#createTimeEnd'
        });
    });
    //上方修复：295 优化后台管理端，更换时间控件
</script>
</@footer>