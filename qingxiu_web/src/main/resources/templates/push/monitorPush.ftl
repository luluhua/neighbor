<#include "../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 推送监控器</small>
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
                                <div id="queue" style="height:500px"></div>
                            </div>
                            <div class="middle">
                                <div id="push" style="height:500px"></div>
                            </div>
                            <div class="middle">
                                <div id="vm" style="height:500px"></div>
                            </div>
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
            var interval = 5;//间隔5秒
            var len = 60/interval;//  默认创建60秒内的空数据
            var totalMemory = [];
            var freeMemory  = [];
            var maxMemory   = [];
            var usedMemory  = [];

            var jiguangTotalSpeed  = [];
            var jiguangActualSpeed = [];
            var javapnsTotalSpeed  = [];
            var javapnsActualSpeed = [];

            var queueTotal = [];

            var xAxisData = [];
            for(i = 1; i <= len; i++){
                xAxisData.push(i*interval);
                totalMemory.push(0);
                freeMemory.push(0);
                maxMemory.push(0);
                usedMemory.push(0);

                jiguangTotalSpeed.push(0);
                jiguangActualSpeed.push(0);
                javapnsTotalSpeed.push(0);
                javapnsActualSpeed.push(0);

                queueTotal.push(0);
            }

            var vmChartBox = echarts.init(document.getElementById('vm'));
            var vmOption = {
                calculable: true,
                title: {
                    text: "内存使用监控",
                    x: "center"
                },
                tooltip: {
                    trigger: 'axis'
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: {show: true},
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                legend: {
                    x : 'center',
                    y : '35',
                    data: ['总内存', '空闲内存','最大内存','已用内存']
                },
                xAxis: [
                    {
                        type: 'category',
                        data: xAxisData
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '内存',
                        axisLabel: {
                            formatter: '{value} MB'
                        }
                    }
                ],
                series: [
                    {
                        name: '总内存',
                        type: 'line',
                        data: totalMemory
                    },
                    {
                        name: '空闲内存',
                        type: 'line',
                        data: freeMemory
                    },
                    {
                        name: '最大内存',
                        type: 'line',
                        data: maxMemory
                    },
                    {
                        name: '已用内存',
                        type: 'line',
                        data: usedMemory
                    }
                ]
            };
            vmChartBox.setOption(vmOption, true);

            var pushChartBox = echarts.init(document.getElementById('push'));
            var pushOption = {
                calculable: true,
                title: {
                    text: "推送实时监控",
                    x: "center"
                },
                tooltip: {
                    trigger: 'axis'
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: {show: true},
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                legend: {
                    x : 'center',
                    y : '35',
                    data: ['极光统计速率', '极光瞬时速率','APNs统计速率', 'APNs瞬时速率']
                },
                xAxis: [
                    {
                        type: 'category',
                        data: xAxisData
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '速率',
                        axisLabel: {
                            formatter: '{value} 条/分钟'
                        }
                    }
                ],
                series: [
                    {
                        name: '极光统计速率',
                        type: 'line',
                        data: jiguangTotalSpeed
                    },
                    {
                        name: '极光瞬时速率',
                        type: 'line',
                        data: jiguangActualSpeed
                    },
                    {
                        name: 'APNs统计速率',
                        type: 'line',
                        data: javapnsTotalSpeed
                    },
                    {
                        name: 'APNs瞬时速率',
                        type: 'line',
                        data: javapnsActualSpeed
                    }
                ]
            };
            pushChartBox.setOption(pushOption, true);

            var queueChartBox = echarts.init(document.getElementById('queue'));
            var queueOption = {
                calculable: true,
                title: {
                    text: "推送队列监控",
                    x: "center"
                },
                tooltip: {
                    trigger: 'axis'
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: {show: true},
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                legend: {
                    x : 'center',
                    y : '35',
                    data: ['队列数']
                },
                xAxis: [
                    {
                        type: 'category',
                        data: xAxisData
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '总数',
                        axisLabel: {
                            formatter: '{value} 条'
                        }
                    }
                ],
                series: [
                    {
                        name: '队列数',
                        type: 'line',
                        data: queueTotal
                    }
                ]
            };
            queueChartBox.setOption(queueOption, true);
            var retryNum = 0;
            // 获取内存数据
            function getMemory(){
                $.ajax({
                    type: "post",
                    url: '/push/notify/monitorData',
                    data: {},
                    dataType: "json",
                    async:false,
                    success:function(d) {
                        if(!d){
                            if(retryNum < 5){
                                retryNum++;
                            }
                            interval = 30*retryNum;
                            console.log("连接断开，"+interval+"秒后尝试重连...")
                            return;
                        }else{
                            interval = 5;
                        }
                        totalMemory.push(d.data.vmTotal);
                        freeMemory.push(d.data.vmFree);
                        maxMemory.push(d.data.vmMax);
                        usedMemory.push(d.data.vmUse);
                        if (totalMemory.length > len){
                            totalMemory.shift();
                            freeMemory.shift();
                            maxMemory.shift();
                            usedMemory.shift();
                        }
                        vmOption.series = [
                            {
                                name: '总内存',
                                type: 'line',
                                data: totalMemory
                            },
                            {
                                name: '空闲内存',
                                type: 'line',
                                data: freeMemory
                            },
                            {
                                name: '最大内存',
                                type: 'line',
                                data: maxMemory
                            },
                            {
                                name: '已用内存',
                                type: 'line',
                                data: usedMemory
                            }
                        ];
                        vmChartBox.setOption(vmOption, true);

                        jiguangTotalSpeed.push(d.data.jiguangTotalSpeed);
                        jiguangActualSpeed.push(d.data.jiguangActualSpeed);
                        javapnsTotalSpeed.push(d.data.javapnsTotalSpeed);
                        javapnsActualSpeed.push(d.data.javapnsActualSpeed);
                        if (jiguangTotalSpeed.length > len){
                            jiguangTotalSpeed.shift();
                            jiguangActualSpeed.shift();
                            javapnsTotalSpeed.shift();
                            javapnsActualSpeed.shift();
                        }
                        pushOption.series = [
                            {
                                name: '极光统计速率',
                                type: 'line',
                                data: jiguangTotalSpeed
                            },
                            {
                                name: '极光瞬时速率',
                                type: 'line',
                                data: jiguangActualSpeed
                            },
                            {
                                name: 'APNs统计速率',
                                type: 'line',
                                data: javapnsTotalSpeed
                            },
                            {
                                name: 'APNs瞬时速率',
                                type: 'line',
                                data: javapnsActualSpeed
                            }
                        ];
                        pushChartBox.setOption(pushOption, true);

                        queueTotal.push(d.data.pushTotal);
                        if (queueTotal.length > len) {
                            queueTotal.shift();
                        }
                        queueOption.series = [
                            {
                                name: '队列数',
                                type: 'line',
                                data: queueTotal
                            }
                        ];
                        queueChartBox.setOption(queueOption, true);
                    },
                    error:function(){
                        console.log('错误执行方法');
                    }
                });
                window.setTimeout(getMemory, interval*1000);
            }
            window.setTimeout(getMemory, interval*1000);
            //var InterValObj = window.setInterval(getMemory, interval*1000);
        });
    </script>
</@footer>