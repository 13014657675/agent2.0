package com.object;

import com.publics.DB_MS2K; 
import java.io.Serializable;
import java.sql.*;

public class Commission implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer c_no;

	private Integer c_year;

	private Integer c_month;

	private Integer c_orgid[]; 

	private String c_system;

	private String c_jobnumber[]; 
	
	private String c_name[]; 

	private Integer c_type;

	private String c_str[];

	private double c_strv[];

	public Commission() {
	}  

	public String[] getC_name() {
		return c_name;
	} 

	public void setC_name(String[] c_name) {
		this.c_name = c_name;
	} 
	
	public Integer getC_year() {
		return c_year;
	}

	public void setC_year(Integer cYear) {
		c_year = cYear;
	}

	public Integer getC_month() {
		return c_month;
	}

	public void setC_month(Integer cMonth) {
		c_month = cMonth;
	} 

	public Integer getC_type() {
		return c_type;
	}

	public void setC_type(Integer cType) {
		c_type = cType;
	} 
	 
	public String[] getC_str() {
		return c_str;
	}

	public void setC_str(String cStr[]) {
		c_str = cStr;
	}  

	public String[] getC_jobnumber() {
		return c_jobnumber;
	}

	public void setC_jobnumber(String[] c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	}

	public Integer getC_no() {
		return c_no;
	}

	public void setC_no(Integer c_no) {
		this.c_no = c_no;
	} 
	
	public Integer[] getC_orgid() {
		return c_orgid;
	}

	public void setC_orgid(Integer[] c_orgid) {
		this.c_orgid = c_orgid;
	}

	public double[] getC_strv() {
		return c_strv;
	}

	public void setC_strv(double[] c_strv) {
		this.c_strv = c_strv;
	}

	public String getC_system() {
		return c_system;
	}

	public void setC_system(String c_system) {
		this.c_system = c_system;
	}

	public void agentcommission(Commission commission, Staff staff)
		throws SQLException
	{		  
		Connection connection = DB_MS2K.getConnection();
		try {
		StringBuffer sb = null;
		Statement st = connection.createStatement();
		String sql="delete t_agentcommission where c_year="+commission.getC_year()+" and c_month="+commission.getC_month();
		st.executeUpdate(sql);
		for (int i = 0; i < commission.getC_jobnumber().length; i++)
		{
			sb = new StringBuffer(" p_agentcommission  ");  
			sb.append(commission.getC_year()+",");
			sb.append(commission.getC_month()+",");
			sb.append(commission.getC_orgid()[i]+",");
			sb.append("'"+commission.getC_jobnumber()[i]+"',");
			sb.append("'"+commission.getC_str()[i]+"',");
			sb.append(commission.getC_strv()[i]);
			System.out.println(sb.toString());
			st.executeUpdate(sb.toString());
		} 
		connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		} 
	}
}