<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">分类名称</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="name" name="name" value="${(entity.name)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="type" class="col-sm-2 control-label">类型1 文书模板 2 诉讼须知</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="type" name="type" value="${(entity.type)!}" class="form-control"  />
                    </div>
                </div>
                                                </div>
</@body>
<@footer>
</@footer>