$(document).ready(function () {

    fhasoeihf();  //政务服务
    jicfuwu();   //基础服务
    zxzxPhbList();  //在线咨询
    wsbs(); //网上办事
    wsblBjsqsl();// 日申请折线图
    wsblBmbj();  //部门办结排行
    ymsj();//新闻咨询
    usertogji();//平台用户
    setInterval("shij()", 1000);
});

//政务服务
function fhasoeihf() {
    setTimeout(fhasoeihf, 1000 * 60 * 60);
    var yfsiojr = echarts.init(document.getElementById('div1'));
    $.post('/eDataCenter/banshi/bssxZwfwXzspZjfw', function (response) {
        var options = {
            tooltip: {
                trigger: 'axis',
                show: false,
            },

            title: {
                text: "政务\n服务",
                x: 'center',
                y: 'center',
                textStyle: {
                    color: '#E7E7EC',
                    fontSize: 20,
                    fontWeight: '',


                }
            },
            calculable: false,
            color: ['#F19510', '#6054FF'],
            series: [
                {
                    type: 'pie',
                    radius: ['74%', '90%'],
                    itemStyle: {
                        normal: {
                            label: {
                                show: false
                            },
                            labelLine: {
                                show: false
                            }
                        },
                    },
                    data: [{value: response.data[1].num, name: '行政审批'}, {value: response.data[0].num, name: '基层服务'}]
                }
            ]
        };
        yfsiojr.setOption(options);
        $('#xzspshu').html(response.data[1].num);
        $('#jcfwshu').html(response.data[0].num);

        var xzspzb = toPercent(response.data[1].num, response.data[0].num);
        var jcfwzb = toPercent(response.data[0].num, response.data[1].num);
        $('#xzspzb').html(xzspzb);
        $('#jcfwzb').html(jcfwzb);

    });
}

//基层服务
function jicfuwu() {
    setTimeout(jicfuwu, 1000 * 60 * 60);
    var yfsiof = echarts.init(document.getElementById('div2'));
    $.post('/eDataCenter/banshi/bssxJcfwCs', function (response) {
        var yfsiofiuase = {
            tooltip: {
                trigger: 'axis',
                show: false,
            },
            title: {
                text: '基层\n服务',
                x: 'center',
                y: 'center',
                textStyle: {
                    color: '#E7E7EC',
                    fontSize: 20,
                    fontWeight: '',

                }
            },
            calculable: false,
            color: ['#33D160', '#027FF4', '#F15115'],
            series: [
                {
                    type: 'pie',
                    radius: ['74%', '90%'],
                    itemStyle: {
                        normal: {
                            label: {
                                show: false
                            },
                            labelLine: {
                                show: false
                            }
                        },
                    },
                    data: [
                        {value: response.data[0].num, name: '一次不用跑'},
                        {value: response.data[1].num, name: '只跑一次'},
                        {value: response.data[2].num, name: '其他'},
                    ]
                }
            ]
        };
        yfsiof.setOption(yfsiofiuase);
        $('#zpycshu').html(response.data[1].num);
        $('#ycbypshu').html(response.data[0].num);
        $('#qitashu').html(response.data[2].num);
        var xzspzb = toPercent(response.data[1].num, response.data[0].num + response.data[2].num);
        var jcfwzb = toPercent(response.data[0].num, response.data[1].num + response.data[2].num);
        var yitazb = toPercent(response.data[2].num, response.data[0].num + response.data[1].num);
        $('#zpyczb').html(xzspzb);
        $('#ycbypzb').html(jcfwzb);
        $('#yitazb').html(yitazb);
    });
}

