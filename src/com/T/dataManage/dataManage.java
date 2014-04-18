package com.T.dataManage;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class dataManage extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> result;

	public Map<String, Object> getResult() {
		return result;
	}

	public void setResult(Map<String, Object> result) {
		this.result = result;
	}
	
	public String execute() {
		System.out.println("good");
		result = new HashMap<String, Object>();
		result.put("x","asdfasdf");
		return SUCCESS;
	}

}
