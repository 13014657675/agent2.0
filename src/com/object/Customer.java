package com.object;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; 
import java.util.Date; 

import com.publics.DB_MS2K;
  
public class Customer extends Base {

	private static final long serialVersionUID = 1L;
	private int c_no;
	private String c_name;
	private String c_nation;
	private int c_sex;
	private int c_birthy;
	private int c_birthm;
	private int c_birthd;
	private int c_marriage;
	private String c_cardtype;
	private String c_cardnum;
	private String c_cardperiod;
	private String c_education;
	private String c_email;
	private String c_phone;
	private String c_mobile;
	private String c_company;
	private String c_post;
	private String c_postcode;
	private String c_hddr;
	private String c_hzip;
	private String c_cddr;
	private String c_czip;
	private String c_jobnm;
	private String c_operator;
	private Date c_datime;
	private String c_ip;
	
	public int getC_birthd() {
		return c_birthd;
	}
	public void setC_birthd(int c_birthd) {
		this.c_birthd = c_birthd;
	}
	public int getC_birthm() {
		return c_birthm;
	}
	public void setC_birthm(int c_birthm) {
		this.c_birthm = c_birthm;
	}
	public int getC_birthy() {
		return c_birthy;
	}
	public void setC_birthy(int c_birthy) {
		this.c_birthy = c_birthy;
	}
	public String getC_cardnum() {
		return c_cardnum;
	}
	public void setC_cardnum(String c_cardnum) {
		this.c_cardnum = c_cardnum;
	}
	public String getC_cardperiod() {
		return c_cardperiod;
	}
	public void setC_cardperiod(String c_cardperiod) {
		this.c_cardperiod = c_cardperiod;
	}
	public String getC_cardtype() {
		return c_cardtype;
	}
	public void setC_cardtype(String c_cardtype) {
		this.c_cardtype = c_cardtype;
	}
	public String getC_cddr() {
		return c_cddr;
	}
	public void setC_cddr(String c_cddr) {
		this.c_cddr = c_cddr;
	}
	public String getC_company() {
		return c_company;
	}
	public void setC_company(String c_company) {
		this.c_company = c_company;
	}
	public String getC_czip() {
		return c_czip;
	}
	public void setC_czip(String c_czip) {
		this.c_czip = c_czip;
	}
	public Date getC_datime() {
		return c_datime;
	}
	public void setC_datime(Date c_datime) {
		this.c_datime = c_datime;
	}
	public String getC_education() {
		return c_education;
	}
	public void setC_education(String c_education) {
		this.c_education = c_education;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_hddr() {
		return c_hddr;
	}
	public void setC_hddr(String c_hddr) {
		this.c_hddr = c_hddr;
	}
	public String getC_hzip() {
		return c_hzip;
	}
	public void setC_hzip(String c_hzip) {
		this.c_hzip = c_hzip;
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
	public int getC_marriage() {
		return c_marriage;
	}
	public void setC_marriage(int c_marriage) {
		this.c_marriage = c_marriage;
	}
	public String getC_mobile() {
		return c_mobile;
	}
	public void setC_mobile(String c_mobile) {
		this.c_mobile = c_mobile;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_nation() {
		return c_nation;
	}
	public void setC_nation(String c_nation) {
		this.c_nation = c_nation;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_operator() {
		return c_operator;
	}
	public void setC_operator(String c_operator) {
		this.c_operator = c_operator;
	}
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_post() {
		return c_post;
	}
	public void setC_post(String c_post) {
		this.c_post = c_post;
	}
	public String getC_postcode() {
		return c_postcode;
	}
	public void setC_postcode(String c_postcode) {
		this.c_postcode = c_postcode;
	}
	public int getC_sex() {
		return c_sex;
	}
	public void setC_sex(int c_sex) {
		this.c_sex = c_sex;
	}
	
	//	 客户添加，修改
	public void add_update(Customer c, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_customer ");
			sb.append("" + c.getC_no() + ",");// //71员工id  
			sb.append("'" +c.getC_name()+ "',");// //72操作电脑的IP地址
			sb.append("'" +c.getC_nation()+ "',");// //72操作电脑的IP地址 
			sb.append("" + c.getC_sex() + ",");// // 
			sb.append("" + c.getC_birthy() + ",");// // 
			sb.append("" + c.getC_birthm() + ",");// // 
			sb.append("" + c.getC_birthd() + ",");// // 
			sb.append("" + c.getC_marriage() + ",");// // 
			sb.append("'" +c.getC_cardtype()+ "',");// //72操作电脑的IP地址 
			sb.append("'" +c.getC_cardnum()+ "',");// //72操作电脑的IP地址 
			sb.append("'" +c.getC_cardperiod()+ "',");// //
			sb.append("'" +c.getC_education()+ "',");// //
			sb.append("'" +c.getC_email()+ "',");// //
			sb.append("'" +c.getC_phone()+ "',");// //
			sb.append("'" +c.getC_mobile()+ "',");// //
			sb.append("'" +c.getC_company()+ "',");// //
			sb.append("'" +c.getC_post()+ "',");// //
			sb.append("'" +c.getC_postcode()+ "',");// //
			sb.append("'" +c.getC_hddr()+ "',");// //
			sb.append("'" +c.getC_hzip()+ "',");// //
			sb.append("'" +c.getC_cddr()+ "',");// //
			sb.append("'" +c.getC_czip()+ "',");// //
			sb.append("'" +c.getC_jobnm()+ "',");// //72操作电脑的IP地址
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 
			System.out.println(sb.toString());
			Statement st = connection.createStatement();
			st.execute(sb.toString());
			sqlrecord(connection, "p_customer", sb.toString(), op);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}	 
	
	//	 筛选出客户信息
	public Customer get_customer(String c_cardtype,String c_cardnum)
			throws SQLException {
		Customer customer = new Customer(); 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = " select * from t_customer where c_cardtype = '"+c_cardtype.trim()+"' and c_cardnum= '"+c_cardnum.trim()+"' ";
			System.out.println(sql);
			ResultSet rs = connection.createStatement().executeQuery(sql); 
			if (rs.next()) { 
				customer.setC_no(rs.getInt("c_no"));
				customer.setC_name(rs.getString("c_name"));
				customer.setC_nation(rs.getString("c_nation"));
				customer.setC_sex(rs.getInt("c_sex"));
				customer.setC_birthy(rs.getInt("c_birthy"));
				customer.setC_birthm(rs.getInt("c_birthm"));
				customer.setC_birthd(rs.getInt("c_birthd"));
				customer.setC_marriage(rs.getInt("c_marriage"));
				customer.setC_cardtype(rs.getString("c_cardtype").trim());
				customer.setC_cardnum(rs.getString("c_cardnum").trim());
				customer.setC_cardperiod(rs.getString("c_cardperiod"));
				customer.setC_education(rs.getString("c_education"));
				customer.setC_email(rs.getString("c_email"));
				customer.setC_phone(rs.getString("c_phone"));
				customer.setC_mobile(rs.getString("c_mobile"));
				customer.setC_company(rs.getString("c_company"));
				customer.setC_post(rs.getString("c_post"));
				customer.setC_postcode(rs.getString("c_postcode"));
				customer.setC_hddr(rs.getString("c_hddr"));
				customer.setC_hzip(rs.getString("c_hzip"));
				customer.setC_cddr(rs.getString("c_cddr"));
				customer.setC_czip(rs.getString("c_czip"));
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return customer;
	}
	
	
}
