package com.object;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * 基类
 * 
 * @author djt-it
 * 
 */
public class Base implements java.io.Serializable {

	public Base() {
		super();
		// TODO Auto-generated constructor stub
	}

	private static final long serialVersionUID = 1L;
	
	//	 写操作记录
	public void sqlrecord(Connection conn,String c_str,String c_sql,Staff s) throws SQLException { 
		String sql = " insert into t_sqlrecord (c_str,c_sql,c_operator,c_ip) values (?,?,'" 
			+ s.getC_jobnumber() + "','" + s.getC_ip()  + "')";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, c_str);
		ps.setString(2, c_sql);
		ps.executeUpdate();
	}
}
