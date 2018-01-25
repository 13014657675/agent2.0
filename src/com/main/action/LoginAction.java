package com.main.action;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import com.main.form.LoginForm; 
import com.object.Staff;
import com.publics.DB_MS2K;
import com.publics.MD5; 
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class LoginAction extends Action
{ 
	private static Log log = LogFactory.getLog(LoginAction.class.getName());
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException 
	{		
		LoginForm loginForm = (LoginForm) form; 
		String c_jobnumber = loginForm.getC_jobnumber().trim().toUpperCase(); 	// π§∫≈ 
		String c_pwd = MD5.MD5Encode(loginForm.getC_pwd()); 				// √‹¬Î			 
		String sql = "exec p_login '" + c_jobnumber + "','" + c_pwd + "'";
		log.info(sql);
		log.info("begin----------1--------"+sql);
		
		Connection connection =DB_MS2K.getConnection();
		log.debug("----------2--------"+sql);
		try
		{		 
			log.debug("------3------------"+sql);
			
			ResultSet rs = connection.createStatement().executeQuery(sql);			
			log.debug("-------4-----------"+sql);
			
			if (rs.next())
			{
				log.debug("------------------"+sql);
				request.getSession().setAttribute("c_jobnumber", c_jobnumber);	 
				Staff s=new Staff().getstaff(c_jobnumber);
				s.setC_ip(request.getRemoteAddr().toString());
				request.getSession().setAttribute("Staff", s);	
				
				log.debug("login success");
				
				return mapping.findForward("index");
			} else
			{ 
				ActionMessages errors = new ActionMessages();
				errors.add("c_pwd.error", new ActionMessage("login.c_pwd.error"));
				saveErrors(request, errors);
				
				log.debug("login error");
				
				return mapping.findForward("login");
			}
		}
		catch (Exception e) {
			ActionMessages errors = new ActionMessages();
			errors.add("c_pwd.error", new ActionMessage("login.c_pwd.error"));
			saveErrors(request, errors);
			
			log.debug("login exception");
			
			return mapping.findForward("login");
		}
		finally
		{
			DB_MS2K.closeConnection(connection);
		}
	}
}