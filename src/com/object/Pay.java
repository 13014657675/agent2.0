package com.object;

import java.sql.Connection; 
import java.sql.SQLException;
import java.sql.Statement; 
import java.util.Date; 

import com.publics.DB_MS2K;

public class Pay extends Base {

	private static final long serialVersionUID = 1L;

	private int c_no[];
	
	private int c_pcategory;
	
	private int c_type;
	
	private int c_orgid;
	
	private int c_pclass[];
	
	private int c_pproject[];
	
	private double c_base[];
	
	private int c_year;
	
	private int c_number;
	
	private String c_var; 
	
	private String c_name;
	
	private int c_input;
	
	private int c_period;
	
	private int c_o;
	
	private int c_pcoefficient;
	
	private String c_jobnumber[];
	
	private double c_value[];
	 	
	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip; 

	 

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

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
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

	public int getC_pcategory() {
		return c_pcategory;
	}

	public void setC_pcategory(int c_pcategory) {
		this.c_pcategory = c_pcategory;
	}

	public int getC_type() {
		return c_type;
	}

	public void setC_type(int c_type) {
		this.c_type = c_type;
	}

	public String getC_var() {
		return c_var;
	}

	public void setC_var(String c_var) {
		this.c_var = c_var;
	}	
	
	public double[] getC_base() {
		return c_base;
	}

	public void setC_base(double[] c_base) {
		this.c_base = c_base;
	}

	public int[] getC_pclass() {
		return c_pclass;
	}

	public void setC_pclass(int[] c_pclass) {
		this.c_pclass = c_pclass;
	}

	public int[] getC_pproject() {
		return c_pproject;
	}

	public void setC_pproject(int[] c_pproject) {
		this.c_pproject = c_pproject;
	}

	public int getC_input() {
		return c_input;
	}

	public void setC_input(int c_input) {
		this.c_input = c_input;
	}

	public int getC_period() {
		return c_period;
	}

	public void setC_period(int c_period) {
		this.c_period = c_period;
	}	

	public int getC_pcoefficient() {
		return c_pcoefficient;
	}

	public void setC_pcoefficient(int c_pcoefficient) {
		this.c_pcoefficient = c_pcoefficient;
	}	

	public int getC_number() {
		return c_number;
	}

	public void setC_number(int c_number) {
		this.c_number = c_number;
	}

	public int getC_year() {
		return c_year;
	}

	public void setC_year(int c_year) {
		this.c_year = c_year;
	}		

	public String[] getC_jobnumber() {
		return c_jobnumber;
	}

	public void setC_jobnumber(String[] c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	}	

	public double[] getC_value() {
		return c_value;
	}

	public void setC_value(double[] c_value) {
		this.c_value = c_value;
	}	

	public int getC_orgid() {
		return c_orgid;
	}

	public void setC_orgid(int c_orgid) {
		this.c_orgid = c_orgid;
	}	

	public int getC_o() {
		return c_o;
	}

	public void setC_o(int c_o) {
		this.c_o = c_o;
	}

	/*---------------------------------------------*/
	// 薪酬类别
	public void pcategory(Pay pay, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_pcategory  ");
			sb.append("" + pay.getC_no()[0] + ","); 
			sb.append("'" + pay.getC_name() + "',"); // 名称
			sb.append("'" + pay.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_pcategory", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 薪酬等级
	public void pclass(Pay pay, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_pclass  ");
			sb.append("" + pay.getC_no()[0] + ","); 
			sb.append("" + pay.getC_pcategory() + ","); 
			sb.append("'" + pay.getC_name() + "',"); // 名称
			sb.append("'" + pay.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_pclass", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 薪酬项目
	public void pproject(Pay pay, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_pproject  ");
			sb.append("" + pay.getC_no()[0] + ","); 
			sb.append("" + pay.getC_type() + ","); 
			sb.append("'" + pay.getC_name() + "',"); // 名称
			sb.append("'" + pay.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_pproject", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 薪酬标准
	public void pstandard(Pay pay, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			Statement st = connection.createStatement(); 
			StringBuffer sb =null;
			for(int i=0;i<pay.getC_no().length;i++)
			{ 	
				sb = new StringBuffer(" p_pstandard  ");
				sb.append("" + pay.getC_no()[i] + ","); 
				sb.append("" + pay.getC_pclass()[i] + ","); 
				sb.append("" + pay.getC_pproject()[i] + ","); 
				sb.append("" + pay.getC_base()[i] + ","); // 
				sb.append("'" + pay.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				String sql = sb.toString();
				System.out.println(sql); 
				st.executeUpdate(sql);				
				sqlrecord(connection, "p_pstandard", sql, s);
			}			
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 薪酬社保
	public void psocial(Pay pay, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			Statement st = connection.createStatement(); 
			StringBuffer sb =null;
			for(int i=0;i<pay.getC_no().length;i++)
			{ 	
				sb = new StringBuffer(" p_psocial  ");
				sb.append("" + pay.getC_no()[i] + ",");  
				sb.append("" + pay.getC_orgid() + ","); 
				sb.append("" + pay.getC_pclass()[i] + ","); 
				sb.append("" + pay.getC_pproject()[i] + ","); 
				sb.append("" + pay.getC_base()[i] + ","); // 
				sb.append("'" + pay.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				String sql = sb.toString();
				System.out.println(sql); 
				st.executeUpdate(sql);				
				sqlrecord(connection, "p_psocial", sql, s);
			}			
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 薪酬系数定义
	public void pcoefficient(Pay pay, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_pcoefficient  ");
			sb.append("" + pay.getC_no()[0] + ","); 
			sb.append("" + pay.getC_var().toUpperCase() + ","); 
			sb.append("'" + pay.getC_name() + "',"); // 名称
			sb.append("" + pay.getC_input() + ","); 
			sb.append("" + pay.getC_period() + ","); 
			sb.append("" + pay.getC_o() + ","); 
			sb.append("'" + pay.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_pcoefficient", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 薪酬系数设置
	public void pcoefficientset(Pay pay, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = null;
			Statement st = connection.createStatement();
			for(int i=0;i<pay.getC_jobnumber().length;i++)
			{ 	
				sb = new StringBuffer(" p_pcoefficientset  ");
				sb.append("" + pay.getC_no()[i] + ","); 
				sb.append("" + pay.getC_pcoefficient() + ","); 
				sb.append("" + pay.getC_year() + ","); 
				sb.append("" + pay.getC_number() + ",");
				sb.append("" + pay.getC_orgid() + ",");
				sb.append("'" + pay.getC_jobnumber()[i] + "',"); // 名称
				sb.append("" + pay.getC_value()[i] + ",");
				sb.append("'" + pay.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				String sql = sb.toString();
				System.out.println(sql);				
				st.executeUpdate(sql);
				sqlrecord(connection, "p_pcoefficientset", sql, s);
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
