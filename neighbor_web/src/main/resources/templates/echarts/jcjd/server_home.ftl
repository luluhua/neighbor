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
    <link href="/jcjd/qxdashboard/home.css" rel="stylesheet"/>
    <script src="/jcjd/qxdashboard/home.js"></script>
</head>
<body>
<div id="main-scene" class="scene">
    <div class="scene-page scene-home">
        <div class="main-top-banner">
            <input id="pid" type="hidden" value="${(dftOrgUnit.id)!}">
            <input id="mapImg" type="hidden" value="${(dftOrgUnit.mapImg)!}">
            <input id="brief" type="hidden" value="${(dftOrgUnit.brief)!}">
            <div class="panel pnl-left" id="riqianriqi"></div>
            <div class="panel pnl-center" id="slt-unit">青秀区大数据</div>
            <div class="panel pnl-right">
            <#--<iframe name="weather_inc"-->
            <#--src="http://i.tianqi.com/index.php?c=code&id=52&icon=1&num=3&color=%23FFFFFF"-->
            <#--width="140" height="20" frameborder="0" marginwidth="0"-->
            <#--marginheight="0"-->
            <#--scrolling="no"></iframe>-->
            </div>
        </div>

        <div class="main-panel-left">
            <div class="dsj-summary">
                <div class="item animated zoomIn">
                    <b class="number ">96</b>
                    <p>事项总数</p>
                </div>
                <div class="item animated zoomIn">
                    <b class="number " id="daiban"></b>
                    <p>待办</p>
                </div>
                <div class="item animated zoomIn">
                    <b class="number " id="banlizhong"></b>
                    <p>办理中</p>
                </div>
                <div class="item animated zoomIn">
                    <b class="number " id="banjie"></b>
                    <p>已办结</p>
                </div>
            </div>

            <div class="dsj-chart-daily  animated fadeInLeft">
                <div class="caption">每日申请数</div>
                <div id="dsj-chart-01" class="panel-chart"></div>
            </div>

            <div class="dsj-row">
                <div class="dsj-panel-table float-left">
                    <div class="caption">申请最多</div>
                    <div class="panel-chart animated fadeInUp">
                        <table cellpadding="2" cellspacing="0" class="dsj-table" id="hot">

                        </table>
                    </div>
                </div>
                <div class="dsj-panel-table float-right">
                    <div class="caption">浏览最多</div>
                    <div class="panel-chart animated fadeInUp">
                        <table cellpadding="2" cellspacing="0" class="dsj-table" id="view">

                        </table>
                    </div>
                </div>
            </div>

        </div>

        <div class="main-panel-right">

            <div class="dsj-panel-map animated fadeInUp">
                <#--<div class="tu-dangyuan">-->
                    <#--<img class="pop_uy" src="/jcjd/qxdashboard/images2/tcion.png">-->
                <#--</div>-->
                <div class="mapbox">
                    <img id="map-img" src="/jcjd/qxdashboard/images2/map.png"/>
                </div>
            </div>

            <div class="dsj-panel-intro animated fadeInRight">
                <div class="caption">青秀区简介</div>
                <div class="panel-chart">
                    <p class="content" id="brief-content">
                        青秀区是南宁市的核心城区，位于市区东南部，总面积872平方公里，常住人口79.17万，辖4个镇、5个街道和1个省级经济开发区。
                        在2018年10月8日人民日报发布的中国中小城市科学发展指数研究成果中，青秀区是广西唯一同时入选全国“综合实力百强区（78）”、“绿色发展百强区（62）”、“投资潜力百强区（34）”“科技创新百强区（93）”、“新型城镇化质量百强区（76）”五个全国百强区的城区。
                        近年来，青秀区依托独特的区位优势和优越的投资环境，经济社会保持高速增长势头，主要经济指标均位居广西各县区前列。先后荣获了“全国科技进步县区”、“全国卫生服务示范区”、“全国和谐社区建设示范城区”、“广西科学发展先进城区”等多项国家级、自治区级荣誉称号，成为广西经济功能、社会功能、城市功能综合体现最强的城区。2018年青秀区财政收入突破200亿元，是广西首个财政收入超200亿的城区。
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="pop-up">
<#--<img class="dangyuanimg"-->
<#--src="/jcjd/qxdashboard/images2/dangyuanxinxi.jpg">-->
    <div class="div-left">

    </div>
    <div class="div-right">
        <div class="tab-navigation">
            <h2>一个</h2>
            <h2>二个</h2>
            <h2>3个</h2>
        </div>
    </div>
