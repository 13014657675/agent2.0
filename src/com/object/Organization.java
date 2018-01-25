package com.object;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import org.apache.struts.util.LabelValueBean;

import com.publics.DB_MS2K;

public class Organization extends Base {

	private static final long serialVersionUID = 1L;

	private int c_no;

	private int c_orgtypeid;

	private int c_orgclassid;

	private String c_name; 
	
	private String c_prefix;

	private String c_path;

	private int c_parent;
	
	private String c_license;
	
	private String c_lbeg;
	
	private String c_lend;

	private String c_permit;
	
	private String c_pbeg;
	
	private String c_pend;

	private String c_tax;
	
	private String c_organization;
	
	private String c_jobnumber;	 
	
	private String c_seal;
	
	private String c_slocation;
	
	private String c_bbank;
	
	private String c_bcard;
	
	private String c_gbank1;
	
	private String c_gcard1;
	
	private String c_gbank2;
	
	private String c_gcard2;

	private String c_phone;
	
	private String c_address;

	private String c_flag;

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String CIp;

	/*---------------------------------------------------*/
	
	private String c_ptnature;
	
	private int c_system;

	private int c_order;
	
	private int c_mark;

	private int c_orgid;

	private int c_deptid;

	private int c_postid;
	
	private int c_type;

	private String c_xitong;

	private String c_menu [];

	/*---------------------------------------------------*/

	public Organization() {
		// TODO Auto-generated constructor stub
	}	

	public String getC_ptnature() {
		return c_ptnature;
	}

