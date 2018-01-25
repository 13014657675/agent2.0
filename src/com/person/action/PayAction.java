package com.person.action; 
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction; 
import com.object.*;
import com.person.form.PayForm; 
public class PayAction extends DispatchAction
{
	 
	//	н�����
	public ActionForward pcategory(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		PayForm payForm = (PayForm) form;  	
		Pay pay=payForm.getPay();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		pay.pcategory(pay,s);
		return mapping.findForward("success");
	}
	//	н��ȼ�
	public ActionForward pclass(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		PayForm payForm = (PayForm) form;  	
		Pay pay=payForm.getPay();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		pay.pclass(pay,s);
		return mapping.findForward("success");
	}
	//	н����Ŀ
	public ActionForward pproject(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		PayForm payForm = (PayForm) form;  	
		Pay pay=payForm.getPay();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		pay.pproject(pay,s);
		return mapping.findForward("success");
	}
	//	н���׼
	public ActionForward pstandard(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		PayForm payForm = (PayForm) form;  	
		Pay pay=payForm.getPay();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		pay.pstandard(pay,s);
		return mapping.findForward("success");
	} 
	//	н���籣
	public ActionForward psocial(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		PayForm payForm = (PayForm) form;  	
		Pay pay=payForm.getPay();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		pay.psocial(pay,s);
		return mapping.findForward("success");
	} 
	//	н��ϵ������
	public ActionForward pcoefficient(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		PayForm payForm = (PayForm) form;  	
		Pay pay=payForm.getPay();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		pay.pcoefficient(pay,s);
		return mapping.findForward("success");
	}
	//	н��ϵ������
	public ActionForward pcoefficientset(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		PayForm payForm = (PayForm) form;  	
		Pay pay=payForm.getPay();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		pay.pcoefficientset(pay,s);
		return mapping.findForward("success");
	}
}
