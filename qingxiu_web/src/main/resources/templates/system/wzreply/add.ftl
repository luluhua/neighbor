<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/wzReply/doAdd">
    <div class="box-body">
            
                                                            <div class="form-group">
                    <label for="dataSource" class="col-sm-2 control-label">dataSource</label>
                    <div class="col-sm-10">
                        <input type="text" id="dataSource" name="dataSource" class="form-control" placeholder="请输入dataSource"  />
                    </div>
                </div>
                                                        
                                                            <div class="form-group">
                    <label for="dataSourceId" class="col-sm-2 control-label">dataSourceId</label>
                    <div class="col-sm-10">
                        <input type="text" id="dataSourceId" name="dataSourceId" class="form-control" placeholder="请输入dataSourceId"  />
                    </div>
                </div>
                                                        
                                                                        <div class="form-group">
                    <label for="caseId" class="col-sm-2 control-label">caseId</label>
                    <div class="col-sm-10">
                        <input type="number" id="caseId" name="caseId" class="form-control" placeholder="请输入caseId"  />
                    </div>
                </div>
                                            
                                                            <div class="form-group">
                    <label for="rpUsername" class="col-sm-2 control-label">rpUsername</label>
                    <div class="col-sm-10">
                        <input type="text" id="rpUsername" name="rpUsername" class="form-control" placeholder="请输入rpUsername"  />
                    </div>
                </div>
                                                        
                                                            <div class="form-group">
                    <label for="rpContent" class="col-sm-2 control-label">rpContent</label>
                    <div class="col-sm-10">
                        <input type="text" id="rpContent" name="rpContent" class="form-control" placeholder="请输入rpContent"  />
                    </div>
                </div>
                                                        
                                                                                    <div class="form-group">
                    <label for="rpDatetime" class="col-sm-2 control-label">rpDatetime</label>
                    <input type="text" name="rpDatetime" class="form-control date" id="rpDatetime" placeholder="开始日期  - 结束日期" style="width: 228px;">
                </div>
                                
                                                            <div class="form-group">
                    <label for="rpFiles" class="col-sm-2 control-label">rpFiles</label>
                    <div class="col-sm-10">
                        <input type="text" id="rpFiles" name="rpFiles" class="form-control" placeholder="请输入rpFiles"  />
                    </div>
                </div>
                                                        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>