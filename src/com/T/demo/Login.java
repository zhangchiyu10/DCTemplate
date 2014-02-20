package com.T.demo;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private Map<String,Object> session;

	public void setSession(Map<String,Object> session) {
		this.session = session;
	}

	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String system(){
		return SUCCESS;
	}
	
	public String login() {
		if (user == null) {
			return LOGIN;
		}
		
		if ( user.getUsername().equals("a") &&  user.getPassword().equals("a") ) {
			session = ActionContext.getContext().getSession();
			session.put("logged", user);
			return SUCCESS;
		} else {
			System.out.println("fucked");
			return LOGIN;
		}
	}

}
