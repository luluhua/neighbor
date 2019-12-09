<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">名称</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="name" name="name" value="${(entity.name)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="code" class="col-sm-2 control-label">code</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="code" name="code" value="${(entity.code)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="icon" class="col-sm-2 control-label">图标</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="icon" name="icon" value="${(entity.icon)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="skipUrl" class="col-sm-2 control-label">跳转URL</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="skipUrl" name="skipUrl" value="${(entity.skipUrl)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="sortIndex" class="col-sm-2 control-label">排序</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}" class="form-control"  />
                    </div>
                </div>
                                                            </div>
</@body>
<@footer>
</@footer>