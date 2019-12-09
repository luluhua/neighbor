<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">用户表id</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="userId" name="userId" value="${(entity.userId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="nickname" class="col-sm-2 control-label">昵称</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="nickname" name="nickname" value="${(entity.nickname)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="email" name="email" value="${(entity.email)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="gender" class="col-sm-2 control-label">0:未填写，1：男，2：女</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="gender" name="gender" value="${(entity.gender)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                <div class="form-group">
                    <label for="avatarUrl" class="col-sm-2 control-label">头像</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="avatarUrl" name="avatarUrl" value="${(entity.avatarUrl)!}" class="form-control"  />
                    </div>
                </div>
                                                </div>
</@body>
<@footer>
</@footer>