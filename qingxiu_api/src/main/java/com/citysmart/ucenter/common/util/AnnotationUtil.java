package com.citysmart.ucenter.common.util;

import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.NotNull;
import java.lang.reflect.Field;

/**
 * 注解 工具
 */
public class AnnotationUtil {
    /**
     * 获取apiMOdelProperty注解的字段注释
     *
     * @param field
     * @return
     */
    public static String getApiModelProperty(@NotNull Field field) {
        String annotationValue ;
        boolean ismEmpty = field.isAnnotationPresent(ApiModelProperty.class);
        if (ismEmpty) {
            ApiModelProperty[] aa = field.getAnnotationsByType(ApiModelProperty.class);
            annotationValue = aa[0].value();
        } else {
            annotationValue = field.getName();
        }
        return annotationValue;
    }
}
