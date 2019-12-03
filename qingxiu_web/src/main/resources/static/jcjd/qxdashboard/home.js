var winPost
if (!winPost) {
    winPost = {};
}
winPost = {
    param: {
        pid: 1,
        mapImg:'',
        brief:''
    },
    url: "/jcjd/findUnitList",
    data: {},
    list: [],
    doPost: function () {
        var that = winPost;
        $.post(
            that.url,
            that.data,
            function (r) {
                console.log(r);
                that.list = r.data;
            });
    },
    toHtml: function () {
        var that = winPost;
        var html = '<div class="win-bg">';
        for (i = 0; i < that.list.length; i++) {
            var curr = '';
            if (that.param.pid == that.list[i].id) {
                curr = 'current';
            }
            html += '<div class="item-row ' + curr + '" pid="' + that.list[i].id + '">' +
                that.list[i].name + '</div>';
        }
        html += '</div>';
        return html;
    },
    bindOpen: function(){
        var that = winPost;
        var winId = 'slt-unit-win';
        $("#slt-unit").bind("click", function () {
            var thTab = $(this);
            //示范一个公告层
            var _html = that.toHtml();
            layer.open({
                type: 1
                , title: false //不显示标题栏
                , closeBtn: false
                , area: '400px;'
                , shade: 0.8
                , id: winId //设定一个id，防止重复弹出
                , btn: ['确 定', '关 闭']
                , btnAlign: 'c'
                , moveType: 1 //拖拽模式，0或者1
                , content: _html
                , success: function (layero) {
                    $('.layui-layer-btn0').bind('click',function(){
                        var slt = $('#'+winId).find('.clicked');
                        var sv = '没有';
                        var sl = '';
                        if(slt.length > 0){
                            sv = slt.eq(0).attr('pid');
                            sl = slt.eq(0).text();
                            that.param.pid = parseInt(sv);
                        }
                        if(sl == ''){
                            console.log('不做大数据切换~');
                            return;
                        }
                        if(typeof changeCallBack == "function"){
                            changeCallBack(sv);
                        }

                        thTab.text(sl);
                        console.log(sv + '大数据');
                    });
                    $('#'+winId).find('.item-row').bind('click', function () {
                        var that = $(this);
                        if (that.hasClass('current') || that.hasClass('clicked')) {
                            return;
                        }
                        $('#'+winId).find('.item-row').removeClass('current').removeClass('clicked');
                        that.addClass('clicked');
                    });
                }
            });

        });
    },
    totalMember:function(data, callBack){
        //党员统计
        $.post(
            '/jcjd/totalMember',
            data,
            function (r) {
                console.log(r);
                if(typeof callBack == "function"){
                    callBack(r);
                }
            });
    },
    totalUnit: function(data, callBack){
        //党组织统计
        $.post(
            '/jcjd/totalUnit',
            data,
            function (r) {
                console.log(r);
                if(typeof callBack == "function"){
                    callBack(r);
                }
            });
    },
    totalMemberByGender:function(data, callBack){
        $.post(
            '/jcjd/totalMemberByGender',
            data,
            function (r) {
                console.log(r);
                if(typeof callBack == "function"){
                    callBack(r);
                }
            });
    },
    totalMemberByAge : function(data, callBack){
        $.post(
            '/jcjd/totalMemberByAge',
            data,
            function (r) {
                console.log(r);
                if(typeof callBack == "function"){
                    callBack(r);
                }
            });
    },
    totalMemberByEducation:function(data, callBack){
        $.post(
            '/jcjd/totalMemberByEducation',
            data,
            function (r) {
                console.log(r);
                if(typeof callBack == "function"){
                    callBack(r);
                }
            });
    },
    init:function(){
        var that = winPost;
        if(typeof initDftOrgUnit == "function"){
            initDftOrgUnit(that);
        }
        that.doPost();
        that.bindOpen();
    }

};
$(function () {
    console.log("load...");
    winPost.init();
})

