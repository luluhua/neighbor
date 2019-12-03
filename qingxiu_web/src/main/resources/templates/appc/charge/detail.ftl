<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<div class="box-body">
    <div class="form-group">
        <label for="no" class="col-sm-2 control-label">记录编号</label>
        <div class="col-sm-10">
            <input type="text" disabled id="no" name="no" value="${(entity.no)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="recordId" class="col-sm-2 control-label">办事记录ID</label>
        <div class="col-sm-10">
            <input type="number" disabled id="recordId" name="recordId" value="${(entity.recordId)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="paymentNumber" class="col-sm-2 control-label">付款单号</label>
        <div class="col-sm-10">
            <input type="text" disabled id="paymentNumber" name="paymentNumber" value="${(entity.paymentNumber)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="state" class="col-sm-2 control-label">付款状态 （0未付 1已付 2取消）</label>
        <div class="col-sm-10">
            <input type="number" disabled id="state" name="state" value="${(entity.state)!}" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="dtPayment" class="col-sm-2 control-label">付款时间</label>
        <input type="text" disabled name="dtPayment" class="form-control"
               value="${(entity.dtPayment?string('yyyy-MM-dd'))!}" id="dtPayment">
    </div>
    <div class="form-group">
        <label for="paymentUser" class="col-sm-2 control-label">付款用户</label>
        <div class="col-sm-10">
            <input type="number" disabled id="paymentUser" name="paymentUser" value="${(entity.paymentUser)!}"
                   class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label for="paymentChannel" class="col-sm-2 control-label">付款渠道（1 微信支付 2支付宝 3银联）</label>
        <div class="col-sm-10">
            <input type="number" disabled id="paymentChannel" name="paymentChannel" value="${(entity.paymentChannel)!}"
                   class="form-control"/>
        </div>
    </div>
</div>
</@body>
<@footer>
</@footer>