//在线咨询
function zxzxPhbList() {
    setTimeout(jicfuwu, 1000 * 60 * 30);
    $.post('/eDataCenter/zxzx/zxzxPhbList?topNum=6', function (response) {
        if (response.count == 0) {
            var html = "";
            for (var i = 0; i < response.data.length; i++) {
                var inx = i + 1;
                html += ' <li>' +
                    '<a>' +
                    '<text class="tile zxtile">' + inx + '</text>' +
                    ' <text class="zhongj zxzhongj">' + response.data[i].title + '</text>' +
                    '<text class="liang zxliang">' + response.data[i].num + '</text>' +
                    '</a>' +
                    '</li>'
            }
            $("#lusjie").html(html);
        }
    });
    $.post('/eDataCenter/zxzx/zxzxPhbZxslAndPhbDfl', function (succeed) {
        if (succeed.count == 0) {
            $("#zxshu").html(succeed.data.zs);
            $("#hfl").html(succeed.data.hfl + '%');
        }
    });
}

function wsbs() {
    setTimeout(wsbs, 1000 * 60 * 30);
    $.post('/eDataCenter/wsbs/wsblLjbjAndSlsxAndBjl', function (succeed) {
        if (succeed.count == 0) {
            $("#ljbj").html(succeed.data[0].num);
            $("#ljsl").html(succeed.data[0].totalnum);
            $("#zbjl").html(Math.round(succeed.data[0].othernum) + '%');
        }
    });
}

function wsblBjsqsl() {
    setTimeout(wsblBjsqsl, 1000 * 60 * 30);
    var myChart = echarts.init(document.getElementById('main'));
    $.post('/eDataCenter/wsbs/wsblBjsqsl', function (succeed) {
        var option = {
            tooltip: {
                trigger: 'axis',
                show: false,
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            calculable: true,
            title:
                {
                    left: 'center',
                    text:
                        '按日统计办事申请数量',
                    textStyle:
                        {
                            color: '#1E7190'
                        }
                },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    data: succeed.data.day1,
                    splitLine: {show: false},//去除网格线
                    splitArea: {show: false},//保留网格区域

                    axisLine: {
                        lineStyle: {
                            type: 'solid',
                            color: '#1A4984',//左边线的颜色
                            width: '2',//坐标线的宽度
                        }
                    },
                    axisLabel: {
                        textStyle: {
                            color: '#FFF',//坐标值得具体的颜色
                        },
                        interval: 0,
                    }
                }
            ],
            yAxis:
                [
                    {
                        type: 'value',
                        splitLine: {show: true, lineStyle: {color: '#1A4984', width: '1'}},//去除网格线
                        splitArea: {show: false},//保留网格区域
                        minInterval: 1,
                        axisLine: {
                            lineStyle: {
                                type: 'solid',
                                color: '#1A4984',
                                width: '2',
                            },

                        },
                        title: {
                            left: '10'
                        },
                        axisLabel: {
                            textStyle: {
                                color: '#fff'
                            },
                            interval: 0,
                        },

                    },

                ],
            series:
                [
                    {
                        name: '日申请量',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                label: {show: false},
                                color: '#F3A200',
                                background: '#F3A200',
                                lineStyle: {color: '#F5A100', width: '2'},
                                splitLine: {show: false},

                            }
                        },
                        areaStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(0, 0, 0, 2, [{
                                    offset: 0,
                                    color: '#F5A100'
                                }, {
                                    offset: .34,
                                    color: 'rgba(56,155,250,0.1)'
                                }, {
                                    offset: 1,
                                    color: 'rgba(38,197,255,0.00)'
                                }])

                            }
                        },
                        data: succeed.data.num1
                    }
                ]
        };
        myChart.setOption(option);
    });
}

function wsblBmbj() {
    setTimeout(wsblBjsqsl, 1000 * 60 * 60);
    $.post('/eDataCenter/wsbs/wsblBmbj', function (response) {
        if (response.count == 0) {
            var html = "";
            for (var i = 0; i < response.data.length; i++) {
                var inx = i + 1;
                // html += ' <tr>' +
                //     '<td class="tile tuerfd">' + inx + '</td>' +
                //     '<td class="zhongj fhasjke">' + response.data[i].title + '</td>' +
                //     '<td class="liang jfioewr">' + Math.round(response.data[i].othernum) + '%</td>' +
                //     ' </tr>'


                html += ' <li>' +
                    '<a>' +
                    '<b class="kf_index">' + inx + '</b>' +
                    '<b class="kf_comse">' + response.data[i].title + '</b>' +
                    '<b class="kf_baifen">' + Math.round(response.data[i].othernum) + '%</b>' +
                    '</a>' +
                    '</li>'
            }
            $("#ihfiawe").html(html);
        }
    });
}

