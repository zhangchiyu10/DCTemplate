package com.T.chartsData;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class chart1 extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Map<String, Object> result;

	public Map<String, Object> getResult() {
		return result;
	}

	public void setResult(Map<String, Object> result) {
		this.result = result;
	}
	
	private String date;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public String execute() {
		result = new HashMap<String, Object>();
		ArrayList<String> y = new ArrayList<String>();
		ArrayList<String> x = new ArrayList<String>();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/thfund", "root", "1234567890");

			Statement statement = conn.createStatement();
			String sql = "select * from chart_data_1 where date='"+date+"' order by x;";
			ResultSet rs = statement.executeQuery(sql);
			System.out.println(sql);
			while (rs.next()) {
				x.add(rs.getString("x"));
				y.add(rs.getString("y"));
				//System.out.println(rs.getString("y"));
			}

			rs.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();

		}
		result.put("x", x.toArray());
		result.put("y", y.toArray());
		return SUCCESS;

	}

}
