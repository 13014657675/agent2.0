package com.publics;
import java.sql.Connection; 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class CALLProcessor {
 

	public double function(Connection conn, int fid, int param1[],
			Object param2[], HashMap<Integer, String> hp) throws SQLException,
			ClassNotFoundException {
		double w = 0;
		Statement st = conn.createStatement();
		String s1 = "select * from tb_function where c_fid=" + fid;
		ResultSet rs1 = st.executeQuery(s1);
		String c_proc = "";
		if (rs1.next()) {
			c_proc = rs1.getString("c_proc").trim();
		}
		String s2 = "select * from tb_fparam where c_fid=" + fid
				+ " order by c_order ";
		ResultSet rs2 = st.executeQuery(s2);
		while (rs2.next()) {
			boolean f1 = true;
			int c_xid = rs2.getInt("c_xid");
			for (int i = 0; i < param1.length; i++) {
				if (param1[i] == c_xid) {
					String x1 = "select * from tb_param where c_pid=" + c_xid;
					Statement st2 = conn.createStatement();
					ResultSet rs3 = st2.executeQuery(x1);
					if (rs3.next()) {
						if (rs3.getInt("c_type") == 1) {
							c_proc = c_proc + " '" + param2[i].toString()
									+ "', ";
						}
						if (rs3.getInt("c_type") == 2) {
							c_proc = c_proc + " " + param2[i].toString() + ", ";
						}
					}
					f1 = false;
				}
			}
			if (f1) {
				String x2 = "select * from tb_function where c_fid=" + c_xid;
				Statement st2 = conn.createStatement();
				ResultSet rs4 = st2.executeQuery(x2);
				if (rs4.next()) {
					double z1 = function(conn, c_xid, param1, param2, hp);
					c_proc = c_proc + " " + z1 + ", ";
				} else {
					String x3 = "select * from tb_combination where c_cid="
							+ c_xid;
					Statement st3 = conn.createStatement();
					ResultSet rs5 = st3.executeQuery(x3);
					if (rs5.next()) {
						double e1 = 0, e2 = 0, e = 0;
						String c_name = rs5.getString("c_name").trim();
						int t1 = rs5.getInt("c_t1");
						int o1 = rs5.getInt("c_o1");
						int op = rs5.getInt("c_op");
						int t2 = rs5.getInt("c_t2");
						int o2 = rs5.getInt("c_o2");
						e1 = rs5.getDouble("c_x1");
						e2 = rs5.getDouble("c_x2");
						String wn1 = "";
						String wn2 = "";
						if (t1 == 1) {
							String ts1 = "select * from vb_processor where c_o="
									+ o1;
							Statement st4 = conn.createStatement();
							ResultSet rs6 = st4.executeQuery(ts1);
							if (rs6.next()) {
								wn1 = rs6.getString("c_name").trim();
								int type = rs6.getInt("c_type");
								if (type == 1) {
									e1 = function(conn, o1, param1, param2, hp);
								} else {
									e1 = combination(conn, o1, param1, param2,
											hp);
								}
							}
						}

						if (t2 == 1) {
							String ts2 = "select * from vb_processor where c_o="
									+ o2;
							Statement st5 = conn.createStatement();
							ResultSet rs7 = st5.executeQuery(ts2);
							if (rs7.next()) {
								wn2 = rs7.getString("c_name").trim();
								int type = rs7.getInt("c_type");
								if (type == 1) {
									e2 = function(conn, o2, param1, param2, hp);
								} else {
									e2 = combination(conn, o2, param1, param2,
											hp);
								}
							}
						}

						String y1 = "", y2 = "", z = "";
						if (hp.get(o1) == null) {
							y1 = wn1 + "[" + e1 + "]";
						} else {
							z = hp.get(o1).substring(
									hp.get(o1).indexOf("=") + 1);
							y1 = "£¨" + z + "£©";
						}
						if (hp.get(o2) == null) {
							y2 = wn2 + "[" + e2 + "]";
						} else {
							z = hp.get(o2).substring(
									hp.get(o2).indexOf("=") + 1);
							y2 = "£¨" + z + "£©";
						}

						if (op == 1) {
							e = e1 + e2;
							String a1 = c_name + "=" + y1 + "+" + y2;
							// System.out.println(a1);
							hp.put(c_xid, a1);
						}
						if (op == 2) {
							e = e1 - e2;
							String a2 = c_name + "=" + y1 + "-" + y2;
							// System.out.println(a2);
							hp.put(c_xid, a2);
						}
						if (op == 3) {
							e = e1 * e2;
							String a3 = c_name + "=" + y1 + "*" + y2;
							// System.out.println(a3);
							hp.put(c_xid, a3);
						}
						if (op == 4) {
							e = e1 / e2;
							String a4 = c_name + "=" + y1 + "/" + y2;
							// System.out.println(a4);
							hp.put(c_xid, a4);
						}

						double z1 = e;
						c_proc = c_proc + " " + z1 + ", ";
					}
				}
			}
		}
		int l = c_proc.lastIndexOf(",");
		Statement st3 = conn.createStatement();
		String z = c_proc.substring(0, l);
		ResultSet rs6 = st3.executeQuery(z);
		if (rs6.next()) {
			w = rs6.getDouble(1);
		}
		return w;
	}

	public double combination(Connection conn, int cid, int param1[],
			Object param2[], HashMap<Integer, String> hp) throws SQLException,
			ClassNotFoundException {
		double w1 = 0, w2 = 0, r = 0;
		Statement st = conn.createStatement();
		String s = "select * from tb_combination where c_cid=" + cid;
		ResultSet rs = st.executeQuery(s);
		if (rs.next()) {
			String c_name = rs.getString("c_name").trim();
			int t1 = rs.getInt("c_t1");
			Integer o1 = rs.getInt("c_o1");
			int op = rs.getInt("c_op");
			int t2 = rs.getInt("c_t2");
			Integer o2 = rs.getInt("c_o2");
			w1 = rs.getDouble("c_x1");
			w2 = rs.getDouble("c_x2");
			String wn1 = "";
			String wn2 = "";
			if (t1 == 1) {
				String ts1 = "select * from vb_processor where c_o=" + o1;
				ResultSet rs1 = st.executeQuery(ts1);
				if (rs1.next()) {
					wn1 = rs1.getString("c_name").trim();
					int type = rs1.getInt("c_type");
					if (type == 1) {
						w1 = function(conn, o1, param1, param2, hp);
					} else {
						w1 = combination(conn, o1, param1, param2, hp);
					}
				}
			}
			if (t2 == 1) {
				String ts2 = "select * from vb_processor where c_o=" + o2;
				ResultSet rs2 = st.executeQuery(ts2);
				if (rs2.next()) {
					wn2 = rs2.getString("c_name").trim();
					int type = rs2.getInt("c_type");
					if (type == 1) {
						w2 = function(conn, o2, param1, param2, hp);
					} else {
						w2 = combination(conn, o2, param1, param2, hp);
					}
				}
			}

			String y1 = "", y2 = "", z = "";
			if (hp.get(o1) == null) {
				y1 = wn1 + "[" + w1 + "]";
			} else {
				z = hp.get(o1).substring(hp.get(o1).indexOf("=") + 1);
				y1 = "£¨" + z + "£©";
			}
			if (hp.get(o2) == null) {
				y2 = wn2 + "[" + w2 + "]";
			} else {
				z = hp.get(o2).substring(hp.get(o2).indexOf("=") + 1);
				y2 = "£¨" + z + "£©";
			}

			if (op == 1) {
				r = w1 + w2;
				String s1 = c_name + "=" + y1 + "+" + y2;
				// System.out.println(s1);
				hp.put(cid, s1);
			}
			if (op == 2) {
				r = w1 - w2;
				String s2 = c_name + "=" + y1 + "-" + y2;
				// System.out.println(s2);
				hp.put(cid, s2);
			}
			if (op == 3) {
				r = w1 * w2;
				String s3 = c_name + "=" + y1 + "*" + y2;
				// System.out.println(s3);
				hp.put(cid, s3);
			}
			if (op == 4) {
				r = w1 / w2;
				String s4 = c_name + "=" + y1 + "/" + y2;
				// System.out.println(s4);
				hp.put(cid, s4);
			}
		}
		return r;
	}

	
}
