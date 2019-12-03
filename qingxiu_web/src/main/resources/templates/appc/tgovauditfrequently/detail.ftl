<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                            <div class="form-group">
                    <label for="orgId" class="col-sm-2 control-label">orgId</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="orgId" name="orgId" value="${(entity.orgId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                <div class="form-group">
                    <label for="content" class="col-sm-2 control-label">content</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="content" name="content" value="${(entity.content)!}" class="form-control"  />
                    </div>
                </div>
                                                                        </div>
</@body>
<@footer>
</@footer>