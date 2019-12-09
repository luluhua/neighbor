package com.citysmart.ucenter.api.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ApiPage<T> {
    private static final long serialVersionUID = 1L;
    private List<T> records;
    private int pageCurrent;
    private int pageSize;
}
