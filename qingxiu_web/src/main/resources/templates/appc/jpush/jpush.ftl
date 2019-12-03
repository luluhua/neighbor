<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
 <form role="form" class="layui-form layui-form-pane pd10" method="post" action="/system/jpush/doAddJPush">
     <div class="box-body">
         <div class="form-group">
             <label for="uname">推送平台</label> <span class="xing_red"> *</span>
             <select  name="platform" class="form-control select2 input-select-200"  lay-verify="required" lay-ignore>
                 <option value="">请必选</option>
                 <option value="android">android</option>
                 <option value="ios">ios</option>
                 <option value="all">all</option>
             </select>
         </div>
         <div class="form-group">
             <label for="uname">推送类型</label> <span class="xing_red"> *</span>
             <select  name="audienceType" class="form-control select2 input-select-200"  lay-verify="required" lay-ignore>
                 <option value="">--请选择--</option>
                <@dictTag method="getDictListByType" type="jpush_audience_type" >
                    <#list getDictListByType as m>
                        <option value="${(m.value)!}">${(m.label)!}</option>
                    </#list>
                </@dictTag>
             </select>
         </div>
         <div class="form-group">
             <label>推送对象</label>
             <input type="text" name="audience" class="form-control" placeholder="请输入对象，对个用','隔开"  >
         </div>
         <div class="form-group">
             <label>标题</label>
             <input type="text" name="messageTitle" class="form-control" placeholder="请输入标题"  lay-verify="required">
         </div>
         <div class="form-group">
             <label>内容</label>
             <input type="text" name="message" class="form-control" placeholder="请输入内容"  lay-verify="required">
         </div>
         <div class="form-group">
             <label>位置</label>
             <input type="text" name="possition" class="form-control" placeholder="请输入内容"  lay-verify="required">
         </div>
         <div class="form-group">
             <label>参数</label>
             <input type="text" name="extras" class="form-control" placeholder="请输入内容"  lay-verify="required">
         </div>

         <div class="form-group">
             <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i> 推送
             </button>
         </div>
     </div>
 </form>
</@body>
<@footer>
</@footer>