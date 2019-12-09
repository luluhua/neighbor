<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 主题事项统计</small>
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
                                <div id="project1Chart1" style="margin-top:30px;height:300px"></div>
                                <div id="project1Chart2" style="margin-top:30px;height:300px"></div>
                                <div id="project1Chart3" style="margin-top:30px;height:300px"></div>
                                <div id="project1Chart4" style="margin-top:30px;height:300px"></div>
                                <div id="project1Chart5" style="margin-top:30px;height:300px"></div>
                                <div id="project2" style="margin-top:30px;height:400px"></div>
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
            //参数数据
            var type_arr=[];
            var chart1_title="${chart1_title!}";
            var chart1_num="${chart1_num!}";
            var chart1_title_arr=[];
            var chart1_num_arr=[];
            if(chart1_title.length>0){
                chart1_title_arr=chart1_title.split(",");
            }
            if(chart1_num.length>0){
                chart1_num_arr=chart1_num.split(",");
                for(var i=0;i<chart1_num_arr.length;i++){
                    chart1_num_arr[i]=parseInt(chart1_num_arr[i]);
                }
            }
            var chart2_title="${chart2_title!}";
            var chart2_num="${chart2_num!}";
            var chart2_title_arr=[];
            var chart2_num_arr=[];
            if(chart2_title.length>0){
                chart2_title_arr=chart2_title.split(",");
            }
            if(chart2_num.length>0){
                chart2_num_arr=chart2_num.split(",");
                for(var i=0;i<chart2_num_arr.length;i++){
                    chart2_num_arr[i]=parseInt(chart2_num_arr[i]);
                }
            }
            var chart3_title="${chart3_title!}";
            var chart3_num="${chart3_num!}";
            var chart3_othernum="${chart3_othernum!}";
            var chart3_title_arr=[];
            var chart3_num_arr=[];
            var chart3_othernum_arr=[];
            if(chart3_title.length>0){
                chart3_title_arr=chart3_title.split(",");
            }
            if(chart3_num.length>0){
                chart3_num_arr=chart3_num.split(",");
                for(var i=0;i<chart3_num_arr.length;i++){
                    chart3_num_arr[i]=parseInt(chart3_num_arr[i]);
                }
            }
            if(chart3_othernum.length>0){
                chart3_othernum_arr=chart3_othernum.split(",");
                for(var i=0;i<chart3_othernum_arr.length;i++){
                    chart3_othernum_arr[i]=parseInt(chart3_othernum_arr[i]);
                }
            }
            var chart4_title="${chart4_title!}";
            var chart4_num="${chart4_num!}";
            var chart4_title_arr=[];
            var chart4_num_arr=[];
            if(chart4_title.length>0){
                chart4_title_arr=chart4_title.split(",");
            }
            if(chart4_num.length>0){
                chart4_num_arr=chart4_num.split(",");
                for(var i=0;i<chart4_num_arr.length;i++){
                    chart4_num_arr[i]=parseInt(chart4_num_arr[i]);
                }
            }
            //------ 以下第一图表 -----//
            var project1Chart1 = echarts.init(document.getElementById('project1Chart1'));
            var project1Chart1Option ={
                title : {
                    text: '按主题统计',
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
                    data: chart1_title_arr
                },
                series : [
                    {
                        name: '主题统计',
                        type: 'pie',
                        radius : '70%',
                        center: ['50%', '60%'],
                        data:[
                            {value:chart1_num_arr[0], name:chart1_title_arr[0]},
                            {value:chart1_num_arr[1], name:chart1_title_arr[1]},
                            {value:chart1_num_arr[2], name:chart1_title_arr[2]},
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
            };;
            // 为echarts对象加载数据
            project1Chart1.setOption(project1Chart1Option);
            //------ 以上第一图表 -----//
            //------ 以下第二图表 -----//
            var project1Chart2 = echarts.init(document.getElementById('project1Chart2'));
            var project1Chart2Option ={
                title : {
                    text: '按到场次数统计',
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
                    data: chart2_title_arr
                },
                series : [
                    {
                        name: '到场次数统计',
                        type: 'pie',
                        radius : '70%',
                        center: ['50%', '60%'],
                        data:[
                            {value:chart2_num_arr[0], name:chart2_title_arr[0]},
                            {value:chart2_num_arr[1], name:chart2_title_arr[1]},
                            {value:chart2_num_arr[2], name:chart2_title_arr[2]},
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
            };;
            // 为echarts对象加载数据
            project1Chart2.setOption(project1Chart2Option);
            //------ 以上第二图表 -----//
            //------ 以下第三图表 -----//
            var project1Chart3 = echarts.init(document.getElementById('project1Chart3'));
            var project1Chart3Option ={
                title : {
                    text: '按基础事项统计',
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
                    data: chart3_title_arr
                },
                series : [
                    {
                        name: '基础事项统计',
                        type: 'pie',
                        radius : '70%',
                        center: ['50%', '60%'],
                        data:[
                            {value:chart3_num_arr[0], name:chart3_title_arr[0]},
                            {value:chart3_num_arr[1], name:chart3_title_arr[1]},
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
            };;
            // 为echarts对象加载数据
            project1Chart3.setOption(project1Chart3Option);
            //------ 以上第三图表 -----//
            //------ 以下第四图表 -----//
            var project1Chart4 = echarts.init(document.getElementById('project1Chart4'));
            var project1Chart4Option ={
                title : {
                    text: '基层服务中按优化营商类型统计',
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
                    data: ["优化营商","非优化营商"]
                },
                series : [
                    {
                        name: '优化营商类型统计',
                        type: 'pie',
                        radius : '70%',
                        center: ['50%', '60%'],
                        data:[
                            {value:chart3_othernum_arr[0], name:"优化营商"},
                            {value:chart3_num_arr[0]-chart3_othernum_arr[0], name:"非优化营商"},
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
            };;
            // 为echarts对象加载数据
            project1Chart4.setOption(project1Chart4Option);
            //------ 以上第四图表 -----//
            //------ 以下第五图表 -----//
            var project1Chart5 = echarts.init(document.getElementById('project1Chart5'));
            var project1Chart5Option ={
                title : {
                    text: '行政审批中按优化营商类型统计',
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
                    data: ["优化营商","非优化营商"]
                },
                series : [
                    {
                        name: '优化营商类型统计',
                        type: 'pie',
                        radius : '70%',
                        center: ['50%', '60%'],
                        data:[
                            {value:chart3_othernum_arr[1], name:"优化营商"},
                            {value:chart3_num_arr[1]-chart3_othernum_arr[0], name:"非优化营商"},
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
            };;
            // 为echarts对象加载数据
            project1Chart5.setOption(project1Chart5Option);
            //------ 以上第五图表 -----//
			//------ 以下第二图表 -----//
            var project2 = echarts.init(document.getElementById('project2'));
            var project2Option ={
                    calculable: true,
                    title: {
                        text: "事项数量统计",
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
                        data: chart4_title_arr
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
                        data: chart4_num_arr
                    }]
                };
            // 为echarts对象加载数据
            project2.setOption(project2Option);
            //------ 以上第二图表 -----//
        });
    </script>
</@footer>