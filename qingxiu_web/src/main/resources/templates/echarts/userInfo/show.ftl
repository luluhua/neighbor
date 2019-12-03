<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 用户信息统计</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body table-responsive no-padding">
                            <div class="middle" style="padding: 10px">
                                <div class="form-inline">
                                    <div class="input-group">年份：</div>
                                    <div class="input-group">
                                        <select id="userInfo_year" class="form-control" lay-ignore>
                                            <option value="2019" <#if year??><#if year=="2019">selected="selected"</#if></#if> >2019</option>
                                            <option value="2020" <#if year??><#if year=="2020">selected="selected"</#if></#if> >2020</option>
                                            <option value="2021" <#if year??><#if year=="2021">selected="selected"</#if></#if> >2021</option>
                                            <option value="2022" <#if year??><#if year=="2022">selected="selected"</#if></#if> >2022</option>
                                            <option value="2023" <#if year??><#if year=="2023">selected="selected"</#if></#if> >2023</option>
                                        </select>
                                    </div>
                                    <div class="input-group">月份：</div>
                                    <div class="input-group">
                                        <select id="userInfo_month" class="form-control" lay-ignore>
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
                                            <button class="btn btn-default" onclick="showUserInfoMonth()"><i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="middle">
                                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                                <div id="usercreate" style="margin-top:30px;height:380px"></div>
                                <div id="userinfosRz" style="margin-top:30px;height:380px"></div>
                                <div id="userinfosZh" style="margin-top:30px;height:380px"></div>
                                <div id="userinfosYh" style="margin-top:30px;height:380px"></div>
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
            //------ 以下第二图表 -----//
            var userinfosRz = echarts.init(document.getElementById('userinfosRz'));

            var authstatus="${authstatus!}";
            var authstatus_nums="${authstatus_nums!}";
            var authstatus_arr=[];
            var authstatus_nums_arr=[];
            if(authstatus.length>0){
                authstatus_arr=authstatus.split(",");
            }
            if(authstatus_nums.length>0){
                authstatus_nums_arr=authstatus_nums.split(",");
                if(authstatus_nums_arr.length>0){
                    for(var i=0;i<authstatus_nums_arr.length;i++){
                        authstatus_nums_arr[i]=parseInt(authstatus_nums_arr[i]);
                    }
                }
            }
            var authstatus_pie_value=[];
            if(authstatus_arr.length>0){
                for(var i=0;i<authstatus_arr.length;i++){
                    var authstatus_pie={
                        value:authstatus_nums_arr[i],
                        name:authstatus_arr[i]
                    };
                    authstatus_pie_value.push(authstatus_pie);
                }
            }

            var userinfosRzOption = {
                title : {
                    text: '按认证状态统计',
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
                    formatter:function(data){
                        return data.seriesName + "<br/>"+ data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                    }
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: authstatus_arr
                },
                series : [
                    {
                        name: '认证状态统计',
                        type: 'pie',
                        radius : '70%',
                        center: ['50%', '60%'],
                        data:authstatus_pie_value,
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
            };
            userinfosRz.setOption(userinfosRzOption);
            //------ 以上第二图表 -----//
            //------ 以下第三图表 -----//
            var userinfosZh = echarts.init(document.getElementById('userinfosZh'));

            var userAccount="${userAccount!}";
            var userAccount_nums="${userAccount_nums!}";
            var userAccount_arr=[];
            var userAccount_nums_arr=[];
            if(userAccount.length>0){
                userAccount_arr=userAccount.split(",");
            }
            if(authstatus_nums.length>0){
                userAccount_nums_arr=userAccount_nums.split(",");
                if(userAccount_nums_arr.length>0){
                    for(var i=0;i<userAccount_nums_arr.length;i++){
                        userAccount_nums_arr[i]=parseInt(userAccount_nums_arr[i]);
                    }
                }
            }
            var userAccount_pie_value=[];
            if(userAccount_arr.length>0){
                for(var i=0;i<userAccount_arr.length;i++){
                    var userAccount_pie={
                        value:userAccount_nums_arr[i],
                        name:userAccount_arr[i]
                    };
                    userAccount_pie_value.push(userAccount_pie);
                }
            }

            var userinfosZhOption = {
                title : {
                    text: '按账户类型统计',
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
                    formatter:function(data){
                        return data.seriesName + "<br/>"+ data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                    }
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: userAccount_arr
                },
                series : [
                    {
                        name: '账户类型统计',
                        type: 'pie',
                        radius : '70%',
                        center: ['50%', '60%'],
                        data:userAccount_pie_value,
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
            };
            userinfosZh.setOption(userinfosZhOption);
            //------ 以上第三图表 -----//
            //------ 以下第四图表 -----//
            var userinfosYh = echarts.init(document.getElementById('userinfosYh'));

            var userTypes="${userTypes!}";
            var userTypes_nums="${userTypes_nums!}";
            var userTypes_arr=[];
            var userTypes_nums_arr=[];
            if(userTypes.length>0){
                userTypes_arr=userTypes.split(",");
            }
            if(userTypes_nums.length>0){
                userTypes_nums_arr=userTypes_nums.split(",");
                if(userTypes_nums_arr.length>0){
                    for(var i=0;i<userTypes_nums_arr.length;i++){
                        userTypes_nums_arr[i]=parseInt(userTypes_nums_arr[i]);
                    }
                }
            }
            var userTypes_pie_value=[];
            if(userTypes_arr.length>0){
                for(var i=0;i<userTypes_arr.length;i++){
                    var userTypes_pie={
                        value:userTypes_nums_arr[i],
                        name:userTypes_arr[i]
                    };
                    userTypes_pie_value.push(userTypes_pie);
                }
            }

            var userinfosYhOption = {
                title : {
                    text: '按用户类型统计',
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
                    formatter:function(data){
                        return data.seriesName + "<br/>"+ data.name+ " : " + data.value + " ("+data.percent.toFixed(1)+"%)";
                    }
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: userTypes_arr
                },
                series : [
                    {
                        name: '用户类型统计',
                        type: 'pie',
                        radius : '70%',
                        center: ['50%', '60%'],
                        data:userTypes_pie_value,
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
            };
            userinfosYh.setOption(userinfosYhOption);
            //------ 以上第四图表 -----//
        });

        showUserInfoMonth();
        //按月统计
        function showUserInfoMonth(){
            var userInfo_year=$('#userInfo_year option:selected').val();
            var userInfo_month=$('#userInfo_month option:selected').val();
            var queryParam={year:userInfo_year,month:userInfo_month};
            $.ajax("/eAppUser/showMonth", {
                dataType: 'json',
                type: 'post',
                async: false,
                data:JSON.stringify(queryParam),
                headers: {'Content-Type': 'application/json'},
                success: function (jsondata) {
                    var usercreate = echarts.init(document.getElementById('usercreate'));
                    var x_arr=['01','02','03','04','05','06','07','08','09','10',
                        '11','12','13','14','15','16','17','18','19','20',
                        '21','22','23','24','25','26','27','28','29','30','31'];
                    var y_arr=[];
                    for(var z=0;z<31;z++){
                        y_arr[z]=0;
                    }
                    if(jsondata.code==200){
                        var monthData=jsondata.data;
                        for(var i=0;i<monthData.length;i++){
                            var sjData=monthData[i].sj.split("-");
                            for(var j=0;j<x_arr.length;j++){
                                if(sjData[2]==x_arr[j]){
                                    y_arr[j]=monthData[i].num;
                                }
                            }
                        }
                    }
                    var usercreateOption = {
                        calculable: true,
                        title: {
                            text: "用户增长数量按月统计",
                            x:"center"
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

                    // 为echarts对象加载数据
                    usercreate.setOption(usercreateOption);
                },
                error: function(){
                    console.log("用户增长数量按月统计发送失败");
                }
            });
        }
    </script>
</@footer>