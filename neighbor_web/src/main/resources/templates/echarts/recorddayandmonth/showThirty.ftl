<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 近30天办事趋势统计</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <div class="input-group">
                                <select id="show_type" class="form-control" lay-ignore>
                                    <option value="1" selected="selected">动态显示</option>
                                    <option value="2" >静止显示</option>
                                </select>
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <div class="middle">
                                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                                <div id="recordday" style="height:600px"></div>
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

            var animation=true;

            //下拉框改变事件
            $("#show_type").unbind().bind().on("change",function(){
                if(this.value=="2"){
                    //静止
                    animation=false;
                    data1=tmpdata;
                    clearInterval(timeInterval);
                    recordday.setOption({
                        series: [{
                            data: data1
                        }]
                    });
                }else{
                    //动态
                    animation=true;
                    count = 0;
                    data1 = [];
                    timeInterval=setInterval(function () {
                        if (data1.length < tmpdata.length) {
                            data1.push(tmpdata[count]);
                            count++;
                        } else {
                            //达到30天时，数据清零，重新开始循环
                            count = 0;
                            data1 = [];
                        }
                        recordday.setOption({
                            series: [{
                                data: data1
                            }]
                        });
                    }, 1000);
                }
            });

            var thirty_day="${thirty_day!}";
            var thirty_num="${thirty_num!}";

            var thirty_day_arr=[];
            var thirty_num_arr=[];

            var data1=[];
            var tmpdata=[];

            if(thirty_day.length>0){
                thirty_day_arr=thirty_day.split(",");
            }
            if(thirty_num.length>0){
                thirty_num_arr=thirty_num.split(",");
                for(var i=0;i<thirty_num_arr.length;i++){
                    thirty_num_arr[i]=parseInt(thirty_num_arr[i]);
                }
            }

            //拼接数据
            if(thirty_day_arr.length>0){
                for(var i=0;i<thirty_day_arr.length;i++){
                    var tmp={name: "办事申请数量", value: [thirty_day_arr[i], parseInt(thirty_num_arr[i])]};
                    tmpdata.push(tmp);
                }
            }


            //------ 以下第一图表 -----//
            var recordday = echarts.init(document.getElementById('recordday'));
            var recorddayOption ={
                calculable: true,
                title: {
                    text: '近30天办事数量趋势统计',
                    x:"center"
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: function (params) {
                        params = params[0];
                        return params.value[0] + " 办事数量：" + params.value[1];
                    },
                    axisPointer: {
                        animation: false
                    }
                },
                xAxis: {
                    type: 'time',
                    splitLine: {
                        show: true
                    }
                },
                yAxis: {
                    type: 'value',
                    splitLine: {
                        show: true
                    }
                },
                series: [{
                    name: '办事申请数量',
                    type: 'line',
                    showSymbol: true,
                    smooth: true,
                    data: data1
                }]
            };

            //每一秒增加一天的数据
            var count = 0;
            var timeInterval=setInterval(function () {
                if (data1.length < tmpdata.length) {
                    data1.push(tmpdata[count]);
                    count++;
                } else {
                    //达到30天时，数据清零，重新开始循环
                    count = 0;
                    data1 = [];
                }
                recordday.setOption({
                    series: [{
                        data: data1
                    }]
                });
            }, 1000);

            // 为echarts对象加载数据
            recordday.setOption(recorddayOption);
            //------ 以上第一图表 -----//
        });
    </script>
</@footer>