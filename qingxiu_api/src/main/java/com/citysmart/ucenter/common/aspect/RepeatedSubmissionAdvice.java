package com.citysmart.ucenter.common.aspect;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Order(3)
@Aspect
@Component
public class RepeatedSubmissionAdvice {
	
	public static final Logger LOG = Logger.getLogger(RepeatedSubmissionAdvice.class);


	@Pointcut("@annotation(com.citysmart.ucenter.common.anno.RepeatedSubmission)")
	public void controllerAspect() {
		
	}

	/***
	 * @Author liuguicheng
	 * @Description //TODO 方法执行前 执行 以下逻辑
	 * @Date 14:34 2019/8/21
	 **/
	@Before("controllerAspect()")
	public void doBefore(JoinPoint joinPoint) throws Throwable{
	}

	/***
	 * @Author liuguicheng
	 * @Description //TODO 方法执行后 执行以下逻辑
	 * @Date 14:34 2019/8/21
	 **/
	@AfterReturning(returning = "ret" , pointcut = "controllerAspect()")
	public void doAfterReturning(Object ret){
		//处理完请求---------方法执行后------");
	}



}