function ymsj() {
    setTimeout(ymsj, 1000 * 60 * 60);
    //云媒数据--总新闻数量
    $.post('/eDataCenter/ymsj/Zxwsl', function (succeed) {
        if (succeed.count == 0) {

        }
    });
    //云媒数据--今日新闻数量
    $.post('/eDataCenter/ymsj/Jrxwsl', function (succeed) {
        if (succeed.count == 0) {

        }
    });
    // 云媒数据--用户回帖量
    $.post('/eDataCenter/ymsj/Yhht', function (succeed) {
        if (succeed.count == 0) {

        }
    });
    // 云媒数据--热点新闻点击排行
    $.post('/eDataCenter/ymsj/Rdxw', function (succeed) {
        if (succeed.count == 0) {

        }
    });
    //云媒数据--每月pv/ip数（按月-折线）
    var news = echarts.init(document.getElementById('mainur'));
    $.post('/eDataCenter/ymsj/Ipsl', function (succeed) {
        if (succeed.count == 0) {
            var news_tongji = {
                tooltip: {
                    trigger: 'axis',
                    show: false,
                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                },
                calculable: true,
                title: {
                    left: 'center',
                    text: '每月PV/IP数',
                    textStyle: {color: '#1E7190'}
                },
                xAxis: [
                    {
                        type: 'category',
                        boundaryGap: false,
                        data: ["3月", "4月", "5月", "6月", "7月", "8月", "9月"],
                        splitLine: {show: false},//去除网格线
                        splitArea: {show: false},//保留网格区域

                        axisLine: {
                            lineStyle: {
                                type: 'solid',
                                color: '#1A4984',//左边线的颜色
                                width: '2',//坐标线的宽度
                            }
                        },
                        axisLabel: {
                            textStyle: {
                                color: '#FFF',//坐标值得具体的颜色
                            },
                            interval: 0,
                        }
                    }
                ],
                yAxis:
                    [
                        {
                            type: 'value',
                            splitLine: {show: true, lineStyle: {color: '#1A4984', width: '1'}},//去除网格线
                            splitArea: {show: false},//保留网格区域
                            minInterval: 1,
                            axisLine: {
                                lineStyle: {
                                    type: 'solid',
                                    color: '#1A4984',
                                    width: '2',
                                },

                            },
                            title: {
                                left: '10'
                            },
                            axisLabel: {
                                textStyle: {
                                    color: '#fff'
                                },

                                interval: 0,
                            },

                        },

                    ],
                series:
                    [
                        {
                            name: '日申请量',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    label: {show: false},
                                    color: '#00ACFE',
                                    background: '#00ACFE',
                                    lineStyle: {color: '#00ACFE', width: '2'},
                                    splitLine: {show: false},

                                }
                            },
                            areaStyle: {
                                normal: {
                                    color: new echarts.graphic.LinearGradient(0, 0, 0, 2, [{
                                        offset: 0,
                                        color: '#00ACFE'
                                    }, {
                                        offset: .34,
                                        color: 'rgba(56,155,250,0.1)'
                                    }, {
                                        offset: 1,
                                        color: 'rgba(38,197,255,0.00)'
                                    }])

                                }
                            },
                            data: [253, 500, 123, 452, 255, 453, 353]
                        }
                    ]
            };
            news.setOption(news_tongji);
        }
    });
}

