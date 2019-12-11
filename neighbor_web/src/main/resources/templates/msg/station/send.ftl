<#include "../../common/layout_dl.ftl">
<@header>

<style type="text/css">

    .centent {
        border: 1px solid #ee9900;
        overflow: auto;

    }

    .centent ul {
        width: 100%;
        height: 250px;
        margin: auto;
        overflow-x: hidden;
    }

    .jksa span {
        cursor: pointer;
    }

    .centent ul li {
        padding-top: 10px;
        cursor: pointer;
    }

    .centent ul li:hover {
        background-color: burlywood;
    }

    .cen1 {
        width: 40%;
        margin: auto;
        float: left;
        text-align: center;

    }

    .cen2 {
        width: 40%;
        margin: auto;
        text-align: center;
        float: right;

    }

    .jksa {
        width: 20%;
        float: left;
        margin: 30px auto;
        text-align: center;
    }

    .jksa span {
        display: block;
        margin-top: 30px;
    }

    .centent select option {
        padding-top: 10px;
    }

    .centent input {
        width: 100%;
        height: 30px;
        border: 1px solid #ee9900;
    }

    #xuanzr2 {
        height: 280px !important;
    }

</style>
</@header>
<@body>
    <form id="fromId" class="form-horizontal layui-form layui-form-pane" method="post" action="/tMsgRecord/msg/doAdd">
        <div class="box-body">

            <div class="form-group">
                <label for="msgType" class="col-sm-2 control-label">消息类型</label>
                <div class="col-sm-10">
                    <select name="msgType" class="form-control select2" style="width: 100%;" lay-verify="required"
                            lay-ignore>
                        <@dictTag method="getDictListByType" type="station_msg_type" >
                            <#list getDictListByType as m>
                                <option value="${(m.value)!}"> ${(m.code)!}-${(m.label)!}</option>
                            </#list>

                        </@dictTag>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="msgTitle" class="col-sm-2 control-label">标题</label>
                <div class="col-sm-10">
                    <input type="text" id="msgTitle" name="msgTitle" class="form-control" placeholder="请输入标题"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label for="msgContent" class="col-sm-2 control-label">消息内容</label>
                <div class="col-sm-10">
                    <textarea rows="3" name="msgContent" id="editor_id"
                              placeholder="请输入消息内容，最多300个字符 ...">
          </textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">发送类型</label>
                <div class="col-sm-10">
                    <input type="radio" name="infoType" title="APP推送消息" value="1" checked
                           lay-filter="erweima">
                    <input type="radio" name="infoType" value="2" lay-filter="erweima"
                           title="站内消息">

                <#--<label>-->
                <#--<input type="radio" name="infoType" value="1" class="minimal" checked lay-ignore-->
                <#--lay-filter="erweima">-->
                <#--APP推送消息-->
                <#--</label>-->
                <#--&nbsp;-->
                <#--<label>-->
                <#--<input type="radio" name="infoType" value="2" class="minimal" lay-ignore lay-filter="erweima">-->
                <#--站内消息-->
                <#--</label>-->
                </div>
            </div>

            <div class="form-group" id="deptlist" style="display: none">
                <label class="col-sm-2 control-label">接收部门</label>
                <div class="col-sm-10">
                    <input type="checkbox" name="deptId" class="minimal" value="0" lay-ignore>
                    所有部门&nbsp;
                    <#list deptList as dept>
                        <label>
                            <input type="checkbox" name="deptId" value="${(dept.id)!}" class="minimal" lay-ignore>
                            ${(dept.name)!}
                        </label>
                        &nbsp;
                    </#list>
                </div>
            </div>
            <div class="form-group" id="appusrlist" style="display: ">
                <label class="col-sm-2 control-label">接收用户</label>
                <div class="col-sm-10">
                    <div class="centent cen1">
                        <input type="hidden" name="userId" id="userId" class="minimal" lay-ignore>
                        <input type="text" placeholder="搜索" onfocus="this.removeAttribute('readonly')"
                               autocomplete="off" id="searchCityName" name="userquery">
                        <ul id="xuanzr1">
                        <#list appuser as appuser>
                            <li pinyin="${(appuser.id)!}"
                                cityname="<@commonTags method="getDecrypt3DEs" type="1" value="${(appuser.mobile)!}">${(getDecrypt3DEs)!}</@commonTags>">
                                <a id="${(appuser.id)!}"><@commonTags method="getDecrypt3DEs" type="1" value="${(appuser.mobile)!}">${(getDecrypt3DEs)!}</@commonTags></a>
                            </li>
                        </#list>
                        </ul>
                    </div>
                    <div class="jksa">
                    <#--<span id="add_all">全部选中</span>-->
                        <span id="remove_all"> 全部删除</span>
                    </div>
                    <div class="centent cen2">
                        <ul id="xuanzr2">

                        </ul>

                    </div>
                    <br style='clear:both'/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                            class="fa fa-save"></i> 发送
                    </button>
                </div>
            </div>
        </div><!-- /.box-body -->
    </form>
</@body>
<@footer>


<script type="text/javascript">

    layui.use('form', function () {
        var form = layui.form;
        form.on('radio(erweima)', function (data) {
            if (data.value == "1") {
                $("#appusrlist").css({'display': 'block'});
                $("#deptlist").css({'display': 'none'});
            } else if (data.value == "2") {
                $("#deptlist").css({'display': 'block'});
                $("#appusrlist").css({'display': 'none'});
            }
            form.render();
        });
    });


    function searchCity() {
        var searchCityName = $("#searchCityName").val();
        if (searchCityName == "") {
            $("#xuanzr1 li").show();
        } else {
            $("#xuanzr1 li").each(
                    function () {
                        var pinyin = $(this).attr("pinyin");
                        var cityName = $(this).attr("cityName");
                        if (pinyin.indexOf(searchCityName) != -1 || cityName.indexOf(searchCityName) != -1) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
        }
    }

    $('#searchCityName').bind('input propertychange', function () {

        searchCity();
    });

    $(document).ready(function () {
        yktry();
    });
    var arrPic = [];

    function yktry() {
        arrPic = new Array();
        //全部移到右边
        $('#add_all').click(function () {
            $('.cen1').find('li').appendTo('#xuanzr2');
            reouer();
            var len = $('.cen2').find('li').length;
            for (var i = 0; i < len; i++) {
                arrPic[i] = $(".cen2 a").eq(i).prop("id");
            }
            $("#userId").val(arrPic);
        });

        $('.cen1 li').dblclick(function () {
            arrPic = new Array();
            $(this).appendTo('#xuanzr2');
            reouer();
            var len = $('.cen2').find('li').length;
            for (var i = 0; i < len; i++) {
                arrPic[i] = $(".cen2 a").eq(i).prop("id");
            }
            $("#userId").val(arrPic);
        });

    }

    function reouer() {
        arrPic = new Array();
        $('.cen2 li').dblclick(function () {

            $(this).appendTo('#xuanzr1');
            yktry();
            var len = $('.cen2').find('li').length;
            for (var i = 0; i < len; i++) {
                arrPic[i] = $(".cen2 a").eq(i).prop("id");
            }
            $("#userId").val(arrPic);
        });
        //全部移到左边
        $('#remove_all').click(function () {
            arrPic = new Array();
            $('.cen2 li').appendTo('#xuanzr1');
            yktry();
            var len = $('.cen2').find('li').length;
            for (var i = 0; i < len; i++) {
                arrPic[i] = $(".cen2 a").eq(i).prop("id");
            }
            $("#userId").val(arrPic);
        });

    }
</script>

</@footer>