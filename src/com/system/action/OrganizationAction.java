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
public class OrganizationAction extends DispatchAction
{
	
	//	机构类型设置
	public ActionForward orgtype(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		OrganizationForm organizationForm = (OrganizationForm) form;  	
		Organization organization=organizationForm.getOrganization();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		organization.orgtype(organization,s);
		return mapping.findForward("success");
	}
	//	机构等级设置
	public ActionForward orgclass(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		OrganizationForm organizationForm = (OrganizationForm) form;  	
		Organization organization=organizationForm.getOrganization();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		organization.orgclass(organization,s);
		return mapping.findForward("success");
	}	
	//	机构名称设置
	public ActionForward add_update_delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		OrganizationForm organizationForm = (OrganizationForm) form;  	
		Organization organization=organizationForm.getOrganization();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		organization.add_update_delete(organization,s);
		return mapping.findForward("success");
	}
	//	部门名称设置
	public ActionForward dept(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		OrganizationForm organizationForm = (OrganizationForm) form;  	
		Organization organization=organizationForm.getOrganization();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		organization.dept(organization,s);
		return mapping.findForward("success");
	}
	//	职位名称设置
	public ActionForward post(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		OrganizationForm organizationForm = (OrganizationForm) form;  	
		Organization organization=organizationForm.getOrganization();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		organization.post(organization,s);
		return mapping.findForward("success");
	}
	//	部门长设置
	public ActionForward sethead(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		OrganizationForm organizationForm = (OrganizationForm) form;  	
		Organization organization=organizationForm.getOrganization();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		organization.sethead(organization,s);
		return mapping.findForward("success");
	}
	//	职位权限设置
	public ActionForward postqx(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		OrganizationForm organizationForm = (OrganizationForm) form;  	
		Organization organization=organizationForm.getOrganization();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		organization.postqx(organization,s);
		return mapping.findForward("success");
	}
}
