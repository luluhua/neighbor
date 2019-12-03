<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="params" class="col-sm-2 control-label">参数</label>
        <div class="col-sm-10">
            <textarea class="form-control" id="params" rows="15" style="display: none;" >${(entity.params)!}</textarea>
        </div>
        <pre id="json-params"></pre>
    </div>
    <div class="form-group">
        <label for="result" class="col-sm-2 control-label">结果</label>
        <div class="col-sm-10">
            <textarea class="form-control" id="result" rows="15" style="display: none;" >${(entity.result)!}</textarea>
        </div>
        <pre id="json-result"></pre>
    </div>
</div>
</@body>
<@footer>
<script src="/plugins/json-viewer/js/jquery.json-viewer.js"></script>
    <script type="text/javascript">
        $(function() {
            var params = $('#params').text();
            var result = $('#result').text();
            if(params == ""){
                params = "{}";
            }
            if(result == ""){
                result = "{}";
            }
            try {
                var input1 = eval('(' + params + ')');
                var input2 = eval('(' + result + ')');
            }
            catch (error) {
                return alert("Cannot eval JSON: " + error);
            }
            var options = {};
            $('#json-params').jsonViewer(input1, options);
            $('#json-result').jsonViewer(input2, options);
        });
    </script>
</@footer>