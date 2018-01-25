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
		 * 3.JDBC���񲢷������������������뼶�� JDBC���񲢷�����������: �� ���(Dirty Reads)
		 * һ�������ȡ����һ����������δ�ύ�����ݡ�(����ԭ�򣺶�-д) �� �����ظ���(UnPrpeatable
		 * Read)һ������ǰ�����ζ�ȡ����ʱ,�õ������ݲ�һ��,����һ�����ύ�������޸ġ� �� �ö�(Phantom Read)
		 * һ�������ٴβ�ѯ����¼�е����仯�ˡ�(����ͳ����Ӱ��) Ϊ�˱���������������ĳ��֣������������뼶��: TRANSACTION_NONE
		 * ��ʹ������(�������ã�ֻ�����۵�) TRANSACTION_READ_UNCOMMITTED ���Զ�ȡδ�ύ����(���������Ҳ������)
		 * TRANSACTION_READ_COMMITTED ֻ���ύ�����ݣ��ɷ�ֹ������󲿷����ݿ��Ĭ�ϸ��뼶��
		 * TRANSACTION_REPEATABLE_READ �ظ���ȡ��ֻ���Ա������ TRANSACTION_SERIALIZABLE
		 * �����л������Ա���������ظ���ȡ�ͻö������ή�����ݿ�Ч��(���)
		 * ���ϵ����������뼶������Connection���ж���ľ�̬���������뼶��Խ�ߣ�����Խ��ȫ����������Խ�
		 * ʹ��setTransactionIsolation(int level) ������������������뼶��
		 * ���磺con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
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
