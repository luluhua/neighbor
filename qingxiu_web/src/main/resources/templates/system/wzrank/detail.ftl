<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="groupName" class="col-sm-2 control-label">groupName</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="groupName" name="groupName" value="${(entity.groupName)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">title</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="title" name="title" value="${(entity.title)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                                                                                                        <div class="form-group">
                    <label for="sortIndex" class="col-sm-2 control-label">sortIndex</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}" class="form-control"  />
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