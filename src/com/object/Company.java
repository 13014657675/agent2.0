package com.object;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; 
import java.util.ArrayList;
import java.util.Date; 
import org.apache.struts.util.LabelValueBean;
import com.publics.DB_MS2K;

public class Company extends Base {

	private static final long serialVersionUID = 1L;

	private int c_no[];

	private int c_type;

	private String c_fullname;

	private String c_name[];

	private int c_tbdl;

	private int c_bdl;

	private String c_addr;

	private String c_zipcode;

	private String c_phone;

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;

	/*-------------------------------------------*/
	
	private int c_convertT;

	private int c_companyid;

	private String c_code[];

	/*-------------------------------------------*/ 
	
	private int c_conceptid;
	
	private int c_jfqx[];

	private double c_dec[]; 
	
	/*-------------------------------------------*/
	
	public String getC_addr() {
		return c_addr;
	}

	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}

	public int getC_bdl() {
		return c_bdl;
	}

	public void setC_bdl(int c_bdl) {
		this.c_bdl = c_bdl;
	}
 
	public int getC_companyid() {
		return c_companyid;
	}

	public void setC_companyid(int c_companyid) {
		this.c_companyid = c_companyid;
	}

	public String getC_fullname() {
		return c_fullname;
	}

	public void setC_fullname(String c_fullname) {
		this.c_fullname = c_fullname;
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
 
	
	public int[] getC_no() {
		return c_no;
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

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public int getC_tbdl() {
		return c_tbdl;
	}

	public void setC_tbdl(int c_tbdl) {
		this.c_tbdl = c_tbdl;
	}

	public int getC_type() {
		return c_type;
	}

	public void setC_type(int c_type) {
		this.c_type = c_type;
	}

	public String getC_zipcode() {
		return c_zipcode;
	}

	public void setC_zipcode(String c_zipcode) {
		this.c_zipcode = c_zipcode;
	}

	public Date getC_datime() {
		return c_datime;
	}

	public void setC_datime(Date c_datime) {
		this.c_datime = c_datime;
	}
	
	public double[] getC_dec() {
		return c_dec;
	}

	public void setC_dec(double[] c_dec) {
		this.c_dec = c_dec;
	} 
		
	public int[] getC_jfqx() {
		return c_jfqx;
	}

	public void setC_jfqx(int[] c_jfqx) {
		this.c_jfqx = c_jfqx;
	}

	public int getC_conceptid() {
		return c_conceptid;
	}

	public void setC_conceptid(int c_conceptid) {
		this.c_conceptid = c_conceptid;
	}

	
	public String[] getC_code() {
		return c_code;
	}

	public void setC_code(String[] c_code) {
		this.c_code = c_code;
	}

	public String[] getC_name() {
		return c_name;
	}

	public void setC_name(String[] c_name) {
		this.c_name = c_name;
	}     
	
	public int getC_convertT() {
		return c_convertT;
	}

	public void setC_convertT(int c_convertt) {
		c_convertT = c_convertt;
	}

	/*---------------------------------------------*/
	// 保险公司
	public void add_update_delete(Company com, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {			
			StringBuffer sb = new StringBuffer(" p_company  ");
			sb.append("" + com.getC_no()[0] + ",");
			sb.append("" + com.getC_type() + ",");
			sb.append("'" + com.getC_fullname() + "',"); // 全名
			sb.append("'" + com.getC_name()[0] + "',"); // 简称
			sb.append("" + com.getC_tbdl() + ",");
			sb.append("" + com.getC_bdl() + ",");
			sb.append("'" + com.getC_addr() + "',"); // 地址
			sb.append("'" + com.getC_zipcode() + "',"); // 邮编
			sb.append("'" + com.getC_phone() + "',"); // 邮编
			sb.append("'" + com.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_company", sql, s);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	// 职业代码
	public void occupation(Company com, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try { 
			Statement st = connection.createStatement(); 
			StringBuffer sb =null;
			for(int i=0;i<com.getC_code().length;i++)
			{ 	
				if (!com.getC_code()[i].equals(""))
				{
					sb = new StringBuffer(" p_occupation  ");
					sb.append("" + com.getC_no()[i] + ",");
					sb.append("" + com.getC_companyid() + ",");
					sb.append("'" +com.getC_code()[i].toUpperCase() + "',"); // 代码
					sb.append("'" + com.getC_name()[i] + "',"); // 名称
					sb.append("'" + com.getC_jobnm() + "',"); // 作业状态
					sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
					sb.append("'" + s.getC_ip() + "'"); // 操作人ip
					String sql = sb.toString();
					System.out.println(sql);			
					st.executeUpdate(sql);
					sqlrecord(connection, "p_occupation", sql, s);
				}
			}
			connection.commit();
		} 
		catch (SQLException e) {
			connection.rollback();
			throw e;
		}
		finally {  
			DB_MS2K.closeConnection(connection);
		}
	}
	// 系数类型
	public void convertT(Company com, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();		
		try { 
			StringBuffer sb = new StringBuffer(" p_convertT  ");
			sb.append("" + com.getC_no()[0] + ",");  
			sb.append("'" + com.getC_name()[0] + "',"); // 简称			 
			sb.append("'" + com.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_convertT", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	// 系数设置
	public void convert(Company com, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();		
		try { 
			Statement st = connection.createStatement(); 
			StringBuffer sb =null;
			for(int i=0;i<com.getC_jfqx().length;i++)
			{ 					
				sb = new StringBuffer(" p_convert  ");
				sb.append("" + com.getC_no()[i] + ",");
				sb.append("" + com.getC_companyid() + ","); 
				sb.append("" + com.getC_convertT() + ",");  
				sb.append("" + com.getC_jfqx()[i] + ",");//	 
				sb.append("" + com.getC_dec()[i] + ","); 
				sb.append("'" + com.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_convert", sql, s);
			}	
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	
	//	 检查出保险公司保单，投保单号码长度
	public Company get_length(int c_companyid) throws SQLException
	{ 
		Company company=new Company();
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			String sql = "select * from t_company where c_no="+c_companyid; 
			System.out.println(sql);
			ResultSet rs= connection.createStatement().executeQuery(sql); 
			if (rs.next())
			{				 
				company.setC_bdl(rs.getInt("c_bdl"));
				company.setC_tbdl(rs.getInt("c_tbdl")); 
			}			 
		} finally {
			DB_MS2K.closeConnection(connection);
		}		
		return company;
	}
	
	//	 根据性质，检查保险公司名称
	public ArrayList<LabelValueBean> get_company(String c_ptnature)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = " select * from t_company where c_type = '" + c_ptnature+"' ";
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_no"));
				lab.setLabel(rs.getString("c_name").trim());
				data.add(lab);
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}

}
