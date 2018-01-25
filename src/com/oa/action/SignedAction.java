package com.oa.action; 
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;  

import com.oa.form.SignedForm;
import com.object.*; 
public class SignedAction extends DispatchAction {

	// 审批人添加
	public ActionForward role_add_delete(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		
		SignedForm signedForm = (SignedForm) form;
		Role role = signedForm.getRole();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		role.add_update_delete(role, s);
		return mapping.findForward("success");
	} 	
	//	 角色设置
	public ActionForward roleset(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		
		SignedForm signedForm = (SignedForm) form;
		Role role = signedForm.getRole();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		role.roleset(role, s);
		return mapping.findForward("success");
	} 		 
	// 授权人定义
	public ActionForward grant_add_update(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		
		SignedForm signedForm = (SignedForm) form;
		Role role = signedForm.getRole();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		role.grant(role, s);
		return mapping.findForward("success");
	} 		 
	// 签批申请
	public ActionForward signed_add(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SignedForm signedForm = (SignedForm) form;
		Signed signed = signedForm.getSigned();
		Sprocess sprocess = signedForm.getSprocess();
		File file = signedForm.getFile();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		String filepath = request.getSession().getServletContext().getRealPath("upload/signed") + "/"; 
		signed.signed_add(signed,sprocess,file,filepath,s);
		return mapping.findForward("success");
	} 
	// 文件批复
	public ActionForward signed_return(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		SignedForm signedForm = (SignedForm) form; 
		Sprocess sprocess = signedForm.getSprocess();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sprocess.signed_return(sprocess,s);
		return mapping.findForward("success");
	}  
}
