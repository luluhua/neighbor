<!DOCTYPE html>
<html>
<head>
    <#include "../common/base.ftl">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>智慧党建</title>
	<link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <script src="${ctx}/base/js/jquery-1.12.4.min.js"></script>
	<#--
	<link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
	<script src="${ctx}/base/js/mui.min.js"></script>
	-->
	<link href="${ctx}/dj/css/home.css" rel="stylesheet" />
	<#--
	<script type="text/javascript" charset="utf-8">
		mui.init();
		window.onload = function () {
			mui('.mui-scroll-wrapper').scroll({
				deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
			});
		}
	</script>
	-->
</head>
<body>
<div class="home_top">
    <div class="homt_top_content">
        <div class="homt_top_content_left"><img src="${ctx}/dj/images/dw.png" width="60px" height="60px"></div>
        <div class="homt_top_content_right">
            <div style="width: 280px;">${rootOrg.name!'--'}</div>
            <div class="home_top_content_sel_div">
                <span onclick="tojgxz();">查看下属机构</span>
                <span onclick="torlxy();">认领微心愿</span>
            </div>

        </div>
    </div>
</div>
<div class="home_body">
    <div class="home_men" onclick="totj()">
        <div class="home_men_1">${partymemberCount!'0'}<br/><span class="home_men_span">党员人数/人</span></div>
        <div class="home_men_2"></div>
        <div class="home_men_3">${meetingCount!'0'}<br/><span class="home_men_span">会议次数/次</span></div>
    </div>
    <div class="content">
        <span class="content_title">党员会议</span>
        <select class="content_select" id="slt-meeting-date">
            <option value="">月份</option>
            <#list mtslt as ml>
            <option value="${ml.key}"<#if "${(params.meetingDate)!}" == "${ml.key}"> selected</#if>>${ml.value}</option>
            </#list>
        </select>
        <div class="content_a">
            <div id="data-list">
            <#list meetingPage.getRecords() as meeting>
            <div class="content_c" onclick="tomeeting('${meeting.id!''}');">
                <div class="content_txt">
                    <span>主题:</span>${meeting.mtTheme!''}
                </div>
                <#--<div class="content_txt">
                    <span>内容:</span>${meeting.mtContent!''}&lt;#&ndash;<@commonTags method="strIntercept" content="${meeting.mtContent!''}" len="20">${(strIntercept)!}</@commonTags>&ndash;&gt;
                </div>-->
                <div class="content_txt">
                    <span>类型:</span><@dictTag method="getChildValue" ptype="mt_classify" pvalue="${(meeting.mtClassify)!}" value="${(meeting.mtType)!}">${(getChildValue)!}</@dictTag>
                </div>
                <div class="content_txt">
                    <span>地点:</span>${meeting.address!''}
                </div>
                <div class="content_txt">
                    <span>时间:</span>${(meeting.dtMeeting?string("yyyy年M月d日 HH:mm"))!''}
                </div>
            </div>
            </#list>
            </div>
            <#--<div style="text-align: center; padding: 1rem; color: #C7C7CC;">已经没有了</div>-->
            <div style="text-align: center;">
                <div id="next-page" style="display:none;padding: .5rem;border: 1px solid #c7c7cc;border-radius: 5px;">下一页</div>
                <div id="not-data" style="display:none;color: #C7C7CC;padding: 1rem;">已经没有了</div>
            </div>
        </div>
    </div>
</div>
<script>
    Date.prototype.patternFormat = function(fmt)
    { //author: meizz
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时
            "H+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }

    function tojgxz(){
        window.location.href="${ctx}/dj/org/tree?pid=${rootOrg.id!'0'}"
    }
    function tomeeting(_id){
        window.location.href="${ctx}/dj/meeting/detail/" + _id;
    }
    function totj(){
        window.location.href="${ctx}/dj/org/count/${rootOrg.id!'0'}";
    }
    function torlxy(){
        window.location.href= 'http://sjyh.nnsmk.com/app/demand';
    }

    var pageParams = {
        pid:${(rootOrg.id)!'0'} ,
        date:'${(params.meetingDate)!}' ,
        pageNo:${meetingPage.current + 1} ,
        pageSize:${meetingPage.size}
    }

    var cf = eval('(<@dictTag method="findListAndChildJson" type="mt_classify">${(findListAndChildJson)!}</@dictTag> )');
    function getChild(pt, pv, cv){
        var labelt = '';
        for(i = 0; i < cf.length; i++){
            if(cf[i].type == pt && cf[i].value == pv){
                labelt += cf[i].label;
            }
        }
        var hasP = false;
        if(labelt != ''){
            hasP = true;
            labelt += '(';
        }
        for(i = 0; i < cf.length; i++){
            if(cf[i].type == pv && cf[i].value == cv){
                labelt += cf[i].label;
            }
        }
        if(hasP){
            labelt += ')';
        }
        return labelt;
    }
    function nextPage(){
        $.post(
            "${ctx}/dj/meeting/pageData",
            pageParams,
            function(data){
                if(pageParams.pageNo >= data.pages){
                    $('#next-page').hide();
                    $('#not-data').show();
                }else{
                    pageParams.pageNo = data.current + 1;
                }

                console.log(data);
                $.each(data.records, function(i,d){
                    var date = new Date(d.dtMeeting);
                    var ithml = '<div class="content_c" onclick="tomeeting(' + d.id + ');">\n' +
                            '                <div class="content_txt">\n' +
                            '                    <span>主题:</span>'+d.mtTheme+'\n' +
                            '                </div>\n' +
                            '                <div class="content_txt">\n' +
                            '                    <span>类型:</span>' + getChild('mt_classify',d.mtClassify, d.mtType) +'\n' +
                            '                </div>\n' +
                            '                <div class="content_txt">\n' +
                            '                    <span>地点:</span>'+d.address + '\n' +
                            '                </div>\n' +
                            '                <div class="content_txt">\n' +
                            '                    <span>时间:</span>'+d.strMeetingZH + '\n' +
                            '                </div>\n' +
                            '            </div>';
                    //date.patternFormat("yyyy年M月d日 HH:mm")
                    $('#data-list').append(ithml);
                });
            });
    }
    $(function(){
        $('#slt-meeting-date').bind("change", function () {
            var ss = $(this).children('option:selected').val();
            window.location.href="${ctx}/dj/home?pid=${rootOrg.id!'0'}&meetingDate=" + ss;
        });
        $('#next-page').bind('click',function(){
            nextPage();
        });
        <#if meetingPage.hasNext()>
        $('#next-page').show();
        $('#not-data').hide();<#else >
        $('#next-page').hide();
        $('#not-data').show();
        </#if>
    });



</script>
</body>
</html>