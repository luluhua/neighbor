package com.citysmart.common.util;


import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.Map;

/**
 * 验证工具
 * @author liuguicheng
 * @Time：2019.03.09 下午1:29:08
 */
public class ValidateUtil {

	public static Map<String, Object> toStringJson(BindingResult result){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(FieldError fieldError : result.getFieldErrors()){
			map.put(fieldError.getField(), fieldError.getDefaultMessage());
		}
		
		return map;
		
	}
	
}
