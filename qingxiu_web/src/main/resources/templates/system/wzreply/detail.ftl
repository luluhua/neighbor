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
                    <label for="caseId" class="col-sm-2 control-label">caseId</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="caseId" name="caseId" value="${(entity.caseId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                <div class="form-group">
                    <label for="rpUsername" class="col-sm-2 control-label">rpUsername</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="rpUsername" name="rpUsername" value="${(entity.rpUsername)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="rpContent" class="col-sm-2 control-label">rpContent</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="rpContent" name="rpContent" value="${(entity.rpContent)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                                    <div class="form-group">
                    <label for="rpDatetime" class="col-sm-2 control-label">rpDatetime</label>
                    <input type="text" disabled name="rpDatetime" class="form-control" value="${(entity.rpDatetime?string('yyyy-MM-dd'))!}" id="rpDatetime" >
                </div>
                                                                                    <div class="form-group">
                    <label for="rpFiles" class="col-sm-2 control-label">rpFiles</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="rpFiles" name="rpFiles" value="${(entity.rpFiles)!}" class="form-control"  />
                    </div>
                </div>
                                                </div>
</@body>
<@footer>
</@footer>