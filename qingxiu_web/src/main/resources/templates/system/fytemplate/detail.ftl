<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
                                                                            <div class="form-group">
                    <label for="docType" class="col-sm-2 control-label">类型</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="docType" name="docType" value="${(entity.docType)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="docClassify" class="col-sm-2 control-label">分类</label>
                    <div class="col-sm-10">
                        <input type="number" disabled id="docClassify" name="docClassify" value="${(entity.docClassify)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="title" name="title" value="${(entity.title)!}" class="form-control"  />
                    </div>
                </div>
                                                                                                            <div class="form-group">
                    <label for="url" class="col-sm-2 control-label">下载地址</label>
                    <div class="col-sm-10">
                        <input type="text" disabled id="url" name="url" value="${(entity.url)!}" class="form-control"  />
                    </div>
                </div>
                                                            </div>
</@body>
<@footer>
</@footer>