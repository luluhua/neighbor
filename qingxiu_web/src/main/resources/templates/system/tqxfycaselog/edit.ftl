<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <form class="form-horizontal layui-form layui-form-pane" method="post" action="/qxfy/tQxfyCaseLog/doQuery" >
        <div class="box-body">
            <div class="form-group">
                <label for="yCaseCode" class="col-sm-2 control-label">电话号码<span class="xing_red">*</span></label>
                <div class="col-sm-10">
                    <input type="text" id="yQueryPhone" name="yQueryPhone" value="${(TQxfyCaseLog.yQueryPhone)!}"
                           class="form-control" placeholder="请输入电话号码"
                           lay-verify="required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="yCaseCode" class="col-sm-2 control-label">验证码<span class="xing_red">*</span></label>
                <div class="col-sm-10">
                    <input type="text" id="vCode" name="vCode" value="${(TQxfyCaseLog.yCaseCode)!}"
                            class="form-control" placeholder="请输入手机验证码"
                           lay-verify="required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="yCaseCode" class="col-sm-2 control-label">案件代码<span class="xing_red">*</span></label>
                <div class="col-sm-10">
                    <input type="text" id="yCaseCode" name="yCaseCode"
                           class="form-control" placeholder="请输入案件代码"
                           lay-verify="required"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i> 提 交
                    </button>

                    <button type="button" class="btn btn-warning" onclick="sendMsg();return false;"><i class="fa fa-save"></i> 发送短信
                    </button>
                </div>

            </div>
        </div><!-- /.box-body -->
    </form>

</@body>
<@footer>
     <script type="application/javascript">
         function sendMsg(){
             var yQueryPhone=$("#yQueryPhone").val();
             alert("yQueryPhone=="+yQueryPhone);
             $.ajax({
                 url : "https://www.iganxu.vip/api/web/login/send",
                 type:'POST',
                 dataType: 'JSON',
                 data: "mobile=18697931020",
                 xhrFields: {
                     withCredentials: false
                 },
                 beforeSend : function(req) {
                     // req.setRequestHeader('Authorization', auth);
                     req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题
                     req.setRequestHeader('Access-Control-Allow-Origin', '*');
                 },
                 success: function(data) {
                     console.log(data);
                 },
                 error: function(){
                     console.log('error');
                 }
             });

             return false;
         }

         $("#yQueryPhone").change(function(){
             $.ajax({
                 url : "https://www.iganxu.vip/api/web/login/send",
                 type:'POST',
                 dataType: 'JSON',
                 data: "mobile=18697931020",
                 xhrFields: {
                     withCredentials: true
                 },
                 beforeSend : function(req) {
                     // req.setRequestHeader('Authorization', auth);
                     req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题
                 },
                 success: function(data) {
                     console.log(data);
                 },
                 error: function(){
                     console.log('error');
                 }
             });
         }
     );
    </script>
</@footer>