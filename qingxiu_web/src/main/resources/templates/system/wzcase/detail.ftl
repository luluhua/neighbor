<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="dataSource" class="col-sm-2 control-label">dataSource</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="dataSource" name="dataSource" value="${(entity.dataSource)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="dataSourceId" class="col-sm-2 control-label">dataSourceId</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="dataSourceId" name="dataSourceId" value="${(entity.dataSourceId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="num" class="col-sm-2 control-label">num</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="num" name="num" value="${(entity.num)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">title</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="title" name="title" value="${(entity.title)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="ctypeText" class="col-sm-2 control-label">ctypeText</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="ctypeText" name="ctypeText" value="${(entity.ctypeText)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="dep" class="col-sm-2 control-label">dep</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="dep" name="dep" value="${(entity.dep)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="postUsername" class="col-sm-2 control-label">postUsername</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="postUsername" name="postUsername" value="${(entity.postUsername)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                                    <div class="form-group">
                    <label for="postDatetime" class="col-sm-2 control-label">postDatetime</label>
                    <input type="text" disabled name="postDatetime" class="form-control" value="${(entity.postDatetime?string('yyyy-MM-dd'))!}" id="postDatetime" >
                </div>
                                                                                    <div class="form-group">
                    <label for="postContent" class="col-sm-2 control-label">postContent</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="postContent" name="postContent" value="${(entity.postContent)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="postFiles" class="col-sm-2 control-label">postFiles</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="postFiles" name="postFiles" value="${(entity.postFiles)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="statusText" class="col-sm-2 control-label">statusText</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="statusText" name="statusText" value="${(entity.statusText)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="viewsCount1" class="col-sm-2 control-label">viewsCount1</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="viewsCount1" name="viewsCount1" value="${(entity.viewsCount1)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="viewsCount2" class="col-sm-2 control-label">viewsCount2</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="viewsCount2" name="viewsCount2" value="${(entity.viewsCount2)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="promiseDate" class="col-sm-2 control-label">promiseDate</label>
                    <input type="text" disabled name="promiseDate" class="form-control" value="${(entity.promiseDate?string('yyyy-MM-dd'))!}" id="promiseDate" >
                </div>
                                                                                    <div class="form-group">
                    <label for="supportFiles" class="col-sm-2 control-label">supportFiles</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="supportFiles" name="supportFiles" value="${(entity.supportFiles)!}" class="form-control"  />
                    </div>
                </div>
                                                </div>
</@body>
<@footer>
</@footer>