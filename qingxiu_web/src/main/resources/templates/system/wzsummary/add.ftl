<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/wzSummary/doAdd">
    <div class="box-body">
            
                                                                        <div class="form-group">
                    <label for="completed" class="col-sm-2 control-label">completed</label>
                    <div class="col-sm-10">
                        <input type="number" id="completed" name="completed" class="form-control" placeholder="请输入completed"  />
                    </div>
                </div>
                                            
                                                                        <div class="form-group">
                    <label for="replied" class="col-sm-2 control-label">replied</label>
                    <div class="col-sm-10">
                        <input type="number" id="replied" name="replied" class="form-control" placeholder="请输入replied"  />
                    </div>
                </div>
                                            
                                                                        <div class="form-group">
                    <label for="working" class="col-sm-2 control-label">working</label>
                    <div class="col-sm-10">
                        <input type="number" id="working" name="working" class="form-control" placeholder="请输入working"  />
                    </div>
                </div>
                                            
                                                                        <div class="form-group">
                    <label for="lastest" class="col-sm-2 control-label">lastest</label>
                    <div class="col-sm-10">
                        <input type="number" id="lastest" name="lastest" class="form-control" placeholder="请输入lastest"  />
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