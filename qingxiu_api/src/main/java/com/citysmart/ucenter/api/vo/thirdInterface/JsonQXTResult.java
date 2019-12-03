package com.citysmart.ucenter.api.vo.thirdInterface;

import com.fasterxml.jackson.annotation.JsonProperty;

public class JsonQXTResult {
    @JsonProperty("Success")
    private boolean success;
    @JsonProperty("Error")
    private String error;
    @JsonProperty("Result")
    private Object result;

    public boolean getSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
