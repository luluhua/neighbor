<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
      <#if (entity.id)??>action="/dj/partymember/doEdit/${(entity.id)!}"<#else>action="/dj/partymember/doAdd"</#if>>
    <div class="box-body">
        <input type="hidden" name="id" value="${(entity.id)!}"/>
        <div class="form-group">
            <label for="code" class="col-sm-3 control-label">姓名</label>
            <div class="col-sm-9">
                <input type="text" name="name" value="${(entity.name)!}" class="form-control input-title-500"
                       placeholder="请输入姓名" lay-verify="required" readonly/>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-3 control-label">性别<span class="xing_red"> *</span></label>
            <div class="col-sm-9">
                <label>
                    <input name="sex" type="radio" class="minimal" ${(entity.sex=='1')?string('checked','')}
                           value="1" lay-ignore> 男
                </label>
                <label>
                    <input name="sex" type="radio" class="minimal" ${(entity.sex=='2')?string('checked','')}
                           value="2" lay-ignore> 女
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-3 control-label">出生日期</label>
            <div class="col-sm-9">
                <input type="text" class="form-control  input-select-200 partymember_datetime" id="birthday"
                       name="birthday"
                       value="${(entity.birthday)!}"
                       placeholder="选择出生日期" readonly>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-3 control-label">入党日期</label>
            <div class="col-sm-9">
                <input type="text" class="form-control  input-select-200 partymember_datetime" id="partyDate"
                       name="partyDate"
                       value="${(entity.partyDate)!}"
                       placeholder="选择入党日期" readonly>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-3 control-label">学历</label>
            <div class="col-sm-9">
                <select name="education" class="form-control select2 input-select-200" style="width: 500px" lay-ignore disabled>
                    <@dictTag method="getDictListByType" type="edu_detail" >
                            <#list getDictListByType as m>
                                <option value="${(m.value)!}" <#if "${(m.value)!}"=="${(entity.education)!}">selected</#if> >${(m.label)!}</option>
                            </#list>
                    </@dictTag>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-3 control-label">所在党支部</label>
            <div class="col-sm-9">
                <select name="partyBranchOrg" class="form-control select2 input-select-200" style="width: 500px" lay-ignore disabled>
                <#list orgList as org>
                    <option value="${(org.id)!}" <#if "${(org.id)!}"=="${(entity.partyBranchOrg)!}">selected</#if>>${(org.name)!}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-3 control-label">排序</label>
            <div class="col-sm-9">
                <input type="text" name="sort" value="${(entity.sort)!}" class="form-control input-title-500"
                       placeholder="请输入排序" readonly/>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
  <script>
      $(document).ready(function () {

      });
      $('.partymember_datetime').daterangepicker({
          "autoApply": true,
          "singleDatePicker": true,
          "showDropdowns": true,
          "timePicker": false,
          "timePicker24Hour": false,
          "opens": "center",
          locale: {
              format: "YYYY-MM-DD",
              applyLabel: '确定',
              cancelLabel: '取消',
              daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
              monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                  '七月', '八月', '九月', '十月', '十一月', '十二月'
              ],
              firstDay: 1
          },
      }, function (start) {

      });
  </script>
<style>
    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;
    }
</style>
</@footer>