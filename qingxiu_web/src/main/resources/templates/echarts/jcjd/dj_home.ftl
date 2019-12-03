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
    <link href="/jcjd/qxdashboard/main2.css" rel="stylesheet"/>
    <script>var gScreenAspectFit = true;</script>
    <script src="/jcjd/qxdashboard/main.js"></script>
    <link href="/jcjd/qxdashboard/home.css?v=1" rel="stylesheet"/>
    <script src="/jcjd/qxdashboard/home.js"></script>
</head>
<body>
<div id="main-scene" class="scene">
    <div class="scene-page scene-home">
        <div class="main-top-banner">
            <div class="panel pnl-left" id="now-date">${(date)!}</div>
            <input id="pid" type="hidden" value="${(dftOrgUnit.id)!}">
            <input id="mapImg" type="hidden" value="${(dftOrgUnit.mapImg)!}">
            <input id="brief" type="hidden" value="${(dftOrgUnit.brief)!}">
            <div class="panel pnl-center" id="slt-unit">青秀区</div>
            <div class="panel pnl-right">
                <#--<iframe name="weather_inc"-->
                        <#--src="http://i.tianqi.com/index.php?c=code&id=52&icon=1&num=3&color=%23FFFFFF"-->
                        <#--width="98" height="20" frameborder="0" marginwidth="0"-->
                        <#--marginheight="0"-->
                        <#--scrolling="no"></iframe>-->
            </div>
        </div>

        <div class="main-panel-left">

            <div class="main-panel-left-row">
                <div class="dsj-dj-chart-01 float-left pop_uy">
                    <div class="caption">党组织</div>
                    <div class="number-box">
                        <div class="item animated zoomIn" id="unit-total-box">
                            <b class="number counter" id="unit-total">71</b>
                            <p>党组织数</p>
                        </div>
                    </div>
                    <div id="dsj-chart-01" class="panel-chart animated fadeIn"></div>
                </div>
                <div class="dsj-dj-chart-01 float-right">
                    <div class="caption">党员</div>
                    <div class="number-box number-box2-w2">
                        <div class="item float-left animated zoomIn pop_uy" id="member-total-box">
                            <b class="number counter" id="member-total">43000</b>
                            <p>党员总人数</p>
                        </div>
                        <div class="item float-right animated zoomIn pop_uy" id="member-total-box">
                            <b class="number counter" id="member-party-num">0</b>
                            <p>本月政治生日党员数</p>
                        </div>
                    </div>
                    <div id="dsj-chart-02" class="panel-chart  animated fadeIn"></div>
                </div>
            </div>

            <div class="main-panel-left-row">
                <div class="dsj-dj-chart-02 float-left  animated fadeInLeft">
                    <div class="caption">党员男女比例</div>
                    <div id="dsj-chart-03" class="panel-chart"></div>
                </div>
                <div class="dsj-dj-chart-02 float-right  animated fadeInRight">
                    <div class="caption">党员年龄占比</div>
                    <div id="dsj-chart-04" class="panel-chart"></div>
                </div>
            </div>

            <div class="main-panel-left-row   animated fadeInUp">
                <div class="dsj-dj-chart-03 float-left">
                    <div class="caption">党员学历分布</div>
                    <div id="dsj-chart-05" class="panel-chart"></div>
                </div>
            </div>

        </div>

        <div class="main-panel-right">

            <div class="dsj-panel-map animated fadeInUp">
                <div class="mapbox">
                    <img id="map-img" src="${(dftOrgUnit.mapImg)!}"/>
                </div>
            </div>

            <div class="dsj-panel-intro animated fadeInRight">
                <div class="caption" id="brief-title">${(dftOrgUnit.name)!}简介</div>
                <div class="panel-chart">
                    <p class="content" id="brief-content">
                    ${(dftOrgUnit.brief)!}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    (function () {
        var animateName = 'box-pluse';
        var animateNumberBox = function () {
            var delayCall = function (index, ele) {
                setTimeout(function () {
                    $(ele).removeClass('animated zoomIn ' + animateName);
                    $(ele).addClass('animated ' + animateName);
                }, index * 300);
            };

            $('.dj-summary .item').each(function (i, ele) {
                delayCall(i, ele);
            });
        };
        setInterval(animateNumberBox, $('.dj-summary .item').length * 500);
        $('.dj-summary .item').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $(this).removeClass('animated zoomIn').removeClass(animateName);
        });

    })();
