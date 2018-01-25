package com.oa.action; 
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction; 
import com.oa.form.FileForm; 
import com.object.*; 
public class FileAction extends DispatchAction {

	// 审批人
	public ActionForward role_add_delete(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		
		FileForm fileForm = (FileForm) form;
		Role role = fileForm.getRole();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		role.add_update_delete(role, s);
		return mapping.findForward("success");
	} 
	// 文件目录
	public ActionForward catalog_add_delete(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		
		FileForm fileForm = (FileForm) form;
		File file = fileForm.getFile();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		file.catalog_add_delete(file, s);
		return mapping.findForward("success");
	} 
	// 文件上挂
	public ActionForward filesigned_add(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		FileForm fileForm = (FileForm) form;  
		Filesigned filesigned = fileForm.getFilesigned();
		Sprocess sprocess =fileForm.getSprocess(); 
		File file = fileForm.getFile();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		String filepath = request.getSession().getServletContext().getRealPath("upload/file") + "/"; 
		filesigned.filesigned_add(filesigned,sprocess,file,filepath,s);
		return mapping.findForward("success");
	} 
	// 文件批复
	public ActionForward filesigned_return(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		FileForm fileForm = (FileForm) form;  
		Sprocess sprocess = fileForm.getSprocess();
		File file = fileForm.getFile(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		sprocess.filesigned_return(sprocess,file,s);
		return mapping.findForward("success");
	}  	
	// 文件修改
	public ActionForward file_update_del(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		
		FileForm fileForm = (FileForm) form;  
		File file = fileForm.getFile(); 
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		file.file_update_del(file, s);
		return mapping.findForward("success");
	} 
}
