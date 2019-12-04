<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="goods Id" class="col-sm-2 control-label">物品id</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="goods Id" name="goods Id" value="${(entity.goods Id)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="keyName" class="col-sm-2 control-label">参数名称</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="keyName" name="keyName" value="${(entity.keyName)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="valueName" class="col-sm-2 control-label">说明</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="valueName" name="valueName" value="${(entity.valueName)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="sortIndex" class="col-sm-2 control-label">排序</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}" class="form-control"  />
                    </div>
                </div>
                                                                        </div>
</@body>
<@footer>
</@footer>