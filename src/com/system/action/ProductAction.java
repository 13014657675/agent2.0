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
	
	//	产品分类
	public ActionForward ptclass(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.ptclass(prodect,s);
		return mapping.findForward("success");
	}
	//	产品类型
	public ActionForward pttype(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.pttype(prodect,s);
		return mapping.findForward("success");
	}	
	//	产品定义
	public ActionForward add_update_delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.add_update_delete(prodect,s);
		return mapping.findForward("success");
	}
	//	产品组件
	public ActionForward pcomponent(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.pcomponent(prodect,s);
		return mapping.findForward("success");
	}
	//	产品费率
	public ActionForward ptrate(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Rate rate=prodectForm.getRate();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		rate.add_update_delete(rate,s);
		return mapping.findForward("success");
	}
	//	产品系数
	public ActionForward ptconvert(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.ptconvert(prodect,s);
		return mapping.findForward("success");
	}
	//	保险责任
	public ActionForward pliability(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product prodect=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		prodect.pliability(prodect,s);
		return mapping.findForward("success");
	}
	//	保险责任相关名词
	public ActionForward pliabilityc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		ProductForm prodectForm = (ProductForm) form;  	
		Product product=prodectForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.pliabilityc(product,s);
		return mapping.findForward("success");
	}
	//	保险责任结构
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
