<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 用户行为统计</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/appc/tAppPageOperationStatistics/chart/index"
                                  method="get">
                                <div class="input-group">
                                    <select name="timeType" id="timeType" class="form-control" lay-ignore>
                                        <option value="7"<#if timeType==7> selected="selected"</#if>>
                                            最近7天
                                        </option>
                                        <option value="15"<#if timeType==15> selected="selected"</#if>>
                                            最近15天
                                        </option>
                                        <option value="30"<#if timeType==30> selected="selected"</#if>>
                                            最近30天
                                        </option>
                                    </select>
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
                                <!-- 1.设备数（柱），总时长（折） -->
                                <div id="mobileCount" style="height:${boxHeight}px"></div>
                                <!-- 2.栏目/功能点击数，合并（堆积条形图）-->
                                <div id="keyCount" style="height:${boxHeight}px"></div>
                                <!-- 3.模块点击数，合并（堆积条形图）-->
                                <div id="modelCount" style="height:${boxHeight}px"></div>
                                <!-- 4.栏目使用平均时长（折线图） -->
                                <div id="keyUseAvg" style="height:${boxHeight}px"></div>
                                <div id="keyHourAvg" style="height:${boxHeight}px"></div>

                                <!-- 平均周期（柱），总时长 （折）-->
                                <div id="lifecycleHourAvg" style="height:${boxHeight}px"></div>

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

        $(function () {
            //  ------------------------------
            //  1.设备数（柱），总时长（折）.start
            //  ------------------------------
            function mobileCountChart() {
                var mobileCountChartBox = echarts.init(document.getElementById('mobileCount'));
                var mobileCountData = eval('(${mobileCountData})');
                var dateData = mobileCountData.dateList;
                var countData = mobileCountData.countList;
                var sumData = mobileCountData.sumList;
                var mobileCountOption = {
                    calculable: true,
                    title: {
                        text: "最近${timeType}天-设备使用统计",
                        x: "left"
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            mark: {show: true},
                            dataView: {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    calculable: true,
                    legend: {
                        x : 'center',
                        data: ['设备数', '总时长']
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: dateData
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            name: '设备',
                            axisLabel: {
                                formatter: '{value} 台'
                            }
                        },
                            {
                                type: 'value',
                                name: '时长',
                                axisLabel: {
                                    formatter: '{value} 秒'
                                }
                            }
                    ],
                    series: [
                        {
                            name: '设备数',
                            type: 'bar',
                            data: countData
                        },
                        {
                            name: '总时长',
                            type: 'line',
                            yAxisIndex: 1,
                            data: sumData
                        }
                    ]
                };

                // 为echarts对象加载数据
                mobileCountChartBox.setOption(mobileCountOption);
            }
            mobileCountChart();
            //  ------------------------------
            //  1.设备数（柱），总时长（折）.end
            //  ------------------------------

            //  ------------------------------
            //  2.栏目/功能点击数，合并（堆积条形图）.start
            //  ------------------------------
            function keyCountChart() {
                var chartBox = echarts.init(document.getElementById('keyCount'));
                var jsonData = eval('(${keyCountData})');
                var dateData = jsonData.dateList;
                var countData = jsonData.countList;
                var legendData = jsonData.legendList;
                var keyCountOption = {
                    calculable: true,
                    title: {
                        text: "最近${timeType}天-栏目/功能点击数",
                        x: "left"
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'stack', 'tiled']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable: true,
                    legend: {
                        x : 'center',
                        data: legendData
                    },
                    xAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    yAxis: [
                        {
                            type : 'category',
                            data : dateData
                        }
                    ],
                    series: countData
                };

                // 为echarts对象加载数据
                chartBox.setOption(keyCountOption);
            }
            keyCountChart();
            //  ------------------------------
            //  2.栏目/功能点击数，合并（堆积条形图）.end
            //  ------------------------------

            //  ------------------------------
            //  3.模块点击数，合并（堆积条形图）.start
            //  ------------------------------
            function modelCountChart() {
                var chartBox = echarts.init(document.getElementById('modelCount'));
                var jsonData = eval('(${modelCountData})');
                var dateData = jsonData.dateList;
                var countData = jsonData.countList;
                var legendData = jsonData.legendList;
                var option = {
                    calculable: true,
                    title: {
                        text: "最近${timeType}天-模块点击数",
                        x: "left"
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'stack', 'tiled']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable: true,
                    legend: {
                        x : 'center',
                        data: legendData
                    },
                    xAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    yAxis: [
                        {
                            type : 'category',
                            data : dateData
                        }
                    ],
                    series: countData
                };

                // 为echarts对象加载数据
                chartBox.setOption(option);
            }
            modelCountChart();
            //  ------------------------------
            //  3.模块点击数，合并（堆积条形图）.end
            //  ------------------------------

            //  ------------------------------
            //  4.栏目使用平均时长（折线图）.start
            //  ------------------------------
            function keyUseAvgChart() {
                var chartBox = echarts.init(document.getElementById('keyUseAvg'));
                var jsonData = eval('(${keyUseAvgData})');
                var dateData = jsonData.dateList;
                var countData = jsonData.countList;
                var legendData = jsonData.legendList;
                var option = {
                    title: {
                        text: "最近${timeType}天-栏目/功能使用平均时长",
                        x: "left"
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'stack', 'tiled']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable: true,
                    legend: {
                        x : 'center',
                        /*y : '35',*/
                        data: legendData
                    },
                    yAxis: [
                        {
                            type: 'value',
                            name: '时长',
                            axisLabel: {
                                formatter: '{value} 秒'
                            }
                        }
                    ],
                    xAxis: [
                        {
                            type : 'category',
                            data : dateData
                        }
                    ],
                    series: countData
                };

                // 为echarts对象加载数据
                chartBox.setOption(option);
            }
            keyUseAvgChart();
            //  ------------------------------
            //  4.栏目使用平均时长（折线图）.end
            //  ------------------------------


            //  ------------------------------
            //  5.时段使用频率统计（折线面积图）.start
            //  ------------------------------
            function keyHourAvgChart() {
                var chartBox = echarts.init(document.getElementById('keyHourAvg'));
                var jsonData = eval('(${keyHourAvgData})');
                var dateData = jsonData.dateList;
                var countData = jsonData.countList;
                var legendData = jsonData.legendList;
                var option = {
                    title: {
                        text: "最近${timeType}天-各时段使用频率",
                        x: "left"
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'stack', 'tiled']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable: true,
                    legend: {
                        x : 'center',
                        /*y : '35',*/
                        data: legendData
                    },
                    yAxis: [
                        {
                            type: 'value',
                            name: '频率',
                            axisLabel: {
                                formatter: '{value} 次'
                            }
                        }
                    ],
                    xAxis: [
                        {
                            type : 'category',
                            data : dateData
                        }
                    ],
                    series: countData
                };

                // 为echarts对象加载数据
                chartBox.setOption(option);
            }
            keyHourAvgChart();
            //  ------------------------------
            //  5.时段使用频率统计（折线面积图）.end
            //  ------------------------------

            //  ------------------------------
            //  6.APP使用平均周期（柱状图）.start
            //  ------------------------------
            function lifecycleHourAvgChart() {
                var chartBox = echarts.init(document.getElementById('lifecycleHourAvg'));
                var jsonData = eval('(${lifecycleHourAvgData})');
                var dateData = jsonData.dateList;
                var countData = jsonData.countList;
                var legendData = ["平均周期"];
                var option = {
                    title: {
                        text: "最近${timeType}天-APP使用平均周期",
                        x: "left"
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'stack', 'tiled']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable: true,
                    legend: {
                        x : 'center',
                        /*y : '35',*/
                        data: legendData
                    },
                    yAxis: [
                        {
                            type: 'value',
                            name: '周期',
                            axisLabel: {
                                formatter: '{value} 秒'
                            }
                        }
                    ],
                    xAxis: [
                        {
                            type : 'category',
                            data : dateData
                        }
                    ],
                    series: [
                        {
                            name:'周期',
                            type:'bar',
                            data:countData
                        }
                    ]
                };

                // 为echarts对象加载数据
                chartBox.setOption(option);
            }
            lifecycleHourAvgChart();
            //  ------------------------------
            //  6.APP使用平均周期（柱状图）.end
            //  ------------------------------
        });
    </script>
</@footer>