</div>

<script>
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
        if (id == 1) {
            wsbs(1, id);
            jdbAccessAndapply(1, id);
            fawe(1, id);
        } else {
            wsbs(2, id);
            jdbAccessAndapply(2, id);
            fawe(2, id);
        }
    }

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
    function fawe(type, stree) {
        $.post('/eDataCenter/wsbs/wsblBjsqsl?type=' + type + '&stree=' + stree, function (succeed) {
            var projectOption = {
                xAxis: {
                    type: 'category',
                    data: succeed.data.day1,
                    splitLine: {show: false},//去除网格线
                    splitArea: {show: false},//保留网格区域
                    axisLabel: {
                        rotate: 360
                    }

                },
                textStyle: {
                    fontSize: 15,
                    color: '#fff'
                },
                yAxis:
                        [
                            {
                                type: 'value',
                                splitLine: {show: true, lineStyle: {color: '#1A4984', width: '1'}},//去除网格线
                                splitArea: {show: false},//保留网格区域
                                // minInterval: 1,
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
                series: [{
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
                    data: succeed.data.num1,
                    type: 'line'
                }

                ]
            };
            // setTimeout(function () {
            gSceneChart.setChart('dsj-chart-01', projectOption);
            // }, 1 * 300);
        });
    };

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
        var hothtml = "";
        var viewhtml = "";
        $.post('/eDataCenter/wsbs/jdbAccessAndapply?type=' + type + '&streeid=' + streeid, function (succeed) {
            console.log(succeed);
            if (succeed.count == 0) {
                for (var i = 0; i < succeed.data.recordByhot.records.length; i++) {
                    var _index = i + 1;
                    hothtml += '<tr>' +
                            '<td class="w-num">' + _index + '</td>' +
                            '<td>' + succeed.data.recordByhot.records[i].projectTitle + '</td>' +
                            '</tr>'
                }
                for (var j = 0; j < succeed.data.pageView.records.length; j++) {
                    var _index = j + 1;
                    viewhtml += '<tr>' +
                            '<td class="w-num">' + _index + '</td>' +
                            '<td>' + succeed.data.pageView.records[j].projectTitle + '</td>' +
                            '</tr>'
                }
                $("#hot").html(hothtml);
                $("#view").html(viewhtml);
            }
        });
    }

    $(function () {
        wsbs(1, ${(dftOrgUnit.id)!});
        jdbAccessAndapply(1, ${(dftOrgUnit.id)!});
        fawe(1, ${(dftOrgUnit.id)!});
        shij();
    })

    // setTimeout(function () {
    //     gSceneChart.setChart(wsbs(2, 2938));
    // }, 1 * 300);
    // setTimeout(function () {
    //     gSceneChart.setChart(jdbAccessAndapply(2, 2938));
    // }, 1 * 300);
    // setTimeout(function () {
    //     gSceneChart.setChart(fawe(2, 2938));
    // }, 1 * 300);
    // setTimeout(function () {
    //     gSceneChart.setChart(shij());
    // }, 1 * 300);
    setInterval(function () {
        shij()
    }, 1000);

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
        $("#riqianriqi").html(nyr + "   " + shij);
        // $(".shij").html(shij);
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

    $(".pop_uy").click(function () {

        // layer.open({
        //     content: "/eDataCenter/wsbs/pop",
        //     btn: false,
        //     area: ["90%", "90%"]
        //
        // });
        layer.open({
            type: 2,
            content: '/eDataCenter/wsbs/pop', //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            area: ["90%", "90%"],
            title: '',
        });

    })


</script>
</body>
</html>