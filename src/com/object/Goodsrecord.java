package com.object;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; 
import java.util.Date;

import com.publics.DB_MS2K;

public class Goodsrecord extends Base {
 
	private static final long serialVersionUID = 1L;
	
	private Integer c_no; 
	
	private Integer c_orgid;
	
	private Integer c_libraryid;
	
	private Long c_recordid;
	
	private int c_id[]; 
	
	private Integer c_goodsid[];
	
	private double c_inprice[]; 
	
	private double c_outprice[]; 
	
	private String c_code[]; 
	
	private Integer c_number[]; 
	
	private String c_p;

	private Integer c_o;  
	
	private String c_flag;
	
	private String c_jobnm;
	
	private String c_operator;
	
	private Date c_datime;
	
	private String c_ip; 	

	public String[] getC_code() {
		return c_code;
	}

	public void setC_code(String[] c_code) {
		this.c_code = c_code;
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

	public Integer getC_no() {
		return c_no;
	}

	public void setC_no(Integer c_no) {
		this.c_no = c_no;
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

	public Long getC_recordid() {
		return c_recordid;
	}

	public void setC_recordid(Long c_recordid) {
		this.c_recordid = c_recordid;
	} 

	public Integer[] getC_goodsid() {
		return c_goodsid;
	}

	public void setC_goodsid(Integer[] c_goodsid) {
		this.c_goodsid = c_goodsid;
	}

	public Integer[] getC_number() {
		return c_number;
	}

	public void setC_number(Integer[] c_number) {
		this.c_number = c_number;
	} 
	
	public String getC_p() {
		return c_p;
	}

	public void setC_p(String c_p) {
		this.c_p = c_p;
	}	

	public Integer getC_o() {
		return c_o;
	}

	public void setC_o(Integer c_o) {
		this.c_o = c_o;
	}

	public double[] getC_inprice() {
		return c_inprice;
	}

	public void setC_inprice(double[] c_inprice) {
		this.c_inprice = c_inprice;
	}

	public double[] getC_outprice() {
		return c_outprice;
	}

	public void setC_outprice(double[] c_outprice) {
		this.c_outprice = c_outprice;
	}	

	public Integer getC_libraryid() {
		return c_libraryid;
	}

	public void setC_libraryid(Integer c_libraryid) {
		this.c_libraryid = c_libraryid;
	}	

	public int[] getC_id() {
		return c_id;
	}

	public void setC_id(int[] c_id) {
		this.c_id = c_id;
	}

	//	 批号过程
	public void goodsrecord(int c_orgid,int c_libraryid ,Long c_recordid,String c_jobnm,Staff s,Connection connection) throws SQLException { 
		try {			 
			StringBuffer sb =null; 
			sb= new StringBuffer(" p_goodsrecord  "); 
			sb.append("" + c_orgid + ",");  
			sb.append("" + c_libraryid + ",");  
			sb.append("" + c_recordid + ","); 			 			
			sb.append("'" + c_jobnm + "',"); // 类型		 
			sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + s.getC_ip() + "'"); // 操作人ip
			System.out.println(sb.toString());
			Statement st = connection.createStatement();	
			st.executeUpdate(sb.toString()); 		 
			sqlrecord(connection, "p_goodsrecord", sb.toString(), s);
		} catch (SQLException e) {
			connection.rollback(); 
			throw e;
		} 
	}	

	//	 物品批量变动
	public void goodsbatch(Goodsrecord goodsrecord, Staff s) throws SQLException {
	 	Connection connection = DB_MS2K.getConnection(); 
		try {			 
			if (goodsrecord.getC_jobnm().equals("ck") && null!=goodsrecord.getC_o() && goodsrecord.getC_o()>0)
			{
				goodsbatch_rk2(goodsrecord, s,connection);
			} 
			goodsrecord(goodsrecord.getC_orgid(),goodsrecord.getC_libraryid(),goodsrecord.getC_recordid(),goodsrecord.getC_jobnm(),s,connection);
			StringBuffer sb =null;  
			for(int i=0;i<goodsrecord.getC_goodsid().length;i++)
			{
				sb= new StringBuffer(" p_goodsbatch  "); 
				sb.append("" + goodsrecord.getC_orgid() + ",");  
				sb.append("" + goodsrecord.getC_libraryid() + ",");  
				sb.append("" + goodsrecord.getC_recordid() + ",");  
				sb.append("" + goodsrecord.getC_goodsid()[i] + ",");    
				sb.append("" + goodsrecord.getC_number()[i] + ","); 
				sb.append("'" + goodsrecord.getC_p()+ "',"); // 类型
				sb.append("" + goodsrecord.getC_o() + ","); // 类型						
				sb.append("'" + goodsrecord.getC_jobnm() + "',"); // 类型		 
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				System.out.println(sb.toString());
				Statement st = connection.createStatement();	
				st.executeUpdate(sb.toString());
				sqlrecord(connection, "p_goodsbatch", sb.toString(), s);
			}
			connection.commit();
		} catch (SQLException e) {
			connection.rollback(); 
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}	
	
	//	 物品批量变动-机构入库
	public void goodsbatch_rk2(Goodsrecord goodsrecord, Staff s,Connection connection) throws SQLException { 
		try {			 
			String c_jobnm="rk2";		
			Long c_recordid=null;
			Statement st = connection.createStatement();	
			ResultSet rs=st.executeQuery("select max(c_recordid) c_recordid  from t_goodsrecord where c_orgid="+goodsrecord.getC_o()+" and c_libraryid="+goodsrecord.getC_libraryid());
			if (rs.next())
			{   
				if (rs.getLong(1)==0)
				{
					String x=goodsrecord.getC_o().toString()+goodsrecord.getC_libraryid()+"0000001"; 
					c_recordid=Long.parseLong(x);			
				}
				else
				{	
					c_recordid=rs.getLong(1)+1;		
				}
			} 
			goodsrecord(goodsrecord.getC_o(),goodsrecord.getC_libraryid(),c_recordid,c_jobnm,s,connection);
			StringBuffer sb =null;  
			for(int i=0;i<goodsrecord.getC_goodsid().length;i++)
			{ 
					sb= new StringBuffer(" p_goodsbatch  "); 
					sb.append("" + goodsrecord.getC_o() + ","); // 类型	
					sb.append("" + goodsrecord.getC_libraryid() + ",");  
					sb.append("" + c_recordid + ",");  
					sb.append("" + goodsrecord.getC_goodsid()[i] + ",");    
					sb.append("" + goodsrecord.getC_number()[i] + ","); 
					sb.append("'" + goodsrecord.getC_p()+ "',"); // 类型
					sb.append("" + goodsrecord.getC_orgid() + ",");  					
					sb.append("'" + c_jobnm + "',"); // 类型		 
					sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
					sb.append("'" + s.getC_ip() + "'"); // 操作人ip
					System.out.println(sb.toString());
					st = connection.createStatement();	
				 	st.executeUpdate(sb.toString()); 
				 	sqlrecord(connection, "p_goodsbatch", sb.toString(), s);
			}			 
		} catch (SQLException e) {
			connection.rollback(); 
			throw e;
		}  
	}	
	
	//	 物品价格定义
	public void goodsprice(Goodsrecord goodsrecord, Staff s) throws SQLException {
	 	Connection connection = DB_MS2K.getConnection(); 
		try {			 
			goodsrecord(goodsrecord.getC_orgid(),goodsrecord.getC_libraryid(),goodsrecord.getC_recordid(),goodsrecord.getC_jobnm(),s,connection);
			StringBuffer sb =null;  
			for(int i=0;i<goodsrecord.getC_goodsid().length;i++)
			{
				sb= new StringBuffer(" p_goodsprice  "); 
				sb.append("" + goodsrecord.getC_orgid() + ",");  
				sb.append("" + goodsrecord.getC_libraryid() + ",");  
				sb.append("" + goodsrecord.getC_recordid() + ",");  
				sb.append("" + goodsrecord.getC_goodsid()[i] + ",");    
				sb.append("" + goodsrecord.getC_number()[i] + ","); 
				sb.append("" + goodsrecord.getC_inprice()[i] + ",");    
				sb.append("" + goodsrecord.getC_outprice()[i] + ","); 				
				sb.append("'" + goodsrecord.getC_jobnm() + "',"); // 类型		 
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				System.out.println(sb.toString());
				Statement st = connection.createStatement();	
				st.executeUpdate(sb.toString());
				sqlrecord(connection, "p_goodsprice", sb.toString(), s);
			}			
			connection.commit();
		} catch (SQLException e) {
			connection.rollback(); 
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	
	//	 物品个别变动
	public void goodssingle(Goodsrecord goodsrecord, Staff s) throws SQLException {
	 	Connection connection = DB_MS2K.getConnection(); 
		try {			 				
			if (goodsrecord.getC_jobnm().equals("ck") && null!=goodsrecord.getC_o() && goodsrecord.getC_o()>0)
			{
				goodssingle_rk2(goodsrecord, s,connection);
			} 
			goodsrecord(goodsrecord.getC_orgid(),goodsrecord.getC_libraryid(),goodsrecord.getC_recordid(),goodsrecord.getC_jobnm(),s,connection);
			StringBuffer sb =null;  
			for(int i=0;i<goodsrecord.getC_id().length;i++)
			{
				sb= new StringBuffer(" p_goodssingle  "); 
				sb.append("" + goodsrecord.getC_orgid() + ",");  
				sb.append("" + goodsrecord.getC_libraryid() + ",");  
				sb.append("" + goodsrecord.getC_recordid() + ",");  
				sb.append("" + goodsrecord.getC_goodsid()[goodsrecord.getC_id()[i]] + ",");    
				sb.append("" + goodsrecord.getC_code()[goodsrecord.getC_id()[i]] + ","); 
				sb.append("'" + goodsrecord.getC_p()+ "',"); // 类型
				sb.append("" + goodsrecord.getC_o() + ","); // 类型			 			
				sb.append("'" + goodsrecord.getC_jobnm() + "',"); // 类型		 
				sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
				sb.append("'" + s.getC_ip() + "'"); // 操作人ip
				System.out.println(sb.toString());
				Statement st = connection.createStatement();	
			 	st.executeUpdate(sb.toString());
			 	sqlrecord(connection, "p_goodssingle", sb.toString(), s);
			}				
			connection.commit();
		} catch (SQLException e) {
			connection.rollback(); 
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	
	//	 物品个别变动-机构入库
	public void goodssingle_rk2(Goodsrecord goodsrecord, Staff s,Connection connection) throws SQLException { 
		try {			 
			String c_jobnm="rk2";	
			Long c_recordid=null;
			Statement st = connection.createStatement();	
			ResultSet rs=st.executeQuery("select max(c_recordid) c_recordid  from t_goodsrecord where c_orgid="+goodsrecord.getC_o()+" and c_libraryid="+goodsrecord.getC_libraryid());
			if (rs.next())
			{   
				if (rs.getLong(1)==0)
				{
					String x=goodsrecord.getC_o().toString()+goodsrecord.getC_libraryid()+"0000001"; 
					c_recordid=Long.parseLong(x);			
				}
				else
				{	
					c_recordid=rs.getLong(1)+1;		
				}
			}  
			goodsrecord(goodsrecord.getC_o(),goodsrecord.getC_libraryid(),c_recordid,c_jobnm,s,connection);
			StringBuffer sb =null;  
			for(int i=0;i<goodsrecord.getC_id().length;i++)
			{   					
					sb= new StringBuffer(" p_goodssingle  "); 
					sb.append("" + goodsrecord.getC_o() + ","); // 类型	
					sb.append("" + goodsrecord.getC_libraryid() + ",");  
					sb.append("" + c_recordid + ",");  
					sb.append("" + goodsrecord.getC_goodsid()[goodsrecord.getC_id()[i]] + ",");    
					sb.append("" + goodsrecord.getC_code()[goodsrecord.getC_id()[i]] + ","); 
					sb.append("'" + goodsrecord.getC_p()+ "',"); // 类型
					sb.append("" + goodsrecord.getC_orgid() + ",");  	 			
					sb.append("'" + c_jobnm + "',"); // 类型		 
					sb.append("'" + s.getC_jobnumber() + "',"); // 操作人
					sb.append("'" + s.getC_ip() + "'"); // 操作人ip
					System.out.println(sb.toString());
					st = connection.createStatement();	
					st.executeUpdate(sb.toString()); 		
					sqlrecord(connection, "p_goodssingle", sb.toString(), s);
			} 
		} catch (SQLException e) {
			connection.rollback(); 
			throw e;
		}  
	}
	 
    
}
