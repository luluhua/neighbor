<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                            <div class="form-group">
                    <label for="yCaseId" class="col-sm-2 control-label">案件ID</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="yCaseId" name="yCaseId" value="${(entity.yCaseId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                <div class="form-group">
                    <label for="yCaseCode" class="col-sm-2 control-label">案件代码</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="yCaseCode" name="yCaseCode" value="${(entity.yCaseCode)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="yReturnInfo" class="col-sm-2 control-label">查询返回的数据</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="yReturnInfo" name="yReturnInfo" value="${(entity.yReturnInfo)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                                                <div class="form-group">
                    <label for="yQueryPlace" class="col-sm-2 control-label">请求查询地方：1:后台 2:api</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="yQueryPlace" name="yQueryPlace" value="${(entity.yQueryPlace)!}" class="form-control"  />
                    </div>
                </div>
                                    </div>
</@body>
<@footer>
</@footer>