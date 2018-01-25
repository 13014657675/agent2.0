package com.object;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.publics.DB_MS2K;

public class Rate extends Base {

	private static final long serialVersionUID = 1L;

	private int c_no[];

	private int c_companyid;

	private int c_productid;  

	private String c_type;

	private double c_base;

	private String c_bxqlx;

	private int c_bxq;

	private String c_jfqlx;

	private int c_jfq; 

	private int c_age[];

	private double c_male[];

	private double c_female[];

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;

 
	public double getC_base() {
		return c_base;
	}
	public void setC_base(double c_base) {
		this.c_base = c_base;
	}
	public int getC_bxq() {
		return c_bxq;
	}
	public void setC_bxq(int c_bxq) {
		this.c_bxq = c_bxq;
	}
	public String getC_bxqlx() {
		return c_bxqlx;
	}
	public void setC_bxqlx(String c_bxqlx) {
		this.c_bxqlx = c_bxqlx;
	}
	public int getC_companyid() {
		return c_companyid;
	}
	public void setC_companyid(int c_companyid) {
		this.c_companyid = c_companyid;
	}
	public Date getC_datime() {
		return c_datime;
	}
	public void setC_datime(Date c_datime) {
		this.c_datime = c_datime;
	} 
	public String getC_ip() {
		return c_ip;
	}
	public void setC_ip(String c_ip) {
		this.c_ip = c_ip;
	}	 
	public int getC_jfq() {
		return c_jfq;
	}
	public void setC_jfq(int c_jfq) {
		this.c_jfq = c_jfq;
	}
	public String getC_jfqlx() {
		return c_jfqlx;
	}
	public void setC_jfqlx(String c_jfqlx) {
		this.c_jfqlx = c_jfqlx;
	}
	public String getC_jobnm() {
		return c_jobnm;
	}
	public void setC_jobnm(String c_jobnm) {
		this.c_jobnm = c_jobnm;
	}	 
	public void setC_no(int[] c_no) {
		this.c_no = c_no;
	}	 
	public String getC_operator() {
		return c_operator;
	}
	public void setC_operator(String c_operator) {
		this.c_operator = c_operator;
	}
	public int getC_productid() {
		return c_productid;
	}
	public void setC_productid(int c_productid) {
		this.c_productid = c_productid;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}	
	public int[] getC_age() {
		return c_age;
	}
	public void setC_age(int[] c_age) {
		this.c_age = c_age;
	}
	public double[] getC_female() {
		return c_female;
	}
	public void setC_female(double[] c_female) {
		this.c_female = c_female;
	}
	public double[] getC_male() {
		return c_male;
	}
	public void setC_male(double[] c_male) {
		this.c_male = c_male;
	}	
	public int[] getC_no() {
		return c_no;
	}		 
	/*---------------------------------------------*/
	// 产品费率
	public void add_update_delete(Rate r, Staff s) throws SQLException {

		Connection connection= DB_MS2K.getConnection();
		try
		{ 	Statement st = connection.createStatement(); 
			StringBuffer sb =null;
			for(int i=0;i<r.getC_age().length;i++)
			{ 					
				sb= new StringBuffer(" p_ptrate  ");
				sb.append("" + r.getC_no()[i] + ",");
				sb.append("" + r.getC_companyid() + ",");
				sb.append("" + r.getC_productid() + ",");  
				sb.append("'" + r.getC_type() + "',"); // 
				sb.append("" + r.getC_base() + ",");// 基数
				sb.append("'" + r.getC_bxqlx() + "',"); // 
				sb.append("" + r.getC_bxq() + ",");//
				sb.append("'" + r.getC_jfqlx() + "',"); // 
				sb.append("" + r.getC_jfq() + ",");//			 
				sb.append("" + r.getC_age()[i] + ",");
				sb.append("" + r.getC_male()[i] + ",");
				sb.append("" + r.getC_female()[i] + ",");
				sb.append("'" + r.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_ptrate", sql, s);
			}			
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}			 
	}
}
