<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                            <div class="form-group">
                    <label for="completed" class="col-sm-2 control-label">completed</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="completed" name="completed" value="${(entity.completed)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="replied" class="col-sm-2 control-label">replied</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="replied" name="replied" value="${(entity.replied)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="working" class="col-sm-2 control-label">working</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="working" name="working" value="${(entity.working)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="lastest" class="col-sm-2 control-label">lastest</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="lastest" name="lastest" value="${(entity.lastest)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="dtCreated" class="col-sm-2 control-label">dtCreated</label>
                    <input type="text" disabled name="dtCreated" class="form-control" value="${(entity.dtCreated?string('yyyy-MM-dd'))!}" id="dtCreated" >
                </div>
                        </div>
</@body>
<@footer>
</@footer>