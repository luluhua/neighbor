<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
  <section class="content-header">
    <h1>
     <small><a href="/system/tThirdAuthInterfaceLog/authInterfaceLog/1">实名认证接口日志列表</a> ></small>
    </h1>
  </section>
  <!-- Main content -->
  <section class="content">
    <!-- Your Page Content Here -->
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
             <form class="form-inline"  action="" method="post">
			  <div class="form-group">
			    <input type="text" name="daterange" value="${daterange!}" class="form-control date" id="daterange" placeholder="开始日期  - 结束日期" style="width: 228px;">
			  </div>
			 <div class="input-group">
				 <input type="text" name="search" value="${search!}" class="form-control"
						placeholder="请求标识查询">
               <div class="input-group-btn">
                 <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
               </div>
            </div>
			</form>
          </div>
          <div class="box-body table-responsive no-padding">
            <table class="table table-hover">
              <tr>
				  <th ><input type="checkbox"lay-filter="allCheck"  value="root" class="minimal  checkbox-toolbar"
							  lay-ignore  >全选
                  <th>请求人员ID</th>
                  <th>请求参数</th>
                <th>请求结果</th>
                <th>请求时间</th>
				  <th>操作</th>
              </tr>
              <#list pageData.getRecords() as log>
              	  <tr>
					  <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids" value="${((log.id)?c)!}"
													 class="minimal checkbox-item"></td>
                      <td>${(log.uid)!}</td>
                      <td>${(log.certifyid)!}</td>
	                <td>
						<#if log.isok==0><font color="red">请求失败</font><#else><font color="green">请求成功</font></#if>
					</td>
	                <td>${(log.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!}</td>
					  <td>
							  <a class="btn btn-primary btn-xs dialog" href="javascript:;"
								 data-url="/system/tThirdAuthInterfaceLog/info/${(log.id)!}" data-title="返回结果"
								 data-width="850" data-height="650">查看返回结果</a>
					  </td>
	              </tr>
              </#list>
            </table>
          </div><!-- /.box-body -->
          <div class="box-footer row">
            <div class="col-md-6">
         	  <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/system/tThirdInterfaceConfig/interfaceLog/" urlParas="?search=${search!}&daterange=${daterange!}"  />
            </div>
            <div class="col-md-6 pull-left">
	             <#include "../../common/paginate.ftl" />
	  			 <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/tThirdInterfaceConfig/interfaceLog/" urlParas="?search=${search!}&daterange=${daterange!}&pageSize=${pageSize!}"  />
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

	function getBoforeDate(before){
		var now = new Date();
		now.setDate(now.getDate()-before);
		return now;
	}

	function getBoforeMonth(beforeMonth,day){
		var now = new Date();
		now.setDate(day);
		now.setMonth(now.getMonth()-beforeMonth);
		return now;
	}

	$(function(){

		var now = new Date();

		$('.date').daterangepicker({
		    "showWeekNumbers": true,
		    "showISOWeekNumbers": true,
		    "ranges": {
		        "今天": [
		            now,
		            now
		        ],
		        "昨天": [
					getBoforeDate(1),
					getBoforeDate(1)
		        ],
		        "最近7天": [
					getBoforeDate(7),
					now
		        ],
		        "最近30天": [
		            getBoforeDate(30),
		            now
		        ],
		        "本月": [
		            getBoforeMonth(0,1),
		            getBoforeMonth(0,31)
		        ],
		        "上个月": [
					getBoforeMonth(1,1),
					getBoforeMonth(1,31)
		        ],
		        "最近三个月": [
						getBoforeMonth(2,1),
						getBoforeMonth(0,31)
			        ]
		    },
		    "locale": {
		        "format": "YYYY/MM/DD",
		        "separator": "-",
		        "applyLabel": "应用",
		        "cancelLabel": "取消",
		        "fromLabel": "From",
		        "toLabel": "To",
		        "customRangeLabel": "自定义",
		        "weekLabel": "W",
		        "daysOfWeek": [
		            "日",
		            "一",
		            "二",
		            "三",
		            "四",
		            "五",
		            "六"
		        ],
		        "monthNames": [
		            "一月",
		            "二月",
		            "三月",
		            "四月",
		            "五月",
		            "六月",
		            "七月",
		            "八月",
		            "九月",
		            "十月",
		            "十一月",
		            "十二月"
		        ],
		        "firstDay": 1
		    },
		    "alwaysShowCalendars": true,
		    "autoUpdateInput":false,
		    "opens": "right",
		    "buttonClasses": "btn btn-sm"
		}, function(start, end, label) {
		  console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
		});

		$('.date').on('apply.daterangepicker', function(ev, picker) {
            $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
        });

        $('.date').on('cancel.daterangepicker', function(ev, picker) {
            $(this).val('');
        });

	});
</script>
</@footer>