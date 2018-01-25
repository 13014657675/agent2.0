package com.life.action; 
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;  
import com.life.form.SxbdForm;
import com.object.*; 
public class SxbdAction extends DispatchAction {

	// 投保单添加
	public ActionForward sxbdadd(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd();
		Customer tbr = sxbdForm.getTbr();
		Customer bbr = sxbdForm.getBbr();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxbdadd(tbr,bbr,sxbd, s);
		return mapping.findForward("success");
	} 
	//	 投保单删除
	public ActionForward sxbddel(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxbddel(sxbd, s);
		return mapping.findForward("success");
	} 
	//	 投保单撤单
	public ActionForward sxbdcd(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxbdcd(sxbd, s);
		return mapping.findForward("success");
	} 
	//	 保单生效
	public ActionForward sxbdsx(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxbdsx(sxbd, s);
		return mapping.findForward("success");
	} 
	//	 保单发放
	public ActionForward sxbdff(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxbdff(sxbd, s);		 
		return mapping.findForward("success");
	} 
	//	 保单回执
	public ActionForward sxbdhz(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxbdhz(sxbd, s);
		return mapping.findForward("success");
	}  
	//	 保单退保
	public ActionForward sxbdtb(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxbdtb(sxbd, s);
		return mapping.findForward("success");
	}  
	//	 保单日期修改
	public ActionForward sxbdrq(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxbdrq(sxbd, s);
		return mapping.findForward("success");
	}
	//	 保单状态恢复
	public ActionForward sxbdback(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxbdback(sxbd, s);
		return mapping.findForward("success");
	} 
	//	 续期发票录入
	public ActionForward sxbdxuqi(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxbdxuqi(sxbd, s);
		return mapping.findForward("success");
	} 
	//	 寿险报案
	public ActionForward sxlpba(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxlpba(sxbd, s);
		return mapping.findForward("success");
	} 
	//	 寿险结案
	public ActionForward sxlpja(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		SxbdForm sxbdForm = (SxbdForm) form;
		Sxbd sxbd = sxbdForm.getSxbd(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sxbd.sxlpja(sxbd, s);
		return mapping.findForward("success");
	} 
}
