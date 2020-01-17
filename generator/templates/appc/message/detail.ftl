<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="sender" class="col-sm-2 control-label">sender</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="sender" name="sender" value="${(entity.sender)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">用户id</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="userId" name="userId" value="${(entity.userId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="type" class="col-sm-2 control-label">类型 0系统消息  1用户消息</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="type" name="type" value="${(entity.type)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="title" name="title" value="${(entity.title)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="content" class="col-sm-2 control-label">内容</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="content" name="content" value="${(entity.content)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="files" class="col-sm-2 control-label">附件 多个,隔开</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="files" name="files" value="${(entity.files)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="status" class="col-sm-2 control-label">是否已读 0：未读 1：已读</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="status" name="status" value="${(entity.status)!}" class="form-control"  />
                    </div>
                </div>
                                                            </div>
</@body>
<@footer>
</@footer>