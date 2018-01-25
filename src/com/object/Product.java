package com.object;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import org.apache.struts.util.LabelValueBean;

import com.publics.DB_MS2K;

public class Product extends Base {

	private static final long serialVersionUID = 1L;

	private int c_no[];
	
	private int c_orgid;

	private int c_companyid;
	
	private int c_productid;  
	
	private int c_pttypeid;
	
	private String c_bd[];

	private String c_code;

	private String c_fullname;

	private String c_name;
	
	private int c_type; 
	
	private String c_ksrq;
	
	private String c_ffrq;

	private String c_flag;

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;

	/*-------------------------------------------*/

	private String c_ptnature;

	private int c_ptclassid;
	
	/*-------------------------------------------*/	
	
	private int c_convertT;
	
	private int c_system;
	
	private int c_exptypeid;
	
	private int c_jfqx[];
	
	private int c_bdnd;

	private double c_dec[]; 
		
	private double c_dec_in[]; 
	
	private double c_dec_out[]; 
	
	/*-------------------------------------------*/	
	
	private String c_pcode[];
	
	private String c_pfullname[];
	
	private String c_pname[];
	
	private String c_pdesc[];
	
	private int c_ptype[];	 
	
	/*-------------------------------------------*/	  
	
	private String c_name_temp[];
	
	private int c_pliabilitycid;
	
	private int c_bxqtype[];
	
	private int c_bxq[];
	
	private int c_jfqtype[];   	
	
	private int c_jfq[];
	
	private int c_t[];
	
	private int c_v[];	 
	
	/*-------------------------------------------*/	   
	
	private int c_condition[];
	
	private int c_cv2t[];
	
	private int c_cv2[]; 
	
	private int c_cv31t[];
	
	private int c_cv31[]; 
	
	private int c_cv32t[];
	
	private int c_cv32[]; 
	
	private int c_result[];
	
	private double c_rv[];   	
			
