package com.object; 
import java.sql.Connection; 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; 
import java.util.ArrayList;
import java.util.Date;  

import org.apache.struts.util.LabelValueBean;

import com.publics.DB_MS2K; 
public class Planbook extends Base {

	private static final long serialVersionUID = 1L;

	private String c_tbrname;

	private String c_bbrname;

	private int c_bbrsex;

	private int c_bbirthy;

	private int c_bbirthm;

	private int c_bbirthd;

	private int c_age;

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;

	/** ************************************* */

	private int c_plan_bookid;

	private int c_companyid;

	private int c_productid[];
	
	private int c_basetype[];

	private double c_base[];

	private int c_bxqtype[];

	private int c_bxq[];

	private int c_jfqtype[];

	private int c_jfq[];

	public int getC_age() {
		return c_age;
	}
	public void setC_age(int c_age) {
		this.c_age = c_age;
	}
	public double[] getC_base() {
		return c_base;
	}

	public void setC_base(double[] c_base) {
		this.c_base = c_base;
	}
	public int getC_bbirthd() {
		return c_bbirthd;
	}
	public void setC_bbirthd(int c_bbirthd) {
		this.c_bbirthd = c_bbirthd;
	}
	public int getC_bbirthm() {
		return c_bbirthm;
	}
	public void setC_bbirthm(int c_bbirthm) {
		this.c_bbirthm = c_bbirthm;
	}
	public int getC_bbirthy() {
		return c_bbirthy;
	}
	public void setC_bbirthy(int c_bbirthy) {
		this.c_bbirthy = c_bbirthy;
	}
	public String getC_bbrname() {
		return c_bbrname;
	}
	public void setC_bbrname(String c_bbrname) {
		this.c_bbrname = c_bbrname;
	}
	public int getC_bbrsex() {
		return c_bbrsex;
	}
	public void setC_bbrsex(int c_bbrsex) {
		this.c_bbrsex = c_bbrsex;
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
	public String getC_jobnm() {
		return c_jobnm;
	}
	public void setC_jobnm(String c_jobnm) {
		this.c_jobnm = c_jobnm;
	}
	public String getC_operator() {
		return c_operator;
	}
	public void setC_operator(String c_operator) {
		this.c_operator = c_operator;
	}
	public int getC_plan_bookid() {
		return c_plan_bookid;
	}
	public void setC_plan_bookid(int c_plan_bookid) {
		this.c_plan_bookid = c_plan_bookid;
	}
	public int[] getC_productid() {
		return c_productid;
	}
	public void setC_productid(int[] c_productid) {
		this.c_productid = c_productid;
	}
	public String getC_tbrname() {
		return c_tbrname;
	}
	public void setC_tbrname(String c_tbrname) {
		this.c_tbrname = c_tbrname;
	}	
	public int[] getC_basetype() {
		return c_basetype;
	}
	public void setC_basetype(int[] c_basetype) {
		this.c_basetype = c_basetype;
	}	
	public int[] getC_bxq() {
		return c_bxq;
	}
	public void setC_bxq(int[] c_bxq) {
		this.c_bxq = c_bxq;
	}
	public int[] getC_bxqtype() {
		return c_bxqtype;
	}
	public void setC_bxqtype(int[] c_bxqtype) {
		this.c_bxqtype = c_bxqtype;
	}
	public int[] getC_jfq() {
		return c_jfq;
	}
	public void setC_jfq(int[] c_jfq) {
		this.c_jfq = c_jfq;
	}
	public int[] getC_jfqtype() {
		return c_jfqtype;
	}
	public void setC_jfqtype(int[] c_jfqtype) {
		this.c_jfqtype = c_jfqtype;
	}
	//	 筛选出产品
	public ArrayList<LabelValueBean> get_product(int c_companyid)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = " select distinct a.c_productid ,b.c_fullname,b.c_code from t_pliability a,t_product b " +
					"	where  a.c_companyid="+c_companyid+" and a.c_productid=b.c_no   ";
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_productid"));
				lab.setLabel(rs.getString("c_fullname").trim()+"（"+rs.getString("c_code").trim()+"）");
				data.add(lab);
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}	
	
	// 计划书过程
	public int plan_book(Planbook planbook, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		int c_plan_bookid=0;
		try {			
			StringBuffer sb = new StringBuffer(" p_plan_book  ");
			sb.append("'" + planbook.getC_tbrname() + "',");
			sb.append("'" + planbook.getC_bbrname() + "',");
			sb.append("" + planbook.getC_bbrsex() + ",");
			sb.append("" + planbook.getC_bbirthy() + ",");
			sb.append("" + planbook.getC_bbirthm() + ",");
			sb.append("" + planbook.getC_bbirthd() + ",");
			sb.append("" + planbook.getC_age() + ",");			
			sb.append("'" + planbook.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			ResultSet rs=st.executeQuery(sql);
			if (rs.next())
			{
				c_plan_bookid=rs.getInt(1);
			} 
			sqlrecord(connection, "p_plan_book", sql, s);
			for(int i=0;i<planbook.getC_productid().length;i++)
			{ 	
				sb = new StringBuffer(" p_plan_books  ");
				sb.append("" + c_plan_bookid + ","); 
				sb.append("" + planbook.getC_companyid() + ","); 
				sb.append("" + planbook.getC_productid()[i] + ","); 
				sb.append("" + planbook.getC_basetype()[i] + ",");
				sb.append("" + planbook.getC_base()[i] + ",");
				sb.append("" + planbook.getC_bxqtype()[i] + ",");
				sb.append("" + planbook.getC_bxq()[i] + ",");
				sb.append("" + planbook.getC_jfqtype()[i] + ",");
				sb.append("" + planbook.getC_jfq()[i] + ",");				 
				sb.append("'" + planbook.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip 
				System.out.println(sb.toString());				
				st.executeUpdate(sb.toString());
				sqlrecord(connection, "p_plan_books", sb.toString(), s);
			}						
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return c_plan_bookid;
	}

}
