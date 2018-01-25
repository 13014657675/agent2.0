package com.object;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import org.apache.struts.util.LabelValueBean;

import com.publics.DB_MS2K;
import com.publics.MD5;

public class Staff extends Base {

	private static final long serialVersionUID = 1L;

	private int c_no; // 工号

	private int c_orgid;
	
	private int o_orgid;

	private String c_name; // 姓名

	private String c_jobnumber; // 工号

	private String c_sex; // 性别 1，男 0，女

	private String c_birthday; // 出生日期

	private int c_age; // 年龄

	private String c_nation; // 民族code

	private String c_politics; // 政治面貌code

	private String c_education; // 学历code

	private String c_marriage; // 婚姻code

	private String c_healthy; // 健康code

	private String c_blood; // 血型code

	private String c_certificatetype; // 证件类型code

	private String c_certificate; // 证件号码code

	private String c_native; // 籍贯

	private String c_registerplace; // 户口所在地

	private String c_livein; // 常住地

	private String c_zipcode; // 邮编

	private String c_telephone; // 固定电话

	private String c_mobilephone; // 手机

	private String c_email; // email

	private String c_hobby; // 爱好

	private String c_contactname; // 紧急联系人姓名

	private String c_contactphone; // 紧急联系人电话

	private String c_foreign; // 外语水平

	private String c_computer; // 电脑水平

	private String c_workdate; // 参加工作日期

	private String c_bank; // 银行code

	private String c_bankcode; // 银行卡号code
	
	private String c_qualificate; //资格证号

	private String c_quitdate; // 离职日期

	private String c_sqi1; // 起日期

	private String c_sqi2;

	private String c_sqi3;

	private String c_szhi1; // 止日期

	private String c_szhi2;

	private String c_szhi3;

	private String c_school1; // 学校

	private String c_school2;

	private String c_school3;

	private String c_professional1; // 专业

	private String c_professional2;

	private String c_professional3;

	private String c_wqi1; // 起日期

	private String c_wqi2;

	private String c_wqi3;
	
	private String c_wqi4; 

	private String c_wqi5;

	private String c_wqi6;

	private String c_wzhi1; // 止日期

	private String c_wzhi2;

	private String c_wzhi3;
	
	private String c_wzhi4; 

	private String c_wzhi5;

	private String c_wzhi6;

	private String c_worknote1; // 工作经历

	private String c_worknote2;

	private String c_worknote3;
	
	private String c_worknote4;

	private String c_worknote5;

	private String c_worknote6;

	private String c_worker1; // 职位

	private String c_worker2;

	private String c_worker3;
	
	private String c_worker4; 

	private String c_worker5;

	private String c_worker6;

	private String c_name1;

	private String c_name2;

	private String c_name3;

	private String c_call1;

	private String c_call2;

	private String c_call3;

	private String c_company1;

	private String c_company2;

	private String c_company3;

	private String c_address1;

	private String c_address2;

	private String c_address3;

	private String c_note;

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;
	/*-------------------------------------------------*/

	private int c_orgtypeid;

	private int c_deptid;

	private int c_postid[];

	private int c_postid1;

	private int c_postid2;

	private String c_xitong;

	private String c_menu[];

	private String c_pwd;

	private int c_mark;

	/*-------------------------------------------------*/

	private int c_pclass;

	private int c_state;

	/*-------------------------------------------------*/ 

	private int c_system;

	private String c_tjrgh;

	private int c_type;	  
	
	private String c_ksrq;
	
	private int c_type_sxr;
	
	private String c_jobnumber_sxr;
	
	private int c_type_xq;
	
	private String c_jobnumber_xq;

	public String getC_address1() {
		return c_address1;
	}

	public void setC_address1(String c_address1) {
		this.c_address1 = c_address1;
	}

	public String getC_address2() {
		return c_address2;
	}

	public void setC_address2(String c_address2) {
		this.c_address2 = c_address2;
	}

	public String getC_address3() {
		return c_address3;
	}

	public void setC_address3(String c_address3) {
		this.c_address3 = c_address3;
	}

	public int getC_age() {
		return c_age;
	}

	public void setC_age(int c_age) {
		this.c_age = c_age;
	}

	public String getC_birthday() {
		return c_birthday;
	}

	public void setC_birthday(String c_birthday) {
		this.c_birthday = c_birthday;
	}

	public String getC_blood() {
		return c_blood;
	}

	public void setC_blood(String c_blood) {
		this.c_blood = c_blood;
	}

	public String getC_call1() {
		return c_call1;
	}

	public void setC_call1(String c_call1) {
		this.c_call1 = c_call1;
	}

	public String getC_call2() {
		return c_call2;
	}

	public void setC_call2(String c_call2) {
		this.c_call2 = c_call2;
	}

	public String getC_call3() {
		return c_call3;
	}

	public void setC_call3(String c_call3) {
		this.c_call3 = c_call3;
	}

	public String getC_certificate() {
		return c_certificate;
	}

	public void setC_certificate(String c_certificate) {
		this.c_certificate = c_certificate;
	}

