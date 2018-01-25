package com.object;

import java.sql.Connection; 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.publics.DB_MS2K;

public class Cxbd extends Base {
	
	private static final long serialVersionUID = 1L;
	private int c_no;
	private int c_orgid    ;	// ����
	private int c_companyid   ;	// ���չ�˾ 
	private String c_bd     ;	// ������
	private int c_productid ; 	// ��Ʒ����id	 
	private double c_bxf ; 		// ���շ� 
	private double c_ccs ; 		// ����˰
	private String c_platenumber;	//���ƺ�
	private String c_hisnumber;	//���ݺ�
	private String c_customer;	//������������
	private String c_cardtype; //֤������
	private String c_cardnum; //֤������ 
	private String c_lrrq;//¼������;
	private String c_cbrq; //�б�����
	private String c_jobnumber; //�����˹���
	private int c_usageid; //ʹ������
	private int c_pay; //���ʽ
	private String c_fpserial;//��Ʊ��ˮ��
	private String c_dzserial;//��֤��ˮ��
	private String c_system_sq; //������ϵ
	private String c_flag     ;
	private String c_jobnm     ;
	private String c_operator    ;
	private String c_ip  ;
	
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_bd() {
		return c_bd;
	}
	public void setC_bd(String c_bd) {
		this.c_bd = c_bd;
	}
	public double getC_bxf() {
		return c_bxf;
	}
	public void setC_bxf(double c_bxf) {
		this.c_bxf = c_bxf;
	}
	public String getC_cardnum() {
		return c_cardnum;
	}
	public void setC_cardnum(String c_cardnum) {
		this.c_cardnum = c_cardnum;
	}
	public String getC_cardtype() {
		return c_cardtype;
	}
	public void setC_cardtype(String c_cardtype) {
		this.c_cardtype = c_cardtype;
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
	public String getC_customer() {
		return c_customer;
	}
	public void setC_customer(String c_customer) {
		this.c_customer = c_customer;
	}
	public String getC_flag() {
		return c_flag;
	}
	public void setC_flag(String c_flag) {
		this.c_flag = c_flag;
	}
	public String getC_hisnumber() {
		return c_hisnumber;
	}
	public void setC_hisnumber(String c_hisnumber) {
		this.c_hisnumber = c_hisnumber;
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
	public String getC_jobnumber() {
		return c_jobnumber;
	}
	public void setC_jobnumber(String c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	}
	public String getC_lrrq() {
		return c_lrrq;
	}
	public void setC_lrrq(String c_lrrq) {
		this.c_lrrq = c_lrrq;
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
	public String getC_platenumber() {
		return c_platenumber;
	}
	public void setC_platenumber(String c_platenumber) {
		this.c_platenumber = c_platenumber;
	}
	public int getC_productid() {
		return c_productid;
	}
	public void setC_productid(int c_productid) {
		this.c_productid = c_productid;
	}
	public String getC_system_sq() {
		return c_system_sq;
	}
	public void setC_system_sq(String c_system_sq) {
		this.c_system_sq = c_system_sq;
	}	
	public double getC_ccs() {
		return c_ccs;
	}
	public void setC_ccs(double c_ccs) {
		this.c_ccs = c_ccs;
	}
	public String getC_dzserial() {
		return c_dzserial;
	}
	public void setC_dzserial(String c_dzserial) {
		this.c_dzserial = c_dzserial;
	}
	public String getC_fpserial() {
		return c_fpserial;
	}
	public void setC_fpserial(String c_fpserial) {
		this.c_fpserial = c_fpserial;
	}	
	public int getC_usageid() {
		return c_usageid;
	}
	public void setC_usageid(int c_usageid) {
		this.c_usageid = c_usageid;
	}
	public int getC_pay() {
		return c_pay;
	}
	public void setC_pay(int c_pay) {
		this.c_pay = c_pay;
	}
	/*---------------------------------------------*/
	//	 ����Ա��������
	public String get_name(String c_jobnumber) throws SQLException { 
		String c_name="";
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			String sql = "select c_jobnumber,c_name from t_staff where c_jobnumber ='"+c_jobnumber+"' and c_quitdate is null " ;	
			ResultSet rs= connection.createStatement().executeQuery(sql); 
			if (rs.next())
			{				 
				c_name=rs.getString("c_name").trim(); 
			}			 
		} finally {
			DB_MS2K.closeConnection(connection);
		}		
		return c_name;
	}
	// Ͷ�������
	public void cxbdadd(Cxbd cxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {						
			StringBuffer sql3 = new StringBuffer(" p_cxbd ");
			sql3.append("" + cxbd.getC_no() + ",");// //71Ա��id  
			sql3.append("" + cxbd.getC_orgid() + ",");// //71Ա��id  
			sql3.append("" +cxbd.getC_companyid()+ ",");// //72�������Ե�IP��ַ 
			sql3.append("'" +cxbd.getC_bd()+ "',");// //72�������Ե�IP��ַ 		
			sql3.append("" +cxbd.getC_productid()+ ",");// //72�������Ե�IP��ַ 			
			sql3.append("" +cxbd.getC_bxf()+ ",");// // 
			sql3.append("" +cxbd.getC_ccs()+ ",");// 
			sql3.append("'" +cxbd.getC_platenumber()+ "',");// //
			sql3.append("'" +cxbd.getC_hisnumber()+ "',");// //
			sql3.append("'" +cxbd.getC_customer()+ "',");// //
			sql3.append("'" +cxbd.getC_cardtype()+ "',");// //			
			sql3.append("'" +cxbd.getC_cardnum()+ "',");// // 
			sql3.append("'" +cxbd.getC_lrrq()+ "',");// //
			sql3.append("'" +cxbd.getC_cbrq()+ "',");// //			
			sql3.append("'" +cxbd.getC_jobnumber()+ "',");// //	
			sql3.append("" +cxbd.getC_usageid()+ ",");// 
			sql3.append("" +cxbd.getC_pay()+ ",");// 
			sql3.append("'" +cxbd.getC_fpserial()+ "',");// 
			sql3.append("'" +cxbd.getC_dzserial()+ "',");// 			
			sql3.append("'" +cxbd.getC_jobnm()+ "',");// //72�������Ե�IP��ַ
			sql3.append("'" + op.getC_jobnumber() + "',");// //71����Ա
			sql3.append("'" + op.getC_ip() + "'");// //72�������Ե�IP��ַ 
			System.out.println(sql3.toString()); 
			Statement st = connection.createStatement();
			st.executeUpdate(sql3.toString()); 
			sqlrecord(connection, "p_cxbd", sql3.toString(), op);
			 
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	
	//	 ����ɾ��
	public void cxbddel(Cxbd cxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			String sql1="delete t_cxbd where c_companyid="+cxbd.getC_companyid()+" and c_bd='"+cxbd.getC_bd()+"'";	 		 
			Statement st = connection.createStatement();
			st.executeUpdate(sql1);  		 
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	

}
