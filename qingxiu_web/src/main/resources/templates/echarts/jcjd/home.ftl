<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=yes"/>
    <title>基层街道大数据统计</title>
    <script src="/jcjd/libs/jquery/jquery-1.10.2.min.js"></script>
    <script src="/jcjd/libs/jquery/jquery-migrate-1.4.1.js"></script>
    <script src="/jcjd/libs/echarts/echarts.min.js"></script>
    <script src="/jcjd/libs/layer/layer.js"></script>
    <script src="/jcjd/libs/jquery/jquery.waypoints.min.js"></script>
    <script src="/jcjd/libs/jquery/jquery.countup.min.js"></script>
    <script src="/jcjd/libs/perfect-scrollbar/dist/perfect-scrollbar.min.js"></script>
    <link href="/jcjd/libs/animate.3.7.2.min.css" rel="stylesheet"/>
    <link href="/jcjd/qxdashboard/main.css" rel="stylesheet"/>
    <script>var gScreenAspectFit = true;</script>
    <script src="/jcjd/qxdashboard/main.js"></script>
</head>
<body>
<div id="main-scene" class="scene">
    <div class="scene-page scene-home">
        <div class="main-top-banner">
            <div class="panel pnl-left">${(date)!}</div>
            <div class="panel pnl-center">青秀区大数据</div>
            <div class="panel pnl-right">
                <#--<iframe name="weather_inc"-->
                        <#--src="http://i.tianqi.com/index.php?c=code&id=52&icon=1&num=3&color=%23FFFFFF"-->
                        <#--width="98" height="20" frameborder="0" marginwidth="0"-->
                        <#--marginheight="0"-->
                        <#--scrolling="no"></iframe>-->
            </div>
        </div>

        <div class="main-panel-01">
            <div class="dj-summary">
                <div class="item animated zoomIn">
                    <b class="number counter">71</b>
                    <p>党组织数</p>
                </div>
                <div class="item animated zoomIn">
                    <b class="number counter">360</b>
                    <p>党员会议数</p>
                </div>
                <div class="item animated zoomIn">
                    <b class="number counter">24000</b>
                    <p>党员数</p>
                </div>
                <div class="item animated zoomIn">
                    <b class="number counter">5</b>
                    <p>大工委数</p>
                </div>
                <div class="item animated zoomIn">
                    <b class="number counter">58</b>
                    <p>网格数</p>
                </div>
            </div>

            <div class="dj-row">
                <div class="dj-left-p50">
                    <h2 class="sc-title">党员数</h2>
                    <div id="dj-chart-1" class="dj-chart-a"></div>
                </div>
                <div class="dj-right-p50">
                    <h2 class="sc-title">会议次数</h2>
                    <div id="dj-chart-2" class="dj-chart-a"></div>
                </div>
            </div>

            <div class="dj-row">
                <div class="dj-left-p50">
                    <h2 class="sc-title">党员男女比例</h2>
                    <div id="dj-chart-3" class="dj-chart-b"></div>
                </div>
                <div class="dj-right-p50">
                    <h2 class="sc-title">党员年龄占比</h2>
                    <div id="dj-chart-4" class="dj-chart-b"></div>
                </div>
            </div>

            <div class="dj-row">
                <h2 class="sc-title">党员学历</h2>
                <div id="dj-chart-5" class="dj-chart-c"></div>
            </div>

        </div>
        <div class="main-panel-02">
            <div class="panel-map">
                <img class="animated fadeIn" src="/jcjd/qxdashboard/images/qx_map.jpg" style="width: 100%;"/>
            </div>
            <div class="panel-intro animated flipInY">
                <h2 class="title">青秀区简介</h2>
                <div class="intro-content">
                    青秀区是南宁市的核心城区，位于市区东南部，总面积872平方公里，常住人口79.17万，辖4个镇、5个街道和1个省级经济开发区。
                    在2018年10月8日人民日报发布的中国中小城市科学发展指数研究成果中，青秀区是广西唯一同时入选全国“综合实力百强区（78）”、“绿色发展百强区（62）”、“投资潜力百强区（34）”“科技创新百强区（93）”、“新型城镇化质量百强区（76）”五个全国百强区的城区。
                    近年来，青秀区依托独特的区位优势和优越的投资环境，经济社会保持高速增长势头，主要经济指标均位居广西各县区前列。先后荣获了“全国科技进步县区”、“全国卫生服务示范区”、“全国和谐社区建设示范城区”、“广西科学发展先进城区”等多项国家级、自治区级荣誉称号，成为广西经济功能、社会功能、城市功能综合体现最强的城区。2018年青秀区财政收入突破200亿元，是广西首个财政收入超200亿的城区。
                </div>
            </div>
        </div>
        <div class="main-panel-03">

            <div class="dj-summary ">
                <div class="item item2 animated zoomIn">
                    <b class="number counter">70</b>
                    <p class="color-y">事项总数</p>
                </div>
                <div class="item item2 animated zoomIn">
                    <b class="number counter" id="daiban"></b>
                    <p class="color-y">待办</p>
                </div>
                <div class="item item2 animated zoomIn">
                    <b class="number counter" id="banlizhong"></b>
                    <p class="color-y">办理中</p>
                </div>
                <div class="item item2 animated zoomIn">
                    <b class="number counter" id="banjie"></b>
                    <p class="color-y">已办结</p>
                </div>
            </div>

            <div class="dj-row main-right-width">
                <h2 class="sc-title">每日申请数</h2>
                <div id="dj-chart-6" class="ssqx-chart"></div>
            </div>

            <div class="dj-row main-right-width">
                <div class="stat-table-ctx  animated fadeInUp">
                    <table cellpadding="2" cellspacing="0" class="dj-table">
                        <tr>
                            <th>街道名称</th>
                            <th>事项数</th>
                        </tr>
                        <tr class="row-0">
                            <td>新竹街道</td>
                            <td>16</td>
                        </tr>
                        <tr class="row-1">
                            <td>建政街道</td>
                            <td>16</td>
                        </tr>
                        <tr class="row-0">
                            <td>津头街道</td>
                            <td>16</td>
                        </tr>
                        <tr class="row-1">
                            <td>南湖街道</td>
                            <td>16</td>
                        </tr>
                        <tr class="row-0">
                            <td>中山街道</td>
                            <td>16</td>
                        </tr>
                        <tr class="row-1">
                            <td>伶俐镇</td>
                            <td>16</td>
                        </tr>
                        <tr class="row-0">
                            <td>长塘镇</td>
                            <td>16</td>
                        </tr>
                        <tr class="row-1">
                            <td>南阳镇</td>
                            <td>16</td>
                        </tr>
                        <tr class="row-0">
                            <td>伶俐镇</td>
                            <td>16</td>
                        </tr>
                        <tr class="row-1">
                            <td>仙葫开发区</td>
                            <td>16</td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

