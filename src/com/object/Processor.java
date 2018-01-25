package com.object;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.struts.util.LabelValueBean;

import com.publics.CALLProcessor;
import com.publics.DB_MS2K;

public class Processor extends Base {

	private static final long serialVersionUID = 1L;

	private int c_no;

	private int c_pid;

	private int c_type;

	private String c_name;
	
	private int c_projectclass;
	
	private int c_o;

	private int c_fid;

	private String c_proc;

	private int c_xid[];

	private int c_cid;

	private int c_t1;

	private int c_o1;

	private double c_x1;

	private int c_op;

	private int c_t2;

	private int c_o2;

	private double c_x2;

	private String c_jobnm;

	public int getC_cid() {
		return c_cid;
	}

	public void setC_cid(int c_cid) {
		this.c_cid = c_cid;
	}

	public int getC_fid() {
		return c_fid;
	}

	public void setC_fid(int c_fid) {
		this.c_fid = c_fid;
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

	public int getC_o1() {
		return c_o1;
	}

	public void setC_o1(int c_o1) {
		this.c_o1 = c_o1;
	}

	public int getC_o2() {
		return c_o2;
	}

	public void setC_o2(int c_o2) {
		this.c_o2 = c_o2;
	}

	public int getC_op() {
		return c_op;
	}

	public void setC_op(int c_op) {
		this.c_op = c_op;
	}

	public int getC_pid() {
		return c_pid;
	}

	public void setC_pid(int c_pid) {
		this.c_pid = c_pid;
	}

	public String getC_proc() {
		return c_proc;
	}

	public void setC_proc(String c_proc) {
		this.c_proc = c_proc;
	}

	public int getC_type() {
		return c_type;
	}

	public void setC_type(int c_type) {
		this.c_type = c_type;
	}

	public int[] getC_xid() {
		return c_xid;
	}

	public void setC_xid(int[] c_xid) {
		this.c_xid = c_xid;
	}

	public String getC_jobnm() {
		return c_jobnm;
	}

	public void setC_jobnm(String c_jobnm) {
		this.c_jobnm = c_jobnm;
	}

	public double getC_x1() {
		return c_x1;
	}

	public void setC_x1(double c_x1) {
		this.c_x1 = c_x1;
	}

	public double getC_x2() {
		return c_x2;
	}

	public void setC_x2(double c_x2) {
		this.c_x2 = c_x2;
	}

	public int getC_t1() {
		return c_t1;
	}

	public void setC_t1(int c_t1) {
		this.c_t1 = c_t1;
	}

	public int getC_t2() {
		return c_t2;
	}

	public void setC_t2(int c_t2) {
		this.c_t2 = c_t2;
	}	

	public int getC_projectclass() {
		return c_projectclass;
	}

	public void setC_projectclass(int c_projectclass) {
		this.c_projectclass = c_projectclass;
	}	 

	public int getC_o() {
		return c_o;
	}

	public void setC_o(int c_o) {
		this.c_o = c_o;
	}

	/*---------------------------------------------*/
	// 参数
	public void param(Processor p, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" pb_param  ");
			sb.append("" + p.getC_pid() + ",");
			sb.append("" + p.getC_type() + ",");
			sb.append("'" + p.getC_name() + "',");
			sb.append("'" + p.getC_jobnm() + "'");
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "pb_param", sql, s);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 类型过程
	public void projectclass(Processor p, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" pb_projectclass  ");
			sb.append("" + p.getC_no() + ","); 
			sb.append("'" + p.getC_name() + "',");
			sb.append("" + p.getC_o() + ","); 
			sb.append("'" + p.getC_jobnm() + "'");
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
			sqlrecord(connection, "pb_projectclass", sql, s);
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	// 函数
	public void function(Processor p, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" pb_function  ");
			sb.append("" + p.getC_projectclass() + ",");
			sb.append("" + p.getC_fid() + ",");
			sb.append("'" + p.getC_name() + "',");
			sb.append("'" + p.getC_proc() + "',");
			sb.append("'" + p.getC_jobnm() + "'");
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			sqlrecord(connection, "pb_function", sql, s);
			if (rs.next() && p.getC_jobnm().equals("add")) {
				Statement st2 = connection.createStatement();
				int c_fid = rs.getInt("c_fid");
				for (int i = 0; i < p.getC_xid().length; i++) {
					sb = new StringBuffer(" pb_fparam  ");
					sb.append("" + c_fid + ",");
					sb.append("" + p.getC_xid()[i] + " ");
					sql = sb.toString();
					System.out.println(sql);
					st2.executeUpdate(sql);
					sqlrecord(connection, "pb_fparam", sql, s);
				}
			}
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	// 生成组合的参数
	public void pb_cparam(Connection conn, int id, int c_cid)
			throws SQLException {
		String s = "select * from tb_function where c_fid=" + id;
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(s);
		if (rs.next()) {
			// 函数参数
			String s1 = "select * from tb_fparam where c_fid=" + id
					+ " order by c_order";
			Statement st1 = conn.createStatement();
			ResultSet rs1 = st1.executeQuery(s1);
			while (rs1.next()) {
				int c_xid = rs1.getInt("c_xid");
				String s2 = "select * from tb_param where c_pid=" + c_xid;
				Statement st2 = conn.createStatement();
				ResultSet rs2 = st2.executeQuery(s2);
				if (rs2.next()) {
					Statement st22 = conn.createStatement();
					st22.executeUpdate("pb_cparam " + c_cid + "," + c_xid);
				} else {
					pb_cparam(conn, c_xid, c_cid);
				}

			}
		} else {
			// 组合参数
			String s3 = "select * from tb_combination where c_cid=" + id;
			Statement st3 = conn.createStatement();
			ResultSet rs3 = st3.executeQuery(s3);
			if (rs3.next()) {
				int c_t1 = rs3.getInt("c_t1");
				if (c_t1 == 1) {
					int c_o1 = rs3.getInt("c_o1");
					pb_cparam(conn, c_o1, c_cid);
				}
				int c_t2 = rs3.getInt("c_t2");
				if (c_t2 == 1) {
					int c_o2 = rs3.getInt("c_o2");
					pb_cparam(conn, c_o2, c_cid);
				}
			}
		}
	}
	// 组合
	public void combination(Processor p, Staff s) throws SQLException {
		Connection connection = DB_MS2K.getConnection();
		try {
			StringBuffer sb = new StringBuffer(" pb_combination  ");
			sb.append("" + p.getC_projectclass() + ",");
			sb.append("" + p.getC_cid() + ",");
			sb.append("'" + p.getC_name() + "',");
			sb.append("" + p.getC_t1() + ",");
			sb.append("" + p.getC_o1() + ",");
			sb.append("" + p.getC_x1() + ",");
			sb.append("" + p.getC_op() + ",");
			sb.append("" + p.getC_t2() + ",");
			sb.append("" + p.getC_o2() + ",");
			sb.append("" + p.getC_x2() + ",");
			sb.append("'" + p.getC_jobnm() + "'");
			String sql = sb.toString();
			System.out.println(sql);
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			sqlrecord(connection, "pb_combination", sql, s);
			if (rs.next() && p.getC_jobnm().equals("add")) {
				Statement st2 = connection.createStatement();
				int c_cid = rs.getInt("c_cid");
				String s2 = "select * from tb_combination where c_cid=" + c_cid;
				ResultSet rs2 = st2.executeQuery(s2);
				if (rs2.next()) {
					int c_t1 = rs2.getInt("c_t1");
					if (c_t1 == 1) {
						int c_o1 = rs2.getInt("c_o1");
						pb_cparam(connection, c_o1, c_cid);
					}
					int c_t2 = rs2.getInt("c_t2");
					if (c_t2 == 1) {
						int c_o2 = rs2.getInt("c_o2");
						pb_cparam(connection, c_o2, c_cid);
					}
				}
			}
			connection.commit();
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			DB_MS2K.closeConnection(connection);
		}
	}
	//	 筛选处理器
	public ArrayList<LabelValueBean> get_childpro(int c_projectclass)
			throws SQLException {
		ArrayList<LabelValueBean> data = null; 
		Connection connection = DB_MS2K.getConnection();
		try {
			String sql = "select * from  vb_processor where c_projectclass=" + c_projectclass;
			ResultSet rs = connection.createStatement().executeQuery(sql);
			LabelValueBean lab;
			data = new ArrayList<LabelValueBean>();
			while (rs.next()) {
				lab = new LabelValueBean();
				lab.setValue(rs.getString("c_o"));
				lab.setLabel(rs.getString("c_name").trim());
				data.add(lab);
			}
		} finally {
			DB_MS2K.closeConnection(connection);
		}
		return data;
	}
	//处理器操作
	public LabelValueBean CALLProcessor(int c_xid , int[]param1 , Object[]param2 ) throws SQLException, ClassNotFoundException
	{
		LabelValueBean lb=new LabelValueBean(); 
		Connection connection = DB_MS2K.getConnection();
		HashMap<Integer, String> hp = new HashMap<Integer, String>();
		double a = new CALLProcessor().combination(connection, c_xid, param1 , param2 , hp);
		lb.setLabel(hp.get(c_xid));
		lb.setValue(String.valueOf(a));		 
		return lb;
	}
	

}
