package com.financial.action;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.financial.form.LifesolveForm; 
import com.object.*; 
public class LifesolveAction extends DispatchAction
{	
	//	手续费率
	public ActionForward srate(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		LifesolveForm lifesolveForm = (LifesolveForm) form;  	
		Product product=lifesolveForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.srate(product,s);
		return mapping.findForward("success");
	}
	//	佣金项目
	public ActionForward exptype(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		LifesolveForm lifesolveForm = (LifesolveForm) form;  	
		Product product=lifesolveForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.exptype(product,s);
		return mapping.findForward("success");
	} 
	//	佣金率
	public ActionForward expsrate(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		LifesolveForm lifesolveForm = (LifesolveForm) form;  	
		Product product=lifesolveForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.expsrate(product,s);
		return mapping.findForward("success");
	} 
	//	对账文件上传
	public ActionForward sxdz_upload(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		LifesolveForm lifesolveForm = (LifesolveForm) form;  
		Sxdz sxdz=lifesolveForm.getSxdz();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		sxdz.sxdz_upload(sxdz,s);				 
		return mapping.findForward("success"); 
	} 
	//	对账
	public ActionForward sxdz_dz(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		LifesolveForm lifesolveForm = (LifesolveForm) form;  
		Sxdz sxdz=lifesolveForm.getSxdz();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		sxdz.sxdz_dz(sxdz,s);				 
		ActionForward af=new ActionForward();
		af.setPath("/lifesolve/solve/check3.jsp?c_orgid="+sxdz.getC_orgid()+"&c_sjlx="+sxdz.getC_sjlx()+"&c_companyid="+sxdz.getC_companyid()+"&c_year="+sxdz.getC_year()+"&c_month="+sxdz.getC_month());
		return af;
	} 
	//	结算
	public ActionForward sxdz_js(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		LifesolveForm lifesolveForm = (LifesolveForm) form;  
		Sxdz sxdz=lifesolveForm.getSxdz();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		sxdz.sxdz_js(sxdz,s);				 
		return mapping.findForward("success"); 
	} 
	//	寿险数据计算
	public ActionForward sxsjjs(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		LifesolveForm lifesolveForm = (LifesolveForm) form;  
		Sxdz sxdz=lifesolveForm.getSxdz();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		sxdz.sxsjjs(sxdz,s);				 
		return mapping.findForward("success"); 
	}  
}
