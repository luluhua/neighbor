<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">用户Id</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="userId" name="userId" value="${(entity.userId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="province" class="col-sm-2 control-label">省份</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="province" name="province" value="${(entity.province)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">城市</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="city" name="city" value="${(entity.city)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="region" class="col-sm-2 control-label">区域</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="region" name="region" value="${(entity.region)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="detailedAddress" class="col-sm-2 control-label">详细地址</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="detailedAddress" name="detailedAddress" value="${(entity.detailedAddress)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="state" class="col-sm-2 control-label">是否删除 0:默认</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="state" name="state" value="${(entity.state)!}" class="form-control"  />
                    </div>
                </div>
                                                            </div>
</@body>
<@footer>
</@footer>