function usertogji() {
    setTimeout(ymsj, 1000 * 60 * 60);
    var usert = echarts.init(document.getElementById('usettoa'));
    $.post('/eDataCenter/usertj/ptyhLjaz', function (succeed) {
        if (succeed.count == 0) {
            var dataStyle = {
                normal: {
                    label: {show: false},
                    labelLine: {show: false}
                }
            };
            var placeHolderStyle = {
                normal: {
                    color: 'rgba(0,0,0,0)',
                    label: {show: false},
                    labelLine: {show: false}
                },
                emphasis: {
                    color: 'rgba(0,0,0,0)'
                }
            };

            var usertoe = {

                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                color: ['#63B8FF', '#FFBBFF'],
                series: [
                    {
                        type: 'pie',
                        radius: '62%',
                        center: ['50%', '50%'],
                        selectedMode: 'single',
                        data: [
                            {value: succeed.data.sbsl, name: '安装用户\n' + succeed.data.sbsl},
                            {value: succeed.data.yhsl, name: '注册用户\n' + succeed.data.yhsl},

                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(255,255,255, 1)'
                            }
                        }
                    }
                ]
            };

            usertoe.series[0].startAngle = 225;

            usert.setOption(usertoe);

            $("#zcyh").html(succeed.data.sbsl);
            $("#anzyh").html(":" + succeed.data.yhsl);
        }
    });

    $.post('/eDataCenter/usertj/ptyhGr', function (succeed) {
        if (succeed.count == 0) {
            $("#grNum").html(succeed.data.grNum);
            $("#grzbNum").html(succeed.data.grzbNum + "%");
            $("#qyNum").html(succeed.data.qyNum);
            $("#qyzbNum").html(succeed.data.qyzbNum + "%");

        }
    });
    var userzz = echarts.init(document.getElementById('user_zheng'));
    $.post('/eDataCenter/ptyh/Xz', function (succeed) {
        if (succeed.count == 0) {
            var userzhengz = {

                tooltip: {
                    trigger: 'axis',
                    backgroundColor: 'rgba(255,255,255,0.7)',
                    axisPointer: {
                        type: 'shadow'
                    },

                },
                grid: {
                    y: 10,
                    y2: 30,
                    x2: 40
                },
                xAxis: [
                    {
                        type: 'category',
                        data: succeed.data.sj,
                        splitLine: {show: false},//去除网格线
                        splitArea: {show: false},//保留网格区域

                        axisLine: {
                            lineStyle: {
                                type: 'solid',
                                color: '#1A4984',//左边线的颜色
                                width: '2',//坐标线的宽度
                            }
                        },
                        axisLabel: {
                            textStyle: {
                                color: '#FFF',//坐标值得具体的颜色
                            },
                            interval: 0,
                        }
                    }

                ],
                yAxis: [
                    {
                        type: 'value',
                        min: 0,
                        splitNumber: 5,
                        boundaryGap: [0.2, 0.2],
                        splitLine: {show: true, lineStyle: {color: '#1A4984', width: '1'}},//去除网格线
                        splitArea: {show: false},//保留网格区域
                        axisLine: {
                            lineStyle: {
                                type: 'solid',
                                color: '#1A4984',
                                width: '2',
                            },

                        },
                        title: {
                            left: '10'
                        },
                        axisLabel: {
                            textStyle: {
                                color: '#fff'
                            },
                            interval: 0,
                        }
                    }
                ],
                series: [
                    {
                        type: 'bar',
                        itemStyle: {
                            color: '#00BBFE'
                        },
                        barWidth: 20,//柱图宽度
                        data: succeed.data.shu,
                    }
                ]
            };
            userzz.setOption(userzhengz);
        }
    });

}

function shij() {

    var myDate = new Date();
//获取当前年
    var year = myDate.getFullYear();
//获取当前月
    var month = myDate.getMonth() + 1;
//获取当前日
    var date = myDate.getDate();
    var h = myDate.getHours();       //获取当前小时数(0-23)
    var m = myDate.getMinutes();     //获取当前分钟数(0-59)
    var s = myDate.getSeconds();
    var nyr = year + '年' + getNow(month) + "月" + getNow(date) + "日";
    var shij = yeret(h) + " " + h + ":" + m;
    $(".riqi").html(nyr);
    $(".shij").html(shij);
}

function getNow(s) {
    return s < 10 ? '0' + s : s;
}

function yeret(h) {
    if (h < 6 && h > 18) {
        return "晚上"
    }
    if (h > 6 && h < 12) {
        return "上午"
    }
    return "下午"
}

function toPercent(num, num1) {
    var total = num + num1;
    return (Math.round(num / total * 100) + "%");
}

