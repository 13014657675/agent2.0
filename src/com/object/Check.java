package com.object;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection; 
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.apache.struts.upload.FormFile;
import com.publics.DB_MS2K; 
import com.publics.Tool;
public class Check extends Base {

	private static final long serialVersionUID = 1L;

	private int c_no; // 
	
	private int c_orgid;
	
	private String c_name; // 姓名 
	
	private String c_code[]; 
	
	private int c_ontype;  
	
	private int c_state;  
	
	private int c_type; // 1 一次 2 一天
	
	private double c_deducted;	
	
	private double c_deducted_temp[];	

	private int c_id[];	
	
	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;
	
	private int c_year;
	
	private int c_month;
	
	private String c_date[];
	
	private String c_jobnumber[]; //工号
	
	private String c_morning[];
	
	private String c_afternoon[]; 
	
	private FormFile file; // 文件		
	
	/*-------------------------------------------------*/
		
	public String[] getC_code() {
		return c_code;
	}

	public void setC_code(String[] c_code) {
		this.c_code = c_code;
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

	public int getC_state() {
		return c_state;
	}

	public void setC_state(int c_state) {
		this.c_state = c_state;
	}	
	
	public double getC_deducted() {
		return c_deducted;
	}

	public void setC_deducted(double c_deducted) {
		this.c_deducted = c_deducted;
	}

	public int getC_ontype() {
		return c_ontype;
	}

	public void setC_ontype(int c_ontype) {
		this.c_ontype = c_ontype;
	}

	public int getC_orgid() {
		return c_orgid;
	}

	public void setC_orgid(int c_orgid) {
		this.c_orgid = c_orgid;
	}

	public int getC_type() {
		return c_type;
	}

	public void setC_type(int c_type) {
		this.c_type = c_type;
	}
	
	public int[] getC_id() {
		return c_id;
	}

	public void setC_id(int[] c_id) {
		this.c_id = c_id;
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

	public String getC_operator() {
		return c_operator;
	}

	public void setC_operator(String c_operator) {
		this.c_operator = c_operator;
	} 	

	public String[] getC_afternoon() {
		return c_afternoon;
	}

	public void setC_afternoon(String[] c_afternoon) {
		this.c_afternoon = c_afternoon;
	}   
	 
	public String[] getC_jobnumber() {
		return c_jobnumber;
	}

	public void setC_jobnumber(String[] c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	}

	public String[] getC_morning() {
		return c_morning;
	}

	public void setC_morning(String[] c_morning) {
		this.c_morning = c_morning;
	}  

	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	} 

	public String[] getC_date() {
		return c_date;
	}

	public void setC_date(String[] c_date) {
		this.c_date = c_date;
	}

	public int getC_month() {
		return c_month;
	}

	public void setC_month(int c_month) {
		this.c_month = c_month;
	}

	public int getC_year() {
		return c_year;
	}

	public void setC_year(int c_year) {
		this.c_year = c_year;
	}	

	public double[] getC_deducted_temp() {
		return c_deducted_temp;
	}

	public void setC_deducted_temp(double[] c_deducted_temp) {
		this.c_deducted_temp = c_deducted_temp;
	}

	// ////////////////////////////////////////////////////////////////////////////////////////////////-//
	public Check() {
		// TODO Auto-generated constructor stub
	}
	
	//	 考勤类型
	public void ontype(Check s, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_ontype ");
			sb.append("" + s.getC_no() + ",");// //71员工id  
			sb.append("'" +s.getC_name()+ "',");// //72操作电脑的IP地址
			sb.append("'" +s.getC_code()[0].toUpperCase()+ "',");// //72操作电脑的IP地址 
			sb.append("" + s.getC_state() + ",");// // 
			sb.append("'" +s.getC_jobnm()+ "',");// //72操作电脑的IP地址
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			sb.toString();
			System.out.println(sb.toString());
			Statement st = connection.createStatement();
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_ontype", sb.toString(), op);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}	
	//	 机构考勤类型
	public void ontype2(Check s, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_ontype2 ");
			sb.append("" + s.getC_no() + ",");// //71员工id  
			sb.append("" + s.getC_orgid() + ",");// //71员工id  
			sb.append("" + s.getC_ontype() + ",");// //71员工id  
			sb.append("" + s.getC_type() + ",");// // 
			sb.append("" + s.getC_deducted() + ",");// // 
			sb.append("'" +s.getC_jobnm()+ "',");// //72操作电脑的IP地址
			sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
			sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
			sb.toString();
			System.out.println(sb.toString());
			Statement st = connection.createStatement();
			st.executeUpdate(sb.toString());
			sqlrecord(connection, "p_ontype2", sb.toString(), op);
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	关联工号
	public void onrelate(Check s, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb=null;
			Statement st = connection.createStatement();
			for (int i=0;i<s.getC_jobnumber().length;i++)
			{			 
					sb = new StringBuffer(" p_onrelate ");
					sb.append("'" + s.getC_id()[i] + "',");// //71员工id
					sb.append("" + s.getC_orgid() + ",");// //71员工id
					sb.append("'" + s.getC_jobnumber()[i] + "',");// //71员工id
					sb.append("'" +s.getC_code()[i]+ "',");// //72操作电脑的IP地址					
					sb.append("'" +s.getC_jobnm()+ "',");// //72操作电脑的IP地址
					sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
					sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
					System.out.println(sb.toString());
					st.addBatch(sb.toString());			 
					sqlrecord(connection, "p_onrelate", sb.toString(), op);
			}					
			st.executeBatch();
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	} 	
	//	值勤表导入 
	public void onimport(Check s, Staff op) throws SQLException, BiffException, FileNotFoundException, IOException {
		Connection connection = DB_MS2K.getConnection();
		FormFile file = s.getFile();
		jxl.Workbook wb = null; 
		StringBuffer sb=null;
		try { 			
			//年月
			int year=s.getC_year();
			int month=s.getC_month();
			//读取excel 文件中的内容写入到表中
			wb = Workbook.getWorkbook(file.getInputStream());
			Sheet sheet = wb.getSheet(0);					
			int rows = sheet.getRows();
			int columns=sheet.getColumns();  				
			int dl=(columns-1)/2,sl=rows-2;			 
			String[] date=new String[dl];
			String[] staffid=new String[sl];
			String[][] morning=new String[sl][dl];
			String[][] afternoon=new String[sl][dl];
			Statement st = connection.createStatement(); 
			for (int i = 0 ; i < sl; i++)
			{
				for (int j = 0 ; j < dl; j++)
				{
					
					if (i==0)
					{
						int x=(j+1)*2-1,y=i;
						String temp=sheet.getCell(x, y).getContents();				 
						int day=Integer.parseInt(temp);  
						date[j]=new Tool().getDATE(year,month,day);
						x=(j+1)*2-1;y=i+2;
						morning[i][j]=sheet.getCell(x, y).getContents();  
						x=(j+1)*2;y=i+2;
						afternoon[i][j]=sheet.getCell(x, y).getContents();  
					}
					if (j==0)
					{
						int x=j,y=i+2;
						staffid[i]=sheet.getCell(x, y).getContents();  
						x=(j+1)*2-1;y=i+2;
						morning[i][j]=sheet.getCell(x, y).getContents();  
						x=(j+1)*2;y=i+2;
						afternoon[i][j]=sheet.getCell(x, y).getContents();  
					}
					if (i>0 && j>0)
					{
						int x=(j+1)*2-1,y=i+2;
						morning[i][j]=sheet.getCell(x, y).getContents();  
						x=(j+1)*2;y=i+2;
						afternoon[i][j]=sheet.getCell(x, y).getContents();  
					}								
				}
			}		
			for (int i = 0 ; i < sl; i++)
			{
				for (int j = 0 ; j < dl; j++)
				{
					sb = new StringBuffer(" p_onimport  "); 
					sb.append("" + s.getC_orgid() + ",");// //71员工id					
					sb.append("'" + staffid[i] + "',");// //71员工id
					sb.append("'" +date[j]+ "',");// //72操作电脑的IP地址
					sb.append("'"+morning[i][j].toUpperCase()+"',");// //71员工id					
					sb.append("'"+afternoon[i][j].toUpperCase()+"',");// //71员工id			 
					sb.append("'" +s.getC_jobnm()+ "',");// //72操作电脑的IP地址
					sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
					sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
					System.out.println(sb.toString());
					st.addBatch(sb.toString());	
					sqlrecord(connection, "p_onimport", sb.toString(), op);
				}				
			}			
			st.executeBatch(); 
			connection.commit(); 						
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	
	// 值勤登记
	public void onduty(Check s, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb=null;
			Statement st = connection.createStatement();
			for (int i=0;i<s.getC_jobnumber().length;i++)
			{			 
					sb = new StringBuffer(" p_onduty ");
					sb.append("" + s.getC_id()[i] + ",");// //71员工id
					sb.append("" + s.getC_orgid() + ",");// //71员工id
					sb.append("'" + s.getC_jobnumber()[i] + "',");// //71员工id
					sb.append("'" +s.getC_date()[i]+ "',");// //72操作电脑的IP地址
					sb.append("" + s.getC_morning()[i] + ",");// //71员工id					
					sb.append("" + s.getC_afternoon()[i] + ",");// //71员工id	 	
					sb.append("'" +s.getC_jobnm()+ "',");// //72操作电脑的IP地址
					sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
					sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
					System.out.println(sb.toString());
					st.addBatch(sb.toString());			
					sqlrecord(connection, "p_onduty", sb.toString(), op);
			}					
			st.executeBatch();
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	} 

	//	 值勤汇总
	public void onsummary(Check s, Staff op) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb=null;
			Statement st = connection.createStatement();
			for (int i=0;i<s.getC_jobnumber().length;i++)
			{			 
					sb = new StringBuffer(" p_onsummary ");
					sb.append("" + s.getC_id()[i] + ",");// //71员工id
					sb.append("" + s.getC_orgid() + ",");// //71员工id
					sb.append("" + s.getC_year() + ",");// //71员工id
					sb.append("" + s.getC_month() + ",");// //71员工id
					sb.append("'" + s.getC_jobnumber()[i] + "',");// //71员工id
					sb.append("" + s.getC_deducted_temp()[i] + ",");// //71员工id 	
					sb.append("'" +s.getC_jobnm()+ "',");// //72操作电脑的IP地址
					sb.append("'" + op.getC_jobnumber() + "',");// //71操作员
					sb.append("'" + op.getC_ip() + "'");// //72操作电脑的IP地址
					System.out.println(sb.toString());
					st.addBatch(sb.toString());			
					sqlrecord(connection, "p_onsummary", sb.toString(), op);
			}					
			st.executeBatch();
			connection.commit();
		}  catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	} 
	
}