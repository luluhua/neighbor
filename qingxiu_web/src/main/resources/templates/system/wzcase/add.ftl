<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/wzCase/doAdd">
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
                    <label for="num" class="col-sm-2 control-label">num</label>
                    <div class="col-sm-10">
                        <input type="text" id="num" name="num" class="form-control" placeholder="请输入num"  />
                    </div>
                </div>
                                                        
                                                            <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">title</label>
                    <div class="col-sm-10">
                        <input type="text" id="title" name="title" class="form-control" placeholder="请输入title"  />
                    </div>
                </div>
                                                        
                                                            <div class="form-group">
                    <label for="ctypeText" class="col-sm-2 control-label">ctypeText</label>
                    <div class="col-sm-10">
                        <input type="text" id="ctypeText" name="ctypeText" class="form-control" placeholder="请输入ctypeText"  />
                    </div>
                </div>
                                                        
                                                            <div class="form-group">
                    <label for="dep" class="col-sm-2 control-label">dep</label>
                    <div class="col-sm-10">
                        <input type="text" id="dep" name="dep" class="form-control" placeholder="请输入dep"  />
                    </div>
                </div>
                                                        
                                                            <div class="form-group">
                    <label for="postUsername" class="col-sm-2 control-label">postUsername</label>
                    <div class="col-sm-10">
                        <input type="text" id="postUsername" name="postUsername" class="form-control" placeholder="请输入postUsername"  />
                    </div>
                </div>
                                                        
                                                                                    <div class="form-group">
                    <label for="postDatetime" class="col-sm-2 control-label">postDatetime</label>
                    <input type="text" name="postDatetime" class="form-control date" id="postDatetime" placeholder="开始日期  - 结束日期" style="width: 228px;">
                </div>
                                
                                                            <div class="form-group">
                    <label for="postContent" class="col-sm-2 control-label">postContent</label>
                    <div class="col-sm-10">
                        <input type="text" id="postContent" name="postContent" class="form-control" placeholder="请输入postContent"  />
                    </div>
                </div>
                                                        
                                                            <div class="form-group">
                    <label for="postFiles" class="col-sm-2 control-label">postFiles</label>
                    <div class="col-sm-10">
                        <input type="text" id="postFiles" name="postFiles" class="form-control" placeholder="请输入postFiles"  />
                    </div>
                </div>
                                                        
                                                            <div class="form-group">
                    <label for="statusText" class="col-sm-2 control-label">statusText</label>
                    <div class="col-sm-10">
                        <input type="text" id="statusText" name="statusText" class="form-control" placeholder="请输入statusText"  />
                    </div>
                </div>
                                                        
                                                                        <div class="form-group">
                    <label for="viewsCount1" class="col-sm-2 control-label">viewsCount1</label>
                    <div class="col-sm-10">
                        <input type="number" id="viewsCount1" name="viewsCount1" class="form-control" placeholder="请输入viewsCount1"  />
                    </div>
                </div>
                                            
                                                                        <div class="form-group">
                    <label for="viewsCount2" class="col-sm-2 control-label">viewsCount2</label>
                    <div class="col-sm-10">
                        <input type="number" id="viewsCount2" name="viewsCount2" class="form-control" placeholder="请输入viewsCount2"  />
                    </div>
                </div>
                                            
                                                                                    <div class="form-group">
                    <label for="promiseDate" class="col-sm-2 control-label">promiseDate</label>
                    <input type="text" name="promiseDate" class="form-control date" id="promiseDate" placeholder="开始日期  - 结束日期" style="width: 228px;">
                </div>
                                
                                                            <div class="form-group">
                    <label for="supportFiles" class="col-sm-2 control-label">supportFiles</label>
                    <div class="col-sm-10">
                        <input type="text" id="supportFiles" name="supportFiles" class="form-control" placeholder="请输入supportFiles"  />
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