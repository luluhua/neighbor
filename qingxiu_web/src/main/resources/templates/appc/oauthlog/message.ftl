<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <textarea class="form-control" id="json-input" rows="15" style="display: none;" >${(entity.message)!}</textarea>
        <textarea class="form-control" id="result" rows="15" style="display: none;" >${(entity.result)!}</textarea>
    </div>
    <label >请求报文：</label>
    <pre id="json-renderer"></pre>
    <br/>
    <label >响应结果：</label>
    <pre id="json-result"></pre>
</div>
</@body>
<@footer>
<script src="/plugins/json-viewer/js/jquery.json-viewer.js"></script>
    <script type="text/javascript">
        $(function() {
            try {
                var input = eval('(' + $('#json-input').text() + ')');
                var input2 = eval('(' + $('#result').text() + ')');
            }
            catch (error) {
                return alert("Cannot eval JSON: " + error);
            }
            var options = {};
            $('#json-renderer').jsonViewer(input, options);
            $('#json-result').jsonViewer(input2, options);
        });
    </script>
</@footer>