	public String getC_certificatetype() {
		return c_certificatetype;
	}

	public void setC_certificatetype(String c_certificatetype) {
		this.c_certificatetype = c_certificatetype;
	}

	public String getC_company1() {
		return c_company1;
	}

	public void setC_company1(String c_company1) {
		this.c_company1 = c_company1;
	}

	public String getC_company2() {
		return c_company2;
	}

	public void setC_company2(String c_company2) {
		this.c_company2 = c_company2;
	}

	public String getC_company3() {
		return c_company3;
	}

	public void setC_company3(String c_company3) {
		this.c_company3 = c_company3;
	}

	public String getC_computer() {
		return c_computer;
	}

	public void setC_computer(String c_computer) {
		this.c_computer = c_computer;
	}

	public String getC_contactname() {
		return c_contactname;
	}

	public void setC_contactname(String c_contactname) {
		this.c_contactname = c_contactname;
	}

	public String getC_contactphone() {
		return c_contactphone;
	}

	public void setC_contactphone(String c_contactphone) {
		this.c_contactphone = c_contactphone;
	}

	public Date getC_datime() {
		return c_datime;
	}

	public void setC_datime(Date c_datime) {
		this.c_datime = c_datime;
	}

	public String getC_education() {
		return c_education;
	}

	public void setC_education(String c_education) {
		this.c_education = c_education;
	}

	public String getC_email() {
		return c_email;
	}

	public void setC_email(String c_email) {
		this.c_email = c_email;
	}

	public String getC_foreign() {
		return c_foreign;
	}

	public void setC_foreign(String c_foreign) {
		this.c_foreign = c_foreign;
	}

	public String getC_healthy() {
		return c_healthy;
	}

	public void setC_healthy(String c_healthy) {
		this.c_healthy = c_healthy;
	}

	public String getC_hobby() {
		return c_hobby;
	}

