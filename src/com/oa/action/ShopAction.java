package com.oa.action; 
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction; 
import com.oa.form.ShopForm;
import com.object.*; 
public class ShopAction extends DispatchAction {
	   	 
	//	 ���ඨ��
	public ActionForward goodstype(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		 
		ShopForm shopForm = (ShopForm) form;
		Library library = shopForm.getLibrary();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		library.goodstype(library, s);
		return mapping.findForward("success");
	} 	 
	//	 ��Ʒ����
	public ActionForward goods(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		 
		ShopForm shopForm = (ShopForm) form;
		Library library = shopForm.getLibrary();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		library.goods(library, s);
		return mapping.findForward("success");
	} 	  
	//	 ��Ʒ�����䶯
	public ActionForward goodsbatch(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		 
		ShopForm shopForm = (ShopForm) form;
		Goodsrecord goodsrecord = shopForm.getGoodsrecord();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		goodsrecord.goodsbatch(goodsrecord, s);  		
		ActionForward af=new ActionForward();
		if (goodsrecord.getC_jobnm().equals("rk"))
		{
			af.setPath("/shop/record/rk/print.jsp?c_orgid="+goodsrecord.getC_orgid()+"&c_libraryid="+goodsrecord.getC_libraryid()+"&c_recordid="+goodsrecord.getC_recordid());
			return af;
		}
		if (goodsrecord.getC_jobnm().equals("ck"))
		{
			af.setPath("/shop/record/ck/print.jsp?c_orgid="+goodsrecord.getC_orgid()+"&c_libraryid="+goodsrecord.getC_libraryid()+"&c_recordid="+goodsrecord.getC_recordid());
			return af;
		}
		if (goodsrecord.getC_jobnm().equals("hk"))
		{
			af.setPath("/shop/record/hk/print.jsp?c_orgid="+goodsrecord.getC_orgid()+"&c_libraryid="+goodsrecord.getC_libraryid()+"&c_recordid="+goodsrecord.getC_recordid());
			return af;
		}
		if (goodsrecord.getC_jobnm().equals("bf"))
		{
			af.setPath("/shop/record/bf/print.jsp?c_orgid="+goodsrecord.getC_orgid()+"&c_libraryid="+goodsrecord.getC_libraryid()+"&c_recordid="+goodsrecord.getC_recordid());
			return af;
		}
		return mapping.findForward("success");
	} 	 
	//	 ��Ʒ�۸���
	public ActionForward goodsprice(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		 
		ShopForm shopForm = (ShopForm) form;
		Goodsrecord goodsrecord = shopForm.getGoodsrecord();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		goodsrecord.goodsprice(goodsrecord, s);
		ActionForward af=new ActionForward();
		af.setPath("/shop/record/dj/print.jsp?c_orgid="+goodsrecord.getC_orgid()+"&c_libraryid="+goodsrecord.getC_libraryid()+"&c_recordid="+goodsrecord.getC_recordid());
		return af;
	} 	 
	//	 ��Ʒ����䶯
	public ActionForward goodssingle(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		 
		ShopForm shopForm = (ShopForm) form;
		Goodsrecord goodsrecord = shopForm.getGoodsrecord();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		goodsrecord.goodssingle(goodsrecord, s);
		ActionForward af=new ActionForward();
		if (goodsrecord.getC_jobnm().equals("ck"))
		{
			af.setPath("/shop/record/ck/print.jsp?c_orgid="+goodsrecord.getC_orgid()+"&c_libraryid="+goodsrecord.getC_libraryid()+"&c_recordid="+goodsrecord.getC_recordid());
			return af;
		}
		if (goodsrecord.getC_jobnm().equals("hk"))
		{
			af.setPath("/shop/record/hk/print.jsp?c_orgid="+goodsrecord.getC_orgid()+"&c_libraryid="+goodsrecord.getC_libraryid()+"&c_recordid="+goodsrecord.getC_recordid());
			return af;
		}
		if (goodsrecord.getC_jobnm().equals("bf"))
		{
			af.setPath("/shop/record/bf/print.jsp?c_orgid="+goodsrecord.getC_orgid()+"&c_libraryid="+goodsrecord.getC_libraryid()+"&c_recordid="+goodsrecord.getC_recordid());
			return af;
		}
		return mapping.findForward("success");
	} 	 
}
