package com.test;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.HashMap;

import org.apache.struts.util.LabelValueBean;

import com.publics.CALLProcessor;
import com.publics.DB_MS2K;
public class TestProcessor {

//	public static Connection getC() throws SQLException, ClassNotFoundException {
//		String RL = "jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=agent2";
//		String user = "sa";// 这里替换成你自已的数据库用户名
//		String password = "123";// 这里替换成你自已的数据库用户密码
//		Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
//		Connection conn = DriverManager.getConnection(RL, user, password);
//		return conn;
//	}

	public LabelValueBean doProcessor(int year, int month, int jigouid,
			String c_jobnumber) throws SQLException, ClassNotFoundException {
		LabelValueBean lv = null;
		CALLProcessor cp = new CALLProcessor();
		DecimalFormat df = new DecimalFormat();		
		String pattern = "#.##";
		df.applyPattern(pattern);		
		int x = 3008;
		HashMap<Integer, String> hp1 = new HashMap<Integer, String>();
		Connection connection=DB_MS2K.getConnection(); 
		double a = cp.combination(connection, x, new int[] { 1001, 1002, 1003,
				1004 }, new Object[] { Integer.valueOf(year),
				Integer.valueOf(month), Integer.valueOf(jigouid),c_jobnumber },
				hp1);
		
		lv = new LabelValueBean(); 
		lv.setLabel((String) hp1.get(Integer.valueOf(x)));
		lv.setValue(String.valueOf(df.format(a)));
		DB_MS2K.closeConnection(connection);
		return lv;
	}  

}
