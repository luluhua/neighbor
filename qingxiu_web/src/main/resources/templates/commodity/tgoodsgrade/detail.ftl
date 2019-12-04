<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                <div class="form-group">
                    <label for="goodsId" class="col-sm-2 control-label">goodsId</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="goodsId" name="goodsId" value="${(entity.goodsId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="userId" class="col-sm-2 control-label">userId</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="userId" name="userId" value="${(entity.userId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="gradeUserId" class="col-sm-2 control-label">gradeUserId</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="gradeUserId" name="gradeUserId" value="${(entity.gradeUserId)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="gradeType" class="col-sm-2 control-label">0 不匿名 1匿名</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="gradeType" name="gradeType" value="${(entity.gradeType)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                <div class="form-group">
                    <label for="explain" class="col-sm-2 control-label">explain</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="explain" name="explain" value="${(entity.explain)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                                        <div class="form-group">
                    <label for="sortIndex" class="col-sm-2 control-label">sortIndex</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}" class="form-control"  />
                    </div>
                </div>
                                                            </div>
</@body>
<@footer>
</@footer>