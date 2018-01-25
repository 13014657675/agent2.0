package com.oa.action;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction; 

import com.oa.form.ToolForm;
import com.object.*; 
public class ToolAction extends DispatchAction {

	 
	// 工具目录添加
	public ActionForward catalog_add_delete(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		 
		ToolForm toolForm = (ToolForm) form;
		File file = toolForm.getFile();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		file.catalog_add_delete(file, s);
		return mapping.findForward("success");
	} 	 
	// 工具添加
	public ActionForward tool_add(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException {		
		ToolForm toolForm = (ToolForm) form;
		File file = toolForm.getFile();
		String filepath = request.getSession().getServletContext().getRealPath("upload/tool") + "/"; 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		file.tool_add(file,filepath, s);
		return mapping.findForward("success");
	} 
	// 工具修改
	public ActionForward tool_update_del(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		ToolForm toolForm = (ToolForm) form;
		File file = toolForm.getFile(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		file.file_update_del(file, s);
		return mapping.findForward("success");
	} 
	
}
