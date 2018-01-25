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
	
	private int c_type; //1 ǩ������ 2 ������
	
	private String c_bd[];   
	
	private double c_bxf;
	
	private double c_ccs;
	
	private double c_bxfy1;//������
	
	private double c_bxfy2;//Ӷ��
	
	private double c_ccsy1;//����˰
	
	private double c_ccsy2;//֧��˰
	
	private String c_jobnm;
	
	private String c_operator;
	
	private Date c_datime;
	
	private String c_ip;
	
	private FormFile file;  //�ļ� 
	
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
	//	�����ϴ�	
	public void cxdz_upload(Cxdz cxdz, Staff s) throws Exception
	{		
		Connection connection = DB_MS2K.getConnection();
		FormFile file = cxdz.getFile();
		jxl.Workbook rwb = null; 
		try
		{ 	 
			// ��ȡexcel �ļ��е�����д�뵽����
			rwb = Workbook.getWorkbook(file.getInputStream());
			Sheet rs = rwb.getSheet(0);//��һ��������	������				
			int rsRows = rs.getRows();//��ȡ����
			Statement st = connection.createStatement();	
			String sql=null;
			sql="delete t_cxdz where c_orgid="+cxdz.getC_orgid()
				+" and c_year="+cxdz.getC_year()+" and c_month="+cxdz.getC_month()+" and c_companyid="+cxdz.getC_companyid();
			st.executeUpdate(sql);			
			//����д����˱������ݣ��������ֶ��� 
			for (int i = 1; i < rsRows; i++)
			{
				StringBuffer sb = null;					 
				int j = 0;
				sb=new StringBuffer("insert  t_cxdz("); 
				sb.append("c_orgid		,"); // ����
				sb.append("c_year		,"); // ��
				sb.append("c_month		,"); // ��
				sb.append("c_companyid  ,"); // ���չ�˾
				sb.append("c_type			,"); // 1 ǩ������ 2 ������
				sb.append("c_bd			,"); // ������ 
				sb.append("c_bxf		,"); // ���շ� 
				sb.append("c_bxfy1		,"); // ������ 
				sb.append("c_bxfy2		,"); // Ӷ�� 
				sb.append("c_jobnm		,"); // ��ҵ����
				sb.append("c_operator	,"); // ����Ա
				sb.append("c_ip			");  // ����ԱIP
				sb.append(")values(");
				sb.append(cxdz.getC_orgid()+","); // ����
				sb.append(cxdz.getC_year()+","); // ��
				sb.append(cxdz.getC_month()+","); // ��
				sb.append(cxdz.getC_companyid()+","); // ���չ�˾
				sb.append(cxdz.getC_type()+",'"); // ���� 1 ǩ������ 2 ������
				sb.append(rs.getCell(j, i).getContents()+"',");j++;// ������  
				sb.append(rs.getCell(j, i).getContents()+",");j++;// ���շ�
				sb.append(rs.getCell(j, i).getContents()+",");j++;// ������ 
				sb.append(rs.getCell(j, i).getContents()+",'");j++;// Ӷ��
				sb.append(cxdz.getC_jobnm()+"','"); // ��ҵ����
				sb.append(s.getC_jobnumber()+"','"); // ����Ա
				sb.append(s.getC_ip()+"')");// ����ԱIP				 
				System.out.println("t_cxdz-sql:" + sb.toString());	
				st.executeUpdate(sb.toString());				
			}
			//----------------------------------------------------------------------------------------------------------	
			rs = rwb.getSheet(1);//��һ��������	����˰				
			rsRows = rs.getRows();//��ȡ����    
			//����д����˱������ݣ��������ֶ��� 
			for (int i = 1; i < rsRows; i++)
			{
				StringBuffer sb = null;					 
				int j = 0;
				String c_bd=rs.getCell(j, i).getContents();j++;
				sb=new StringBuffer("update  t_cxdz set "); 				
				sb.append("c_ccs="+rs.getCell(j, i).getContents()+", ");j++; // ����˰ 
				sb.append("c_ccsy1="+rs.getCell(j, i).getContents()+", ");j++; // ����˰ 
				sb.append("c_ccsy2="+rs.getCell(j, i).getContents()+" ");j++; // ֧��˰	
				sb.append("where c_companyid="+cxdz.getC_companyid()+" and c_bd='"+c_bd+"' " ); // ����
				
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
//	//����
//	public void cxdz_dz(Cxdz sxdz, Staff s) throws SQLException {
//		Connection connection = DB_MS2K.getConnection();
//		try {	
//		StringBuffer sb = new StringBuffer(" p_sxdz  "); 
//		sb.append("" + sxdz.getC_orgid() + ",");// --4Ա������ 
//		sb.append("" + sxdz.getC_sjlx() + ",");// --68��ע	  
//		sb.append("" + sxdz.getC_companyid() + ",");// --68��ע	  
//		sb.append("" + sxdz.getC_year() + ",");// --68��ע	  
//		sb.append("" + sxdz.getC_month() + ",'");// --68��ע	  
//		sb.append(s.getC_jobnumber()+"','"); // ����Ա
//		sb.append(s.getC_ip()+"'");// ����ԱIP				
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
//	//	����
//	public void sxdz_js(Cxdz sxdz, Staff s) throws SQLException {
//		Connection connection = DB_MS2K.getConnection();
//		try {	
//		StringBuffer sb=null;
//		Statement st = connection.createStatement();
//		for(int i=0;i<sxdz.getC_no().length;i++)
//		{
//			sb = new StringBuffer(" p_sxjs  "); 
//			sb.append("" + sxdz.getC_orgid() + ",");// --4Ա������ 
//			sb.append("" + sxdz.getC_sjlx() + ",");// --68��ע	  
//			sb.append("" + sxdz.getC_companyid() + ",");// --68��ע	  
//			sb.append("" + sxdz.getC_year() + ",");// --68��ע	  
//			sb.append("" + sxdz.getC_month() + ",'");// --68��ע	  
//			sb.append("" + sxdz.getC_bd()[sxdz.getC_no()[i]]+"',"); // ����Ա
//			sb.append("" + sxdz.getC_bdnd()[sxdz.getC_no()[i]]+",'"); // ����Ա
//			sb.append(s.getC_jobnumber()+"','"); // ����Ա
//			sb.append(s.getC_ip()+"'");// ����ԱIP				
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
