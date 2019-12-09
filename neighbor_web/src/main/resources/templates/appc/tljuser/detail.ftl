<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="username" name="username" value="${(entity.username)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="password" name="password" value="${(entity.password)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="mobile" class="col-sm-2 control-label">mobile</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="mobile" name="mobile" value="${(entity.mobile)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="status" class="col-sm-2 control-label">0:正在使用中 1 禁用</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="status" name="status" value="${(entity.status)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                <div class="form-group">
                    <label for="guid" class="col-sm-2 control-label">GUID</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="guid" name="guid" value="${(entity.guid)!}" class="form-control"  />
                    </div>
                </div>
                                                            </div>
</@body>
<@footer>
</@footer>