package com.object;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.publics.DB_MS2K;
public class Sprocess extends Base {

	private static final long serialVersionUID = 1L;

	private Integer c_no;

	private Integer c_sys;

	private Integer c_sid;

	private Integer c_return;

	private String c_note;

	private String c_send;

	private String c_receive;

	private String c_flag;

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;
	
	/*---------------------------------------------------*/
	
	private int c_orgid;
	
	private int c_to;
	
	private int c_orgid2;

	private int c_deptid2;
	
	private String c_jobnumber2; // 工号;
	
	/*---------------------------------------------------*/
	
	public Date getC_datime() {
		return c_datime;
	}

	public void setC_datime(Date c_datime) {
		this.c_datime = c_datime;
	}

	public String getC_flag() {
		return c_flag;
	}

	public void setC_flag(String c_flag) {
		this.c_flag = c_flag;
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

	public String getC_note() {
		return c_note;
	}

	public void setC_note(String c_note) {
		this.c_note = c_note;
	}

	public String getC_operator() {
		return c_operator;
	}

	public void setC_operator(String c_operator) {
		this.c_operator = c_operator;
	}

	public String getC_receive() {
		return c_receive;
	}

	public void setC_receive(String c_receive) {
		this.c_receive = c_receive;
	}

	public Integer getC_return() {
		return c_return;
	}

	public void setC_return(Integer c_return) {
		this.c_return = c_return;
	}

	public String getC_send() {
		return c_send;
	}

	public void setC_send(String c_send) {
		this.c_send = c_send;
	}

	public Integer getC_sid() {
		return c_sid;
	}

	public void setC_sid(Integer c_sid) {
		this.c_sid = c_sid;
	}

	public Integer getC_sys() {
		return c_sys;
	}

	public void setC_sys(Integer c_sys) {
		this.c_sys = c_sys;
	}	

	public int getC_deptid2() {
		return c_deptid2;
	}

	public void setC_deptid2(int c_deptid2) {
		this.c_deptid2 = c_deptid2;
	}

	public String getC_jobnumber2() {
		return c_jobnumber2;
	}

	public void setC_jobnumber2(String c_jobnumber2) {
		this.c_jobnumber2 = c_jobnumber2;
	}

	public int getC_orgid() {
		return c_orgid;
	}

	public void setC_orgid(int c_orgid) {
		this.c_orgid = c_orgid;
	}

	public int getC_orgid2() {
		return c_orgid2;
	}

	public void setC_orgid2(int c_orgid2) {
		this.c_orgid2 = c_orgid2;
	}

	public int getC_to() {
		return c_to;
	}

	public void setC_to(int c_to) {
		this.c_to = c_to;
	}

	public void filesigned_return(Sprocess sprocess, File file, Staff staff) throws IOException,SQLException {
	 	Connection connection = DB_MS2K.getConnection(); 
		try {		
			Statement st = connection.createStatement();
			st.executeUpdate("delete t_fileJT where c_fileid ="+file.getC_fileid());
			StringBuffer sb = new StringBuffer("");
			for (int i = 0; i < file.getC_postid().length ; i++) {
				sb = new StringBuffer(" p_fileJT ");
				sb.append("" + file.getC_fileid() + ",");
				sb.append("" + file.getC_postid()[i] + ","); // 类型
				sb.append("'" + file.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人
				sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
				System.out.println(sb.toString());				
				st.executeUpdate(sb.toString());
				sqlrecord(connection, "p_fileJT", sb.toString(), staff);
			}
			st.executeBatch();			 
			sb = new StringBuffer(" p_sprocess  null,");
			sb.append("" + sprocess.getC_sys() + ",");
			sb.append("" + sprocess.getC_sid() + ",");
			sb.append("" + sprocess.getC_return()+ ",");
			sb.append("'" + sprocess.getC_note()+ "',"); // 类型
			sb.append("'" + sprocess.getC_send() + "',"); // 类型
			sb.append("'" + sprocess.getC_receive() + "',"); // 类型
			sb.append("'" + sprocess.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
			System.out.println(sb.toString());
			// st = connection.createStatement();
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_sprocess", sb.toString(), staff);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback(); 
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}

	public void signed_return(Sprocess sprocess , Staff staff) throws SQLException {
	 	Connection connection = DB_MS2K.getConnection(); 
	 	StringBuffer sb=null;
	 	Statement st=null;
		try {
			if (sprocess.getC_to()!=0) {
				sb = new StringBuffer(" p_orgsigned  null,");
				sb.append("" + sprocess.getC_sys() + ",");
				sb.append("" + sprocess.getC_sid() + ",");
				sb.append("" + sprocess.getC_orgid() + ",");
				sb.append("" + sprocess.getC_to() + ",");
				sb.append("" + sprocess.getC_orgid2() + ",");
				sb.append("" + sprocess.getC_deptid2() + ",");
				sb.append("'" + sprocess.getC_jobnumber2() + "',");
				sb.append("'add',"); // 操作人id
				sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
				System.out.println(sb.toString());
				st = connection.createStatement();
				st.executeUpdate(sb.toString());
				sqlrecord(connection, "p_orgsigned", sb.toString(), staff);
			}
			sb = new StringBuffer(" p_sprocess  null,");
			sb.append("" + sprocess.getC_sys() + ",");
			sb.append("" + sprocess.getC_sid() + ",");
			sb.append("" + sprocess.getC_return()+ ",");
			sb.append("'" + sprocess.getC_note()+ "',"); // 类型
			sb.append("'" + sprocess.getC_send() + "',"); // 类型
			sb.append("'" + sprocess.getC_receive() + "',"); // 类型
			sb.append("'" + sprocess.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
			System.out.println(sb.toString());
			st = connection.createStatement();		
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_sprocess", sb.toString(), staff);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback(); 
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	
}