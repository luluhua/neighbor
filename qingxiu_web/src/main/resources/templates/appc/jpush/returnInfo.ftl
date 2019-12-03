<#include "../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="/plugins/json-viewer/css/jquery.json-viewer.css">
</@header>
<@body>
    <form role="form" class="layui-form layui-form-pane">
        <div class="box-body">
            <div class="form-group">
                <textarea class="form-control" id="json-input" rows="15" style="display: none;" >${(jPushSendLog.returnMsgAll)!''}</textarea></div>
            <pre id="json-renderer"></pre>
        </div>
    </form>
</@body>
<@footer>
    <script src="/plugins/json-viewer/js/jquery.json-viewer.js"></script>
    <script type="text/javascript">
        $(function() {
            try {
                var input = eval('(' + $('#json-input').text() + ')');
            }
            catch (error) {
                return alert("Cannot eval JSON: " + error);
            }
            var options = {
            };
            console.log(input)
            $('#json-renderer').jsonViewer(input, options);
        });
    </script>
</@footer>