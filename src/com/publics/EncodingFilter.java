package com.publics;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
public class EncodingFilter implements Filter {
	private String encoding = "GBK";
	public void init(FilterConfig arg0) throws ServletException {
	}
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		request.setCharacterEncoding(this.encoding);
		Object obj = request.getSession().getAttribute("c_jobnumber");
		if ( obj != null)
		{
			System.out.println(">Filter");
			arg2.doFilter(request, response); // 跳转到下个过滤器或页面
		}		
		else {
			System.out.println(">login");
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			response.encodeURL(basePath + "login.jsp");
			response.sendRedirect(basePath + "login.jsp");
		}
	}
	public void destroy() {
	}
}
