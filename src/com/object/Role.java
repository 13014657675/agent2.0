package com.object;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.publics.DB_MS2K;
public class Role extends Base {

	private static final long serialVersionUID = 1L;

	private Integer c_no;

	private Integer c_sys;

	private String c_jobnumber;

	private int c_role;
	
	private int c_orgid[];
	
	private int c_deptid[];

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;

	/*-------------------------------------------*/

	private Double c_money;

	/*-------------------------------------------*/

	public Role() {
		// TODO Auto-generated constructor stub
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

	public Integer getC_no() {
		return c_no;
	}

	public void setC_no(Integer c_no) {
		this.c_no = c_no;
	}

	public String getC_operator() {
		return c_operator;
	}

	public void setC_operator(String c_operator) {
		this.c_operator = c_operator;
	}

	public int getC_role() {
		return c_role;
	}

	public void setC_role(int c_role) {
		this.c_role = c_role;
	}

	public String getC_jobnumber() {
		return c_jobnumber;
	}

	public void setC_jobnumber(String c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	}

	public Integer getC_sys() {
		return c_sys;
	}

	public void setC_sys(Integer c_sys) {
		this.c_sys = c_sys;
	}

	public Double getC_money() {
		return c_money;
	}

	public void setC_money(Double c_money) {
		this.c_money = c_money;
	}	

	public int[] getC_deptid() {
		return c_deptid;
	}

	public void setC_deptid(int[] c_deptid) {
		this.c_deptid = c_deptid;
	}

	public int[] getC_orgid() {
		return c_orgid;
	}

	public void setC_orgid(int[] c_orgid) {
		this.c_orgid = c_orgid;
	}

	// ---------------------------------------------------------------------------------------------------//
	public void add_update_delete(Role role, Staff staff) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_role  ");
			sb.append("" + role.getC_no() + ",");
			sb.append("" + role.getC_sys() + ","); // 类型
			sb.append("'" + role.getC_jobnumber() + "',"); // 类型
			sb.append("" + role.getC_role() + ","); // 作业状态
			sb.append("'" + role.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_role", sql, staff);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}	
	public void roleset(Role role, Staff staff) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		StringBuffer sb=null;
		Statement st=null;
		try {
			String sql="delete t_roleset where c_jobnumber='"+role.getC_jobnumber()+"' ";
			st = connection.createStatement();
			st.executeUpdate(sql);	
		    for (int i=0;i<role.getC_orgid().length;i++)
		    {
		    	sb = new StringBuffer(" p_roleset  ");
				sb.append("" + role.getC_no() + ",");
				sb.append("" + role.getC_sys() + ","); // 类型
				sb.append("'"+ role.getC_jobnumber() + "',"); // 类型
				sb.append("" + role.getC_orgid()[i] + ","); // 作业状态
				sb.append("" + role.getC_deptid()[i] + ","); // 作业状态
				sb.append("'" + role.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
				sql = sb.toString();
				System.out.println(sql);
				st = connection.createStatement();
				st.executeUpdate(sql);		    	
				sqlrecord(connection, "p_roleset", sql, staff);
		    }			
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}		
	public void grant(Role role, Staff staff)
			throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_grant  ");
			sb.append("" + role.getC_no() + ",");
			sb.append("" + role.getC_sys() + ","); // 类型
			sb.append("" + role.getC_jobnumber() + ","); // 类型
			sb.append("" +  role.getC_money() + ","); // 作业状态
			sb.append("'" + role.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_grant", sql, staff);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
}