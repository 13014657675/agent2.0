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
public class CompanyAction extends DispatchAction
{
	
	//	���չ�˾
	public ActionForward add_update_delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		CompanyForm companyForm = (CompanyForm) form;  	
		Company company=companyForm.getCompany();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		company.add_update_delete(company,s);
		return mapping.findForward("success");
	}
	//	ְҵ���
	public ActionForward occupation(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		CompanyForm companyForm = (CompanyForm) form;  	
		Company company=companyForm.getCompany();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		company.occupation(company,s);
		return mapping.findForward("success");
	}	
	//	ϵ������
	public ActionForward convertT(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		CompanyForm companyForm = (CompanyForm) form;  	
		Company company=companyForm.getCompany();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		company.convertT(company,s);
		return mapping.findForward("success");
	}	
	//	ϵ������
	public ActionForward convert(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		CompanyForm companyForm = (CompanyForm) form;  	
		Company company=companyForm.getCompany();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		company.convert(company,s);
		return mapping.findForward("success");
	}	
}
