<#include "../../common/layout.ftl">
<@header>
    <script src="/app/js/echarts.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            border: 0;
            list-style: none;
            text-decoration: none;
            font-family: "方正黑体";
        }

        /*公用样式*/
        .wl_common {
            background: white;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .wl_common h2 {
            padding: 10px 0 0 20px;
            font-size: 26px;
            color: #50576a;
        }

        /*标题*/
        .wl_title {
            margin: 5px 4px 20px 4px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            background: white;
            padding: 10px 0 10px 35px;
            font-size: 26px;
            color: #333333;
        }

        /*今日数据*/
        .today_data {
            width: 96%;
            margin: 10px 10px 20px 40px;
            padding: 10px 20px 20px 10px;
            display: table;
            font-size: 18px;
            color: #666666;
        }

        .status_div {
            padding: 0 0 0 25px;
        }

        .tjsq {
            width: 10px;
            height: 10px;
            background: #f9bd2b;
            display: inline-block;
            overflow: hidden;
            margin: 0 10px 0 0;
        }

        .djs {
            width: 10px;
            height: 10px;
            background: #2ec0f9;
            margin: 0 10px 0 0;
        }

        .dsp {
            width: 10px;
            height: 10px;
            background: #d100ea;
            margin: 0 10px 0 0;
        }

        .dzz {
            width: 10px;
            height: 10px;
            background: #f92e6c;
            margin: 0 10px 0 0;
        }

        .today_data div {
            display: table-cell;
        }

        .today_data span {
            font-size: 64px;
            color: #123966;
            padding: 5px;
        }

        .month_data {
            width: 96%;
            margin: 10px 10px 20px 40px;
            padding: 10px 20px 20px 10px;
            display: table;
            font-size: 18px;
            color: #666666;
        }

        .month_data span {
            font-size: 64px;
            color: #123966;
            padding: 5px;
        }

        .month_data div {
            display: table-cell;
        }

        /*历史趋势*/
        .lsqs {
            width: 96%;
            margin: 10px 10px 0 40px;
        }

        .lsqs_div {
            height: 500px;
        }

        /*热门事项*/
        .rmsx {
            width: 96%;
            margin: 10px 10px 0 40px;
            background: white;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .ask_and_see {
            display: table;
            width: 100%;
            padding: 10px 25px 25px 30px;
            position: center;
            margin: 20px 0 0 0;
        }

        .ask_and_see div {
            display: table-cell;
            height: 260px;
        }

        .ask_and_see h3 {
            background: white;
            padding: 10px 5px 10px 20px;
            margin: 0 0 5px 0;
            font-size: 22px;
            color: #145bb4;
        }

        .ask_and_see ul {
            background: white;
            font-size: 20px;
            color: #333333;
            height: 209px;
        }

        .ask_and_see ul li {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .ask_and_see span {
            font-size: 32px;
            color: #f29f00;
            padding: 15px;
        }

        .max_ask {
            background: #dbecfa;
            border: 1px #e4eaf0 solid;
            float: left;
            width: 48%;

        }

        .midle_div {
            width: 40px;
        }

        .max_see {
            background: #dbecfa;
            border: 1px #e4eaf0 solid;
            float: right;
            width: 48%;
            float: right;
        }

    </style>

</@header>
<@body>

    <div class="content-wrapper">
        <div class="wl_title">办事看板</div>
        <div class="today_data wl_common">
            <div><img src="/images/spdt/today.png"></div>
            <div>
                <span>${(todayReord.awaitDispose)}</span>
                <div>
                    <img class="tjsq">
                    待受理
                </div>
            </div>
            <div>
                <span>${(todayReord.inReview)}</span>
                <div class="status_div">
                    <img class="djs">审批中
                </div>
            </div>
            <div>
                <span>${(todayReord.awaitSend)}</span>
                <div class="status_div">
                    <img class="dsp">已完结
                </div>
            </div>
            <div>
                <span>${(todayReord.awaitMake)}</span>
                <div class="status_div">
                    <img class="dzz">未通过
                </div>
            </div>
        </div>
        <div class="month_data wl_common">
            <div><img src="/images/spdt/month.png"></div>
            <div>
                <span>${(monthReord.awaitDispose)!}</span>
                <div>
                    <img class="tjsq">
                    待受理
                </div>
            </div>
            <div>
                <span>${(monthReord.inReview)!}</span>
                <div class="status_div">
                    <img class="djs">审批中
                </div>
            </div>
            <div>
                <span>${(monthReord.awaitSend)!}</span>
                <div class="status_div">
                    <img class="dsp">已完结
                </div>
            </div>
            <div>
                <span>${(monthReord.awaitMake)!}</span>
                <div class="status_div">
                    <img class="dzz">未通过
                </div>
            </div>
        </div>
        <div class="wl_common lsqs">
            <h2>历史趋势</h2>
            <div id="lsqs_div" class="lsqs_div">
            </div>
        </div>
        <div class="wl_common rmsx">
            <h2>热门事项</h2>
            <div class="ask_and_see">
                <div class="max_ask">
                    <h3>申请最多</h3>
                    <ul>
                            <#list recordByhot.getRecords() as hot>
                                <li>
                                    <#if (hot.projectTitle)??>
                                        <span>
                                            ${((recordByhot.current-1)*recordByhot.size +hot_index+1)!}
                                        </span>
                                        ${(hot.projectTitle)!}
                                    <#else >
                                    <span>

                                    </span>
                                    暂无申请
                                    </#if>
                                </li>
                            </#list>
                    </ul>

                </div>
                <div class="max_see">
                    <h3>浏览最多</h3>
                    <ul>
                        <#list PageView.getRecords() as View>
                            <li>
                                <span>
                                    ${((PageView.current-1)*PageView.size +View_index+1)!}
                                </span>
                                ${(View.getProjectTitle())}
                            </li>
                        </#list>

                    </ul>
                </div>
            </div>

        </div>
    </div>
</@body>
<@footer>
     <script type="text/javascript">
         // 基于准备好的dom，初始化echarts实例
         var myChart = echarts.init(document.getElementById('lsqs_div'));

         // 指定图表的配置项和数据
         option = {
             xAxis: {
                 type: 'category',
                 data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
             },
             yAxis: {
                 type: 'value'
             },
             series: [{
                 data: ${list!},
                 type: 'line',
                 smooth: true
             }]
         };


         // 使用刚指定的配置项和数据显示图表。
         myChart.setOption(option);

     </script>
</@footer>