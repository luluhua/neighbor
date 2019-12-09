<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > （安装/使用）机型分布</small>
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
                                <div id="clients" style="height:380px"></div>
                                <div id="androidClients" style="height:380px"></div>
                                <div id="iosClients" style="height:380px"></div>
                            </div>
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
            //------ 以下第一图表 -----//
            var type_arr=[];
            var mobilePlatforms="${mobilePlatforms!}";
            var mobilePlatforms_nums="${mobilePlatforms_nums!}";
            var mobilePlatforms_arr=[];
            var mobilePlatforms_nums_arr=[];
            if(mobilePlatforms.length>0){
                mobilePlatforms_arr=mobilePlatforms.split(",");
                type_arr=type_arr.concat(mobilePlatforms_arr);
            }
            if(mobilePlatforms_nums.length>0){
                mobilePlatforms_nums_arr=mobilePlatforms_nums.split(",");
                if(mobilePlatforms_nums_arr.length>0){
                    for(var i=0;i<mobilePlatforms_nums_arr.length;i++){
                        mobilePlatforms_nums_arr[i]=parseInt(mobilePlatforms_nums_arr[i]);
                    }
                }
            }
            var mobilePlatforms_pie_value=[];
            if(mobilePlatforms_arr.length>0){
                for(var i=0;i<mobilePlatforms_arr.length;i++){
                    var mobilePlatforms_pie={
                        value:mobilePlatforms_nums_arr[i],
                        name:mobilePlatforms_arr[i]
                    };
                    mobilePlatforms_pie_value.push(mobilePlatforms_pie);
                }
            }
            var clients = echarts.init(document.getElementById('clients'));
            var clientsOption ={
                tooltip: {
                    trigger: 'item',
                    formatter:function(data){
                        return  data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                    }
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
                calculable : true,
                title: {
                    text: '手机系统分布统计',
                    x:'center'
                },
                legend: {
                    orient : 'vertical',
                    x : 'left',
                    data:type_arr
                },
                series : [
                    {
                        name: '机型',
                        type : 'pie',
                        center : ['50%', '50%'],
                        radius: '50%',
                        percentPrecision: 1,
                        data : mobilePlatforms_pie_value,
                        label: {
                            normal: {
                                formatter:function(data){
                                    return  data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                                }
                            }
                        }
                    }
                ]
            };
            // 为echarts对象加载数据
            clients.setOption(clientsOption);
            //------ 以上第一图表 -----//

            //------ 以下第二图表 -----//
            var android_type_arr=[];
            var androidPlatforms="${androidPlatforms!}";
            var androidPlatforms_nums="${androidPlatforms_nums!}";
            var androidPlatforms_arr=[];
            var androidPlatforms_nums_arr=[];
            if(androidPlatforms.length>0){
                androidPlatforms_arr=androidPlatforms.split(",");
                android_type_arr=android_type_arr.concat(androidPlatforms_arr);
            }
            if(androidPlatforms_nums.length>0){
                androidPlatforms_nums_arr=androidPlatforms_nums.split(",");
                if(androidPlatforms_nums_arr.length>0){
                    for(var i=0;i<androidPlatforms_nums_arr.length;i++){
                        androidPlatforms_nums_arr[i]=parseInt(androidPlatforms_nums_arr[i]);
                    }
                }
            }
            var androidPlatforms_pie_value=[];
            if(androidPlatforms_arr.length>0){
                for(var i=0;i<androidPlatforms_arr.length;i++){
                    var androidPlatforms_pie={
                        value:androidPlatforms_nums_arr[i],
                        name:androidPlatforms_arr[i]
                    };
                    androidPlatforms_pie_value.push(androidPlatforms_pie);
                }
            }
            var androidClients = echarts.init(document.getElementById('androidClients'));
            var androidClientsOption ={
                tooltip: {
                    trigger: 'item',
                    formatter:function(data){
                        return  data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                    }
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
                calculable : true,
                title: {
                    text: '安卓系统机型分布统计',
                    x:'center'
                },
                legend: {
                    orient : 'vertical',
                    x : 'left',
                    data:android_type_arr
                },
                series : [
                    {
                        name: '机型',
                        type : 'pie',
                        center : ['50%', '50%'],
                        radius: '50%',
                        percentPrecision: 1,
                        data : androidPlatforms_pie_value,
                        label: {
                            normal: {
                                formatter:function(data){
                                    return  data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                                }
                            }
                        }
                    }
                ]
            };
            // 为echarts对象加载数据
            androidClients.setOption(androidClientsOption);
            //------ 以上第二图表 -----//

            //------ 以下第三图表 -----//
            var ios_type_arr=[];
            var iosPlatforms="${iosPlatforms!}";
            var iosPlatforms_nums="${iosPlatforms_nums!}";
            var iosPlatforms_arr=[];
            var iosPlatforms_nums_arr=[];
            if(iosPlatforms.length>0){
                iosPlatforms_arr=iosPlatforms.split(",");
                ios_type_arr=ios_type_arr.concat(iosPlatforms_arr);
            }
            if(iosPlatforms_nums.length>0){
                iosPlatforms_nums_arr=iosPlatforms_nums.split(",");
                if(iosPlatforms_nums_arr.length>0){
                    for(var i=0;i<iosPlatforms_nums_arr.length;i++){
                        iosPlatforms_nums_arr[i]=parseInt(iosPlatforms_nums_arr[i]);
                    }
                }
            }
            var iosPlatforms_pie_value=[];
            if(iosPlatforms_arr.length>0){
                for(var i=0;i<iosPlatforms_arr.length;i++){
                    var iosPlatforms_pie={
                        value:iosPlatforms_nums_arr[i],
                        name:iosPlatforms_arr[i]
                    };
                    iosPlatforms_pie_value.push(iosPlatforms_pie);
                }
            }
            var iosClients = echarts.init(document.getElementById('iosClients'));
            var iosClientsOption ={
                tooltip: {
                    trigger: 'item',
                    formatter:function(data){
                        return  data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                    }
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
                calculable : true,
                title: {
                    text: '苹果系统机型分布统计',
                    x:'center'
                },
                legend: {
                    orient : 'vertical',
                    x : 'left',
                    data:ios_type_arr
                },
                series : [
                    {
                        name: '机型',
                        type : 'pie',
                        center : ['50%', '50%'],
                        radius: '50%',
                        percentPrecision: 1,
                        data : iosPlatforms_pie_value,
                        label: {
                            normal: {
                                formatter:function(data){
                                    return  data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                                }
                            }
                        }
                    }
                ]
            };
            // 为echarts对象加载数据
            iosClients.setOption(iosClientsOption);
            //------ 以上第三图表 -----//
        });
    </script>
</@footer>