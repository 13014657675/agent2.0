package com.publics;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.SwitchAction; 
public class SwitchAction2 extends SwitchAction {
	public ActionForward execute(ActionMapping actionmapping,
			ActionForm actionform, HttpServletRequest httpservletrequest,
			HttpServletResponse httpservletresponse) throws Exception {
		httpservletrequest.setCharacterEncoding("GBK"); 
		Object obj = httpservletrequest.getSession().getAttribute("c_jobnumber");
		if ( obj != null)
			return super.execute(actionmapping, actionform, httpservletrequest,
					httpservletresponse);
		else {
			String path = httpservletrequest.getContextPath();
			String basePath = httpservletrequest.getScheme() + "://"
					+ httpservletrequest.getServerName() + ":"
					+ httpservletrequest.getServerPort() + path + "/";
			httpservletresponse.encodeURL(basePath + "login.jsp");
			httpservletresponse.sendRedirect(basePath + "login.jsp");
			return null;
		}
	}
}
