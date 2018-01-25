package com.object;
import java.sql.Connection; 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; 
import java.util.ArrayList;
import java.util.Date; 
import org.apache.struts.util.LabelValueBean;
import com.publics.DB_MS2K;
public class Bankoutlets extends Base {

	private static final long serialVersionUID = 1L;
	
	private int c_no;
	
	private int c_outletsid;
	
	private int c_orgtypeid;
	
	private int c_orgid;
	
	private String c_code;
	
	private String c_name;

	private String c_address; 

	private String c_phone;
	
	private String c_bank;
	
	private String c_jobnumber;
	
	private String c_ksrq;
	
	private String c_jsrq;

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;
	
	
	public int getC_orgtypeid() {
		return c_orgtypeid;
	}

	public void setC_orgtypeid(int c_orgtypeid) {
		this.c_orgtypeid = c_orgtypeid;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public String getC_bank() {
		return c_bank;
	}

	public void setC_bank(String c_bank) {
		this.c_bank = c_bank;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
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

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_operator() {
		return c_operator;
	}

	public void setC_operator(String c_operator) {
		this.c_operator = c_operator;
	}

	public int getC_orgid() {
		return c_orgid;
	}

	public void setC_orgid(int c_orgid) {
		this.c_orgid = c_orgid;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
		
	public int getC_outletsid() {
		return c_outletsid;
	}

	public void setC_outletsid(int c_outletsid) {
		this.c_outletsid = c_outletsid;
	}	
	
	public String getC_jobnumber() {
		return c_jobnumber;
	}

	public void setC_jobnumber(String c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	}

	public String getC_jsrq() {
		return c_jsrq;
	}

	public void setC_jsrq(String c_jsrq) {
		this.c_jsrq = c_jsrq;
	}

	public String getC_ksrq() {
		return c_ksrq;
	}

	public void setC_ksrq(String c_ksrq) {
		this.c_ksrq = c_ksrq;
	}

	/*---------------------------------------------*/
	//	 筛选出一个机构的网点
	public ArrayList<LabelValueBean> get_outlets(int c_orgid)
			throws SQLException {
		ArrayList<LabelValueBean> data = null;
		if ("".equals(c_orgid))
			return data;
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select * from  t_bankoutlets where c_orgid="+ c_orgid;
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_no"));
				lab.setLabel(rs.getString("c_name").trim()+"["+rs.getString("c_code").trim()+"]");
				data.add(lab);
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}
	
	//	 银行网点
	public void add_update_delete(Bankoutlets bankoutlets, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {			
			StringBuffer sb = new StringBuffer(" p_bankoutlets  ");
			sb.append("" + bankoutlets.getC_no() + ",");
			sb.append("" + bankoutlets.getC_orgid() + ",");
			sb.append("'" + bankoutlets.getC_bank() + "',"); // 邮编
			sb.append("'" + bankoutlets.getC_code() + "',"); // 全名
			sb.append("'" + bankoutlets.getC_name() + "',"); // 简称
			sb.append("'" + bankoutlets.getC_phone() + "',"); 
			sb.append("'" + bankoutlets.getC_address() + "',");
			sb.append("'" + bankoutlets.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_bankoutlets", sql, s);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 银行网点关联
	public void bankrelate(Bankoutlets bankoutlets, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {			
			StringBuffer sb = new StringBuffer(" p_bankrelate  ");
			sb.append("" + bankoutlets.getC_no() + ",");
			sb.append("" + bankoutlets.getC_orgid() + ",");
			sb.append("" + bankoutlets.getC_outletsid() + ","); // 邮编
			sb.append("'" + bankoutlets.getC_jobnumber() + "',"); // 全名
			sb.append("'" + bankoutlets.getC_ksrq() + "',"); // 简称			 
			sb.append("'" + bankoutlets.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_bankrelate", sql, s);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
}
