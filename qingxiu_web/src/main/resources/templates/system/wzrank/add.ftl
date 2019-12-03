<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/wzRank/doAdd">
    <div class="box-body">
            
                                                            <div class="form-group">
                    <label for="groupName" class="col-sm-2 control-label">groupName</label>
                    <div class="col-sm-10">
                        <input type="text" id="groupName" name="groupName" class="form-control" placeholder="请输入groupName"  />
                    </div>
                </div>
                                                        
                                                            <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">title</label>
                    <div class="col-sm-10">
                        <input type="text" id="title" name="title" class="form-control" placeholder="请输入title"  />
                    </div>
                </div>
                                                        
                                                                                        
                                                                        <div class="form-group">
                    <label for="sortIndex" class="col-sm-2 control-label">sortIndex</label>
                    <div class="col-sm-10">
                        <input type="number" id="sortIndex" name="sortIndex" class="form-control" placeholder="请输入sortIndex"  />
                    </div>
                </div>
                                            
                                                                                    <div class="form-group">
                    <label for="dtCreated" class="col-sm-2 control-label">dtCreated</label>
                    <input type="text" name="dtCreated" class="form-control date" id="dtCreated" placeholder="开始日期  - 结束日期" style="width: 228px;">
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