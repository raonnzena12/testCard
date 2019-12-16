package com.ibk.card.member.aop;

import java.lang.reflect.Method;
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import com.ibk.card.member.vo.MemberVo;

@Aspect
@Component
public class MemberAop {
	
	@Pointcut("execution(public * com.ibk.card..membermp*(..))")
	private void membermpMethod() {}
	
	@Around("membermpMethod()")
	public Object memberCheck(ProceedingJoinPoint pjp) throws Throwable {
		Object result = null;
		String memNo = null, paramName = null;
		HttpSession session = null;
		
		Object[] paramVals = pjp.getArgs();
		MethodSignature signature = (MethodSignature)pjp.getSignature();
		Method method = signature.getMethod();
		
		for ( int i = 0 ; i < method.getParameters().length ; i++ ) {
			paramName = method.getParameters()[i].getName();
			if ( paramName.equals("memNo") ) {
				memNo = (String)paramVals[i];
			} else if ( paramName.equals("session")) {
				session = (HttpSession)paramVals[i];
			}
		}
		
		Object loginUser = session.getAttribute("loginUser");
		
		if ( loginUser == null || !((MemberVo)loginUser).getMemNo().equals(memNo) ) {
			System.out.println("유저 비로그인 혹은 유저 불일치");
			return "redirect:/";
		} else {
			result = pjp.proceed();
		}
		
		return result;
	}
}
