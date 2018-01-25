package com.object;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; 
import java.sql.Statement;
import java.util.ArrayList;
import org.apache.struts.util.LabelValueBean;
import com.publics.DB_MS2K; 
  
public class Sxbd extends Base {

	private static final long serialVersionUID = 1L;
	private int c_no	;
	private int c_orgid    ;	// 机构
	private int c_companyid   ;	// 保险公司
	private String c_tbd      ;	// 投保单号
	private String c_bd     ;	// 保单号
	private String c_address    ;	// 通讯地址
	private String c_zip     ;    	// 通讯邮编
	private int c_tbrnum     ;	// 投保人编号
	private int c_bbrnum     ;	// 被保人编号
	private String c_tbrrel     ;	// 是投保人的*	
	private String c_name1     ;	// 受益人姓名
	private String c_sex1     ;	// 受益人性别
	private String c_bbrrel1     ; 	// 是被保人的*	
	private int c_sysx1     ;	// 受益顺序
	private double c_sybl1   ;// 受益比例
	private String c_cardtype1     ;// 证件类型
	private String c_cardnum1     ;	// 证件号码	
	private String c_name2     ;	// 受益人姓名
	private String c_sex2    ;	// 受益人性别
	private String c_bbrrel2     ; 	// 是被保人的*	
	private int c_sysx2     ;	// 受益顺序
	private double c_sybl2  ;// 受益比例
	private String c_cardtype2    ;	// 证件类型
	private String c_cardnum2    ;	// 证件号码	
	private String c_name3    ;		// 受益人姓名
	private String c_sex3    ;		// 受益人性别
	private String c_bbrrel3    ; 	// 是被保人的*	
	private int c_sysx3    ;		// 受益顺序
	private double c_sybl3  ;		// 受益比例
	private String c_cardtype3    ;	// 证件类型
	private String c_cardnum3    ;	// 证件号码 	 
	private int c_pay   ;			// 交费方式
	private int c_pad   ;			// 垫交方式
	private int c_controversy   ;	// 争议处理方式	
	private String c_bank     ;		// 银行
	private String c_bankcode     ;	// 银行卡号
	private String c_jobnumber    ;	// 工号	
	private int c_outletsid    ;	// 网点id
	private String c_tbrq     ; 
	private String c_flag     ;
	private String c_jobnm     ;
	private String c_operator    ;
	private String c_ip  ;
	/*********************************************/	 
	private int c_productid[] ; 	// 产品险种id	 
	private int c_bxqtype[] ;		// 保险期间N年
	private int c_bxq[] ;		// 保险期间至N周岁
	private int c_jfqtype[] ;		// 交费期间N年
	private int c_jfq[] ;		// 交费期间至N周岁
	private int c_jfqx[] ; 		// 交费期间
	private double c_bxje[] ;		// 保险金额
	private double c_bxf[] ; 		// 保险费 
	private double c_bxfr1[]   ;	// 收入比率
	private double c_bxfr2[] 	 ;	// 支出比率
	private double c_bxfy1[]   ;	// 收入
	private double c_bxfy2[]   ;	// 支出 
	private String c_jiesuan[]    ;	// 结算日期
	private double c_bxfxs[] ;
	private double c_bxfbz[] ;
	private double c_bxgsxs[] ;
	private double c_bxgsbz[] ;
	/*********************************************/	 
	private int c_type;
	private String c_date;
	private String c_cardnum;
	private double c_bxfhj;		// 保险费合计
	private int c_id[];
	private int c_companyid_temp[];	// 保险公司
	private String c_tbd_temp[];	// 投保单号
	private String c_bd_temp[];	// 保单号
	private int c_orgid_temp[]    ;	// 机构
	private String c_tbrname;
	private int c_bdnd;	
	private String c_code;
	private String c_fprq;
	private String c_barq;
	private String c_basm;
	private String c_jarq;
	private String c_jasm;
	private int c_jajg;
	private double c_je;
	private String c_bdzt;
	
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
	public String getC_bankcode() {
		return c_bankcode;
	}
	public void setC_bankcode(String c_bankcode) {
		this.c_bankcode = c_bankcode;
	}
	public int getC_bbrnum() {
		return c_bbrnum;
	}
	public void setC_bbrnum(int c_bbrnum) {
		this.c_bbrnum = c_bbrnum;
	}
	public String getC_bbrrel1() {
		return c_bbrrel1;
	}
	public void setC_bbrrel1(String c_bbrrel1) {
		this.c_bbrrel1 = c_bbrrel1;
	}
	public String getC_bbrrel2() {
		return c_bbrrel2;
	}
	public void setC_bbrrel2(String c_bbrrel2) {
		this.c_bbrrel2 = c_bbrrel2;
	}
	public String getC_bbrrel3() {
		return c_bbrrel3;
	}
	public void setC_bbrrel3(String c_bbrrel3) {
		this.c_bbrrel3 = c_bbrrel3;
	}
	public String getC_bd() {
		return c_bd;
	}
	public void setC_bd(String c_bd) {
		this.c_bd = c_bd;
	}
	public String getC_cardnum1() {
		return c_cardnum1;
	}
	public void setC_cardnum1(String c_cardnum1) {
		this.c_cardnum1 = c_cardnum1;
	}
	public String getC_cardnum2() {
		return c_cardnum2;
	}
	public void setC_cardnum2(String c_cardnum2) {
		this.c_cardnum2 = c_cardnum2;
	}
	public String getC_cardnum3() {
		return c_cardnum3;
	}
	public void setC_cardnum3(String c_cardnum3) {
		this.c_cardnum3 = c_cardnum3;
	}
	public String getC_cardtype1() {
		return c_cardtype1;
	}
	public void setC_cardtype1(String c_cardtype1) {
		this.c_cardtype1 = c_cardtype1;
	}
	public String getC_cardtype2() {
		return c_cardtype2;
	}
	public void setC_cardtype2(String c_cardtype2) {
		this.c_cardtype2 = c_cardtype2;
	}
	public String getC_cardtype3() {
		return c_cardtype3;
	}
	public void setC_cardtype3(String c_cardtype3) {
		this.c_cardtype3 = c_cardtype3;
	}
	public int getC_companyid() {
		return c_companyid;
	}
	public void setC_companyid(int c_companyid) {
		this.c_companyid = c_companyid;
	}
	public int getC_controversy() {
		return c_controversy;
	}
	public void setC_controversy(int c_controversy) {
		this.c_controversy = c_controversy;
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
	public String getC_jobnumber() {
		return c_jobnumber;
	}
	public void setC_jobnumber(String c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	}
	public String getC_name1() {
		return c_name1;
	}
	public void setC_name1(String c_name1) {
		this.c_name1 = c_name1;
	}
	public String getC_name2() {
		return c_name2;
	}
	public void setC_name2(String c_name2) {
		this.c_name2 = c_name2;
	}
	public String getC_name3() {
		return c_name3;
	}
	public void setC_name3(String c_name3) {
		this.c_name3 = c_name3;
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
	public int getC_pad() {
		return c_pad;
	}
	public void setC_pad(int c_pad) {
		this.c_pad = c_pad;
	}
	public int getC_pay() {
		return c_pay;
	}
	public void setC_pay(int c_pay) {
		this.c_pay = c_pay;
	}
	public String getC_sex1() {
		return c_sex1;
	}
	public void setC_sex1(String c_sex1) {
		this.c_sex1 = c_sex1;
	}
	public String getC_sex2() {
		return c_sex2;
	}
	public void setC_sex2(String c_sex2) {
		this.c_sex2 = c_sex2;
	}
	public String getC_sex3() {
		return c_sex3;
	}
	public void setC_sex3(String c_sex3) {
		this.c_sex3 = c_sex3;
	}
	public double getC_sybl1() {
		return c_sybl1;
	}
	public void setC_sybl1(double c_sybl1) {
		this.c_sybl1 = c_sybl1;
	}
	public double getC_sybl2() {
		return c_sybl2;
	}
	public void setC_sybl2(double c_sybl2) {
		this.c_sybl2 = c_sybl2;
	}
	public double getC_sybl3() {
		return c_sybl3;
	}
	public void setC_sybl3(double c_sybl3) {
		this.c_sybl3 = c_sybl3;
	}
	 
	public String getC_tbd() {
		return c_tbd;
	}
	public void setC_tbd(String c_tbd) {
		this.c_tbd = c_tbd;
	}
	public int getC_tbrnum() {
		return c_tbrnum;
	}
	public void setC_tbrnum(int c_tbrnum) {
		this.c_tbrnum = c_tbrnum;
	}
	public String getC_tbrq() {
		return c_tbrq;
	}
	public void setC_tbrq(String c_tbrq) {
		this.c_tbrq = c_tbrq;
	}
	public String getC_tbrrel() {
		return c_tbrrel;
	}
	public void setC_tbrrel(String c_tbrrel) {
		this.c_tbrrel = c_tbrrel;
	}
	public String getC_zip() {
		return c_zip;
	}
	public void setC_zip(String c_zip) {
		this.c_zip = c_zip;
	}
	public double[] getC_bxf() {
		return c_bxf;
	}
	public void setC_bxf(double[] c_bxf) {
		this.c_bxf = c_bxf;
	}
	public double[] getC_bxfbz() {
		return c_bxfbz;
	}
	public void setC_bxfbz(double[] c_bxfbz) {
		this.c_bxfbz = c_bxfbz;
	}
	public double[] getC_bxfr1() {
		return c_bxfr1;
	}
	public void setC_bxfr1(double[] c_bxfr1) {
		this.c_bxfr1 = c_bxfr1;
	}
	public double[] getC_bxfr2() {
		return c_bxfr2;
	}
	public void setC_bxfr2(double[] c_bxfr2) {
		this.c_bxfr2 = c_bxfr2;
	}
	public double[] getC_bxfxs() {
		return c_bxfxs;
	}
	public void setC_bxfxs(double[] c_bxfxs) {
		this.c_bxfxs = c_bxfxs;
	}
	public double[] getC_bxfy1() {
		return c_bxfy1;
	}
	public void setC_bxfy1(double[] c_bxfy1) {
		this.c_bxfy1 = c_bxfy1;
	}
	public double[] getC_bxfy2() {
		return c_bxfy2;
	}
	public void setC_bxfy2(double[] c_bxfy2) {
		this.c_bxfy2 = c_bxfy2;
	}
	public double[] getC_bxgsbz() {
		return c_bxgsbz;
	}
	public void setC_bxgsbz(double[] c_bxgsbz) {
		this.c_bxgsbz = c_bxgsbz;
	}
	public double[] getC_bxgsxs() {
		return c_bxgsxs;
	}
	public void setC_bxgsxs(double[] c_bxgsxs) {
		this.c_bxgsxs = c_bxgsxs;
	}
	public double[] getC_bxje() {
		return c_bxje;
	}
	public void setC_bxje(double[] c_bxje) {
		this.c_bxje = c_bxje;
	}	 
	public int[] getC_jfq() {
		return c_jfq;
	}
	public void setC_jfq(int[] c_jfq) {
		this.c_jfq = c_jfq;
	} 
	public String[] getC_jiesuan() {
		return c_jiesuan;
	}
	public void setC_jiesuan(String[] c_jiesuan) {
		this.c_jiesuan = c_jiesuan;
	}
	public int[] getC_productid() {
		return c_productid;
	}
	public void setC_productid(int[] c_productid) {
		this.c_productid = c_productid;
	}	
	public int getC_sysx1() {
		return c_sysx1;
	}
	public void setC_sysx1(int c_sysx1) {
		this.c_sysx1 = c_sysx1;
	}
	public int getC_sysx2() {
		return c_sysx2;
	}
	public void setC_sysx2(int c_sysx2) {
		this.c_sysx2 = c_sysx2;
	}
	public int getC_sysx3() {
		return c_sysx3;
	}
	public void setC_sysx3(int c_sysx3) {
		this.c_sysx3 = c_sysx3;
	}	
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public int getC_type() {
		return c_type;
	}
	public void setC_type(int c_type) {
		this.c_type = c_type;
	}	
	public String getC_cardnum() {
		return c_cardnum;
	}
	public void setC_cardnum(String c_cardnum) {
		this.c_cardnum = c_cardnum;
	}	
	public double getC_bxfhj() {
		return c_bxfhj;
	}
	public void setC_bxfhj(double c_bxfhj) {
		this.c_bxfhj = c_bxfhj;
	}	
	public String[] getC_bd_temp() {
		return c_bd_temp;
	}
	public void setC_bd_temp(String[] c_bd_temp) {
		this.c_bd_temp = c_bd_temp;
	}
	public String[] getC_tbd_temp() {
		return c_tbd_temp;
	}
	public void setC_tbd_temp(String[] c_tbd_temp) {
		this.c_tbd_temp = c_tbd_temp;
	}	
	public int[] getC_companyid_temp() {
		return c_companyid_temp;
	}
	public void setC_companyid_temp(int[] c_companyid_temp) {
		this.c_companyid_temp = c_companyid_temp;
	}	
	public int[] getC_id() {
		return c_id;
	}
	public void setC_id(int[] c_id) {
		this.c_id = c_id;
	}	
	public int getC_no() {
		return c_no;
	}	
	public int[] getC_orgid_temp() {
		return c_orgid_temp;
	}
	public void setC_orgid_temp(int[] c_orgid_temp) {
		this.c_orgid_temp = c_orgid_temp;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}	
	public String getC_tbrname() {
		return c_tbrname;
	}
	public void setC_tbrname(String c_tbrname) {
		this.c_tbrname = c_tbrname;
	}	
	public int getC_bdnd() {
		return c_bdnd;
	}
	public void setC_bdnd(int c_bdnd) {
		this.c_bdnd = c_bdnd;
	}	
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}		
	public String getC_fprq() {
		return c_fprq;
	}
	public void setC_fprq(String c_fprq) {
		this.c_fprq = c_fprq;
	}	
	public String getC_barq() {
		return c_barq;
	}
	public void setC_barq(String c_barq) {
		this.c_barq = c_barq;
	}
	public String getC_basm() {
		return c_basm;
	}
	public void setC_basm(String c_basm) {
		this.c_basm = c_basm;
	}
	public String getC_bdzt() {
		return c_bdzt;
	}
	public void setC_bdzt(String c_bdzt) {
		this.c_bdzt = c_bdzt;
	}
	public int getC_jajg() {
		return c_jajg;
	}
	public void setC_jajg(int c_jajg) {
		this.c_jajg = c_jajg;
	}
	public String getC_jarq() {
		return c_jarq;
	}
	public void setC_jarq(String c_jarq) {
		this.c_jarq = c_jarq;
	}
	public String getC_jasm() {
		return c_jasm;
	}
	public void setC_jasm(String c_jasm) {
		this.c_jasm = c_jasm;
	}
	public double getC_je() {
		return c_je;
	}
	public void setC_je(double c_je) {
		this.c_je = c_je;
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
	public int[] getC_jfqx() {
		return c_jfqx;
	}
	public void setC_jfqx(int[] c_jfqx) {
		this.c_jfqx = c_jfqx;
	}		
	public int getC_outletsid() {
		return c_outletsid;
	}
	public void setC_outletsid(int c_outletsid) {
		this.c_outletsid = c_outletsid;
	}
	/*---------------------------------------------*/
	// 投保单添加
	public void sxbdadd(Customer tbr,Customer bbr,Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {			
			StringBuffer sql1 = new StringBuffer(" p_customer ");
			sql1.append("" + tbr.getC_no() + ",");// //71员工id  
			sql1.append("'" +tbr.getC_name()+ "',");// //72操作电脑的IP地址
			sql1.append("'" +tbr.getC_nation()+ "',");// //72操作电脑的IP地址 
			sql1.append("" + tbr.getC_sex() + ",");// // 
			sql1.append("" + tbr.getC_birthy() + ",");// // 
			sql1.append("" + tbr.getC_birthm() + ",");// // 
			sql1.append("" + tbr.getC_birthd() + ",");// // 
			sql1.append("" + tbr.getC_marriage() + ",");// // 
			sql1.append("'" +tbr.getC_cardtype()+ "',");// //72操作电脑的IP地址 
			sql1.append("'" +tbr.getC_cardnum()+ "',");// //72操作电脑的IP地址 
			sql1.append("'" +tbr.getC_cardperiod()+ "',");// //
			sql1.append("'" +tbr.getC_education()+ "',");// //
			sql1.append("'" +tbr.getC_email()+ "',");// //
			sql1.append("'" +tbr.getC_phone()+ "',");// //
			sql1.append("'" +tbr.getC_mobile()+ "',");// //
			sql1.append("'" +tbr.getC_company()+ "',");// //
			sql1.append("'" +tbr.getC_post()+ "',");// //
			sql1.append("'" +tbr.getC_postcode()+ "',");// //
			sql1.append("'" +tbr.getC_hddr()+ "',");// //
			sql1.append("'" +tbr.getC_hzip()+ "',");// //
			sql1.append("'" +tbr.getC_cddr()+ "',");// //
			sql1.append("'" +tbr.getC_czip()+ "',");// //
			sql1.append("'" +tbr.getC_jobnm()+ "',");// //72操作电脑的IP地址
			sql1.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sql1.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 
			System.out.println(sql1.toString());			
			StringBuffer sql2 = new StringBuffer(" p_customer ");
			sql2.append("" + bbr.getC_no() + ",");// //71员工id  
			sql2.append("'" +bbr.getC_name()+ "',");// //72操作电脑的IP地址
			sql2.append("'" +bbr.getC_nation()+ "',");// //72操作电脑的IP地址 
			sql2.append("" + bbr.getC_sex() + ",");// // 
			sql2.append("" + bbr.getC_birthy() + ",");// // 
			sql2.append("" + bbr.getC_birthm() + ",");// // 
			sql2.append("" + bbr.getC_birthd() + ",");// // 
			sql2.append("" + bbr.getC_marriage() + ",");// // 
			sql2.append("'" +bbr.getC_cardtype()+ "',");// //72操作电脑的IP地址 
			sql2.append("'" +bbr.getC_cardnum()+ "',");// //72操作电脑的IP地址 
			sql2.append("'" +bbr.getC_cardperiod()+ "',");// //
			sql2.append("'" +bbr.getC_education()+ "',");// //
			sql2.append("'" +bbr.getC_email()+ "',");// //
			sql2.append("'" +bbr.getC_phone()+ "',");// //
			sql2.append("'" +bbr.getC_mobile()+ "',");// //
			sql2.append("'" +bbr.getC_company()+ "',");// //
			sql2.append("'" +bbr.getC_post()+ "',");// //
			sql2.append("'" +bbr.getC_postcode()+ "',");// //
			sql2.append("'" +bbr.getC_hddr()+ "',");// //
			sql2.append("'" +bbr.getC_hzip()+ "',");// //
			sql2.append("'" +bbr.getC_cddr()+ "',");// //
			sql2.append("'" +bbr.getC_czip()+ "',");// //
			sql2.append("'" +bbr.getC_jobnm()+ "',");// //72操作电脑的IP地址
			sql2.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sql2.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 
			System.out.println(sql2.toString());			
			Statement st = connection.createStatement();
			ResultSet rs=st.executeQuery(sql1.toString());
			sqlrecord(connection, "p_customer", sql1.toString(), op);
			if (rs.next())
			{
				sxbd.setC_tbrnum(rs.getInt(1));
			}
			if (sxbd.getC_tbrrel().trim().equals("本人"))
			{
				sxbd.setC_bbrnum(sxbd.getC_tbrnum());
			}
			else
			{
				ResultSet rs2=st.executeQuery(sql2.toString());
				sqlrecord(connection, "p_customer", sql2.toString(), op);
				if (rs2.next())
				{
					sxbd.setC_bbrnum(rs2.getInt(1));
				}
			}
			StringBuffer sql3 = new StringBuffer(" p_sxbd ");
			sql3.append("" + sxbd.getC_no() + ",");// //71员工id  
			sql3.append("" + sxbd.getC_orgid() + ",");// //71员工id  
			sql3.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
			sql3.append("'" +sxbd.getC_tbd()+ "',");// //72操作电脑的IP地址 		
			sql3.append("'" +sxbd.getC_bd()+ "',");// //72操作电脑的IP地址 		
			sql3.append("'" +sxbd.getC_address()+ "',");// //72操作电脑的IP地址 
			sql3.append("'" +sxbd.getC_zip()+ "',");// //72操作电脑的IP地址 
			sql3.append("" +sxbd.getC_tbrnum()+ ",");// //
			sql3.append("" +sxbd.getC_bbrnum()+ ",");// //
			sql3.append("'" +sxbd.getC_tbrrel()+ "',");// //
			sql3.append("'" +sxbd.getC_name1()+ "',");// //
			sql3.append("'" +sxbd.getC_sex1()+ "',");// //
			sql3.append("'" +sxbd.getC_bbrrel1()+ "',");// //
			sql3.append("" +sxbd.getC_sysx1()+ ",");// //
			sql3.append("" +sxbd.getC_sybl1()+ ",");// //
			sql3.append("'" +sxbd.getC_cardtype1()+ "',");// //
			sql3.append("'" +sxbd.getC_cardnum1()+ "',");// //
			sql3.append("'" +sxbd.getC_name2()+ "',");// //
			sql3.append("'" +sxbd.getC_sex2()+ "',");// //
			sql3.append("'" +sxbd.getC_bbrrel2()+ "',");// //
			sql3.append("" +sxbd.getC_sysx2()+ ",");// //
			sql3.append("" +sxbd.getC_sybl2()+ ",");// //
			sql3.append("'" +sxbd.getC_cardtype2()+ "',");// //
			sql3.append("'" +sxbd.getC_cardnum2()+ "',");// //
			sql3.append("'" +sxbd.getC_name3()+ "',");// //
			sql3.append("'" +sxbd.getC_sex3()+ "',");// //
			sql3.append("'" +sxbd.getC_bbrrel3()+ "',");// //
			sql3.append("" +sxbd.getC_sysx3()+ ",");// //
			sql3.append("" +sxbd.getC_sybl3()+ ",");// //
			sql3.append("'" +sxbd.getC_cardtype3()+ "',");// //
			sql3.append("'" +sxbd.getC_cardnum3()+ "',");// //
			sql3.append("" + sxbd.getC_pay() + ",");// // 
			sql3.append("" + sxbd.getC_pad() + ",");// // 
			sql3.append("" + sxbd.getC_controversy() + ",");// // 
			sql3.append("'" +sxbd.getC_bank()+ "',");// //
			sql3.append("'" +sxbd.getC_bankcode()+ "',");// //
			sql3.append("'" +sxbd.getC_jobnumber()+ "',");// //
			sql3.append(""  +sxbd.getC_outletsid()+ ",");// //			
			sql3.append("'" +sxbd.getC_tbrq()+ "',");// //
			sql3.append("'" +sxbd.getC_jobnm()+ "',");// //72操作电脑的IP地址
			sql3.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sql3.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 
			System.out.println(sql3.toString()); 
			st.executeUpdate(sql3.toString()); 
			sqlrecord(connection, "p_sxbd", sql3.toString(), op);
			StringBuffer sql4 =null;
			for(int i=0;i<sxbd.getC_productid().length;i++)
			{
				sql4 = new StringBuffer(" p_sxtb "); 
				sql4.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
				sql4.append("'" +sxbd.getC_tbd()+ "',");// //72操作电脑的IP地址 			
				sql4.append("'" +sxbd.getC_bd()+ "',");// //72操作电脑的IP地址 					
				sql4.append("" +sxbd.getC_productid()[i]+ ",");// //72操作电脑的IP地址 			 
				sql4.append("" +sxbd.getC_bxqtype()[i]+ ",");// //
				sql4.append("" +sxbd.getC_bxq()[i]+ ",");// //
				sql4.append("" +sxbd.getC_jfqtype()[i]+ ",");// //
				sql4.append("" +sxbd.getC_jfq()[i]+ ",");// //
				sql4.append("" +sxbd.getC_jfqx()[i]+ ",");// //
				sql4.append("" +sxbd.getC_bxje()[i]+ ",");// //
				sql4.append("" +sxbd.getC_bxf()[i]+ ",");// //
				sql4.append("'" +sxbd.getC_jobnm()+ "',");// //72操作电脑的IP地址
				sql4.append("'" + op.getC_jobnumber() + "',");// //71操作员
				sql4.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 
				System.out.println(sql4.toString());
				st.executeUpdate(sql4.toString());
				sqlrecord(connection, "p_sxtb", sql4.toString(), op);
			} 	
			StringBuffer sql5 = new StringBuffer(" p_sxsqjs2 "); 
			sql5.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
			sql5.append("'" +sxbd.getC_tbd()+ "' ");// //72操作电脑的IP地址 	 
			st.executeUpdate(sql5.toString());
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	
	//	 投保单删除
	public void sxbddel(Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			String sql1="delete t_sxbd where c_companyid="+sxbd.getC_companyid()+" and c_tbd='"+sxbd.getC_tbd()+"'";			 
			String sql2="delete t_sxtb where c_companyid="+sxbd.getC_companyid()+" and c_tbd='"+sxbd.getC_tbd()+"'";			 
			Statement st = connection.createStatement();
			st.executeUpdate(sql1);  		
			st.executeUpdate(sql2);  	
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	
	//	 投保单撤单
	public void sxbdcd(Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			StringBuffer sb = new StringBuffer(" p_sxbd_cd "); 
			sb.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
			sb.append("'" +sxbd.getC_tbd()+ "',");// //72操作电脑的IP地址 				 	 
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 	 
			Statement st = connection.createStatement();
			System.out.println(sb.toString());
			st.executeUpdate(sb.toString());  		
			sqlrecord(connection, "p_sxbd_cd", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	
	//	 保单生效
	public void sxbdsx(Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			StringBuffer sb = new StringBuffer(" p_sxbd_sx "); 
			sb.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
			sb.append("'" +sxbd.getC_tbd()+ "',");// //72操作电脑的IP地址 				 
			sb.append("'" +sxbd.getC_bd()+ "',");// //72操作电脑的IP地址 		
			sb.append("'" +sxbd.getC_cardnum()+ "',");// //72操作电脑的IP地址 	
			sb.append("'" +sxbd.getC_jobnumber()+ "',");// //72操作电脑的IP地址 	
			sb.append("" +sxbd.getC_bxfhj()+ ",");// //72操作电脑的IP地址
			sb.append("'" +sxbd.getC_date()+ "',");// //72操作电脑的IP地址 
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 	 
			Statement st = connection.createStatement();
			System.out.println(sb.toString());
			st.executeUpdate(sb.toString());  		 
			sqlrecord(connection, "p_sxbd_sx", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	
	//	 保单发放
	public void sxbdff(Sxbd sxbd, Staff op) throws SQLException {		
		Connection connection = DB_MS2K.getConnection(); 
		StringBuffer sb=null; 
		try {
			Statement st = connection.createStatement();
			for(int i=0;i<sxbd.getC_id().length;i++)
			{
				sb = new StringBuffer(" p_sxbd_ff "); 
				sb.append("" +sxbd.getC_companyid_temp()[sxbd.getC_id()[i]]+ ",");// //72操作电脑的IP地址
				sb.append("'" +sxbd.getC_tbd_temp()[sxbd.getC_id()[i]]+ "',");// //72操作电脑的IP地址 				 
				sb.append("'" +sxbd.getC_bd_temp()[sxbd.getC_id()[i]]+ "',");// //72操作电脑的IP地址 						 
				sb.append("" + sxbd.getC_orgid_temp()[sxbd.getC_id()[i]]+ ",");// //72操作电脑的IP地址 
				sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
				sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 	 
				System.out.println(sb.toString());
				st.executeUpdate(sb.toString());  		 
				sqlrecord(connection, "p_sxffqd", sb.toString(), op);
				String sql=" p_sxffqd "+sxbd.getC_companyid_temp()[sxbd.getC_id()[i]]+",'"
					+sxbd.getC_bd_temp()[sxbd.getC_id()[i]]+"','"+op.getC_jobnumber()+"','"+op.getC_ip()+"'";
				System.out.println(sql);
				st.executeUpdate(sql);  			
			}					
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		} 
	}	
	
	//	 保单回执
	public void sxbdhz(Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			StringBuffer sb = new StringBuffer(" p_sxbd_hz "); 
			sb.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
			sb.append("'" +sxbd.getC_tbd()+ "',");// //72操作电脑的IP地址 				 
			sb.append("'" +sxbd.getC_bd()+ "',");// //72操作电脑的IP地址 		
			sb.append("'" +sxbd.getC_date()+ "',");// //72操作电脑的IP地址 		
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 	 
			Statement st = connection.createStatement();
			System.out.println(sb.toString());
			st.executeUpdate(sb.toString());  		 
			sqlrecord(connection, "p_sxbd_hz", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	
	//	 保单退保
	public void sxbdtb(Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			StringBuffer sb = new StringBuffer(" p_sxbd_tb "); 
			sb.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
			sb.append("'" +sxbd.getC_tbd()+ "',");// //72操作电脑的IP地址 				 
			sb.append("'" +sxbd.getC_bd()+ "',");// //72操作电脑的IP地址 		
			sb.append("" +sxbd.getC_type()+ ",");// //72操作电脑的IP地址 	
			sb.append("'" + sxbd.getC_date() + "',");// //71操作员
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 	 
			Statement st = connection.createStatement();
			System.out.println(sb.toString());
			st.executeUpdate(sb.toString());  		 
			sqlrecord(connection, "p_sxbd_tb", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 保单日期修改 
	public void sxbdrq(Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			StringBuffer sb = new StringBuffer(" p_sxbd_rq "); 
			sb.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
			sb.append("'" +sxbd.getC_tbd()+ "',");// //72操作电脑的IP地址 		 
			sb.append("'" +sxbd.getC_jobnm()+ "',");// //72操作电脑的IP地址 	
			sb.append("'" +sxbd.getC_date()+ "',");// //72操作电脑的IP地址 	
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 	 
			Statement st = connection.createStatement();
			System.out.println(sb.toString());
			st.executeUpdate(sb.toString());  		 
			sqlrecord(connection, "p_sxbd_rq", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 保单状态恢复
	public void sxbdback(Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			StringBuffer sb = new StringBuffer(" p_sxbd_back "); 
			sb.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
			sb.append("'" +sxbd.getC_tbd()+ "',");// //72操作电脑的IP地址 		 
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 	 
			Statement st = connection.createStatement();
			System.out.println(sb.toString());
			st.executeUpdate(sb.toString());  		 
			sqlrecord(connection, "p_sxbd_back", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	
	//	 检查出保单的相关日期
	public String get_sxbdrq(int c_companyid,String c_tbd,String c_jobnm) throws SQLException { 
		String rq="",sql="";
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			if ("a".equals(c_jobnm)){
				 sql= "select c_tbrq from t_sxbd where c_companyid="+c_companyid+" and c_tbd='"+c_tbd+"' "; 
			}
			if ("b".equals(c_jobnm)){
				 sql= "select c_date from t_sxbdzt where c_companyid="+c_companyid+" and c_tbd='"+c_tbd+"' and c_type=1 "; 
			}
			if ("c".equals(c_jobnm)){
				 sql= "select convert(char(8),c_datime,112) from t_sxbdzt where c_companyid="+c_companyid+" and c_tbd='"+c_tbd+"' and c_type=3 "; 
			}			
			System.out.println(sql);
			ResultSet rs= connection.createStatement().executeQuery(sql); 
			if (rs.next())
			{				  
				rq=rs.getString(1);
			}			 
		} finally {
			DB_MS2K.closeConnection(connection);
		}		
		return rq;
	}
	//	 检查出员工的姓名
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
	//	 检查出工号关联的网点
	public ArrayList<LabelValueBean> get_outlets(String  c_jobnumber)
			throws SQLException {
		ArrayList<LabelValueBean> data = null;
		if ("".equals(c_jobnumber))
			return data;
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select * from t_bankoutlets " +
					"	where c_no in (select c_outletsid from t_bankrelate where c_jobnumber='"+ c_jobnumber+"' and c_flag='0')";
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			lab = new LabelValueBean();
			lab.setValue("-1");
			lab.setLabel("直销");
			data.add(lab);
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
	
	//	 续期发票录入
	public void sxbdxuqi(Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			Statement st = connection.createStatement();
			StringBuffer sb=null;
			for(int i=0;i<sxbd.getC_productid().length;i++)	{
				sb = new StringBuffer(" p_sxtb_xq "); 
				sb.append("" +sxbd.getC_id()[i]+ ",");// //72操作电脑的IP地址
				sb.append("" +sxbd.getC_orgid()+ ",");// //72操作电脑的IP地址 
				sb.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
				sb.append("'" +sxbd.getC_bd()+ "',");// //72操作电脑的IP地址 		 
				sb.append("'" +sxbd.getC_tbrname()+ "',");// //72操作电脑的IP地址 		
				sb.append("" +sxbd.getC_bdnd()+ ",");// //72操作电脑的IP地址
				sb.append("'" +sxbd.getC_code()+ "',");// //72操作电脑的IP地址 	
				sb.append("'" +sxbd.getC_fprq()+ "',");// //72操作电脑的IP地址 	
				sb.append("" +sxbd.getC_productid()[i]+ ",");// //72操作电脑的IP地址
				sb.append("" +sxbd.getC_bxf()[i]+ ",");// //72操作电脑的IP地址				
				sb.append("'" +sxbd.getC_jobnm()+ "',");// //72操作电脑的IP地址 	
				sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
				sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 	 
				System.out.println(sb.toString());
				st.executeUpdate(sb.toString()); 
				sqlrecord(connection, "p_sxtb_xq", sb.toString(), op);
			}			 		 
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	
	//	 寿险报案
	public void sxlpba(Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			StringBuffer sb = new StringBuffer(" exec p_sxlpba "); 
			sb.append("" +sxbd.getC_no()+ ",");// //72操作电脑的IP地址
			sb.append("" +sxbd.getC_orgid()+ ",");// //72操作电脑的IP地址
			sb.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
			sb.append("'" +sxbd.getC_bd()+ "',");// //72操作电脑的IP地址 		 
			sb.append("'" +sxbd.getC_tbrname()+ "',");// //72操作电脑的IP地址 	
			sb.append("'" +sxbd.getC_barq()+ "',");// //72操作电脑的IP地址 	
			sb.append(" ? ,"); // 内容 
			sb.append("'" + sxbd.getC_jobnm() + "',");// //71操作员
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 	  
			System.out.println(sb.toString());
			PreparedStatement ps=connection.prepareStatement(sb.toString()); 
			ps.setString(1, sxbd.getC_basm());
			ps.executeUpdate();
			sqlrecord(connection, "p_sxlpba", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	
	//	 寿险结案
	public void sxlpja(Sxbd sxbd, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection(); 
		try {		
			StringBuffer sb = new StringBuffer(" exec p_sxlpja "); 
			sb.append("" +sxbd.getC_no()+ ",");// //72操作电脑的IP地址
			sb.append("" +sxbd.getC_orgid()+ ",");// //72操作电脑的IP地址
			sb.append("" +sxbd.getC_companyid()+ ",");// //72操作电脑的IP地址
			sb.append("'" +sxbd.getC_bd()+ "',");// //72操作电脑的IP地址 		  
			sb.append("'" +sxbd.getC_jarq()+ "',");// //72操作电脑的IP地址 	
			sb.append("?,");// //72操作电脑的IP地址 	
			sb.append("" +sxbd.getC_jajg()+ ",");// //72操作电脑的IP地址
			sb.append("" +sxbd.getC_je()+ ",");// //72操作电脑的IP地址
			sb.append("'" + sxbd.getC_bdzt() + "',");// //71操作员
			sb.append("'" + sxbd.getC_jobnm() + "',");// //71操作员
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 	  
			System.out.println(sb.toString());
			PreparedStatement ps=connection.prepareStatement(sb.toString()); 
			ps.setString(1, sxbd.getC_jasm());
			ps.executeUpdate();
			sqlrecord(connection, "p_sxlpja", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
 
}