</script>

<script>
    var t2 = window.setInterval(function() {
        $.post(
                '/jcjd/get_date',
                {},
                function (r) {
                    $('#now-date').html(r);
                });
    },30*1000);
    //window.clearInterval(t2)  // 去除定时器
    function initDftOrgUnit(that) {
        that.param = {
            pid: ${(dftOrgUnit.id)!},
            mapImg: $('#mapImg').val(),
            brief: $('#brief').val()
        }
    }

    function changeCallBack(id) {
        var that = winPost;
        //更新地图简介
        for (i = 0; i < that.list.length; i++) {
            var item = that.list[i];
            if (parseInt(id) == item.id) {
                console.log(item);
                if (item.mapImg && item.mapImg != '') {
                    $('#map-img').attr('src', item.mapImg);
                } else {
                    $('#map-img').attr('src', that.param.mapImg);
                }
                if (item.brief && item.brief != '') {
                    $('#brief-content').html(item.brief);
                } else {
                    $('#brief-content').html(that.param.brief);
                }
                $('#brief-title').text(item.name + '简介');
                break;
            }
        }
        //更新数据
        that.totalMember({pid: id}, function (r) {
            //总数
            var total = 0;
            var total_partynum=0;
            console.log("------>"+r.data.dataList.length);
            for (i = 0; i < r.data.dataList.length; i++) {
                if(i<4){
                    total += r.data.dataList[i];
                }else{
                    total_partynum+=r.data.dataList[i];
                }
            }
            $('#member-total').text(total);
            $('#member-party-num').text(total_partynum);
            option2.xAxis[0].data = r.data.categoryList;
            option2.series[0].data = r.data.dataList;
            setTimeout(function () {
                gSceneChart.setChart('dsj-chart-02', option2);
            }, 1 * 300);
        });
        that.totalUnit({pid: id}, function (r) {
            //总数
            var total = 0;
            for (i = 0; i < r.data.dataList.length; i++) {
                total += r.data.dataList[i];
            }
            $('#unit-total').text(total);
            option.xAxis[0].data = r.data.categoryList;
            option.series[0].data = r.data.dataList;
            setTimeout(function () {
                gSceneChart.setChart('dsj-chart-01', option);
            }, 1 * 300);
        });
        that.totalMemberByGender({pid: id}, function (r) {
            option3Data = r.data;
            option3.series[0].data = option3Data;
            setTimeout(function () {
                gSceneChart.setChart('dsj-chart-03', option3);
            }, 1 * 300);
        });
        that.totalMemberByAge({pid: id}, function (r) {
            option4.legend.data = r.data.categoryList;
            option4.series[0].data = r.data.dataList;
            setTimeout(function () {
                gSceneChart.setChart('dsj-chart-04', option4);
            }, 1 * 300);
        });
        that.totalMemberByEducation({pid: id}, function (r) {
            option5.yAxis.data = r.data.categoryList;
            option5.series[0].data = r.data.dataList;
            setTimeout(function () {
                gSceneChart.setChart('dsj-chart-05', option5);
            }, 1 * 300);
        });
        //alert(id);
    }

    var option = {
        color: ['#ff7955'],
        tooltip: {
            trigger: 'axis',
            axisPointer: {
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
                data: ['党委', '党工委', '党总支', '党支部', '两新党组织'],
                axisLabel: {
                    interval: 0,
                    color: '#fff',
                    rotate: 0//角度顺时针计算的
                }
            }
        ],
        yAxis: [
            {
                type : 'value',
                axisLabel : {
                    textStyle: {
                        color: '#fff'
                    }
                }
            }
        ],
        series: [
            {
                name: '组织数',
                type: 'bar',
                data: [10, 52, 200, 334, 390],
                itemStyle: {
                    normal: {
                        label: {
                            show: true,
                            textStyle: {
                                fontSize: 14,
                                color: '#FFF',
                                fontFamily: 'globalFirstFont'
                            },
                            //柱子文字垂直显示
                            rotate: 0,
                            align: 'center',
                            verticalAlign: 'middle',
                            position: ['50%',-10],
                            formatter: function (a) {
                                return a.value;
                            }
                        }
                    }
                }
            }
        ]
    };
    var option2 = {
        color: ['#3398DB'],
        tooltip: {
            trigger: 'axis',
            axisPointer: {
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
                data: ['党委', '党工委', '党总支', '党支部', '两新党组织'],
                axisLabel: {
                    interval: 0,
                    color: '#fff',
                    rotate: 0//角度顺时针计算的
                }
            }
        ],
        yAxis: [
            {
                type : 'value',
                axisLabel : {
                    textStyle: {
                        color: '#fff'
                    }
                }
            }
        ],
        series: [
            {
                name: '党员数',
                type: 'bar',
                data: [10, 52, 200, 334, 390],
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
                            align: 'center',
                            verticalAlign: 'middle',
                            position: ['50%',-10],
                            formatter: function (a) {
                                return a.value;
                            }
                        }
                    }
                }
            }
        ]
    };
    var option3Data = [];
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
        legend: {
            orient: 'vertical', // 布局方式，默认为水平布局，可选为：'horizontal' ¦ 'vertical'
            // 水平安放位置，默认为左侧，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）
            x: 'right',
            // 垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）
            y: 'center',
            textStyle: {//图例文字的样式
                color: '#fff',
                fontSize: 16
            },
            formatter: function (name) {
                // 获取legend显示内容
                var total = 0;
                var tarValue = 0;
                for (var i = 0, l = option3Data.length; i < l; i++) {
                    total += option3Data[i].value;
                    if (option3Data[i].name == name) {
                        tarValue = option3Data[i].value;
                    }
                }
                var p = (tarValue / total * 100).toFixed(2);
                return name + ' ' + ' ' + p + '%';
            },
            data: ['男', '女']

        },
        color: ['#63B8FF', '#FFBBFF'],
        series: [
            {
                name: '',
                type: 'pie',
                radius: '80%',
                //center: ['50%', '60%'],
                data: option3Data,
                //标签
                label: {
                    normal: {
                        show: true,
                        position: 'inside',
                        // formatter: '{d}%',//模板变量有 {a}、{b}、{c}、{d}，分别表示系列名，数据名，数据值，百分比。{d}数据会根据value值计算百分比
                        textStyle: {
                            align: 'center',
                            baseline: 'middle',
                            fontFamily: '微软雅黑',
                            fontSize: 15,
                            fontWeight: 'bolder'
                        }
                    },
                },
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    },
                }
            }
        ]
    };
    // 党员年龄比例
    var option4Colors=['#5b34db','#34db43','#23a1fe','#65d6c9','#f77b36'];
    var option4 = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'right',
            y: 'center',
            data: ['18-29岁', '30-39岁', '40-49岁', '50-59岁', '60岁以上'],
            textStyle: {
                fontSize: 14,//字体大小
                color: '#ffffff'//字体颜色
            }
        },
        color:option4Colors,
        series: [
            {
                name: '',
                type: 'pie',
                radius: ['80%', '55%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: true,
                        position: 'inside',
                        per: {
                            color: '#000000',
                            align: 'center',
                            fontSize: 14,
                        },
                        formatter: '{d}%'

                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '14',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: true
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
    //党员学历
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
            bottom: 10,
            top:10,
            containLabel: true
        },
        xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01],
            axisLabel: {
                textStyle: {
                    color: '#ffffff'
                }
            }
        },
        yAxis: {
            type: 'category',
            data: ['小学', '初中', '高中', '中技', '中专', '专科教育', '本科教育', '研究生教育'],
            axisLabel: {
                textStyle: {
                    color: '#ffffff'
                }
            }


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
                            position: 'right',
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
    (function () {
        changeCallBack(${(dftOrgUnit.id)!});
    })();
    $(".pop_uy").click(function () {
        layer.open({
            type: 2,
            content: '/jcjd/wsbs/pop?unid='+winPost.param.pid, //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            area: ["90%", "90%"],
            title: '',
        });
    })
    var openWin = function (url) {
        layer.open({
            type: 2,
            title: '详情',
            area: ['700px', '500px'],
            content: url,
            shade: false
        });
    };
</script>
</body>
</html>