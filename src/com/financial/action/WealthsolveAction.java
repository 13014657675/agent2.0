package com.financial.action;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.financial.form.WealthsolveForm; 
import com.object.*; 
public class WealthsolveAction extends DispatchAction
{	
	//	ʹ������
	public ActionForward usage(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		WealthsolveForm wealthsolveForm = (WealthsolveForm) form;  	
		Product product=wealthsolveForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.usage(product,s);
		return mapping.findForward("success");
	} 
	//	��������
	public ActionForward crate(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		WealthsolveForm wealthsolveForm = (WealthsolveForm) form;  	
		Product product=wealthsolveForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.crate(product,s);
		return mapping.findForward("success");
	} 
	//	Ӷ����
	public ActionForward expcrate(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		WealthsolveForm wealthsolveForm = (WealthsolveForm) form;  	
		Product product=wealthsolveForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.expcrate(product,s);
		return mapping.findForward("success");
	} 
	//	����˰��
	public ActionForward ctax(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		WealthsolveForm wealthsolveForm = (WealthsolveForm) form;  	
		Product product=wealthsolveForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.ctax(product,s);
		return mapping.findForward("success");
	} 
	//	֧��˰��
	public ActionForward expctax(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		WealthsolveForm wealthsolveForm = (WealthsolveForm) form;  	
		Product product=wealthsolveForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.expctax(product,s);
		return mapping.findForward("success");
	} 
	//	Ԥ��Ӷ��
	public ActionForward cxytyj(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		WealthsolveForm wealthsolveForm = (WealthsolveForm) form;  	
		Product product=wealthsolveForm.getProduct();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		product.cxytyj(product,s);
		return mapping.findForward("success");
	} 
	//	�����ļ��ϴ�
	public ActionForward cxdz_upload(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		WealthsolveForm wealthsolveForm = (WealthsolveForm) form;  	
		Cxdz cxdz=wealthsolveForm.getCxdz();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		cxdz.cxdz_upload(cxdz,s);				 
		return mapping.findForward("success"); 
	} 
//	//	����
//	public ActionForward sxdz_dz(ActionMapping mapping, ActionForm form, HttpServletRequest request,
//			HttpServletResponse response) throws Exception
//	{
//		WealthsolveForm wealthsolveForm = (WealthsolveForm) form; 
//		Cxdz cxdz=wealthsolveForm.getCxdz();
//		Staff s=(Staff)request.getSession().getAttribute("Staff");
//		cxdz.cxdz_dz(cxdz,s);				 
//		ActionForward af=new ActionForward();
//		af.setPath("/lifesolve/solve/check3.jsp?c_orgid="+cxdz.getC_orgid()+"&c_sjlx="+cxdz.getC_sjlx()+"&c_companyid="+cxdz.getC_companyid()+"&c_year="+cxdz.getC_year()+"&c_month="+cxdz.getC_month());
//		return af;
//	} 
//	//	����
//	public ActionForward sxdz_js(ActionMapping mapping, ActionForm form, HttpServletRequest request,
//			HttpServletResponse response) throws Exception
//	{
//		WealthsolveForm wealthsolveForm = (WealthsolveForm) form; 
//		Cxdz cxdz=wealthsolveForm.getCxdz();
//		Staff s=(Staff)request.getSession().getAttribute("Staff");
//		cxdz.cxdz_js(cxdz,s);				 
//		return mapping.findForward("success"); 
//	} 
}
