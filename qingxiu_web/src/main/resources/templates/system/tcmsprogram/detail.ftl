<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">栏目名称</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="title" name="title" value="${(entity.title)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="code" class="col-sm-2 control-label">栏目编号</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="code" name="code" value="${(entity.code)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="isDelete" class="col-sm-2 control-label">isDelete</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="isDelete" name="isDelete" value="${(entity.isDelete)!}" class="form-control"  />
                    </div>
                </div>
                                                </div>
</@body>
<@footer>
</@footer>