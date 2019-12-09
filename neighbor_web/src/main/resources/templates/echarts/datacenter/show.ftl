<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>手上青秀大数据中心</title>
    <link rel="stylesheet" href="../../base/css/datacentre.css">
    <script src="../../base/js/raphael.min.js"></script>
    <script src="../../base/js/jquery-1.8.3.min.js"></script>
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
</head>
<body>
<div class="scale">

    <div class="navigation">
        <div class="title_swo">
            <div class="title_ti">
                <b>手上青秀大数据统计中心</b>
            </div>
            <div class="data_tq">

                <span class="riqi"></span>
                <span class="shij"></span>
                <span style="padding-top: 10px"><iframe name="weather_inc"
                                                        src="http://i.tianqi.com/index.php?c=code&id=52&icon=1&num=3&color=%23FFFFFF"
                                                        width="98" height="20" frameborder="0" marginwidth="0"
                                                        marginheight="0"
                                                        scrolling="no"></iframe></span>
            </div>
        </div>
    </div>
    <div class="info_tab">
        <div class="tab_in">
            <div class="tabin-top">
                <span class="border row1"></span>
                <span class="border row2"></span>
                <div class="biaotise">
                    <b>办事事项</b>
                </div>
                <div class="uyro">
                    <div class="div1" id="div1">
                    </div>
                    <div class="yooer">
                        <span class="ykejnr"></span>
                        <div class="tiert">
                            <table class="t1">
                                <tr>
                                    <th class="run_li">行政审批</th>
                                    <th>占比</th>
                                </tr>
                                <tr>
                                    <td class="sp1" id="xzspshu"></td>
                                    <td class="sp2" id="xzspzb"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="yooer">
                        <span class="ykejnrs"></span>
                        <div class="tiert">
                            <table class="t1">
                                <tr>
                                    <th class="run_li">基层服务</th>
                                    <th>占比</th>
                                </tr>
                                <tr>
                                    <td class="sp1 run_li" id="jcfwshu"></td>
                                    <td class="sp2" id="jcfwzb"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br style='clear:both'/>
                </div>

                <div class="uyro yjner">
                    <div class="div2" id="div2"></div>
                    <div class="yooer">
                        <span class="ykejnr1"></span>
                        <div class="tiert">
                            <table class="t1">
                                <tr>
                                    <th class="run_li">一次不用跑</th>
                                    <th>占比</th>
                                </tr>
                                <tr>
                                    <td class="sp1 run_li" id="ycbypshu"></td>
                                    <td class="sp2" id="ycbypzb"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="yooer">
                        <span class="ykejnr2"></span>
                        <div class="tiert">
                            <table class="t1">
                                <tr>
                                    <th class="run_li">只跑一次</th>
                                    <th>占比</th>
                                </tr>
                                <tr>
                                    <td class="sp1 run_li" id="zpycshu"></td>
                                    <td class="sp2" id="zpyczb"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="yooer">
                        <span class="ykejnr3"></span>
                        <div class="tiert">
                            <table class="t1">
                                <tr>
                                    <th class="run_li">其他</th>
                                    <th>占比</th>
                                </tr>
                                <tr>
                                    <td class="sp1 run_li" id="qitashu"></td>
                                    <td class="sp2" id="yitazb"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br style='clear:both'/>
                </div>
            </div>
            <div class="tabin-boo">
                <span class="border row1"></span>
                <span class="border row2"></span>
                <div class="biaotise">
                    <b>在线咨询数据/排行榜</b>
                </div>
                <div class="fetsef yurthas">
                    <text class="tile">排名</text>
                    <text class="zhongj">部门</text>
                    <text class="liang">咨询量</text>
                </div>
                <ul class="intyu_ul" id="lusjie">

                <#--<li>-->
                <#--<a>-->
                <#--<text class="tile">${(zx_index+1)!}</text>-->
                <#--<text class="zhongj">${(zx.title)!}</text>-->
                <#--<text class="liang">${(zx.num)!}</text>-->
                <#--</a>-->
                <#--</li>-->


                </ul>
                <div class="hofqwe">
                    <div class="trylkn main">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        <b class="b1">在线咨询问题</b>
                        <span class="hfoiwe"></span>
                        <b class="b2" id="zxshu"></b>
                    </div>
                    <div class="trylkn rese main">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        <b class="b1">咨询回复率</b>
                        <span class="hfoiwe"></span>
                        <b class="b2" id="hfl"></b>
                    </div>
                    <br style='clear:both'/>
                </div>
            </div>


        </div>
        <div class="tab_in">
            <div class="tabin">
                <span class="border row1"></span>
                <span class="border row2"></span>
                <div class="biaotise">
                    <b>网上办理</b>
                </div>
                <div class="duihawk">
                    <div class="yieryt">
                        <div class="hkseer main">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <b class="b1">累计办结事项</b>
                            <span class="hfoiwe"></span>
                            <b class="b2" id="ljbj"></b>
                        </div>
                    </div>
                    <div class="yieryt">
                        <div class="hkseer main">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <b class="b1">累计受理事项</b>
                            <span class="hfoiwe"></span>
                            <b class="b2" id="ljsl"></b>
                        </div>
                    </div>
                    <div class="yieryt">
                        <div class="hkseer main">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <b class="b1">总办结率</b>
                            <span class="hfoiwe"></span>
                            <b class="b2" id="zbjl"></b>
                        </div>
                    </div>
                    <br style='clear:both'/>
                </div>
            <#--<div class="hlae">-->
            <#--<b>按日统计办事申请数量</b>-->
            <#--<span>日</span>-->
            <#--</div>-->
                <div id="main" class="tj_anr"></div>
                <div class="yfnler">
                    <div class="bmbjphti">
                        <text class="tile">部门办结排行</text>
                    </div>
                    <div class="jfa">
                        <div class="fetsef gerv">
                            <text class="tile">排名</text>
                            <text class="zhongj">部门</text>
                            <text class="liang">办结率</text>
                        </div>
                    <#--<table cellpadding="0" border="0" cellspacing="0" cellpadding="0" class="dsj-table"-->
                    <#--id="ihfiawe">-->
                    <#--<tr>-->
                    <#--<td class="tile tuerfd">1</td>-->
                    <#--<td class="zhongj fhasjke">洒家扩大付好款士大夫倒萨</td>-->
                    <#--<td class="liang jfioewr">100%</td>-->
                    <#--</tr>-->
                    <#--</table>-->
                        <ul class="kfoawie" id="ihfiawe">
                            <li>
                                <a>
                                    <b class="kf_index">1</b>
                                    <b class="kf_comse">仙湖经济开发区管理委员会</b>
                                    <b class="kf_baifen">6%</b>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <div class="tab_in">
            <div class="tabin">
                <span class="border row1"></span>
                <span class="border row2"></span>
                <div class="biaotise">
                    <b>新闻资讯</b>
                </div>
                <div class="duihawk">
                    <div class="yieryt">
                        <div class="hkseer main">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <b class="b1">总新闻数量</b>
                            <span class="hfoiwe"></span>
                            <b class="b2 huer">0</b>
                        </div>
                    </div>
                    <div class="yieryt">
                        <div class="hkseer main">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <b class="b1">今日新闻数量</b>
                            <span class="hfoiwe"></span>
                            <b class="b2 huer">0</b>
                        </div>
                    </div>
                    <div class="yieryt">
                        <div class="hkseer main">
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <b class="b1">用户回帖量</b>
                            <span class="hfoiwe"></span>
                            <b class="b2 huer">0</b>
                        </div>
                    </div>
                    <br style='clear:both'/>
                </div>

                <div id="mainur" class="tj_anr"></div>
                <div class="yfnler">
                    <div class="bmbjphti">
                        <text class="tile">热点新闻点击排行</text>
                    </div>
                    <div class="jfa">
                        <div class="fetsef">
                            <text class="tile xinpaim">排名</text>
                            <text class="zhongj xinbiaoti">新闻标题</text>
                            <text class="liang xindjs">点击数</text>
                        </div>
                        <ul class="kfoawie txinwen">

                        </ul>
                    </div>
                </div>
            </div>


        </div>
        <div class="tab_in">
            <div class="tabin">
                <span class="border row1"></span>
                <span class="border row2"></span>
                <div class="biaotise">
                    <b>平台用户</b>
                </div>
                <div class="user_tj">

                    <div class="hgoawe">


                        <div class="usert_ise" id="usettoa">
                        </div>

                    </div>
                <#--</div>-->
                    <div class="geren_use">
                        <div class="uiwep">
                            <img src="../base/images/ge_user.png">
                            <div class="yoer">
                                <text>个人用户</text>
                                <b id="grNum"></b>
                            </div>
                            <div class="yoer">
                                <text>占比</text>
                                <b id="grzbNum"></b>
                            </div>
                        </div>
                    </div>
                    <div class="geren_use">
                        <div class="uiwep">
                            <img src="../base/images/fa_user.png">
                            <div class="yoer">
                                <text>法人用户</text>
                                <b id="qyNum"></b>
                            </div>
                            <div class="yoer">
                                <text>占比</text>
                                <b id="qyzbNum"></b>
                            </div>
                        </div>
                    </div>
                    <div class="hfioawe">
                        <b class="jiawe">每月新增用户</b>
                        <div class="user_zheng" id="user_zheng"></div>
                    </div>

                </div>
            </div>
        </div>
        <br style='clear:both'/>
    </div>
</body>

<script src="../../app/js/echarts.js"></script>
<script src="../../base/js/datacentre.js"></script>
</html>