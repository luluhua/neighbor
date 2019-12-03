package com.citysmart.ucenter.api.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TextVo {
    private String text;
    private String value;

    public TextVo(String text, String value) {
        this.text = text;
        this.value = value;
    }
}