<script>

</script>
<script>
    (function () {
        //党员统计
        var option1 = {
            color: ['#3398DB'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: ['建政街道', '新竹街道', '南湖街道', '津头街道', '伶俐镇', '长塘镇', '南阳镇', '刘圩镇', '仙葫开发区'],
                    axisTick: {
                        alignWithLabel: true
                    },
                    axisLabel: {
                        rotate: -45
                    }
                }
            ],
            textStyle: {
                fontSize: 15,
                color: '#fff'
            },
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '',
                    type: 'bar',
                    barWidth: '60%',
                    data: [5000, 6000, 4000, 1000, 1000, 600, 500, 600, 500],
                    itemStyle: {
                        normal: {
                            color: function (params) {
                                return '#FF7F00';
                            },
                            label: {
                                show: true,
                                textStyle: {
                                    fontSize: 14,
                                    color: '#FFF',
                                    fontFamily: 'globalFirstFont'
                                },
                                //柱子文字垂直显示
                                rotate: 90,
                                align: 'left',
                                verticalAlign: 'middle',
                                position: 'insideTop',
                                padding_top: 10,
                                formatter: function (a) {
                                    return a.value;
                                }
                            }
                        }
                    }
                }
            ]
        };
        //会议次数统计
        var option2 = {
            color: ['#3398DB'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: ['建政街道', '新竹街道', '南湖街道', '津头街道', '伶俐镇', '长塘镇', '南阳镇', '刘圩镇', '仙葫开发区'],
                    axisTick: {
                        alignWithLabel: true
                    },
                    axisLabel: {
                        rotate: -45
                    }
                }
            ],
            textStyle: {
                fontSize: 15,
                color: '#fff'
            },
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '',
                    type: 'bar',
                    barWidth: '60%',
                    data: [30, 30, 40, 10, 20, 10, 10, 30, 20],
                    itemStyle: {
                        normal: {
                            color: function (params) {
                                return '#4876FF';
                            },
                            label: {
                                show: true,
                                textStyle: {
                                    fontSize: 14,
                                    color: '#FFF',
                                    fontFamily: 'globalFirstFont'
                                },
                                //柱子文字垂直显示
                                rotate: 90,
                                align: 'left',
                                verticalAlign: 'middle',
                                position: 'insideTop',
                                padding_top: 10,
                                formatter: function (a) {
                                    return a.value;
                                }
                            }
                        }
                    }
                }
            ]
        };
        var option3 = {
            title: {
                text: '',
                subtext: '',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            // legend: {
            //     orient: 'vertical',
            //     left: 'left',
            //     data: ['男','女']
            // },
            series: [
                {
                    name: '',
                    type: 'pie',
                    radius: '80%',
                    center: ['50%', '60%'],
                    data: [
                        {value: 20000, name: '男'},
                        {value: 10000, name: '女'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        var option4 = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'right',
                data: ['18-29岁', '30-39岁', '40-49岁', '50-59岁', '60岁以上']
            },
            series: [
                {
                    name: '',
                    type: 'pie',
                    radius: ['50%', '70%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center',
                            per: {
                                color: '#000000',
                                align: 'center',
                                fontSize: 15,
                            }

                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '30',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data: [
                        {value: 335, name: '18-29岁'},
                        {value: 310, name: '30-39岁'},
                        {value: 234, name: '40-49岁'},
                        {value: 135, name: '50-59岁'},
                        {value: 1548, name: '60岁以上'}
                    ]
                }
            ]
        };
        var option5 = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                boundaryGap: [0, 0.01]
            },
            yAxis: {
                type: 'category',
                data: ['小学', '初中', '高中', '中技', '中专', '专科教育', '本科教育', '研究生教育']
            },
            series: [
                {
                    name: '',
                    type: 'bar',
                    data: [6000, 5600, 6000, 12000, 8000, 1000, 1000, 2000],
                    itemStyle: {
                        normal: {
                            color: function (params) {
                                return '#4876FF';
                            },
                            label: {
                                show: true,
                                textStyle: {
                                    fontSize: 14,
                                    color: '#FFF',
                                    fontFamily: 'globalFirstFont'
                                },
                                //柱子文字垂直显示
                                rotate: 0,
                                align: 'left',
                                verticalAlign: 'middle',
                                position: 'insideTop',
                                padding_top: 10,
                                formatter: function (a) {
                                    return a.value;
                                }
                            }
                        }
                    }
                }
            ]
        };

        function fawe(type, stree) {
            var myChart = echarts.init(document.getElementById('dj-chart-6'));
            $.post('/eDataCenter/wsbs/wsblBjsqsl?type=' + type + '&stree=' + stree, function (succeed) {
                var projectOption = {

                    xAxis: {
                        type: 'category',
                        data: succeed.data.day1,
                        axisLabel: {
                            rotate: 360
                        }
                    },
                    textStyle: {
                        fontSize: 15,
                        color: '#fff'
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: succeed.data.num1,
                        type: 'line'
                    }]

                };
                myChart.setOption(projectOption);
            });
        }

        function wsbs(type, streeid) {
            $.post('/eDataCenter/wsbs/jdbwsblLjbjAndSlsxAndBjl?type=' + type + '&streeid=' + streeid, function (succeed) {
                if (succeed.count == 0) {
                    $("#daiban").html(succeed.data.awaitDispose);
                    $("#banlizhong").html(succeed.data.inReview);
                    $("#banjie").html(succeed.data.awaitSend);
                }
            });
        }

        function jdbAccessAndapply(type, streeid) {
            $.post('/eDataCenter/wsbs/jdbAccessAndapply?type=' + type + '&streeid=' + streeid, function (succeed) {
                if (succeed.count == 0) {
                    // $("#daiban").html(succeed.data.awaitDispose);
                    // $("#banlizhong").html(succeed.data.inReview);
                    // $("#banjie").html(succeed.data.awaitSend);
                }
            });
        }


        setTimeout(function () {
            gSceneChart.setChart('dj-chart-1', option1);
        }, 1 * 300);
        setTimeout(function () {
            gSceneChart.setChart('dj-chart-2', option2);
        }, 1 * 300);
        setTimeout(function () {
            gSceneChart.setChart('dj-chart-3', option3);
        }, 1 * 300);
        setTimeout(function () {
            gSceneChart.setChart('dj-chart-4', option4);
        }, 1 * 300);
        setTimeout(function () {
            gSceneChart.setChart('dj-chart-5', option5);
        }, 1 * 300);
        setTimeout(function () {
            gSceneChart.setChart(fawe(2, 2938));
        }, 1 * 300);
        setTimeout(function () {
            gSceneChart.setChart(wsbs(2, 2938));
        }, 1 * 300);
        setTimeout(function () {
            gSceneChart.setChart(jdbAccessAndapply(2, 2938));
        }, 1 * 300);

    })();
</script>
</body>
</html>