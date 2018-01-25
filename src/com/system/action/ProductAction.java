package com.system.action;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.object.*;
import com.system.form.ProductForm; 
public class ProductAction extends DispatchAction
{
	
	//	��Ʒ����
	public ActionForward ptclass(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.ptclass(prodect,s);
		return mapping.findForward("success");
	}
	//	��Ʒ����
	public ActionForward pttype(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.pttype(prodect,s);
		return mapping.findForward("success");
	}	
	//	��Ʒ����
	public ActionForward add_update_delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.add_update_delete(prodect,s);
		return mapping.findForward("success");
	}
	//	��Ʒ���
	public ActionForward pcomponent(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.pcomponent(prodect,s);
		return mapping.findForward("success");
	}
	//	��Ʒ����
	public ActionForward ptrate(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Rate rate=prodectForm.getRate();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		rate.add_update_delete(rate,s);
		return mapping.findForward("success");
	}
	//	��Ʒϵ��
	public ActionForward ptconvert(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.ptconvert(prodect,s);
		return mapping.findForward("success");
	}
	//	��������
	public ActionForward pliability(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.pliability(prodect,s);
		return mapping.findForward("success");
	}
	//	���������������
	public ActionForward pliabilityc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product product=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.pliabilityc(product,s);
		return mapping.findForward("success");
	}
	//	�������νṹ
	public ActionForward pliabilitys(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product product=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.pliabilitys(product,s);
		return mapping.findForward("success");
	}
}
