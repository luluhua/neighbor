<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 办事状态统计</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body table-responsive no-padding">
                            <div class="middle">
                                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                                <div id="recordStatusDay" style="margin-top: 30px;height:650px"></div>
                            </div>
                            <div class="push"></div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div>
            </div>
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
</@body>
<@footer>
    <script src="/app/js/echarts.min.js"></script>
    <script>

        $(function(){
            var record_today="${record_today!}";
            var record_today_num="${record_today_num!}";
            var record_today_arr=[];
            var record_today_num_arr=[];
            if(record_today.length>0){
                record_today_arr=record_today.split(",");
            }
            if(record_today_num.length>0){
                record_today_num_arr=record_today_num.split(",");
                for(var i=0;i<record_today_num_arr.length;i++){
                    record_today_num_arr[i]=parseInt(record_today_num_arr[i]);
                }
            }
            var recordStatusDay = echarts.init(document.getElementById('recordStatusDay'));
            var recordStatusDayOption ={
                calculable: true,
                title: {
                    text: "截止到今日办事统计",
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
                    data: record_today_arr
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
                    data: record_today_num_arr
                }]
            };
            recordStatusDay.setOption(recordStatusDayOption);
        });
    </script>
</@footer>