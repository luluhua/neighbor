<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                            <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">用户id</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="userId" name="userId" value="${(entity.userId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                <div class="form-group">
                    <label for="addressName" class="col-sm-2 control-label">地址名称</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="addressName" name="addressName" value="${(entity.addressName)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="addressDetail" class="col-sm-2 control-label">详细地址</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="addressDetail" name="addressDetail" value="${(entity.addressDetail)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="cityId" class="col-sm-2 control-label">行政城市ID</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="cityId" name="cityId" value="${(entity.cityId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="isDefault" class="col-sm-2 control-label">是否默认 1:默认 0：非默认</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="isDefault" name="isDefault" value="${(entity.isDefault)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                                    <div class="form-group">
                    <label for="updateTime" class="col-sm-2 control-label">最后修改时间</label>
                    <input type="text" disabled name="updateTime" class="form-control" value="${(entity.updateTime?string('yyyy-MM-dd'))!}" id="updateTime" >
                </div>
                        </div>
</@body>
<@footer>
</@footer>