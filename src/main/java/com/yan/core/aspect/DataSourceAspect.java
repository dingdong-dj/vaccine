/*
 * Copyright (c) 2018 lxk [https://gitee.com/LiuSubject/VaccineManagement]
 * 
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
package com.yan.core.aspect;

import java.lang.reflect.Method;

import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;

import com.yan.core.annotation.DynamicDataSource;
import com.yan.core.constant.DataSourceName;
import com.yan.core.spring.DataSourceContextHolder;

/**
 * 名称：DataSourceAspect<br>
 *
 * 描述：切换数据源 aop 切面（order=1 优先级最高）<br>
 *
 * @author >lxk<br>
 * 时间：<br>
 * 2017-09-06 10:29:16<br>
 * 版权：<br>
 * Copyright 2017 <a href="https://gitee.com/LiuSubject" target="_blank">https://gitee.com/LiuSubject</a>. All rights reserved.
 */
public class DataSourceAspect implements MethodBeforeAdvice, AfterReturningAdvice {

	/**
	 * 前置通知（用于在事物开启之前切换数据源）<br>
	 * 
	 * @see org.springframework.aop.MethodBeforeAdvice#before(java.lang.reflect.Method, java.lang.Object[], java.lang.Object)
	 */
	@Override
	public void before(Method method, Object[] args, Object target) throws Throwable {
		if (method.isAnnotationPresent(DynamicDataSource.class)) {
			DynamicDataSource dataSource = method.getAnnotation(DynamicDataSource.class);
			if (dataSource.value() != DataSourceName.DEFAULT) {
				DataSourceContextHolder.setDataSource(dataSource.value().getName());
			}
		}
	}

	/**
	 * 后置通知（用于清理切换过的数据源，还原默认数据源）<br>
	 * 
	 * @see org.springframework.aop.AfterReturningAdvice#afterReturning(java.lang.Object, java.lang.reflect.Method, java.lang.Object[], java.lang.Object)
	 */
	@Override
	public void afterReturning(Object returnValue, Method method, Object[] args, Object target) throws Throwable {
		if (method.isAnnotationPresent(DynamicDataSource.class)) {
			DynamicDataSource dataSource = method.getAnnotation(DynamicDataSource.class);
			if (dataSource.value() != DataSourceName.DEFAULT) {
				DataSourceContextHolder.clearDataSource();
			}
		}
	}

}
