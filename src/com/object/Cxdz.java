package com.object;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import jxl.Sheet;
import jxl.Workbook;

import org.apache.struts.upload.FormFile;

import com.publics.DB_MS2K;

public class Cxdz extends Base {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int c_no[];
	
	private int c_orgid;
	
	private int c_year;
	
	private int c_month;
	
	private int c_companyid;
	
	private int c_type; //1 签单日期 2 起保日期
	
	private String c_bd[];   
	
	private double c_bxf;
	
	private double c_ccs;
	
	private double c_bxfy1;//手续费
	
	private double c_bxfy2;//佣金
	
	private double c_ccsy1;//收入税
	
	private double c_ccsy2;//支出税
	
	private String c_jobnm;
	
	private String c_operator;
	
	private Date c_datime;
	
	private String c_ip;
	
	private FormFile file;  //文件 
	
	public double getC_bxf() {
		return c_bxf;
	}

	public void setC_bxf(double c_bxf) {
		this.c_bxf = c_bxf;
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

	public int getC_month() {
		return c_month;
	}

	public void setC_month(int c_month) {
		this.c_month = c_month;
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
 
	public int getC_year() {
		return c_year;
	}

	public void setC_year(int c_year) {
		this.c_year = c_year;
	}	 
	
	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	} 

	public String[] getC_bd() {
		return c_bd;
	}

	public void setC_bd(String[] c_bd) {
		this.c_bd = c_bd;
	}

	public int[] getC_no() {
		return c_no;
	}

	public void setC_no(int[] c_no) {
		this.c_no = c_no;
	} 
	
	public double getC_bxfy1() {
		return c_bxfy1;
	}

	public void setC_bxfy1(double c_bxfy1) {
		this.c_bxfy1 = c_bxfy1;
	}

	public double getC_bxfy2() {
		return c_bxfy2;
	}

	public void setC_bxfy2(double c_bxfy2) {
		this.c_bxfy2 = c_bxfy2;
	}

	public double getC_ccs() {
		return c_ccs;
	}

	public void setC_ccs(double c_ccs) {
		this.c_ccs = c_ccs;
	}

	public double getC_ccsy1() {
		return c_ccsy1;
	}

	public void setC_ccsy1(double c_ccsy1) {
		this.c_ccsy1 = c_ccsy1;
	}

	public double getC_ccsy2() {
		return c_ccsy2;
	}

	public void setC_ccsy2(double c_ccsy2) {
		this.c_ccsy2 = c_ccsy2;
	}

	public int getC_type() {
		return c_type;
	}

	public void setC_type(int c_type) {
		this.c_type = c_type;
	}

	//	---------------------------------------------------------------------------------------------------//	
	//	数据上传	
	public void cxdz_upload(Cxdz cxdz, Staff s) throws Exception
	{		
		Connection connection = DB_MS2K.getConnection();
		FormFile file = cxdz.getFile();
		jxl.Workbook rwb = null; 
		try
		{ 	 
			// 读取excel 文件中的内容写入到表中
			rwb = Workbook.getWorkbook(file.getInputStream());
			Sheet rs = rwb.getSheet(0);//第一个工作表	手续费				
			int rsRows = rs.getRows();//获取行数
			Statement st = connection.createStatement();	
			String sql=null;
			sql="delete t_cxdz where c_orgid="+cxdz.getC_orgid()
				+" and c_year="+cxdz.getC_year()+" and c_month="+cxdz.getC_month()+" and c_companyid="+cxdz.getC_companyid();
			st.executeUpdate(sql);			
			//批量写入对账表中数据，首行是字段名 
			for (int i = 1; i < rsRows; i++)
			{
				StringBuffer sb = null;					 
				int j = 0;
				sb=new StringBuffer("insert  t_cxdz("); 
				sb.append("c_orgid		,"); // 机构
				sb.append("c_year		,"); // 年
				sb.append("c_month		,"); // 月
				sb.append("c_companyid  ,"); // 保险公司
				sb.append("c_type			,"); // 1 签单日期 2 起保日期
				sb.append("c_bd			,"); // 保单号 
				sb.append("c_bxf		,"); // 保险费 
				sb.append("c_bxfy1		,"); // 手续费 
				sb.append("c_bxfy2		,"); // 佣金 
				sb.append("c_jobnm		,"); // 作业名称
				sb.append("c_operator	,"); // 操作员
				sb.append("c_ip			");  // 操作员IP
				sb.append(")values(");
				sb.append(cxdz.getC_orgid()+","); // 机构
				sb.append(cxdz.getC_year()+","); // 年
				sb.append(cxdz.getC_month()+","); // 月
				sb.append(cxdz.getC_companyid()+","); // 保险公司
				sb.append(cxdz.getC_type()+",'"); // 类型 1 签单日期 2 起保日期
				sb.append(rs.getCell(j, i).getContents()+"',");j++;// 保单号  
				sb.append(rs.getCell(j, i).getContents()+",");j++;// 保险费
				sb.append(rs.getCell(j, i).getContents()+",");j++;// 手续费 
				sb.append(rs.getCell(j, i).getContents()+",'");j++;// 佣金
				sb.append(cxdz.getC_jobnm()+"','"); // 作业名称
				sb.append(s.getC_jobnumber()+"','"); // 操作员
				sb.append(s.getC_ip()+"')");// 操作员IP				 
				System.out.println("t_cxdz-sql:" + sb.toString());	
				st.executeUpdate(sb.toString());				
			}
			//----------------------------------------------------------------------------------------------------------	
			rs = rwb.getSheet(1);//第一个工作表	车船税				
			rsRows = rs.getRows();//获取行数    
			//批量写入对账表中数据，首行是字段名 
			for (int i = 1; i < rsRows; i++)
			{
				StringBuffer sb = null;					 
				int j = 0;
				String c_bd=rs.getCell(j, i).getContents();j++;
				sb=new StringBuffer("update  t_cxdz set "); 				
				sb.append("c_ccs="+rs.getCell(j, i).getContents()+", ");j++; // 车船税 
				sb.append("c_ccsy1="+rs.getCell(j, i).getContents()+", ");j++; // 收入税 
				sb.append("c_ccsy2="+rs.getCell(j, i).getContents()+" ");j++; // 支出税	
				sb.append("where c_companyid="+cxdz.getC_companyid()+" and c_bd='"+c_bd+"' " ); // 机构
				
				System.out.println("t_cxdz-sql:" + sb.toString());	
				st.executeUpdate(sb.toString());				
			}
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	} 
//	//对账
//	public void cxdz_dz(Cxdz sxdz, Staff s) throws SQLException {
//		Connection connection = DB_MS2K.getConnection();
//		try {	
//		StringBuffer sb = new StringBuffer(" p_sxdz  "); 
//		sb.append("" + sxdz.getC_orgid() + ",");// --4员工姓名 
//		sb.append("" + sxdz.getC_sjlx() + ",");// --68备注	  
//		sb.append("" + sxdz.getC_companyid() + ",");// --68备注	  
//		sb.append("" + sxdz.getC_year() + ",");// --68备注	  
//		sb.append("" + sxdz.getC_month() + ",'");// --68备注	  
//		sb.append(s.getC_jobnumber()+"','"); // 操作员
//		sb.append(s.getC_ip()+"'");// 操作员IP				
//		System.out.println(sb.toString());
//		Statement st = connection.createStatement();
//		st.executeUpdate(sb.toString()); 
//		sqlrecord(connection, "p_sxdz", sb.toString(), s);
//		connection.commit();
//		}  catch (SQLException e) {
//			connection.rollback();
//			throw e;
//		} finally { 
//			DB_MS2K.closeConnection(connection);
//		}
//	}
//	//	结算
//	public void sxdz_js(Cxdz sxdz, Staff s) throws SQLException {
//		Connection connection = DB_MS2K.getConnection();
//		try {	
//		StringBuffer sb=null;
//		Statement st = connection.createStatement();
//		for(int i=0;i<sxdz.getC_no().length;i++)
//		{
//			sb = new StringBuffer(" p_sxjs  "); 
//			sb.append("" + sxdz.getC_orgid() + ",");// --4员工姓名 
//			sb.append("" + sxdz.getC_sjlx() + ",");// --68备注	  
//			sb.append("" + sxdz.getC_companyid() + ",");// --68备注	  
//			sb.append("" + sxdz.getC_year() + ",");// --68备注	  
//			sb.append("" + sxdz.getC_month() + ",'");// --68备注	  
//			sb.append("" + sxdz.getC_bd()[sxdz.getC_no()[i]]+"',"); // 操作员
//			sb.append("" + sxdz.getC_bdnd()[sxdz.getC_no()[i]]+",'"); // 操作员
//			sb.append(s.getC_jobnumber()+"','"); // 操作员
//			sb.append(s.getC_ip()+"'");// 操作员IP				
//			System.out.println(sb.toString()); 
//			st.executeUpdate(sb.toString()); 
//			sqlrecord(connection, "p_sxjs", sb.toString(), s);
//		}
//		connection.commit();
//		}  catch (SQLException e) {
//			connection.rollback();
//			throw e;
//		} finally { 
//			DB_MS2K.closeConnection(connection);
//		}
//	}
	
}
