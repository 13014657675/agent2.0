package com.object;   
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import org.apache.struts.upload.FormFile; 
import com.publics.DB_MS2K;
import com.publics.Tool;
public class File extends Base {

	private static final long serialVersionUID = 1L;

	private Integer c_no;

	private Integer c_sys;

	private Integer c_catalogid;

	private String c_name;
	
	private String c_save;

	private String c_url;

	private String c_flag;

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;

	private FormFile file; // 文件	
	
	/*-------------------------------------------*/
	
	private Integer c_postid[]; 
	
	private Integer c_fileid;

	private String c_jobnumber;

	private Integer c_times;
	
	/*-------------------------------------------*/

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

	public Integer getC_sys() {
		return c_sys;
	}

	public void setC_sys(Integer c_sys) {
		this.c_sys = c_sys;
	}

	public String getC_url() {
		return c_url;
	}

	public void setC_url(String c_url) {
		this.c_url = c_url;
	}

	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	}    
	
	public Integer getC_fileid() {
		return c_fileid;
	}

	public void setC_fileid(Integer c_fileid) {
		this.c_fileid = c_fileid;
	}

	public Integer[] getC_postid() {
		return c_postid;
	}

	public void setC_postid(Integer[] c_postid) {
		this.c_postid = c_postid;
	} 

	public String getC_jobnumber() {
		return c_jobnumber;
	}

	public void setC_jobnumber(String c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	}

	public Integer getC_times() {
		return c_times;
	}

	public void setC_times(Integer c_times) {
		this.c_times = c_times;
	}
	
	public Integer getC_catalogid() {
		return c_catalogid;
	}

	public void setC_catalogid(Integer c_catalogid) {
		this.c_catalogid = c_catalogid;
	}

	public String getC_save() {
		return c_save;
	}

	public void setC_save(String c_save) {
		this.c_save = c_save;
	}

	// ---------------------------------------------------------------------------------------------------//
	public void catalog_add_delete(File file,  Staff staff)
	throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" p_catalog  ");
			sb.append("" + file.getC_no() + ",");
			sb.append("" + file.getC_sys() + ","); // 类型
			sb.append("'" + file.getC_name() + "',"); // 类型 
			sb.append("'" + file.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_catalog", sql, staff);
			connection.commit();
			} catch (SQLException e) {
				connection.rollback();
				throw e;
			} finally {
				DB_MS2K.closeConnection(connection);
			}
	}
	
	public void tool_add(File file,String filepath, Staff staff) throws SQLException, IOException {
		FormFile f = file.getFile();
		String Suffix = f.getFileName().substring(f.getFileName().lastIndexOf("."));
		String c_save = new Date().getTime() + Suffix; // file.getFileName();
		String c_url = filepath.replaceAll("\\\\", "/") + c_save;
		//file.setC_name(f.getFileName());  
		file.setC_save(c_save);
		file.setC_url(c_url);
		new Tool().addFile(f, c_url);
		Connection connection = DB_MS2K.getConnection();	 
		try {
			StringBuffer sb = new StringBuffer(" p_file  ");
			sb.append("" + file.getC_no() + ",");
			sb.append("" + file.getC_sys() + ","); // 类型
			sb.append("" + file.getC_catalogid() + ","); // 类型
			sb.append("'" + file.getC_name() + "',"); // 类型
			sb.append("'" + file.getC_save() + "',"); // 类型
			sb.append("'" + file.getC_url() + "',"); // 类型
			sb.append("'" + file.getC_flag() + "',"); // 类型
			sb.append("'" + file.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_file", sql, staff);
			connection.commit();
		} catch (SQLException e) {
			new Tool().deleteFile(c_url);
			connection.rollback();
			throw e;
		}		
		 finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	public void file_update_del(File file,Staff staff) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try { 
			StringBuffer sb = new StringBuffer(" p_file  ");
			sb.append("" + file.getC_no() + ",");
			sb.append("" + file.getC_sys() + ","); // 类型
			sb.append("" + file.getC_catalogid() + ","); // 类型
			sb.append("'" + file.getC_name() + "',"); // 类型
			sb.append("'" + file.getC_save() + "',"); // 类型
			sb.append("'" + file.getC_url() + "',"); // 类型
			sb.append("'" + file.getC_flag() + "',"); // 类型
			sb.append("'" + file.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人id
			sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "p_file", sql, staff);
			Tool t=new Tool();
			if (file.getC_jobnm().equals("update") || file.getC_jobnm().equals("del") && t.deleteFile(file.getC_url()) )
			{
				connection.commit();
			}else
			{
				connection.rollback();
			}
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		}	finally {
			DB_MS2K.closeConnection(connection);
		}
	}	
	public boolean fileRD(String c_jobnumber) throws SQLException {
		boolean flag = false;
		Connection connection = DB_MS2K.getConnection();
		try { 
			String sql =" select * from t_fileRD where c_jobnumber='"+ c_jobnumber + "' and c_times=0 ";
			ResultSet rs = connection.createStatement().executeQuery(sql);
			if (rs.next()) {
				flag = true;
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return flag;
	} 

}