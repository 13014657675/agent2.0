package com.publics;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.main.action.LoginAction;
public class DB_MS2K {
	
	private static Log log = LogFactory.getLog(LoginAction.class);
	
	private static Context ctx = null;
	private static DataSource ds = null;
	static {
		try {
			log.debug("InitialContext  1");
			ctx = new InitialContext();
			log.debug("InitialContext  2");
			if (ctx == null) {
				log.debug("InitialContext is null");
			}else{
				log.debug("InitialContext  3");
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/db_mssql");
				if (ds == null) {
					log.debug("DataSource is null");
				}else{
					log.debug("InitialContext  4");
				}
			}
			log.debug("InitialContext  5");
		} catch (NamingException e) {
			log.error("NamingException", e );
		}
	}
	public static synchronized Connection getConnection() throws SQLException {
		Connection conn = null;
		log.debug("InitialContext  6");
		try {
			conn = ds.getConnection();
		} catch (Exception e) {
			log.error("db connect exception\n" , e);
		}
		
		
		if (conn == null) {
			log.debug("conn = ds.getConnection()");
		}else{
			log.debug("InitialContext  7");
		}
		// conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
		/*
		 * 3.JDBC事务并发产生的问题和事务隔离级别 JDBC事务并发产生的问题: ① 脏读(Dirty Reads)
		 * 一个事务读取了另一个并行事务还未提交的数据。(产生原因：读-写) ② 不可重复读(UnPrpeatable
		 * Read)一个事务前后两次读取数据时,得到的数据不一致,被另一个已提交的事务修改。 ③ 幻读(Phantom Read)
		 * 一个事务再次查询，记录中的量变化了。(仅对统计有影响) 为了避免以上三种情况的出现，则采用事务隔离级别: TRANSACTION_NONE
		 * 不使用事务(不可能用，只是理论的) TRANSACTION_READ_UNCOMMITTED 可以读取未提交数据(允许脏读，也不可能)
		 * TRANSACTION_READ_COMMITTED 只读提交的数据：可防止脏读；大部分数据库的默认隔离级别
		 * TRANSACTION_REPEATABLE_READ 重复读取；只可以避免脏读 TRANSACTION_SERIALIZABLE
		 * 事务串行化：可以避免脏读，重复读取和幻读，但会降低数据库效率(最常用)
		 * 以上的五个事务隔离级别都是在Connection类中定义的静态常量。隔离级别越高，数据越安全，并发能力越差。
		 * 使用setTransactionIsolation(int level) 方法可以设置事务隔离级别。
		 * 比如：con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
		 */
		log.debug("InitialContext  8");
		conn.setAutoCommit(false);
		return conn;
	}
	public static synchronized void closeConnection(Connection connection)
			throws SQLException {
		connection.close();
		connection = null;
	}
}
