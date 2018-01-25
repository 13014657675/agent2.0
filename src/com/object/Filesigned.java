package com.object;  
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import org.apache.struts.upload.FormFile;
import com.publics.DB_MS2K;
import com.publics.Tool;
public class Filesigned  extends Base  {

	private static final long serialVersionUID = 1L;

	private Integer c_no;

	private String c_dname;

	private String c_dcode;

	private String c_write;

	private String c_check;

	private String c_note;

	private Integer c_fileid; 

	private String c_jobnm;

	private String c_operator;

	private Date c_datime;

	private String c_ip;

	private String c_accept;	

	public String getC_accept() {
		return c_accept;
	}
	public void setC_accept(String c_accept) {
		this.c_accept = c_accept;
	}
	public String getC_check() {
		return c_check;
	}
	public void setC_check(String c_check) {
		this.c_check = c_check;
	}
	public Date getC_datime() {
		return c_datime;
	}
	public void setC_datime(Date c_datime) {
		this.c_datime = c_datime;
	}
	public String getC_dcode() {
		return c_dcode;
	}
	public void setC_dcode(String c_dcode) {
		this.c_dcode = c_dcode;
	}
	public String getC_dname() {
		return c_dname;
	}
	public void setC_dname(String c_dname) {
		this.c_dname = c_dname;
	}
	public Integer getC_fileid() {
		return c_fileid;
	}
	public void setC_fileid(Integer c_fileid) {
		this.c_fileid = c_fileid;
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
	public String getC_write() {
		return c_write;
	}
	public void setC_write(String c_write) {
		this.c_write = c_write;
	}
	// ---------------------------------------------------------------------------------------------------//
	public void filesigned_add(Filesigned filesigned,Sprocess sprocess,File file,String filepath,Staff staff) throws SQLException, IOException {
		FormFile f = file.getFile();
		String Suffix = f.getFileName().substring(f.getFileName().lastIndexOf("."));
		String c_save = new Date().getTime() + Suffix; // file.getFileName();
		String c_url = filepath.replaceAll("\\\\", "/") + c_save;
		//file.setC_name(f.getFileName());
		file.setC_save(c_save);
		file.setC_url(c_url);
		new Tool().addFile(f, c_url);		 
		Connection connection = DB_MS2K.getConnection(); 
		String c_fileid = "-1", c_sid = "-1";
		try {
			StringBuffer sb = new StringBuffer(" exec p_file  ");
			sb.append("" + file.getC_no() + ",");
			sb.append("" + file.getC_sys() + ","); // 类型
			sb.append("'" + file.getC_catalogid() + "',"); // 类型
			sb.append(" ? ,"); // 类型
			sb.append("'" + file.getC_save() + "',"); // 类型
			sb.append("'" + file.getC_url() + "',"); // 类型
			sb.append("'" + file.getC_flag() + "',"); // 作业状态
			sb.append("'" + file.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
			System.out.println(sb.toString());
			PreparedStatement ps = connection.prepareStatement(sb.toString());
			ps.setString(1, file.getC_name()); 
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				c_fileid = rs.getString("c_no");
			}			  
			sqlrecord(connection, "p_file", sb.toString(), staff);
			Statement st = connection.createStatement();
			for (int i = 0; i < file.getC_postid().length; i++) {
				sb = new StringBuffer(" p_fileJT "); 
				sb.append("" + c_fileid + ",");
				sb.append("" + file.getC_postid()[i] + ","); // 类型
				sb.append("'" + file.getC_jobnm() + "',"); // 作业状态
				sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人
				sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
				System.out.println(sb.toString());
				st.executeUpdate(sb.toString());
				sqlrecord(connection, "p_fileJT", sb.toString(), staff);
			}
			st.executeBatch();
			sb = new StringBuffer(" exec p_filesigned  ");
			sb.append("'" + filesigned.getC_dname() + "',");
			sb.append("'" + filesigned.getC_dcode() + "',"); // 类型
			sb.append("'" + filesigned.getC_write() + "',"); // 类型
			sb.append("'" + filesigned.getC_check() + "',"); // 类型 
			sb.append("" + c_fileid + ","); // 类型
			sb.append(" ? ,"); // 内容
			sb.append("'" + filesigned.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
			System.out.println(sb.toString());
			ps = connection.prepareStatement(sb.toString()); 
			ps.setString(1, sprocess.getC_note()); 	
			rs = ps.executeQuery();
			if (rs.next()) {
				c_sid = rs.getString("c_no");
			}
			sqlrecord(connection, "p_filesigned", sb.toString(), staff);
			sb = new StringBuffer(" exec p_sprocess  null,");
			sb.append("" + sprocess.getC_sys() + ",");
			sb.append("" + c_sid + ",");
			sb.append("1,"); // 同意-不同意
			sb.append(" ? ,"); // 内容
			sb.append("" + sprocess.getC_send() + ","); // 类型
			sb.append("'" + sprocess.getC_receive() + "',"); // 类型
			sb.append("'" + sprocess.getC_jobnm() + "',"); // 作业状态
			sb.append("'" + staff.getC_jobnumber() + "',"); // 操作人
			sb.append("'" + staff.getC_ip() + "'"); // 操作人ip
			System.out.println(sb.toString());  
			ps = connection.prepareStatement(sb.toString());
			ps.setString(1, null); 		
			ps.executeUpdate();
			sqlrecord(connection, "p_sprocess", sb.toString(), staff);
			connection.commit();
		} catch (SQLException e) {
			new Tool().deleteFile(c_url);
			connection.rollback(); 
			throw e;
		} finally { 
			DB_MS2K.closeConnection(connection);
		}
	}
	public boolean get_filesigned(String c_jobnumber) throws SQLException {
		boolean flag = false;
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select a.* from t_filesigned a ,t_sprocess b  "
					+ "	where a.c_jobnm ='add' and b.c_sys=1 and a.c_no=b.c_sid and b.c_flag='0' and b.c_receive='"
					+ c_jobnumber + "'  ";
			//System.out.println(sql);
			ResultSet rs = connection.createStatement().executeQuery(sql);
			if (rs.next()) {
				flag = true;
			}			 
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return flag;
	}
	
	public boolean get_fileprompt(String c_jobnumber) throws SQLException {
		boolean flag = false;
		Connection connection = DB_MS2K.getConnection();
		try { 
			String sql =" select * from t_sprompt where c_sys=1 and c_jobnumber='"+ c_jobnumber + "' and c_flag='0' ";
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