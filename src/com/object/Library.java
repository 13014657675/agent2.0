package com.object;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import org.apache.struts.util.LabelValueBean;

import com.publics.DB_MS2K;
public class Library extends Base {

	private static final long serialVersionUID = 1L;

	private Integer c_no; 
	
	private Integer c_orgid;
	
	private Integer c_libraryid; 
	
	private Integer c_goodstypeid;

	private String c_name;  	 
	
	private String c_factory;
	
	private String c_address;
	
	private Integer c_number; 

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;
	
	public Library() {
		// TODO Auto-generated constructor stub
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public Date getC_datime() {
		return c_datime;
	}

	public void setC_datime(Date c_datime) {
		this.c_datime = c_datime;
	}

	public String getC_factory() {
		return c_factory;
	}

	public void setC_factory(String c_factory) {
		this.c_factory = c_factory;
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

	public Integer getC_libraryid() {
		return c_libraryid;
	}

	public void setC_libraryid(Integer c_libraryid) {
		this.c_libraryid = c_libraryid;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public Integer getC_no() {
		return c_no;
	}

	public void setC_no(Integer c_no) {
		this.c_no = c_no;
	}

	public Integer getC_number() {
		return c_number;
	}

	public void setC_number(Integer c_number) {
		this.c_number = c_number;
	} 

	public String getC_operator() {
		return c_operator;
	}

	public void setC_operator(String c_operator) {
		this.c_operator = c_operator;
	}

	public Integer getC_orgid() {
		return c_orgid;
	}

	public void setC_orgid(Integer c_orgid) {
		this.c_orgid = c_orgid;
	} 	

	public Integer getC_goodstypeid() {
		return c_goodstypeid;
	}

	public void setC_goodstypeid(Integer c_goodstypeid) {
		this.c_goodstypeid = c_goodstypeid;
	}
	
	/*---------------------------------------------*/ 	

	//	 物品分类
	public void goodstype(Library library, Staff s) throws SQLException {
	 	Connection connection = DB_MS2K.getConnection(); 
		try {			 	 
			StringBuffer sb = new StringBuffer(" p_goodstype  ");
			sb.append("" + library.getC_no() + ","); 
			sb.append("" + library.getC_libraryid() + ",");  
			sb.append("'" + library.getC_name()+ "',"); // 类型  			
			sb.append("'" + library.getC_jobnm() + "',"); // 类型		 
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			System.out.println(sb.toString());
			Statement st = connection.createStatement();		
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_goodstype", sb.toString(), s);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback(); 
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}		
	//	 物品定义
	public void goods(Library library, Staff s) throws SQLException {
	 	Connection connection = DB_MS2K.getConnection(); 
		try {			 	 
			StringBuffer sb = new StringBuffer(" p_goods  ");
			sb.append("" + library.getC_no() + ",");
			sb.append("" + library.getC_orgid() + ",");
			sb.append("" + library.getC_libraryid() + ",");  
			sb.append("" + library.getC_goodstypeid() + ",");  
			sb.append("'" + library.getC_name()+ "',"); // 类型 
			sb.append("'" + library.getC_factory() + "',"); // 类型	
			sb.append("'" + library.getC_address() + "',"); // 类型				
			sb.append("'" + library.getC_jobnm() + "',"); // 类型		 
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			System.out.println(sb.toString());
			Statement st = connection.createStatement();		
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_goods", sb.toString(), s);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback(); 
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 筛选出物品分类名-入库
	public ArrayList<LabelValueBean> get_goodstype(int c_libraryid)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select * from t_goodstype where c_libraryid="+c_libraryid+" order by c_name";
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
	//	 筛选出物品名-入库
	public ArrayList<LabelValueBean> get_goods_in(int c_orgid,int c_goodstypeid)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select * from t_goods where c_orgid="+c_orgid+" and c_goodstypeid="+c_goodstypeid+" order by c_name";
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
	//	 筛选出物品名-出库
	public ArrayList<LabelValueBean> get_goods_out(int c_orgid,int c_goodstypeid)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select * from t_goods where c_goodstypeid=" +c_goodstypeid+
				" and c_no in (select c_goodsid from t_goodsstate where c_orgid="+c_orgid+" and c_jobnm in ('rk2','dj','hk')  and c_flag='0')";
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
	//	 筛选出物品库存
	public int get_goodsstock(int c_orgid,int c_goodsid)
			throws SQLException {
		int c=0; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select count(*) from t_goodsstate where c_orgid="+c_orgid+" and c_goodsid="+c_goodsid+" and c_jobnm in ('rk2','dj','hk') and c_flag='0' ";
			ResultSet rs = connection.createStatement().executeQuery(sql); 
			while (rs.next()) { 
				c =rs.getInt(1); 
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return c;
	}
	
}
