package com.wealth.action; 
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;  
import com.wealth.form.WealthForm;
import com.object.*; 
public class WealthAction extends DispatchAction {

	// �������
	public ActionForward cxbdadd(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		WealthForm wealthForm = (WealthForm) form;
		Cxbd cxbd = wealthForm.getCxbd();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		cxbd.cxbdadd(cxbd, s);
		return mapping.findForward("success");
	} 
	//	 ����ɾ��
	public ActionForward cxbddel(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		WealthForm wealthForm = (WealthForm) form;
		Cxbd cxbd = wealthForm.getCxbd();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		cxbd.cxbddel(cxbd, s);
		return mapping.findForward("success");
	}  
//	//	 �����˱�
//	public ActionForward sxbdtb(ActionMapping mapping,ActionForm form, HttpServletRequest request,
//			HttpServletResponse response) throws SQLException {		
//		SxbdForm sxbdForm = (SxbdForm) form;
//		Sxbd sxbd = sxbdForm.getSxbd(); 
//		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
//		sxbd.sxbdtb(sxbd, s);
//		return mapping.findForward("success");
//	}   
//	//	 ����״̬�ָ�
//	public ActionForward sxbdback(ActionMapping mapping,ActionForm form, HttpServletRequest request,
//			HttpServletResponse response) throws SQLException {		
//		SxbdForm sxbdForm = (SxbdForm) form;
//		Sxbd sxbd = sxbdForm.getSxbd(); 
//		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
//		sxbd.sxbdback(sxbd, s);
//		return mapping.findForward("success");
//	} 
	
}
