<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <div class="box-body">
        <div class="form-group">
            <div class="col-sm-12">
                <textarea name="msgContent"  id="editor_id" readonly style="width: 700px;height: 300px"
                          placeholder="请输入消息内容，最多300个字符 ...">
                    ${(msgRecord.msgContent)!}
          </textarea>
            </div>
        </div>
    </div>
</@body>
<@footer>


</@footer>
