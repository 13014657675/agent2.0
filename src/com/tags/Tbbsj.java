package com.tags;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import com.publics.DB_MS2K;
public class Tbbsj extends TagSupport
{	
	private static final long serialVersionUID = 1L;

	public Tbbsj(){} 

	private String c_time;
	
	private String c_code; 

	public String getC_code() {
		return c_code;
	}	
 
	public String getC_time() {
		return c_time;
	}

	public void setC_time(String cTime) {
		c_time = cTime;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	} 

	// 普通字体
	private String td(String c_value, int c_count, String c_type )
	{
		StringBuffer sb = new StringBuffer("");

		if (c_type.equals("r"))
		{
			sb = new StringBuffer("<td align =\"center\"  rowspan=\"" + c_count + "\" >");
		} else if (c_type.equals("c"))
		{
			sb = new StringBuffer("<td align =\"center\"  colspan=\"" + c_count + "\" >");
		} else if (c_type.equals("n"))
		{ 
			sb = new StringBuffer("<td align =\"center\"  >");
		}		
		sb.append(c_value);  		
		sb.append("</td>");
		return sb.toString();
	}	

	private String tr_start()
	{
		return "<tr>";
	}

	public int doEndTag() throws JspException
	{
		String sql = "select * from t_bbsj  where c_time="+c_time+" and  c_code="+c_code+"  order by c_row,c_col";		
		JspWriter page = pageContext.getOut();
		int c_row_temp = -1 ; 	
		Connection connection = null; 
		try
		{
			connection = DB_MS2K.getConnection();
			ResultSet rs = connection.createStatement().executeQuery(sql);
			StringBuffer sb = new StringBuffer("<table width=\"100%\"  border=\"1\" >");
			while (rs.next())
			{
				int c_row = rs.getInt("c_row");
				String c_value;
				if (rs.getString("c_value") != null)
					c_value = rs.getString("c_value").trim();
				else
					c_value = "";
				String c_type = rs.getString("c_type").trim();
				int c_count = rs.getInt("c_count");	
				// 如果不是同一行,换行并增加行开始标记	
				if (c_row_temp!=c_row)
				{
					c_row_temp = c_row;
					sb.append(tr_start());
				}				
				// 把所有数据写入 sb 字符串中
				sb.append(td(c_value, c_count, c_type));				
			}
			sb.append("</table>");
			page.print(sb.toString());
		} catch (SQLException e)
		{
			e.printStackTrace();

		} catch (IOException e)
		{
			e.printStackTrace();
		} finally {
			try {
				DB_MS2K.closeConnection(connection);
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}  
		return super.doEndTag();
	}
}