	public String getC_ffrq() {
		return c_ffrq;
	}
	public void setC_ffrq(String c_ffrq) {
		this.c_ffrq = c_ffrq;
	}
	public String[] getC_bd() {
		return c_bd;
	}
	public void setC_bd(String[] c_bd) {
		this.c_bd = c_bd;
	}
	public int getC_orgid() {
		return c_orgid;
	}
	public void setC_orgid(int c_orgid) {
		this.c_orgid = c_orgid;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
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
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	} 	
	public int getC_type() {
		return c_type;
	}
	public void setC_type(int c_type) {
		this.c_type = c_type;
	}
	public String getC_operator() {
		return c_operator;
	}
	public void setC_operator(String c_operator) {
		this.c_operator = c_operator;
	}
	public int getC_ptclassid() {
		return c_ptclassid;
	}
	public void setC_ptclassid(int c_ptclassid) {
		this.c_ptclassid = c_ptclassid;
	}
	public String getC_ptnature() {
		return c_ptnature;
	}
	public void setC_ptnature(String c_ptnature) {
		this.c_ptnature = c_ptnature;
	}
	public int getC_pttypeid() {
		return c_pttypeid;
	}
	public void setC_pttypeid(int c_pttypeid) {
		this.c_pttypeid = c_pttypeid;
	} 	
	public double[] getC_dec() {
		return c_dec;
	}
	public void setC_dec(double[] c_dec) {
		this.c_dec = c_dec;
	} 
	public int[] getC_jfq() {
		return c_jfq;
	}	 
	public void setC_jfq(int[] c_jfq) {
		this.c_jfq = c_jfq;
	}
	public int[] getC_no() {
		return c_no;
	}
	public void setC_no(int[] c_no) {
		this.c_no = c_no;
	}	
	public int getC_productid() {
		return c_productid;
	}
	public void setC_productid(int c_productid) {
		this.c_productid = c_productid;
	}	 
	public String getC_fullname() {
		return c_fullname;
	}
	public void setC_fullname(String c_fullname) {
		this.c_fullname = c_fullname;
	}	
	public int getC_convertT() {
		return c_convertT;
	}
	public void setC_convertT(int c_convertt) {
		c_convertT = c_convertt;
	}	
	public String[] getC_pcode() {
		return c_pcode;
	}
	public void setC_pcode(String[] c_pcode) {
		this.c_pcode = c_pcode;
	}
	public String[] getC_pfullname() {
		return c_pfullname;
	}
	public void setC_pfullname(String[] c_pfullname) {
		this.c_pfullname = c_pfullname;
	}
	public String[] getC_pname() {
		return c_pname;
	}
	public void setC_pname(String[] c_pname) {
		this.c_pname = c_pname;
	}
	public int[] getC_ptype() {
		return c_ptype;
	}
	public void setC_ptype(int[] c_ptype) {
		this.c_ptype = c_ptype;
	}		
	public String[] getC_pdesc() {
		return c_pdesc;
	}
	public void setC_pdesc(String[] c_pdesc) {
		this.c_pdesc = c_pdesc;
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
	public int[] getC_jfqtype() {
		return c_jfqtype;
	}
	public void setC_jfqtype(int[] c_jfqtype) {
		this.c_jfqtype = c_jfqtype;
	}
	public String[] getC_name_temp() {
		return c_name_temp;
	}
	public void setC_name_temp(String[] c_name_temp) {
		this.c_name_temp = c_name_temp;
	}
	public int[] getC_t() {
		return c_t;
	}
	public void setC_t(int[] c_t) {
		this.c_t = c_t;
	}
	public int[] getC_v() {
		return c_v;
	}
	public void setC_v(int[] c_v) {
		this.c_v = c_v;
	}	 	
	public int getC_pliabilitycid() {
		return c_pliabilitycid;
	}
	public void setC_pliabilitycid(int c_pliabilitycid) {
		this.c_pliabilitycid = c_pliabilitycid;
	}	  
	public int[] getC_condition() {
		return c_condition;
	}
	public void setC_condition(int[] c_condition) {
		this.c_condition = c_condition;
	}
	public int[] getC_cv2() {
		return c_cv2;
	}
	public void setC_cv2(int[] c_cv2) {
		this.c_cv2 = c_cv2;
	}
	public int[] getC_cv2t() {
		return c_cv2t;
	}
	public void setC_cv2t(int[] c_cv2t) {
		this.c_cv2t = c_cv2t;
	}
	public int[] getC_cv31() {
		return c_cv31;
	}
	public void setC_cv31(int[] c_cv31) {
		this.c_cv31 = c_cv31;
	}
	public int[] getC_cv31t() {
		return c_cv31t;
	}
	public void setC_cv31t(int[] c_cv31t) {
		this.c_cv31t = c_cv31t;
	}
	public int[] getC_cv32() {
		return c_cv32;
	}
	public void setC_cv32(int[] c_cv32) {
		this.c_cv32 = c_cv32;
	}
	public int[] getC_cv32t() {
		return c_cv32t;
	}
	public void setC_cv32t(int[] c_cv32t) {
		this.c_cv32t = c_cv32t;
	}	  
	public int[] getC_result() {
		return c_result;
	}
	public void setC_result(int[] c_result) {
		this.c_result = c_result;
	} 
	public double[] getC_rv() {
		return c_rv;
	}
	public void setC_rv(double[] c_rv) {
		this.c_rv = c_rv;
	}	 	 	
	public int[] getC_jfqx() {
		return c_jfqx;
	}
	public void setC_jfqx(int[] c_jfqx) {
		this.c_jfqx = c_jfqx;
	}	
	public int getC_bdnd() {
		return c_bdnd;
	}
	public void setC_bdnd(int c_bdnd) {
		this.c_bdnd = c_bdnd;
	}	
	public int getC_system() {
		return c_system;
	}
	public void setC_system(int c_system) {
		this.c_system = c_system;
	}	
	public int getC_exptypeid() {
		return c_exptypeid;
	}
	public void setC_exptypeid(int c_exptypeid) {
		this.c_exptypeid = c_exptypeid;
	}	
	public String getC_ksrq() {
		return c_ksrq;
	}
	public void setC_ksrq(String c_ksrq) {
		this.c_ksrq = c_ksrq;
	}			
	public double[] getC_dec_in() {
		return c_dec_in;
	}
	public void setC_dec_in(double[] c_dec_in) {
		this.c_dec_in = c_dec_in;
	}
	public double[] getC_dec_out() {
		return c_dec_out;
	}
	public void setC_dec_out(double[] c_dec_out) {
		this.c_dec_out = c_dec_out;
	}
	/*---------------------------------------------*/
	// 产品分类
	public void ptclass(Product product, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_ptclass  ");
			sb.append("" + product.getC_no()[0] + ",");
			sb.append("" + product.getC_ptnature() + ","); // 性质
			sb.append("'" + product.getC_name() + "',"); // 名称
			sb.append("'" + product.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_ptclass", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 筛选出产品分类
	public ArrayList<LabelValueBean> get_ptclass(String c_ptnature)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = " select * from t_ptclass where c_ptnature ='"+c_ptnature+"' ";
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
	// 产品类型
	public void pttype(Product product, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_pttype  ");
			sb.append("" + product.getC_no()[0] + ",");
			sb.append("" + product.getC_ptclassid() + ","); // 分类
			sb.append("'" + product.getC_name() + "',"); // 名称
			sb.append("'" + product.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_pttype", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 筛选出产品类型
	public ArrayList<LabelValueBean> get_pttype(int c_ptclassid)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = " select * from t_pttype where c_ptclassid = " + c_ptclassid;
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
	// 产品
	public void add_update_delete(Product product, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_product  ");
			sb.append("" + product.getC_no()[0] + ",");
			sb.append("" + product.getC_companyid() + ","); // 公司
			sb.append("" + product.getC_ptnature() + ","); // 性质
			sb.append("" + product.getC_ptclassid() + ","); // 分类
			sb.append("" + product.getC_pttypeid() + ","); // 类型
			sb.append("'" + product.getC_code().toUpperCase() + "',"); // 公司代码
			sb.append("'" + product.getC_fullname()+ "',"); // 保险公司代码
			sb.append("'" + product.getC_name() + "',"); // 名称
			sb.append("" + product.getC_type() + ","); // 1 主险 2 附加险
			sb.append("'" + product.getC_flag() + "',"); // 有效标志
			sb.append("'" + product.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_product", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 产品组件
	public void pcomponent(Product product, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();		
		try { 
			Statement st = connection.createStatement(); 
			StringBuffer sb =null;
			for(int i=0;i<product.getC_no().length;i++)
			{ 					
				sb = new StringBuffer(" p_pcomponent  ");
				sb.append("" + product.getC_no()[i] + ",");
				sb.append("" + product.getC_companyid() + ",");
				sb.append("" + product.getC_productid() + ",");
				sb.append("'" + product.getC_pcode()[i].toUpperCase() + "',"); // 作业状态 
				sb.append("'" + product.getC_pfullname()[i] + "',"); // 作业状态 
				sb.append("'" + product.getC_pname()[i] + "',"); // 作业状态 
				sb.append("" + product.getC_ptype()[i] + ",");
				sb.append("'" + product.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_pcomponent", sql, s);
			}	
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 筛选出产品
	public ArrayList<LabelValueBean> get_product(int c_companyid)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = " select * from t_product where c_flag='0' and c_companyid = " + c_companyid;
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_no"));
				lab.setLabel(rs.getString("c_fullname").trim()+"（"+rs.getString("c_code").trim()+"）");
				data.add(lab);
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}	  
	//	 产品系数
	public void ptconvert(Product product, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();		
		try { 
			Statement st = connection.createStatement(); 
			StringBuffer sb =null;
			for(int i=0;i<product.getC_jfqx().length;i++)
			{ 					
				sb = new StringBuffer(" p_ptconvert  ");
				sb.append("" + product.getC_no()[i] + ",");
				sb.append("" + product.getC_companyid() + ",");
				sb.append("" + product.getC_productid() + ",");
				sb.append("" + product.getC_convertT() + ","); 
				sb.append("" + product.getC_jfqx()[i] + ",");//	 
				sb.append("" + product.getC_dec()[i] + ","); 
				sb.append("'" + product.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_ptconvert", sql, s);
			}	
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 保险责任
	public void pliability(Product product, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {			
			StringBuffer sb =null;
			for(int i=0;i<product.getC_pname().length;i++)
			{ 
				sb = new StringBuffer(" exec p_pliability  ");
				sb.append("" + product.getC_no()[i] + ",");
				sb.append("" + product.getC_companyid() + ","); // 公司
				sb.append("" + product.getC_productid() + ","); // 类型
				sb.append("'" + product.getC_pname()[i] + "',"); // 名称
				sb.append("?,"); // 描述		 
				sb.append("'" + product.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				String sql = sb.toString();
				System.out.println(sql); 
				PreparedStatement ps = connection.prepareStatement(sql); 
				ps.setString(1, product.getC_pdesc()[i]);
				ps.executeUpdate();
				sqlrecord(connection, "p_pliability", sql, s);
			}
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 保险责任相关名词
	public void pliabilityc(Product product, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {			
			Statement st=connection.createStatement(); 	
			String sql="delete t_pliabilityc where c_companyid="+product.getC_companyid()+" and c_productid="+product.getC_productid() ;
			st.executeUpdate(sql);	
			sql="delete t_pliabilitycv where c_companyid="+product.getC_companyid()+" and c_productid="+product.getC_productid() ;
			st.executeUpdate(sql);				
			StringBuffer sb =null;
			for(int i=0;i<product.getC_name_temp().length;i++)
			{ 
				int c_pliabilitycid=0;
				sb = new StringBuffer(" p_pliabilityc  "); 
				sb.append("" + product.getC_companyid() + ","); // 公司
				sb.append("" + product.getC_productid() + ","); // 类型 
				sb.append("'" + product.getC_name_temp()[i] + "',"); // 作业状态 
				sb.append("'" + product.getC_jobnm() + "',"); // 作业状态 
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				sql = sb.toString();
				System.out.println(sql); 
				st=connection.createStatement();
				ResultSet rs=st.executeQuery(sql);
				if (rs.next())
				{
					c_pliabilitycid=rs.getInt(1);
				}
				sqlrecord(connection, "p_pliabilityc", sql, s);
				for(int j=0;j<product.getC_bxqtype().length;j++)
				{  
					String temp1=String.valueOf(product.getC_bxqtype()[j]);
					temp1=temp1.substring(0, temp1.length()-1); 
					if (temp1.equals(product.getC_pcode()[i]))
					{
						temp1=String.valueOf(product.getC_bxqtype()[j]);
						String temp2=temp1.substring(temp1.length()-1, temp1.length()); 
						int temp3=Integer.parseInt(temp2);
						sb = new StringBuffer(" p_pliabilitycv  "); 
						sb.append("" + product.getC_companyid() + ","); // 公司
						sb.append("" + product.getC_productid() + ","); // 类型 
						sb.append("" + c_pliabilitycid + ","); // 类型 
						sb.append("" + temp3 + ","); // 类型 
						sb.append("" + product.getC_bxq()[j] + ","); // 类型 
						sb.append("" + product.getC_jfqtype()[j] + ","); // 类型 
						sb.append("" + product.getC_jfq()[j] + ","); // 类型
						sb.append("" + product.getC_t()[j] + ","); // 类型 
						sb.append("" + product.getC_v()[j] + ","); // 类型 
						sb.append("'" + product.getC_jobnm() + "',"); // 作业状态 
						sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
						sb.append("'" + s.getC_ip() + "'"); // 操作人ip
						sql = sb.toString();
						System.out.println(sql); 
						st.executeUpdate(sql);	
						sqlrecord(connection, "p_pliabilitycv", sql, s);
					}					
				}
			}
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 保险责任结构
	public void pliabilitys(Product product, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();		
		try { 
			Statement st = connection.createStatement();  
			st.executeUpdate("delete t_pliabilitys where c_companyid="+product.getC_companyid()+" and c_productid="+product.getC_productid());			
			st = connection.createStatement();  
			StringBuffer sb =null;
			for(int i=0;i<product.getC_condition().length;i++)
			{ 		   			 
				sb = new StringBuffer(" p_pliabilitys  "); 
				sb.append("" + product.getC_companyid() + ","); // 公司
				sb.append("" + product.getC_productid() + ","); // 产品  
				sb.append("'" + product.getC_pname()[i] + "',");
				sb.append("" + product.getC_condition()[i] + ","); 
				sb.append("" + product.getC_cv2t()[i] + ","); 
				sb.append("" + product.getC_cv2()[i] + ",");  
				sb.append("" + product.getC_cv31t()[i] + ","); 
				sb.append("" + product.getC_cv31()[i] + ",");  
				sb.append("" + product.getC_cv32t()[i] + ","); 
				sb.append("" + product.getC_cv32()[i] + ",");  			
				sb.append("" + product.getC_result()[i] + ","); 
				sb.append("" + product.getC_rv()[i] + ",");   	  
				sb.append("'" + product.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人id
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_pliabilitys", sql, s);
			}	
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	// 手续费率定义
	public void srate(Product product, Staff s) throws SQLException
	{
		Connection connection= DB_MS2K.getConnection();
		try
		{  
			Statement st = connection.createStatement();  
			for(int i=0;i<product.getC_jfqx().length;i++) 
			{
				StringBuffer sb = new StringBuffer(" p_srate  "); 
				sb.append("" + product.getC_no()[i] + ","); 					// 1类型 
				sb.append("" + product.getC_companyid() + ","); 				// 1类型 
				sb.append("" + product.getC_productid() + ","); 				// 1类型  
				sb.append("" + product.getC_jfqx()[i] + ","); 					// 2类型
				sb.append("" + product.getC_bdnd() + ","); 						// 1类型 				 
				sb.append("" + product.getC_dec()[i] + ","); 			// 2类型
				sb.append("'" + product.getC_jobnm() + "',"); 			// 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); 			// 操作人id
				sb.append("'" + s.getC_ip() + "'"); 					// 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_srate", sql, s);
			}			
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 佣金项目定义
	public void exptype(Product product, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_exptype  ");
			sb.append("" + product.getC_no()[0] + ",");
			sb.append("" + product.getC_system() + ",");
			sb.append("'" + product.getC_name() + "',"); // 名称
			sb.append("'" + product.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_exptype", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 筛选佣金项目
	public ArrayList<LabelValueBean> get_exptype(int c_system)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = " select * from t_exptype where c_system = " + c_system;
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
	//	 佣金率定义
	public void expsrate(Product product, Staff s) throws SQLException
	{
		Connection connection= DB_MS2K.getConnection();
		try
		{  
			Statement st = connection.createStatement();  
			for(int i=0;i<product.getC_jfqx().length;i++) 
			{
				StringBuffer sb = new StringBuffer(" p_expsrate  "); 
				sb.append("" + product.getC_no()[i] + ","); 					// 1类型 
				sb.append("" + product.getC_companyid() + ","); 				// 1类型 
				sb.append("" + product.getC_productid() + ","); 				// 1类型  				
				sb.append("" + product.getC_jfqx()[i] + ","); 					// 2类型
				sb.append("" + product.getC_bdnd() + ","); 						// 1类型 	
				sb.append("" + product.getC_system() + ","); 					// 系统
				sb.append("" + product.getC_exptypeid() + ","); 				// 系统
				sb.append("" + product.getC_dec()[i] + ","); 			// 2类型
				sb.append("'" + product.getC_jobnm() + "',"); 			// 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); 			// 操作人id
				sb.append("'" + s.getC_ip() + "'"); 					// 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_expsrate", sql, s);
			}			
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 使用性质定义
	public void usage(Product product, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_usage  ");
			sb.append("" + product.getC_no()[0] + ",");
			sb.append("" + product.getC_system() + ",");
			sb.append("'" + product.getC_name() + "',"); // 名称
			sb.append("'" + product.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_usage", sql, s);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 手续费率定义
	public void crate(Product product, Staff s) throws SQLException
	{
		Connection connection= DB_MS2K.getConnection();
		try
		{  
			Statement st = connection.createStatement();  
			for(int i=0;i<product.getC_no().length;i++) 
			{
				StringBuffer sb = new StringBuffer(" p_crate  "); 
				sb.append("" + product.getC_no()[i] + ","); 					// 1类型 
				sb.append("" + product.getC_orgid() + ","); 				// 1类型 
				sb.append("" + product.getC_ptype()[i] + ","); 					// 使用性质id
				sb.append("" + product.getC_companyid() + ","); 				// 1类型 
				sb.append("" + product.getC_productid() + ","); 				// 1类型  
				sb.append("" + product.getC_type() + ","); 					// 2类型
				sb.append("'" + product.getC_ksrq() + "',"); 			// 作业状态			 
				sb.append("" + product.getC_dec_in()[i] + ","); 			// 2类型 
				sb.append("'" + product.getC_jobnm() + "',"); 			// 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); 			// 操作人id
				sb.append("'" + s.getC_ip() + "'"); 					// 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_crate", sql, s);
			}			
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 筛选出开始日期-手续费率
	public ArrayList<LabelValueBean> get_crate_ksrq(int c_orgid,int c_companyid,int c_productid,int c_year,int c_type)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select distinct c_ksrq from  t_crate  where c_orgid="+c_orgid+" and c_companyid="+
				c_companyid+" and c_productid="+c_productid+" and DATEPART(year, c_ksrq)="+c_year+"   and c_type="+c_type+"  order by c_ksrq desc" ;
			System.out.println(sql);
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_ksrq"));
				lab.setLabel(rs.getString("c_ksrq"));
				data.add(lab);
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}		
	//	 佣金率定义
	public void expcrate(Product product, Staff s) throws SQLException
	{
		Connection connection= DB_MS2K.getConnection();
		try
		{  
			Statement st = connection.createStatement();  
			for(int i=0;i<product.getC_no().length;i++) 
			{
				StringBuffer sb = new StringBuffer(" p_expcrate  "); 
				sb.append("" + product.getC_no()[i] + ","); 					// 1类型 
				sb.append("" + product.getC_orgid() + ","); 				// 1类型 
				sb.append("" + product.getC_ptype()[i] + ","); 					// 使用性质id
				sb.append("" + product.getC_companyid() + ","); 				// 1类型 
				sb.append("" + product.getC_productid() + ","); 				// 1类型  
				sb.append("" + product.getC_type() + ","); 					// 2类型
				sb.append("'" + product.getC_ksrq() + "',"); 			// 作业状态			 
				sb.append("" + product.getC_dec_in()[i] + ","); 			// 2类型 
				sb.append("'" + product.getC_jobnm() + "',"); 			// 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); 			// 操作人id
				sb.append("'" + s.getC_ip() + "'"); 					// 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_expcrate", sql, s);
			}			
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 筛选出开始日期-佣金率
	public ArrayList<LabelValueBean> get_expcrate_ksrq(int c_orgid,int c_companyid,int c_productid,int c_year,int c_type)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select distinct c_ksrq from  t_expcrate  where c_orgid="+c_orgid+" and c_companyid="+
				c_companyid+" and c_productid="+c_productid+" and DATEPART(year, c_ksrq)="+c_year+"    and c_type="+c_type+"  order by c_ksrq desc" ;
			System.out.println(sql);
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_ksrq"));
				lab.setLabel(rs.getString("c_ksrq"));
				data.add(lab);
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}		
	//	 收入税率定义
	public void ctax(Product product, Staff s) throws SQLException
	{
		Connection connection= DB_MS2K.getConnection();
		try
		{  
			Statement st = connection.createStatement();  
			for(int i=0;i<product.getC_no().length;i++) 
			{
				StringBuffer sb = new StringBuffer(" p_ctax  "); 
				sb.append("" + product.getC_no()[i] + ","); 					// 1类型 
				sb.append("" + product.getC_orgid() + ","); 				// 1类型 
				sb.append("" + product.getC_ptype()[i] + ","); 					// 使用性质id
				sb.append("" + product.getC_companyid() + ","); 				// 1类型 
				sb.append("" + product.getC_productid() + ","); 				// 1类型  
				sb.append("" + product.getC_type() + ","); 					// 2类型
				sb.append("'" + product.getC_ksrq() + "',"); 			// 作业状态			 
				sb.append("" + product.getC_dec_in()[i] + ","); 			// 2类型 
				sb.append("'" + product.getC_jobnm() + "',"); 			// 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); 			// 操作人id
				sb.append("'" + s.getC_ip() + "'"); 					// 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_ctax", sql, s);
			}			
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 筛选出开始日期-收入税率
	public ArrayList<LabelValueBean> get_ctax_ksrq(int c_orgid,int c_companyid,int c_productid,int c_year,int c_type)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select distinct c_ksrq from  t_ctax  where c_orgid="+c_orgid+" and c_companyid="+
				c_companyid+" and c_productid="+c_productid+" and DATEPART(year, c_ksrq)="+c_year+"  and c_type="+c_type+"  order by c_ksrq desc" ;
			System.out.println(sql);
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_ksrq"));
				lab.setLabel(rs.getString("c_ksrq"));
				data.add(lab);
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}		
	//	 支出税率定义
	public void expctax(Product product, Staff s) throws SQLException
	{
		Connection connection= DB_MS2K.getConnection();
		try
		{  
			Statement st = connection.createStatement();  
			for(int i=0;i<product.getC_no().length;i++) 
			{
				StringBuffer sb = new StringBuffer(" p_expctax  "); 
				sb.append("" + product.getC_no()[i] + ","); 					// 1类型 
				sb.append("" + product.getC_orgid() + ","); 				// 1类型 
				sb.append("" + product.getC_ptype()[i] + ","); 					// 使用性质id
				sb.append("" + product.getC_companyid() + ","); 				// 1类型 
				sb.append("" + product.getC_productid() + ","); 				// 1类型  
				sb.append("" + product.getC_type() + ","); 					// 2类型
				sb.append("'" + product.getC_ksrq() + "',"); 			// 作业状态			 
				sb.append("" + product.getC_dec_in()[i] + ","); 			// 2类型 
				sb.append("'" + product.getC_jobnm() + "',"); 			// 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); 			// 操作人id
				sb.append("'" + s.getC_ip() + "'"); 					// 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_expctax", sql, s);
			}			
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 筛选出开始日期-支出税率
	public ArrayList<LabelValueBean> get_expctax_ksrq(int c_orgid,int c_companyid,int c_productid,int c_year,int c_type)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select distinct c_ksrq from  t_expctax  where c_orgid="+c_orgid+" and c_companyid="+
				c_companyid+" and c_productid="+c_productid+" and DATEPART(year, c_ksrq)="+c_year+"    and c_type="+c_type+"  order by c_ksrq desc" ;
			System.out.println(sql);
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_ksrq"));
				lab.setLabel(rs.getString("c_ksrq"));
				data.add(lab);
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}		
	//	 预提佣金
	public void cxytyj(Product product, Staff s) throws SQLException
	{
		Connection connection= DB_MS2K.getConnection();
		try
		{  
			Statement st = connection.createStatement(); 
			for(int i=0;i<product.getC_no().length;i++) 
			{
				StringBuffer sb = new StringBuffer(" p_cxytyj  "); 
				sb.append("" + product.getC_no()[i] + ","); 					// 1类型 
				sb.append("" + product.getC_orgid() + ","); 				// 1类型  
				sb.append("" + product.getC_companyid() + ","); 				// 1类型  
				sb.append("'" + product.getC_ffrq() + "',"); 				// 发放日期  
				sb.append("'" + product.getC_bd()[product.getC_no()[i]] + "',"); 			// 保单号			  
				sb.append("'" + product.getC_jobnm() + "',"); 			// 作业状态
				sb.append("'" + s.getC_jobnumber() + "',"); 			// 操作人id
				sb.append("'" + s.getC_ip() + "'"); 					// 操作人ip
				String sql = sb.toString();
				System.out.println(sql);
				st.executeUpdate(sql);
				sqlrecord(connection, "p_cxytyj", sql, s);
			}			
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 筛选出发放日期-预提佣金
	public ArrayList<LabelValueBean> get_cxytyj_ffrq(int c_orgid,int c_companyid,int c_year)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select distinct c_ffrq from  t_cxytyj  where c_orgid="+c_orgid+" and c_companyid="+
				c_companyid+" and DATEPART(year, c_ffrq)="+c_year+"  order by c_ffrq desc" ;
			System.out.println(sql);
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_ffrq"));
				lab.setLabel(rs.getString("c_ffrq"));
				data.add(lab);
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}		
}
