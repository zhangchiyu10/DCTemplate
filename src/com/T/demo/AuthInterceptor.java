package com.T.demo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;

	private boolean isLogin(String path) {
		if (path.endsWith("/Login.action")) {
			return false;

		} else
			return true;
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (isLogin(request.getRequestURI())) {
			Map<String, Object> session = invocation.getInvocationContext()
					.getSession();

			if (session.get("logged") == null) {
				return Action.LOGIN;
			}
		}
		return invocation.invoke();

	}
}
