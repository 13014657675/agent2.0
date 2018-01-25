package com.system.action;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.object.*;
import com.system.form.*;
public class ProjectAction extends DispatchAction
{
	
	//	参数
	public ActionForward param(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProjectForm projectForm = (ProjectForm) form;  	
		Processor project=projectForm.getProcessor();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		project.param(project,s);
		return mapping.findForward("success");
	}
	//	类型过程
	public ActionForward projectclass(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProjectForm projectForm = (ProjectForm) form;  	
		Processor project=projectForm.getProcessor();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		project.projectclass(project,s);
		return mapping.findForward("success");
	} 
	//	函数
	public ActionForward function(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProjectForm projectForm = (ProjectForm) form;  	
		Processor project=projectForm.getProcessor();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		project.function(project,s);
		return mapping.findForward("success");
	} 
	//	组合
	public ActionForward combination(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProjectForm projectForm = (ProjectForm) form;  	
		Processor project=projectForm.getProcessor();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		project.combination(project,s);
		return mapping.findForward("success");
	} 

}