	public void setC_ptnature(String c_ptnature) {
		this.c_ptnature = c_ptnature;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public String getC_flag() {
		return c_flag;
	}

	public void setC_flag(String c_flag) {
		this.c_flag = c_flag;
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

	public int getC_orgclassid() {
		return c_orgclassid;
	}

	public void setC_orgclassid(int c_orgclassid) {
		this.c_orgclassid = c_orgclassid;
	}

	public int getC_orgtypeid() {
		return c_orgtypeid;
	}

	public void setC_orgtypeid(int c_orgtypeid) {
		this.c_orgtypeid = c_orgtypeid;
	}

	public int getC_parent() {
		return c_parent;
	}

	public void setC_parent(int c_parent) {
		this.c_parent = c_parent;
	}

	public String getC_path() {
		return c_path;
	}

	public void setC_path(String c_path) {
		this.c_path = c_path;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public Date getC_datime() {
		return c_datime;
	}

	public void setC_datime(Date c_datime) {
		this.c_datime = c_datime;
	}

	public String getCIp() {
		return CIp;
	}

	public void setCIp(String ip) {
		CIp = ip;
	}

	public int getC_order() {
		return c_order;
	}

	public void setC_order(int c_order) {
		this.c_order = c_order;
	}

	public int getC_deptid() {
		return c_deptid;
	}

	public void setC_deptid(int c_deptid) {
		this.c_deptid = c_deptid;
	} 

	public String[] getC_menu() {
		return c_menu;
	}

	public void setC_menu(String[] c_menu) {
		this.c_menu = c_menu;
	}

	public int getC_postid() {
		return c_postid;
	}

	public void setC_postid(int c_postid) {
		this.c_postid = c_postid;
	}

	public String getC_xitong() {
		return c_xitong;
	}

	public void setC_xitong(String c_xitong) {
		this.c_xitong = c_xitong;
	}

	public int getC_orgid() {
		return c_orgid;
	}

	public void setC_orgid(int c_orgid) {
		this.c_orgid = c_orgid;
	}

	public String getC_bbank() {
		return c_bbank;
	}

	public void setC_bbank(String c_bbank) {
		this.c_bbank = c_bbank;
	}

	public String getC_bcard() {
		return c_bcard;
	}

	public void setC_bcard(String c_bcard) {
		this.c_bcard = c_bcard;
	}

	public String getC_gbank1() {
		return c_gbank1;
	}

	public void setC_gbank1(String c_gbank1) {
		this.c_gbank1 = c_gbank1;
	}

	public String getC_gbank2() {
		return c_gbank2;
	}

	public void setC_gbank2(String c_gbank2) {
		this.c_gbank2 = c_gbank2;
	}

	public String getC_gcard1() {
		return c_gcard1;
	}

	public void setC_gcard1(String c_gcard1) {
		this.c_gcard1 = c_gcard1;
	}

	public String getC_gcard2() {
		return c_gcard2;
	}

	public void setC_gcard2(String c_gcard2) {
		this.c_gcard2 = c_gcard2;
	}	

	public String getC_lbeg() {
		return c_lbeg;
	}

	public void setC_lbeg(String c_lbeg) {
		this.c_lbeg = c_lbeg;
	}

	public String getC_lend() {
		return c_lend;
	}

	public void setC_lend(String c_lend) {
		this.c_lend = c_lend;
	}

	public String getC_license() {
		return c_license;
	}

	public void setC_license(String c_license) {
		this.c_license = c_license;
	}

	public String getC_organization() {
		return c_organization;
	}

	public void setC_organization(String c_organization) {
		this.c_organization = c_organization;
	}

	public String getC_pbeg() {
		return c_pbeg;
	}

	public void setC_pbeg(String c_pbeg) {
		this.c_pbeg = c_pbeg;
	}

	public String getC_pend() {
		return c_pend;
	}

	public void setC_pend(String c_pend) {
		this.c_pend = c_pend;
	}

	public String getC_permit() {
		return c_permit;
	}

	public void setC_permit(String c_permit) {
		this.c_permit = c_permit;
	}

	public String getC_seal() {
		return c_seal;
	}

	public void setC_seal(String c_seal) {
		this.c_seal = c_seal;
	}

	public String getC_slocation() {
		return c_slocation;
	}

	public void setC_slocation(String c_slocation) {
		this.c_slocation = c_slocation;
	}

	public String getC_tax() {
		return c_tax;
	}

	public void setC_tax(String c_tax) {
		this.c_tax = c_tax;
	}

	public int getC_mark() {
		return c_mark;
	}

	public void setC_mark(int c_mark) {
		this.c_mark = c_mark;
	}

	public String getC_prefix() {
		return c_prefix;
	}

	public void setC_prefix(String c_prefix) {
		this.c_prefix = c_prefix;
	}

	public int getC_type() {
		return c_type;
	}

	public void setC_type(int c_type) {
		this.c_type = c_type;
	}	

	public String getC_jobnumber() {
		return c_jobnumber;
	}

	public void setC_jobnumber(String c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	}
	
	public int getC_system() {
		return c_system;
	}

	public void setC_system(int c_system) {
		this.c_system = c_system;
	}

	// ---------------------------------------------------------------------------------------------------//
	// 机构类别
	public void orgtype(Organization org, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_orgtype  ");
			sb.append("" + org.getC_no() + ",");
			sb.append("" + org.getC_order() + ",");
			sb.append("" + org.getC_mark() + ",");
			sb.append("'" + org.getC_name() + "',"); // 名称
			sb.append("'" + org.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_orgtype", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	// 机构等级
	public void orgclass(Organization org, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_orgclass  ");
			sb.append("" + org.getC_no() + ",");
			sb.append("'" + org.getC_name() + "',"); // 名称
			sb.append("'" + org.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_orgclass", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	// 机构添加、删除、修改
	public void add_update_delete(Organization org, Staff s)
			throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_organization  ");
			sb.append("" + org.getC_no() + ",");
			sb.append("" + org.getC_orgtypeid() + ",");
			sb.append("" + org.getC_orgclassid() + ",");
			sb.append("'" + org.getC_name() + "',"); // 名称
			sb.append("'" + org.getC_prefix() + "',"); // 代码
			sb.append("" + org.getC_parent() + ",");
			sb.append("" + org.getC_deptid() + ",");
			sb.append("'" + org.getC_license() + "',"); // 执照
			sb.append("'" + org.getC_lbeg() + "',"); // ks
			sb.append("'" + org.getC_lend() + "',"); // js
			sb.append("'" + org.getC_permit() + "',"); 
			sb.append("'" + org.getC_pbeg() + "',"); 
			sb.append("'" + org.getC_pend() + "',"); 
			sb.append("'" + org.getC_tax() + "',"); 
			sb.append("'" + org.getC_organization() + "',"); 
			sb.append("'" + org.getC_jobnumber() + "',");  
			sb.append("'" + org.getC_seal() + "',"); 
			sb.append("'" + org.getC_slocation() + "',"); 
			sb.append("" + org.getC_bbank() + ","); 
			sb.append("'" + org.getC_bcard() + "',"); 
			sb.append("" + org.getC_gbank1() + ","); 
			sb.append("'" + org.getC_gcard1() + "',"); 
			sb.append("" + org.getC_gbank2() + ","); 
			sb.append("'" + org.getC_gcard2() + "',"); 			
			sb.append("'" + org.getC_phone() + "',"); // 电话
			sb.append("'" + org.getC_address() + "',"); // 地址
			sb.append("'" + org.getC_flag() + "',"); // 作业状态
			sb.append("'" + org.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_organization", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 筛选出一个机构的子机构
	public ArrayList<LabelValueBean> get_childorg(int c_parent)
			throws SQLException {
		ArrayList<LabelValueBean> data = null;
		if ("".equals(c_parent))
			return data;
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select * from  t_organization where c_flag='0' and c_parent="+ c_parent;
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
	//	 筛选出一个机构的子机构
	public ArrayList<LabelValueBean> get_childorg2(int c_parent,int c_deptid)
			throws SQLException {
		ArrayList<LabelValueBean> data = null;
		if ("".equals(c_parent))
			return data;
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select * from  t_organization where c_flag='0' and c_parent="+ c_parent+" and c_deptid="+c_deptid;
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
	// 筛选出属于同一个级别的机构（只实用于查询，省类型的机构）
	public ArrayList<LabelValueBean> get_typeorg(int c_orgtypeid)
			throws SQLException {
		ArrayList<LabelValueBean> data = null;
		if ("".equals(c_orgtypeid))
			return data;
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select a.c_no, a.c_name c_namea ,b.c_name c_nameb,c.c_name c_namec from  t_organization a ,t_organization b ,t_organization c "  
					 +"where a.c_parent=b.c_no and b.c_parent=c.c_no and a.c_flag='0' and a.c_orgtypeid="+c_orgtypeid+" order by a.c_path";
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_no"));
				lab.setLabel(rs.getString("c_namea").trim()+"-->"+rs.getString("c_nameb").trim()+"-->"+rs.getString("c_namec").trim());
				data.add(lab);
			}
		}  finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}
	// 筛选出拥有相同前缀的机构
	public ArrayList<LabelValueBean> get_prefixorg(String c_prefix)
			throws SQLException {
		ArrayList<LabelValueBean> data = null;
		if ("".equals(c_prefix))
			return data;
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select * from  t_organization where c_flag='0' and c_path like '"
					+ c_prefix + "%' ";
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_no"));
				lab.setLabel(rs.getString("c_name").trim());
				data.add(lab);
			}
		}  finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}
	// 筛选出属于同一个级别且拥有相同前缀的的机构
	public ArrayList<LabelValueBean> get_org(int c_orgtypeid, String c_prefix)
			throws SQLException {
		ArrayList<LabelValueBean> data = null;
		if ("".equals(c_orgtypeid))
			return data;
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select * from  t_organization where c_flag='0' and c_path like '"
					+ c_prefix + "%' " + "and c_orgtypeid=" + c_orgtypeid;
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_no"));
				lab.setLabel(rs.getString("c_name").trim());
				data.add(lab);
			}
		}  finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}
	// 部门添加、删除、修改
	public void dept(Organization org, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_dept  ");
			sb.append("" + org.getC_no() + ",");
			sb.append("" + org.getC_orgid() + ",");
			sb.append("'" + org.getC_name() + "',"); // 名称
			sb.append("" + org.getC_ptnature() + ",");		
			sb.append("" + org.getC_system() + ",");		
			sb.append("'" + org.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_dept", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 筛选出指定类型的政策体系
	public ArrayList<LabelValueBean> get_childsystem(int c_ptnature) throws SQLException
	{ 
		ArrayList<LabelValueBean> data=null;
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			String sql = "select * from t_policy where c_ptnature="+c_ptnature;	
			ResultSet rs= connection.createStatement().executeQuery(sql);
			LabelValueBean lab;  
			data = new ArrayList<LabelValueBean>();		
 
			while (rs.next())
			{				
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_system"));
				lab.setLabel(rs.getString("c_name").trim());
				data.add(lab);
			}			 
		} finally {
			DB_MS2K.closeConnection(connection);
		}		
		return data;
	}
	//	 筛选出一个机构的所有部门
	public ArrayList<LabelValueBean> get_childdept(int c_orgid) throws SQLException
	{ 
		ArrayList<LabelValueBean> data=null;
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			String sql = "select * from  t_dept where c_orgid="+c_orgid+" order by c_no";	
			ResultSet rs= connection.createStatement().executeQuery(sql);
			LabelValueBean lab;  
			data = new ArrayList<LabelValueBean>();
			while (rs.next())
			{				
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
	//	 筛选出一个机构的所有事业部
	public ArrayList<LabelValueBean> get_childdept_alltype(int c_orgid) throws SQLException
	{ 
		ArrayList<LabelValueBean> data=null;
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			String sql = "select * from  t_dept where c_orgid="+c_orgid+" and c_ptnature>0 order by c_no";	
			ResultSet rs= connection.createStatement().executeQuery(sql);
			LabelValueBean lab;  
			data = new ArrayList<LabelValueBean>();		
//			lab = new LabelValueBean();
//			lab.setValue("0");
//			lab.setLabel("不关联事业部");
//			data.add(lab);
			while (rs.next())
			{				
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
	//	 筛选出一个机构的指定类型的事业部
	public ArrayList<LabelValueBean> get_childdept_type(int c_orgid,int c_ptnature) throws SQLException
	{ 
		ArrayList<LabelValueBean> data=null;
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			String sql = "select * from  t_dept where c_orgid="+c_orgid+" and c_ptnature="+c_ptnature+" order by c_no";	
			ResultSet rs= connection.createStatement().executeQuery(sql);
			LabelValueBean lab;  
			data = new ArrayList<LabelValueBean>();		
//			lab = new LabelValueBean();
//			lab.setValue("0");
//			lab.setLabel("不关联事业部");
//			data.add(lab);
			while (rs.next())
			{				
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
	//	 筛选出一个机构的指定类型的事业部
	public ArrayList<LabelValueBean> get_childdept_typesystem(int c_orgid,int c_ptnature,int c_system) throws SQLException
	{ 
		ArrayList<LabelValueBean> data=null;
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			String sql = "select * from  t_dept where c_orgid="+c_orgid+" and c_ptnature="+c_ptnature+" and c_system="+c_system+" order by c_no";	
			ResultSet rs= connection.createStatement().executeQuery(sql);
			LabelValueBean lab;  
			data = new ArrayList<LabelValueBean>();		
//			lab = new LabelValueBean();
//			lab.setValue("0");
//			lab.setLabel("不关联事业部");
//			data.add(lab);
			while (rs.next())
			{				
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
	// 岗位添加、删除、修改
	public void post(Organization org, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_post  ");
			sb.append("" + org.getC_no() + ",");
			sb.append("" + org.getC_orgid() + ",");
			sb.append("" + org.getC_deptid() + ",");
			sb.append("" + org.getC_type() + ",");
			sb.append("'" + org.getC_name() + "',"); // 名称
			sb.append("'" + org.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_post", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
//	 岗位添加、删除、修改
	public void sethead(Organization org, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_sethead  "); 
			sb.append("" + org.getC_orgid() + ",");
			sb.append("" + org.getC_deptid() + ",");
			sb.append("" + org.getC_postid() + ","); 
			sb.append("'" + org.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_sethead", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 筛选出一个机构的岗位
	public ArrayList<LabelValueBean> get_childpost(int c_deptid) throws SQLException
	{ 
		ArrayList<LabelValueBean> data=null;
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			String sql = "select * from  t_post where c_deptid="+c_deptid+" order by c_no";	
			ResultSet rs= connection.createStatement().executeQuery(sql);
			LabelValueBean lab;  
			data = new ArrayList<LabelValueBean>();
			while (rs.next())
			{				
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
	// 岗位权限
	public void postqx(Organization org, Staff s) throws SQLException {
		String ms="";
		for (String m : org.getC_menu())
		{
			 ms+=m+",";	
		}
		Connection connection = DB_MS2K.getConnection(); 
		try {							
			StringBuffer sb= new StringBuffer(" p_postqx  ");
			sb.append("" + org.getC_postid() + ",");
			sb.append("'" + org.getC_xitong() + "',");
			sb.append("'" + ms + "',"); // 菜单 
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);	
			Statement st = connection.createStatement();
			st.executeUpdate(sql);		
			sqlrecord(connection, "p_postqx", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
}