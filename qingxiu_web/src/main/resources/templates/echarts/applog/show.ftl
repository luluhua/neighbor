<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 接口统计</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/eApplog/show" method="post">
                                <div class="input-group">
                                    <select name="timeType" id="e_applog_timeType" class="form-control" lay-ignore>
                                        <option value="1" <#if timeType??><#if timeType==1>selected="selected"</#if></#if> >本年</option>
                                        <option value="2" <#if timeType??><#if timeType==2>selected="selected"</#if></#if> >本月</option>
                                        <option value="3" <#if timeType??><#if timeType==3>selected="selected"</#if></#if> >本周</option>
                                        <option value="4" <#if timeType??><#if timeType==4>selected="selected"</#if></#if> >本日</option>
                                        <option value="5" <#if timeType??><#if timeType==5>selected="selected"</#if></#if> >自定义</option>
                                    </select>
                                </div>
                                <div class="form-group" id="e_applog_daterange_div" <#if timeType==5&&daterange??><#else>style="display: none"</#if>  >
                                    <input type="text" name="daterange" value="${daterange!}" class="form-control date" id="daterange" placeholder="登录开始日期  - 结束日期" style="width: 228px;">
                                </div>
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <div class="middle">
                                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                                <div id="TopOperApi" style="margin-top: 30px;height:350px"></div>
                                <div id="TimeApi" style="margin-top: 30px;height:300px"></div>
                                <div id="IntervalOperApi" style="margin-top: 30px;height:300px"></div>
                            </div>
                            <div class="push"></div>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                        </div>
                    </div><!-- /.box -->
                </div>
            </div>
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
</@body>
<@footer>
    <script src="/app/js/echarts.min.js"></script>
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
                "alwaysShowCalendars": false,
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

            //下拉框改变事件
            $("#e_applog_timeType").unbind().bind().on("change",function(){
                if(this.value==5){
                    $("#e_applog_daterange_div").show();
                }else{
                    $("#e_applog_daterange_div").hide();
                }
            });

            //------ 以下第一图表 -----//
            var TopOperApiChart = echarts.init(document.getElementById('TopOperApi'));

            var xAxis_data="${xAxis_data!}";
            var series_data="${series_data!}";
            var xAxis_arr=[];
            var series_arr=[];
            if(xAxis_data.length>0){
                xAxis_arr=xAxis_data.split(",");
            }
            if(series_data.length>0){
                series_arr=series_data.split(",");
            }
            var TopOperApiOption = {
                calculable: true,
                title: {
                    text: "高频率调用接口（前20）",
                    x:"center"
                },
                toolbox: {
                    feature: {
                        mark: {
                            show: true,
                            title: {
                                markUndo: "删除辅助线",
                                markClear: "清空辅助线",
                                mark: "辅助线开关"
                            },
                            lineStyle: {
                                color: "#1e90ff",
                                type: "dashed",
                                width: 2
                            }
                        },
                        magicType: {
                            show: true,
                            title: {
                                bar: "柱形图切换",
                                stack: "堆积",
                                tiled: "平铺",
                                line: "折线图切换"
                            },
                            type: ["line", "bar"]
                        },
                        restore: {
                            show: true,
                            title: "还原"
                        },
                        saveAsImage: {
                            show: true,
                            title: "保存为图片",
                            type: "png",
                            lang: ["点击保存"]
                        }
                    },
                    show: true
                },
                tooltip: {
                    trigger: "axis"
                },
                xAxis: [{
                    type: "category",
                    data: xAxis_arr,
                    axisLabel:{
                        rotate:340
                    }
                }],
                yAxis: [{
                    type: "value"
                }],
                series: [{
                    name: "数量",
                    type: "bar",
                    label: {
                        normal: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: 'black'
                            }
                        }
                    },
                    data: series_arr
                }]
            };

            // 为echarts对象加载数据
            TopOperApiChart.setOption(TopOperApiOption);

            //------ 以上第一图表 -----//

            //------ 以下第二图表 -----//
            var TimeApi = echarts.init(document.getElementById('TimeApi'));

            var total_type=['早8点-12点','12点-18点','18点-24点','24点-早8点'];

            var sd_value="${sd_value!}";
            var sd_value_arr=[];
            if(sd_value.length>0){
                sd_value_arr=sd_value.split(",");
            }

            var TimeApiOption = {
                title : {
                    text: '按时段统计',
                    x:'center'
                },
                toolbox: {
                    feature: {
                        mark: {
                            show: true,
                            title: {
                                markUndo: "删除辅助线",
                                markClear: "清空辅助线",
                                mark: "辅助线开关"
                            },
                            lineStyle: {
                                color: "#1e90ff",
                                type: "dashed",
                                width: 2
                            }
                        },
                        restore: {
                            show: true,
                            title: "还原"
                        },
                        saveAsImage: {
                            show: true,
                            title: "保存为图片",
                            type: "png",
                            lang: ["点击保存"]
                        }
                    },
                    show: true
                },
                tooltip : {
                    trigger: 'item',
                    formatter:function(data){
                        return data.seriesName + "<br/>"+ data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                    }
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: total_type
                },
                series : [
                    {
                        name: '时段统计',
                        type: 'pie',
                        radius : '70%',
                        center: ['50%', '60%'],
                        data:[
                            {value:sd_value_arr[0], name:total_type[0]},
                            {value:sd_value_arr[1], name:total_type[1]},
                            {value:sd_value_arr[2], name:total_type[2]},
                            {value:sd_value_arr[3], name:total_type[3]},
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            },
                            normal:{
                                label:{
                                    show: true,
                                    formatter:function(data){
                                        return data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                                    }
                                },
                                labelLine :{show:true}
                            }
                        }
                    }
                ]
            };
            TimeApi.setOption(TimeApiOption);
            //------ 以上第二图表 -----//

            //------ 以下第三图表 -----//
            var IntervalOperApi = echarts.init(document.getElementById('IntervalOperApi'));

            var type_value="${type_value!}";
            var type_value_arr=[];
            var type_name="${type_name!}";
            var type_name_arr=[];
            if(type_value.length>0){
                type_value_arr=type_value.split(",");
            }
            if(type_name.length>0){
                type_name_arr=type_name.split(",");
            }

            var IntervalOperApiOption = {
                title : {
                    text: '按客户端统计',
                    x:'center'
                },
                toolbox: {
                    feature: {
                        mark: {
                            show: true,
                            title: {
                                markUndo: "删除辅助线",
                                markClear: "清空辅助线",
                                mark: "辅助线开关"
                            },
                            lineStyle: {
                                color: "#1e90ff",
                                type: "dashed",
                                width: 2
                            }
                        },
                        restore: {
                            show: true,
                            title: "还原"
                        },
                        saveAsImage: {
                            show: true,
                            title: "保存为图片",
                            type: "png",
                            lang: ["点击保存"]
                        }
                    },
                    show: true
                },
                tooltip : {
                    trigger: 'item',
                    //formatter: "{a} <br/>{b} : {c} ({d}%)"
                    formatter:function(data){
                        return data.seriesName + "<br/>"+ data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                    }
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: type_name_arr
                },
                series : [
                    {
                        name: '客户端统计',
                        type: 'pie',
                        radius : '70%',
                        center: ['50%', '60%'],
                        data:[
                            {value:type_value_arr[0], name:type_name_arr[0]},
                            {value:type_value_arr[1], name:type_name_arr[1]},
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            },
                            normal:{
                                label:{
                                    show: true,
                                    formatter:function(data){
                                        return data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                                    }
                                },
                                labelLine :{show:true}
                            }
                        }
                    }
                ]
            };
            IntervalOperApi.setOption(IntervalOperApiOption);
            //------ 以上第三图表 -----//

        });
    </script>
</@footer>