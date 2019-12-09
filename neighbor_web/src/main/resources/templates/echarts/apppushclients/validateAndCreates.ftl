<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 设备统计</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-lg-6 col-xs-6">
                    <!-- small box -->
                    <div class="small-box  bg-red">
                        <div class="inner">
                            <h3>${totalNum!'0'}</h3>
                            <p>累计设备数</p>
                        </div>
                        <div class="icon">
                            <i class="fa "></i>
                        </div>
                    </div>
                </div><!-- ./col -->

                <div class="col-lg-6 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3>${todayNum!'0'}</h3>
                            <p>今日新增设备数</p>
                        </div>
                        <div class="icon">
                            <i class="fa "></i>
                        </div>
                    </div>
                </div><!-- ./col -->

                <!-- fix for small devices only -->
                <div class="clearfix visible-sm-block"></div>
            </div>
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body table-responsive no-padding">
                            <div class="middle">
                                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                                <div id="validateAndCreatesDay" style="height:500px"></div>
                            </div>
                            <div class="push"></div>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body table-responsive no-padding">
                            <div class="middle" style="padding: 10px">
                                <form class="form-inline" action="/eAppPushClients/showTotalValidate/1" method="post">
                                    <div class="input-group">年份：</div>
                                    <div class="input-group">
                                        <select name="year" class="form-control" lay-ignore>
                                            <option value="2019" <#if year??><#if year=="2019">selected="selected"</#if></#if> >2019</option>
                                            <option value="2020" <#if year??><#if year=="2020">selected="selected"</#if></#if> >2020</option>
                                            <option value="2021" <#if year??><#if year=="2021">selected="selected"</#if></#if> >2021</option>
                                            <option value="2022" <#if year??><#if year=="2022">selected="selected"</#if></#if> >2022</option>
                                            <option value="2023" <#if year??><#if year=="2023">selected="selected"</#if></#if> >2023</option>
                                        </select>
                                    </div>
                                    <div class="input-group">月份：</div>
                                    <div class="input-group">
                                        <select name="month" class="form-control" lay-ignore>
                                            <option value="1" <#if month??><#if month=="1">selected="selected"</#if></#if> >1</option>
                                            <option value="2" <#if month??><#if month=="2">selected="selected"</#if></#if> >2</option>
                                            <option value="3" <#if month??><#if month=="3">selected="selected"</#if></#if> >3</option>
                                            <option value="4" <#if month??><#if month=="4">selected="selected"</#if></#if> >4</option>
                                            <option value="5" <#if month??><#if month=="5">selected="selected"</#if></#if> >5</option>
                                            <option value="6" <#if month??><#if month=="6">selected="selected"</#if></#if> >6</option>
                                            <option value="7" <#if month??><#if month=="7">selected="selected"</#if></#if> >7</option>
                                            <option value="8" <#if month??><#if month=="8">selected="selected"</#if></#if> >8</option>
                                            <option value="9" <#if month??><#if month=="9">selected="selected"</#if></#if> >9</option>
                                            <option value="10" <#if month??><#if month=="10">selected="selected"</#if></#if> >10</option>
                                            <option value="11" <#if month??><#if month=="11">selected="selected"</#if></#if> >11</option>
                                            <option value="12" <#if month??><#if month=="12">selected="selected"</#if></#if> >12</option>
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
                            <table class="table table-hover">
                                <tr>
                                    <th>日期</th>
                                    <th>截止到当天设备总数量</th>
                                    <th>当天设备增长数量</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td>${(entity.sj)!}</td>
                                        <td>${(entity.num)!}</td>
                                        <td>${(entity.othernum)!}</td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/eAppPushClients/showTotalValidate/" urlParas="?year=${year!}&month=${month!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/eAppPushClients/showTotalValidate/" urlParas="?year=${year!}&month=${month!}&pageSize=${pageSize!}"  />
                            </div>
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
            var validateAndCreateList = JSON.parse('${validateAndCreateList!}');
            var x_arr=['01','02','03','04','05','06','07','08','09','10',
                '11','12','13','14','15','16','17','18','19','20',
                '21','22','23','24','25','26','27','28','29','30','31'];
            var y_arr=[];
            for(var z=0;z<31;z++){
                y_arr[z]=0;
            }
            for(var i=0;i<validateAndCreateList.length;i++){
                var sjData=validateAndCreateList[i].sj.split("-");
                for(var j=0;j<x_arr.length;j++){
                    if(sjData[2]==x_arr[j]){
                        y_arr[j]=validateAndCreateList[i].num;
                    }
                }
            }
            var validateAndCreatesDay = echarts.init(document.getElementById('validateAndCreatesDay'));
            var validateAndCreatesDayOption = {
                title: {
                    text: '本月新增设备统计',
                    x: "center"
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
                    data: x_arr,
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
                    data: y_arr
                }]
            };
            validateAndCreatesDay.setOption(validateAndCreatesDayOption);
        });
    </script>
</@footer>