	public void setC_hobby(String c_hobby) {
		this.c_hobby = c_hobby;
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

	public String getC_livein() {
		return c_livein;
	}

	public void setC_livein(String c_livein) {
		this.c_livein = c_livein;
	}

	public String getC_marriage() {
		return c_marriage;
	}

	public void setC_marriage(String c_marriage) {
		this.c_marriage = c_marriage;
	}

	public String getC_mobilephone() {
		return c_mobilephone;
	}

	public void setC_mobilephone(String c_mobilephone) {
		this.c_mobilephone = c_mobilephone;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
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

	public String getC_nation() {
		return c_nation;
	}

	public void setC_nation(String c_nation) {
		this.c_nation = c_nation;
	}

	public String getC_native() {
		return c_native;
	}

	public void setC_native(String c_native) {
		this.c_native = c_native;
	}

	public int getC_no() {
		return c_no;
	}

	public int getC_mark() {
		return c_mark;
	}

	public void setC_mark(int c_mark) {
		this.c_mark = c_mark;
	}

	public void setC_no(int c_no) {
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

	public String getC_politics() {
		return c_politics;
	}

	public void setC_politics(String c_politics) {
		this.c_politics = c_politics;
	}

	public String getC_professional1() {
		return c_professional1;
	}

	public void setC_professional1(String c_professional1) {
		this.c_professional1 = c_professional1;
	}

	public String getC_professional2() {
		return c_professional2;
	}

	public void setC_professional2(String c_professional2) {
		this.c_professional2 = c_professional2;
	}

	public String getC_professional3() {
		return c_professional3;
	}

	public void setC_professional3(String c_professional3) {
		this.c_professional3 = c_professional3;
	}

	public String getC_quitdate() {
		return c_quitdate;
	}

	public void setC_quitdate(String c_quitdate) {
		this.c_quitdate = c_quitdate;
	}

	public String getC_registerplace() {
		return c_registerplace;
	}

	public void setC_registerplace(String c_registerplace) {
		this.c_registerplace = c_registerplace;
	}

	public String getC_school1() {
		return c_school1;
	}

	public void setC_school1(String c_school1) {
		this.c_school1 = c_school1;
	}

	public String getC_school2() {
		return c_school2;
	}

	public void setC_school2(String c_school2) {
		this.c_school2 = c_school2;
	}

	public String getC_school3() {
		return c_school3;
	}

	public void setC_school3(String c_school3) {
		this.c_school3 = c_school3;
	}

	public String getC_sex() {
		return c_sex;
	}

	public void setC_sex(String c_sex) {
		this.c_sex = c_sex;
	}

	public String getC_sqi1() {
		return c_sqi1;
	}

	public void setC_sqi1(String c_sqi1) {
		this.c_sqi1 = c_sqi1;
	}

	public String getC_sqi2() {
		return c_sqi2;
	}

	public void setC_sqi2(String c_sqi2) {
		this.c_sqi2 = c_sqi2;
	}

	public String getC_sqi3() {
		return c_sqi3;
	}

	public void setC_sqi3(String c_sqi3) {
		this.c_sqi3 = c_sqi3;
	}

	public String getC_szhi1() {
		return c_szhi1;
	}

	public void setC_szhi1(String c_szhi1) {
		this.c_szhi1 = c_szhi1;
	}

	public String getC_szhi2() {
		return c_szhi2;
	}

	public void setC_szhi2(String c_szhi2) {
		this.c_szhi2 = c_szhi2;
	}

	public String getC_szhi3() {
		return c_szhi3;
	}

	public void setC_szhi3(String c_szhi3) {
		this.c_szhi3 = c_szhi3;
	}

	public String getC_telephone() {
		return c_telephone;
	}

	public void setC_telephone(String c_telephone) {
		this.c_telephone = c_telephone;
	}

	public String getC_worker1() {
		return c_worker1;
	}

	public void setC_worker1(String c_worker1) {
		this.c_worker1 = c_worker1;
	}

	public String getC_worker2() {
		return c_worker2;
	}

	public void setC_worker2(String c_worker2) {
		this.c_worker2 = c_worker2;
	}

	public String getC_worker3() {
		return c_worker3;
	}

	public void setC_worker3(String c_worker3) {
		this.c_worker3 = c_worker3;
	}

	public String getC_worknote1() {
		return c_worknote1;
	}

	public void setC_worknote1(String c_worknote1) {
		this.c_worknote1 = c_worknote1;
	}

	public String getC_worknote2() {
		return c_worknote2;
	}

	public void setC_worknote2(String c_worknote2) {
		this.c_worknote2 = c_worknote2;
	}

	public String getC_worknote3() {
		return c_worknote3;
	}

	public void setC_worknote3(String c_worknote3) {
		this.c_worknote3 = c_worknote3;
	}

	public String getC_wqi1() {
		return c_wqi1;
	}

	public void setC_wqi1(String c_wqi1) {
		this.c_wqi1 = c_wqi1;
	}

	public String getC_wqi2() {
		return c_wqi2;
	}

	public void setC_wqi2(String c_wqi2) {
		this.c_wqi2 = c_wqi2;
	}

	public String getC_wqi3() {
		return c_wqi3;
	}

	public void setC_wqi3(String c_wqi3) {
		this.c_wqi3 = c_wqi3;
	}

	public String getC_wzhi1() {
		return c_wzhi1;
	}

	public void setC_wzhi1(String c_wzhi1) {
		this.c_wzhi1 = c_wzhi1;
	}

	public String getC_wzhi2() {
		return c_wzhi2;
	}

	public void setC_wzhi2(String c_wzhi2) {
		this.c_wzhi2 = c_wzhi2;
	}

	public String getC_wzhi3() {
		return c_wzhi3;
	}

	public void setC_wzhi3(String c_wzhi3) {
		this.c_wzhi3 = c_wzhi3;
	}

	public String getC_zipcode() {
		return c_zipcode;
	}

	public void setC_zipcode(String c_zipcode) {
		this.c_zipcode = c_zipcode;
	}

	public int[] getC_postid() {
		return c_postid;
	}

	public void setC_postid(int[] c_postid) {
		this.c_postid = c_postid;
	}

	public String getC_pwd() {
		return c_pwd;
	}

	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}

	public String getC_xitong() {
		return c_xitong;
	}

	public void setC_xitong(String c_xitong) {
		this.c_xitong = c_xitong;
	}

	public String[] getC_menu() {
		return c_menu;
	}

	public void setC_menu(String[] c_menu) {
		this.c_menu = c_menu;
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

	public String getC_workdate() {
		return c_workdate;
	}

	public void setC_workdate(String c_workdate) {
		this.c_workdate = c_workdate;
	}

	public int getC_deptid() {
		return c_deptid;
	}

	public void setC_deptid(int c_deptid) {
		this.c_deptid = c_deptid;
	}

	public int getC_orgid() {
		return c_orgid;
	}

	public void setC_orgid(int c_orgid) {
		this.c_orgid = c_orgid;
	}

	public int getC_orgtypeid() {
		return c_orgtypeid;
	}

	public void setC_orgtypeid(int c_orgtypeid) {
		this.c_orgtypeid = c_orgtypeid;
	}

	public String getC_jobnumber() {
		return c_jobnumber;
	}

	public void setC_jobnumber(String c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	}

	public int getC_postid1() {
		return c_postid1;
	}

	public void setC_postid1(int c_postid1) {
		this.c_postid1 = c_postid1;
	}

	public int getC_postid2() {
		return c_postid2;
	}

	public void setC_postid2(int c_postid2) {
		this.c_postid2 = c_postid2;
	}

	public int getC_pclass() {
		return c_pclass;
	}

	public void setC_pclass(int c_pclass) {
		this.c_pclass = c_pclass;
	}

	public int getC_state() {
		return c_state;
	}

	public void setC_state(int c_state) {
		this.c_state = c_state;
	}	

	public String getC_qualificate() {
		return c_qualificate;
	}

	public void setC_qualificate(String c_qualificate) {
		this.c_qualificate = c_qualificate;
	}

	public String getC_jobnumber_sxr() {
		return c_jobnumber_sxr;
	}

	public void setC_jobnumber_sxr(String c_jobnumber_sxr) {
		this.c_jobnumber_sxr = c_jobnumber_sxr;
	}

	public String getC_jobnumber_xq() {
		return c_jobnumber_xq;
	}

	public void setC_jobnumber_xq(String c_jobnumber_xq) {
		this.c_jobnumber_xq = c_jobnumber_xq;
	}

	public String getC_ksrq() {
		return c_ksrq;
	}

	public void setC_ksrq(String c_ksrq) {
		this.c_ksrq = c_ksrq;
	}

	public int getC_system() {
		return c_system;
	}

	public void setC_system(int c_system) {
		this.c_system = c_system;
	}

	public String getC_tjrgh() {
		return c_tjrgh;
	}

	public void setC_tjrgh(String c_tjrgh) {
		this.c_tjrgh = c_tjrgh;
	}

	public int getC_type() {
		return c_type;
	}

	public void setC_type(int c_type) {
		this.c_type = c_type;
	}

	public int getC_type_sxr() {
		return c_type_sxr;
	}

	public void setC_type_sxr(int c_type_sxr) {
		this.c_type_sxr = c_type_sxr;
	}

	public int getC_type_xq() {
		return c_type_xq;
	}

	public void setC_type_xq(int c_type_xq) {
		this.c_type_xq = c_type_xq;
	}

	public int getO_orgid() {
		return o_orgid;
	}

	public void setO_orgid(int o_orgid) {
		this.o_orgid = o_orgid;
	}
	
	public String getC_worker4() {
		return c_worker4;
	}

	public void setC_worker4(String c_worker4) {
		this.c_worker4 = c_worker4;
	}

	public String getC_worker5() {
		return c_worker5;
	}

	public void setC_worker5(String c_worker5) {
		this.c_worker5 = c_worker5;
	}

	public String getC_worker6() {
		return c_worker6;
	}

	public void setC_worker6(String c_worker6) {
		this.c_worker6 = c_worker6;
	}

	public String getC_worknote4() {
		return c_worknote4;
	}

	public void setC_worknote4(String c_worknote4) {
		this.c_worknote4 = c_worknote4;
	}

	public String getC_worknote5() {
		return c_worknote5;
	}

	public void setC_worknote5(String c_worknote5) {
		this.c_worknote5 = c_worknote5;
	}

	public String getC_worknote6() {
		return c_worknote6;
	}

	public void setC_worknote6(String c_worknote6) {
		this.c_worknote6 = c_worknote6;
	}

	public String getC_wqi4() {
		return c_wqi4;
	}

	public void setC_wqi4(String c_wqi4) {
		this.c_wqi4 = c_wqi4;
	}

	public String getC_wqi5() {
		return c_wqi5;
	}

	public void setC_wqi5(String c_wqi5) {
		this.c_wqi5 = c_wqi5;
	}

	public String getC_wqi6() {
		return c_wqi6;
	}

	public void setC_wqi6(String c_wqi6) {
		this.c_wqi6 = c_wqi6;
	}

	public String getC_wzhi4() {
		return c_wzhi4;
	}

	public void setC_wzhi4(String c_wzhi4) {
		this.c_wzhi4 = c_wzhi4;
	}

	public String getC_wzhi5() {
		return c_wzhi5;
	}

	public void setC_wzhi5(String c_wzhi5) {
		this.c_wzhi5 = c_wzhi5;
	}

	public String getC_wzhi6() {
		return c_wzhi6;
	}

	public void setC_wzhi6(String c_wzhi6) {
		this.c_wzhi6 = c_wzhi6;
	}

	// ////////////////////////////////////////////////////////////////////////////////////////////////-//
	public Staff() {
		// TODO Auto-generated constructor stub
	}
	public Staff getstaff(String c_jobnumber) throws SQLException {
		Staff staff=new Staff(); 
		Connection connection = DB_MS2K.getConnection();
		String sql = " select * from t_staff where c_jobnumber = '"
				+ c_jobnumber + "'";
		try {
			ResultSet rs = connection.createStatement().executeQuery(sql);
			if (rs.next()) {
				staff.c_no = rs.getInt("c_no");
				staff.c_jobnumber = rs.getString("c_jobnumber").toString();
				staff.c_name = rs.getString("c_name").toString();
				staff.c_orgid = Integer.parseInt(rs.getString("c_orgid")); 
				staff.c_certificate=rs.getString("c_certificate"); 
				staff.c_mobilephone=rs.getString("c_mobilephone");  
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return staff;
	}
	// 基本资料sql
	public String staff_sql(Staff s, Staff op) {
		StringBuffer sb = new StringBuffer(" exec p_staff ");
		sb.append("" + s.getC_no() + ",");// //id 
		sb.append("" + s.getC_orgid() + ",");// //机构id
		sb.append("'" + s.getC_name().trim() + "',");// //4员工姓名
		sb.append("'" + s.getC_sex().trim() + "',");// //5性别
		sb.append("'" + s.getC_birthday().trim() + "',");// //6出生日期
		sb.append("" + s.getC_age() + ",");// //4员工年龄
		sb.append("'" + s.getC_nation().trim() + "',");// //7民族
		sb.append("'" + s.getC_politics().trim() + "',");// //10政治面貌
		sb.append("'" + s.getC_education().trim() + "',");// //11文化程度
		sb.append("'" + s.getC_marriage().trim() + "',");// //8婚姻状况
		sb.append("'" + s.getC_healthy().trim() + "',");// //9健康状况
		sb.append("'" + s.getC_blood().trim() + "',");// //12血型
		sb.append("'" + s.getC_certificatetype().trim() + "',");// //13证件类型
		sb.append("'" + s.getC_certificate().trim() + "',");// //14证件号码
		sb.append("'" + s.getC_native().trim() + "',");// //15籍贯
		sb.append("'" + s.getC_registerplace().trim() + "',");// //16户口所在地
		sb.append("'" + s.getC_livein().trim() + "',");// //17常住地址
		sb.append("'" + s.getC_zipcode().trim() + "',");// //17邮编
		sb.append("'" + s.getC_telephone().trim() + "',");// //17固定电话
		sb.append("'" + s.getC_mobilephone().trim() + "',");// //18手机
		sb.append("'" + s.getC_email().trim() + "',");// //19email
		sb.append("'" + s.getC_hobby().trim() + "',");// //20爱好
		sb.append("'" + s.getC_contactname().trim() + "',");// //20紧急联系人姓名
		sb.append("'" + s.getC_contactphone().trim() + "',");// //20紧急联系人电话
		sb.append("'" + s.getC_foreign().trim() + "',");// //21外语水平
		sb.append("'" + s.getC_computer().trim() + "',");// //22电脑水平
		sb.append("'" + s.getC_workdate().trim() + "',");// //20参加工作日期
		sb.append("'" + s.getC_bank().trim() + "',");// //21银行
		sb.append("'" + s.getC_bankcode().trim() + "',");// //22银行卡号
		sb.append("'" + s.getC_qualificate().trim() + "',");// //资格证号
		sb.append("'" + s.getC_sqi1().trim() + "',");// //23起日期
		sb.append("'" + s.getC_sqi2().trim() + "',");// //24
		sb.append("'" + s.getC_sqi3().trim() + "',");// //25
		sb.append("'" + s.getC_szhi1().trim() + "',");// //26至日期
		sb.append("'" + s.getC_szhi2().trim() + "',");// //27
		sb.append("'" + s.getC_szhi3().trim() + "',");// //28
		sb.append("'" + s.getC_school1().trim() + "',");// //29学校
		sb.append("'" + s.getC_school2().trim() + "',");// //30
		sb.append("'" + s.getC_school3().trim() + "',");// //31
		sb.append("'" + s.getC_professional1().trim() + "',");// //32专业
		sb.append("'" + s.getC_professional2().trim() + "',");// //33
		sb.append("'" + s.getC_professional3().trim() + "',");// //34
		sb.append("'" + s.getC_wqi1().trim() + "',");// //35起日期
		sb.append("'" + s.getC_wqi2().trim() + "',");// //36
		sb.append("'" + s.getC_wqi3().trim() + "',");// //37
		sb.append("'" + s.getC_wqi4().trim() + "',");// //35
		sb.append("'" + s.getC_wqi5().trim() + "',");// //36
		sb.append("'" + s.getC_wqi6().trim() + "',");// //37
		sb.append("'" + s.getC_wzhi1().trim() + "',");// //38至日期
		sb.append("'" + s.getC_wzhi2().trim() + "',");// //39
		sb.append("'" + s.getC_wzhi3().trim() + "',");// //40
		sb.append("'" + s.getC_wzhi4().trim() + "',");// //38
		sb.append("'" + s.getC_wzhi5().trim() + "',");// //39
		sb.append("'" + s.getC_wzhi6().trim() + "',");// //40
		sb.append("'" + s.getC_worknote1().trim() + "',");// //41工作经历
		sb.append("'" + s.getC_worknote2().trim() + "',");// //42
		sb.append("'" + s.getC_worknote3().trim() + "',");// //43
		sb.append("'" + s.getC_worknote4().trim() + "',");// //41
		sb.append("'" + s.getC_worknote5().trim() + "',");// //42
		sb.append("'" + s.getC_worknote6().trim() + "',");// //43
		sb.append("'" + s.getC_worker1().trim() + "',");// //44职位
		sb.append("'" + s.getC_worker2().trim() + "',");// //45
		sb.append("'" + s.getC_worker3().trim() + "',");// //46
		sb.append("'" + s.getC_worker4().trim() + "',");// //44
		sb.append("'" + s.getC_worker5().trim() + "',");// //45
		sb.append("'" + s.getC_worker6().trim() + "',");// //46
		sb.append("'" + s.getC_name1().trim() + "',");// //47姓名
		sb.append("'" + s.getC_name2().trim() + "',");// //48
		sb.append("'" + s.getC_name3().trim() + "',");// //49
		sb.append("'" + s.getC_call1().trim() + "',");// //50称谓
		sb.append("'" + s.getC_call2().trim() + "',");// //51
		sb.append("'" + s.getC_call3().trim() + "',");// //52
		sb.append("'" + s.getC_company1().trim() + "',");// //53工作单位
		sb.append("'" + s.getC_company2().trim() + "',");// //54
		sb.append("'" + s.getC_company3().trim() + "',");// //55
		sb.append("'" + s.getC_address1().trim() + "',");// //56单位地址
		sb.append("'" + s.getC_address2().trim() + "',");// //57
		sb.append("'" + s.getC_address3().trim() + "',");// //58
		sb.append("'" + s.getC_note().trim() + "',");// //68备注
		sb.append("'" + s.getC_jobnm().trim() + "',");// //68jobnm
		sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
		sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
		System.out.println(sb.toString());
		return sb.toString();
	}
	// 员工岗位职位添加sql
	public ArrayList<String> post_sql(Staff s, String c_jobnumber, Staff op) {
		ArrayList<String> s2 = new ArrayList<String>();
		StringBuffer sb = null;
		// 职位
		if (s.getC_postid1() != -1) {
			sb = new StringBuffer(" p_postset ");
			sb.append("" + s.getC_no() + ",");// //
			sb.append("'" + c_jobnumber + "',");// //工号
			sb.append("" + s.getC_orgid() + ",");// //机构id 
			sb.append("" + s.getC_postid1() + ",");// //岗位id
			sb.append("'" + s.getC_jobnm() + "',");// //72作业名
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			System.out.println(sb.toString());
			s2.add(sb.toString());			 
		}
		// 岗位
		if (s.getC_postid2() != -1) {
			sb = new StringBuffer(" p_postset ");
			sb.append("" + s.getC_no() + ",");// //
			sb.append("'" + c_jobnumber + "',");// //工号
			sb.append("" + s.getC_orgid() + ",");// //机构id 
			sb.append("" + s.getC_postid2() + ",");// //岗位id
			sb.append("'" + s.getC_jobnm() + "',");// //72作业名
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			System.out.println(sb.toString());
			s2.add(sb.toString()); 
		}
		// 兼职
		if (s.getC_postid() != null) {
		for (int i = 0; i < s.getC_postid().length; i++) {
			sb = new StringBuffer(" p_postset ");
			sb.append("" + s.getC_no() + ",");// //
			sb.append("'" + c_jobnumber + "',");// //工号
			sb.append("" + s.getC_orgid() + ",");// //机构id 
			sb.append("" + s.getC_postid()[i] + ",");// //岗位id
			sb.append("'" + s.getC_jobnm() + "',");// //72作业名
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			System.out.println(sb.toString());
			s2.add(sb.toString()); 
		}
		}
		return s2;
	}
	// 内勤员工入司
	public String  staff_add(Staff s1, Staff s2, Staff s3, Staff op)
			throws SQLException {
		String c_jobnumber = "";
		Connection connection = DB_MS2K.getConnection();
		try {
			Statement st = connection.createStatement();
			String sql1 = staff_sql(s1, op);
			ResultSet rs1 = st.executeQuery(sql1);
			if (rs1.next()) {
				c_jobnumber = rs1.getString(1);
			}
			sqlrecord(connection, "p_staff", sql1, op);
			ArrayList<String> sql2 = post_sql(s2, c_jobnumber, op);
			for (String x : sql2) {
				st.executeUpdate(x);
				sqlrecord(connection, "p_staff", x, op);
			}
			StringBuffer sb = new StringBuffer(" p_payset ");
			sb.append("" + s3.getC_no() + ",");// //
			sb.append("'" + c_jobnumber + "',");// //系统id
			sb.append("" + s3.getC_pclass() + ",");// //等级
			sb.append("" + s3.getC_state() + ",");// //状态
			sb.append("'" + s3.getC_jobnm() + "',");// //状态
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			System.out.println(sb.toString());
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_payset", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return c_jobnumber;
	}	
	//	 员工删除
	public void staff_delete(Staff s, Staff op) throws SQLException { 
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_staffdel ");
			sb.append("'" + s.getC_jobnumber() + "'");// //工号 			  
			System.out.println(sb.toString());
			Statement st = connection.createStatement();
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_staffdel", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 基本资料修改
	public void staffset(Staff s, Staff op) throws SQLException { 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql=staff_sql(s,op);	   
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_staff", sql, op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 职位岗位修改
	public void postset(Staff s, Staff op) throws SQLException { 
		Connection connection = DB_MS2K.getConnection();
		try {			   
			Statement st = connection.createStatement();
			String sql="delete t_postset where c_jobnumber='"+s.getC_jobnumber()+"'";
			st.executeUpdate(sql);
			ArrayList<String> sql2 = post_sql(s, s.getC_jobnumber(), op);
			for (String x : sql2) {
				st.executeUpdate(x);
				sqlrecord(connection, "p_postset", x, op);
			} 
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 薪酬等级调整
	public void payset(Staff s, Staff op) throws SQLException { 
		Connection connection = DB_MS2K.getConnection();
		try {			   
			Statement st = connection.createStatement();
			StringBuffer sb = new StringBuffer(" p_payset ");
			sb.append("" + s.getC_no() + ",");// //
			sb.append("'" + s.getC_jobnumber() + "',");// //系统id
			sb.append("" + s.getC_pclass() + ",");// //等级
			sb.append("" + s.getC_state() + ",");// //状态
			sb.append("'" + s.getC_jobnm() + "',");// //状态
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			System.out.println(sb.toString());
			st.executeUpdate(sb.toString());			 
			sqlrecord(connection, "p_payset", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 机构负责人设置
	public void orghead(Staff s, Staff op) throws SQLException { 
		Connection connection = DB_MS2K.getConnection();
		try {			   
			Statement st = connection.createStatement();
			StringBuffer sb = new StringBuffer(" p_orghead ");		
			sb.append("" + s.getC_orgid() + ",");// //等级
			sb.append("'" + s.getC_jobnumber() + "' ");// //系统id			 
			System.out.println(sb.toString());
			st.executeUpdate(sb.toString());			 
			sqlrecord(connection, "p_orghead", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	// 员工权限
	public void staffqx(Staff s, Staff op) throws SQLException {
		String ms = "";
		for (String m : s.getC_menu()) {
			ms += m + ",";
		}
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_staffqx ");
			sb.append("'" + s.getC_jobnumber() + "',");// //工号
			sb.append("'" + s.getC_xitong() + "',");// //系统id
			sb.append("'" + ms + "',");// //72菜单
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			sb.toString();
			System.out.println(sb.toString());
			Statement st = connection.createStatement();
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_staffqx", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	// 权限查询
	public String staffqxcx(Staff s, Staff op) throws SQLException {
		String str = null;
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_staffqxcx ");
			sb.append("'" + s.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + s.getC_xitong() + "'");// //系统id
			System.out.println(sb.toString());
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sb.toString());
			if (rs.next()) {
				str = rs.getString(1);
			}
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return str;
	}
	// 员工登录
	public void login(Staff s, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_login ");
			sb.append("'" + s.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + s.getC_pwd() + "'");// //密码
			System.out.println(sb.toString());
			Statement st = connection.createStatement();
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_login", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	// 员工修改密码
	public void pwdreset(Staff s, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_pwdreset ");
			sb.append("'" + s.getC_jobnumber() + "',");// //71员工id
			sb.append("'" + MD5.MD5Encode(s.getC_pwd()) + "',");// //71密码
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			sb.toString();
			System.out.println(sb.toString());
			Statement st = connection.createStatement();
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_pwdreset", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	// 员工离司
	public void quit(Staff s, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_staffquit ");
			sb.append("'" + s.getC_jobnumber() + "',");// //71员工id 
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址 
			System.out.println(sb.toString());
			Statement st = connection.createStatement();
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_staffquit", sb.toString(), op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 筛选出一个部门的员工
	public ArrayList<LabelValueBean> get_childstaff(int c_deptid) throws SQLException
	{ 
		ArrayList<LabelValueBean> data=null;
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			String sql = "select * from t_staff " +
					"	where c_jobnumber in (select distinct c_jobnumber from t_postset " +
						"	where c_postid in (select c_no from t_post where c_deptid="+c_deptid+") )";	
			ResultSet rs= connection.createStatement().executeQuery(sql);
			LabelValueBean lab;  
			data = new ArrayList<LabelValueBean>();
			while (rs.next())
			{				
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_jobnumber"));
				lab.setLabel(rs.getString("c_name").trim());
				data.add(lab);
			}			 
		} finally {
			DB_MS2K.closeConnection(connection);
		}		
		return data;
	}
	//	 检查出员工的姓名
	public String get_name(String c_jobnumber) throws SQLException
	{ 
		String c_name="";
		Connection connection= DB_MS2K.getConnection();
		try
		{ 
			String sql = "select * from t_staff where c_jobnumber ='"+c_jobnumber+"' ";
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
 
	// 外勤员工入司
	public String  agent_add(Staff s1,  Staff op)
			throws SQLException {
		String c_jobnumber = "";
		Connection connection = DB_MS2K.getConnection();
		try {
			Statement st = connection.createStatement();
			String sql1 = staff_sql(s1, op);
			ResultSet rs1 = st.executeQuery(sql1);
			if (rs1.next()) {
				c_jobnumber = rs1.getString(1);
			}  
			sqlrecord(connection, "p_agent", sql1, op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return c_jobnumber;
	}	
	//	 修改机构 
	public void  agent_org(Staff s1,  Staff op)
			throws SQLException { 
		Connection connection = DB_MS2K.getConnection();
		try {
			Statement st = connection.createStatement();
			StringBuffer sb=new StringBuffer(" p_agent_org ");
			sb.append("" + s1.getC_orgid() + ",");// //机构id 
			sb.append("'"+ s1.getC_jobnumber() + "',");// //工号
			sb.append("" + s1.getO_orgid() + ",");// //目标机构id 
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			String sql = sb.toString();
			System.out.println(sql);
			st.executeUpdate(sql);			 
			sqlrecord(connection, "p_agent_org", sql, op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		} 
	}
	//	 离司人员恢复工号 
	public void  agent_back(Staff s1,  Staff op)
			throws SQLException { 
		Connection connection = DB_MS2K.getConnection();
		try {
			Statement st = connection.createStatement();
			StringBuffer sb=new StringBuffer(" p_agent_back ");
			sb.append("" + s1.getC_orgid() + ",");// //机构id 
			sb.append("'"+ s1.getC_jobnumber() + "',");// //工号
			sb.append("" + s1.getO_orgid() + ",");// //目标机构id 
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			String sql = sb.toString();
			System.out.println(sql);
			st.executeUpdate(sql);			 
			sqlrecord(connection, "p_agent_back", sql, op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		} 
	}
	//	 血缘关系
	public void  agent_relation(Staff s1,  Staff op)
			throws SQLException { 
		Connection connection = DB_MS2K.getConnection();
		try {
			Statement st = connection.createStatement();
			StringBuffer sb=new StringBuffer(" p_relation ");
			sb.append("" + s1.getC_orgid() + ",");// //机构id 
			sb.append("'"+ s1.getC_jobnumber() + "',");// //工号
			sb.append("" + s1.getC_system() + ",");// //机构id 
			sb.append("'"+ s1.getC_tjrgh() + "',");// //工号
			sb.append("'"+ s1.getC_ksrq() + "',");// //开始
			sb.append("'"+ s1.getC_jobnm() + "',");// //开始
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			String sql = sb.toString();
			System.out.println(sql);
			st.executeUpdate(sql);			 
			sqlrecord(connection, "p_relation", sql, op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		} 
	}	 
	//	 职级变动
	public void  agent_zjbd(Staff s1,  Staff op)
			throws SQLException { 
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb=null;
			String c_str=null;
			//直营
			if (s1.getC_system()==1)
			{
				c_str="p_zjbd_1";
				sb=new StringBuffer(" p_zjbd_1 ");
				sb.append("" + s1.getC_orgid() + ",");// //机构id 
				sb.append("" + s1.getC_system() + ",");// //政策id 
				sb.append("'"+ s1.getC_jobnumber() + "',");// //工号
				sb.append("" + s1.getC_type() + ",");// //职级  
				sb.append("'"+ s1.getC_ksrq() + "',");// //开始
				sb.append("'"+ s1.getC_jobnm() + "',");// //
				sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
				sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			} 
			//银行渠道
			if (s1.getC_system()==2)
			{
				c_str="p_zjbd_2";
				sb=new StringBuffer(" p_zjbd_2 ");
				sb.append("" + s1.getC_orgid() + ",");// //机构id 
				sb.append("" + s1.getC_system() + ",");// //政策id 
				sb.append("'"+ s1.getC_jobnumber() + "',");// //工号
				sb.append("" + s1.getC_type() + ",");// //职级  
				sb.append("'"+ s1.getC_ksrq() + "',");// //开始
				sb.append("'"+ s1.getC_jobnm() + "',");// //
				sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
				sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			} 		 
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);			 
			sqlrecord(connection, c_str, sql, op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		} 
	}	 
	//	 离司
	public void  agent_ls(Staff s1,  Staff op)
			throws SQLException { 
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb=null;
			String c_str=null;
			//直营
			if (s1.getC_system()==1)
			{
				c_str="p_zjbd_1_ls";
				sb=new StringBuffer(" p_zjbd_1_ls ");
				sb.append("" + s1.getC_orgid() + ",");// //机构id 
				sb.append("" + s1.getC_system() + ",");// //政策id 
				sb.append("'"+ s1.getC_jobnumber() + "',");// //工号
				sb.append("" + s1.getC_type() + ",");// //职级  
				sb.append("" + s1.getC_type_sxr() + ",");// //职级  
				sb.append("'"+ s1.getC_jobnumber_sxr() + "',");// //开始
				sb.append("" + s1.getC_type_xq() + ",");// //职级  
				sb.append("'"+ s1.getC_jobnumber_xq() + "',");// //开始
				sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
				sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			} 
			//银行渠道
			if (s1.getC_system()==2)
			{
				c_str="p_zjbd_2_ls";
				sb=new StringBuffer(" p_zjbd_2_ls ");
				sb.append("" + s1.getC_orgid() + ",");// //机构id 
				sb.append("" + s1.getC_system() + ",");// //政策id 
				sb.append("'"+ s1.getC_jobnumber() + "',");// //工号 
				sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
				sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			} 		
			//产险
			if (s1.getC_system()==11)
			{
				c_str="p_zjbd_11_ls";
				sb=new StringBuffer(" p_zjbd_11_ls ");
				sb.append("" + s1.getC_orgid() + ",");// //机构id 
				sb.append("" + s1.getC_system() + ",");// //政策id 
				sb.append("'"+ s1.getC_jobnumber() + "',");// //工号 
				sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
				sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			} 	
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);			 
			sqlrecord(connection, c_str, sql, op);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		} 
	}	 

}