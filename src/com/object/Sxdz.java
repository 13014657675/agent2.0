package com.object;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import jxl.Sheet;
import jxl.Workbook;

import org.apache.struts.upload.FormFile;

import com.publics.DB_MS2K;

public class Sxdz extends Base {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int c_no[];
	
	private int c_orgid;
	
	private int c_year;
	
	private int c_month;
	
	private int c_companyid;
	
	private String c_bd[]; 
	private int c_bdnd[]; 
	
	private String c_tbrname;
	
	private String c_bbrname; 
	
	private String c_cbrq;
	
	private double c_bxf;
	
	private double c_sxf;
	
	private String c_jobnm;
	
	private String c_operator;
	
	private Date c_datime;
	
	private String c_ip;
	
	private FormFile file;  //文件
	
	private int c_sjlx;

	public String getC_bbrname() {
		return c_bbrname;
	}

	public void setC_bbrname(String c_bbrname) {
		this.c_bbrname = c_bbrname;
	} 

	public double getC_bxf() {
		return c_bxf;
	}

	public void setC_bxf(double c_bxf) {
		this.c_bxf = c_bxf;
	}

	public String getC_cbrq() {
		return c_cbrq;
	}

	public void setC_cbrq(String c_cbrq) {
		this.c_cbrq = c_cbrq;
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

	public double getC_sxf() {
		return c_sxf;
	}

	public void setC_sxf(double c_sxf) {
		this.c_sxf = c_sxf;
	}

	public String getC_tbrname() {
		return c_tbrname;
	}

	public void setC_tbrname(String c_tbrname) {
		this.c_tbrname = c_tbrname;
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

	public int getC_sjlx() {
		return c_sjlx;
	}

	public void setC_sjlx(int c_sjlx) {
		this.c_sjlx = c_sjlx;
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

	public int[] getC_bdnd() {
		return c_bdnd;
	}

	public void setC_bdnd(int[] c_bdnd) {
		this.c_bdnd = c_bdnd;
	}

	//	---------------------------------------------------------------------------------------------------//	
	//	数据上传	
	public void sxdz_upload(Sxdz sxdz, Staff s) throws Exception
	{		
		Connection connection = DB_MS2K.getConnection();
		FormFile file = sxdz.getFile();
		jxl.Workbook rwb = null; 
		try
		{ 	 
			// 读取excel 文件中的内容写入到表中
			rwb = Workbook.getWorkbook(file.getInputStream());
			Sheet rs = rwb.getSheet(0);//第一个工作表					
			int rsRows = rs.getRows();//获取行数
			Statement st = connection.createStatement();	
			String sql=null;
			if (sxdz.getC_sjlx()==1)//首期
			{
				sql="delete t_sxdz where c_orgid="+sxdz.getC_orgid()
					+" and c_year="+sxdz.getC_year()+" and c_month="+sxdz.getC_month()+" and c_companyid="+sxdz.getC_companyid();
				st.executeUpdate(sql);			
				//批量写入对账表中数据，首行是字段名 
				for (int i = 1; i < rsRows; i++)
				{
					StringBuffer sb = null;					 
					int j = 0;
					sb=new StringBuffer("insert  t_sxdz("); 
					sb.append("c_orgid		,"); // 机构
					sb.append("c_year		,"); // 年
					sb.append("c_month		,"); // 月
					sb.append("c_companyid  ,"); // 保险公司
					sb.append("c_bd			,"); // 保单号 
					sb.append("c_tbrname	,"); // 投保人
					sb.append("c_bbrname	,"); // 被保人 
					sb.append("c_cbrq		,"); // 承保日期 
					sb.append("c_bxf		,"); // 保险费
					sb.append("c_sxf		,"); // 手续费 
					sb.append("c_jobnm		,"); // 作业名称
					sb.append("c_operator	,"); // 操作员
					sb.append("c_ip			");  // 操作员IP
					sb.append(")values(");
					sb.append(sxdz.getC_orgid()+","); // 机构
					sb.append(sxdz.getC_year()+","); // 年
					sb.append(sxdz.getC_month()+","); // 月
					sb.append(sxdz.getC_companyid()+",'"); // 保险公司
					sb.append(rs.getCell(j, i).getContents()+"','");j++;// 保单号 
					sb.append(rs.getCell(j, i).getContents()+"','");j++;// 投保人
					sb.append(rs.getCell(j, i).getContents()+"','");j++;// 被保人 
					sb.append(rs.getCell(j, i).getContents()+"',");j++;// 承保日期 
					sb.append(rs.getCell(j, i).getContents()+",");j++;// 保险费
					sb.append(rs.getCell(j, i).getContents()+",'");j++;// 手续费 
					sb.append(sxdz.getC_jobnm()+"','"); // 作业名称
					sb.append(s.getC_jobnumber()+"','"); // 操作员
					sb.append(s.getC_ip()+"')");// 操作员IP				 
					System.out.println("t_sxdz-sql:" + sb.toString());	
					st.executeUpdate(sb.toString());				
				}
			}	
			if (sxdz.getC_sjlx()==2)//续期
			{
				sql="delete t_sxdz_xq where c_orgid="+sxdz.getC_orgid()
				+" and c_year="+sxdz.getC_year()+" and c_month="+sxdz.getC_month()+" and c_companyid="+sxdz.getC_companyid();
				st.executeUpdate(sql);		
				for (int i = 1; i < rsRows; i++)
				{
					StringBuffer sb = null;					 
					int j = 0;
					sb=new StringBuffer("insert  t_sxdz_xq("); 
					sb.append("c_orgid		,"); // 机构
					sb.append("c_year		,"); // 年
					sb.append("c_month		,"); // 月
					sb.append("c_companyid  ,"); // 保险公司
					sb.append("c_bd			,"); // 保单号 
					sb.append("c_bdnd		,"); // 保单年度  
					sb.append("c_bxf		,"); // 保险费
					sb.append("c_sxf		,"); // 手续费 
					sb.append("c_jobnm		,"); // 作业名称
					sb.append("c_operator	,"); // 操作员
					sb.append("c_ip			");  // 操作员IP
					sb.append(")values(");
					sb.append(sxdz.getC_orgid()+","); // 机构
					sb.append(sxdz.getC_year()+","); // 年
					sb.append(sxdz.getC_month()+","); // 月
					sb.append(sxdz.getC_companyid()+",'"); // 保险公司
					sb.append(rs.getCell(j, i).getContents()+"',");j++;// 保单号 
					sb.append(rs.getCell(j, i).getContents()+",");j++;// 保单年度 
					sb.append(rs.getCell(j, i).getContents()+",");j++;// 保险费
					sb.append(rs.getCell(j, i).getContents()+",'");j++;// 手续费 
					sb.append(sxdz.getC_jobnm()+"','"); // 作业名称
					sb.append(s.getC_jobnumber()+"','"); // 操作员
					sb.append(s.getC_ip()+"')");// 操作员IP				 
					System.out.println("t_sxdz-sql:" + sb.toString());	
					st.executeUpdate(sb.toString());
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
	//对账
	public void sxdz_dz(Sxdz sxdz, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {	
		StringBuffer sb = new StringBuffer(" p_sxdz  "); 
		sb.append("" + sxdz.getC_orgid() + ",");// --4员工姓名 
		sb.append("" + sxdz.getC_sjlx() + ",");// --68备注	  
		sb.append("" + sxdz.getC_companyid() + ",");// --68备注	  
		sb.append("" + sxdz.getC_year() + ",");// --68备注	  
		sb.append("" + sxdz.getC_month() + ",'");// --68备注	  
		sb.append(s.getC_jobnumber()+"','"); // 操作员
		sb.append(s.getC_ip()+"'");// 操作员IP				
		System.out.println(sb.toString());
		Statement st = connection.createStatement();
		st.executeUpdate(sb.toString()); 
		sqlrecord(connection, "p_sxdz", sb.toString(), s);
		connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	//	结算
	public void sxdz_js(Sxdz sxdz, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {	
		StringBuffer sb=null;
		Statement st = connection.createStatement();
		if (sxdz.getC_sjlx()==1)
		{
			st.executeUpdate("delete t_sxjs where c_orgid="+sxdz.getC_orgid()+" and c_year="+sxdz.getC_year()+" and c_month="+sxdz.getC_month()+" " +
					"and c_companyid="+sxdz.getC_companyid()+" and c_bdnd=1"); 
		}else{
			st.executeUpdate("delete t_sxjs where c_orgid="+sxdz.getC_orgid()+" and c_year="+sxdz.getC_year()+" and c_month="+sxdz.getC_month()+" " +
					"and c_companyid="+sxdz.getC_companyid()+" and c_bdnd<>1"); 		
		}		
		for(int i=0;i<sxdz.getC_no().length;i++)
		{
			sb = new StringBuffer(" p_sxjs  "); 
			sb.append("" + sxdz.getC_orgid() + ",");// --4员工姓名 
			sb.append("" + sxdz.getC_sjlx() + ",");// --68备注	  
			sb.append("" + sxdz.getC_companyid() + ",");// --68备注	  
			sb.append("" + sxdz.getC_year() + ",");// --68备注	  
			sb.append("" + sxdz.getC_month() + ",'");// --68备注	  
			sb.append("" + sxdz.getC_bd()[sxdz.getC_no()[i]]+"',"); // 操作员
			sb.append("" + sxdz.getC_bdnd()[sxdz.getC_no()[i]]+",'"); // 操作员
			sb.append(s.getC_jobnumber()+"','"); // 操作员
			sb.append(s.getC_ip()+"'");// 操作员IP				
			System.out.println(sb.toString()); 
			st.executeUpdate(sb.toString()); 
			sqlrecord(connection, "p_sxjs", sb.toString(), s);
		}
		connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	
	//	寿险数据计算
	public void sxsjjs(Sxdz sxdz, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {	
		StringBuffer sb=null;
		Statement st = connection.createStatement();		 
		sb = new StringBuffer(" exec help_sxsjjs  ");		 
		System.out.println(sb.toString()); 
		st.executeUpdate(sb.toString()); 
		sqlrecord(connection, "help_sxsjjs", sb.toString(), s);
		connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
}
