/**
 名称：Exceptionhander
 功能：异常处理类
 作者:
 日期: 20090615
 说明: 
 用法：
 

 */
package com.publics;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.ExceptionHandler;
import org.apache.struts.config.ExceptionConfig;

public class ExceptionHander extends ExceptionHandler {

	public ActionForward execute(Exception ex, ExceptionConfig config,
			ActionMapping mapping, ActionForm formInstance,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException {

		String key = config.getKey();
		ActionMessages errors = new ActionMessages();
		errors.add("error1", new ActionMessage(key));

		String path = null;
		if (config.getPath() != null) {
			path = config.getPath();
		} else {
			path = mapping.getInput();
		}
		
		ActionForward forward = null;
		forward = new ActionForward(path);

		SQLException e = (SQLException) ex;

		request.setAttribute("e1", "错误代码：" + e.getErrorCode());
		request.setAttribute("e2", "错误信息：" + e.getMessage());

		request.setAttribute(Globals.ERROR_KEY, errors);
				
		if (request.getAttribute("conn") != null) {
			Connection conn = (Connection) request.getAttribute("conn");
			try { 
				conn.rollback();
				conn.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return forward;

	}

}
