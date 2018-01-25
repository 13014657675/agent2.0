package com.person.action; 
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction; 
import com.object.*;
import com.person.form.StaffForm; 
public class StaffAction extends DispatchAction
{
	
	//	员工基本资料录入
	public ActionForward staff_sql(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		//Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		request.getSession().setAttribute("Staff1", staff);
		ActionForward af=new ActionForward();
		af.setPath("/staff/entry/add4.jsp?c_orgid="+staff.getC_orgid());
		return af;
	} 
	//	职位岗位设置
	public ActionForward post_sql(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		//Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		request.getSession().setAttribute("Staff2", staff);
		ActionForward af=new ActionForward();
		af.setPath("/staff/entry/add5.jsp");
		return af;
	} 
	//	员工入司
	public ActionForward staff_add(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		Staff staff1=(Staff)request.getSession().getAttribute("Staff1");
		Staff staff2=(Staff)request.getSession().getAttribute("Staff2");
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff3=staffForm.getStaff();
		request.getSession().setAttribute("Staff3", staff3);
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		String c_jobnumber=staff3.staff_add(staff1,staff2,staff3,s);
		ActionForward af=new ActionForward();
		af.setPath("/staff/entry/add6.jsp?c_jobnumber="+c_jobnumber);
		return af;
	}
	//	员工删除
	public ActionForward staff_delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		staff.staff_delete(staff,s);
		return mapping.findForward("success");
	}	
	//	 基本资料修改
	public ActionForward staffset(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		staff.staffset(staff,s);
		return mapping.findForward("success");
	}
	//	 职位岗位修改
	public ActionForward postset(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		staff.postset(staff,s);
		return mapping.findForward("success");
	}
	//	 薪酬等级调整 
	public ActionForward payset(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		staff.payset(staff,s);
		return mapping.findForward("success");
	}
	//	 转正操作
	public ActionForward stateset(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		staff.payset(staff,s);
		return mapping.findForward("success");
	}	
	//	 机构负责人设置
	public ActionForward orghead(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		staff.orghead(staff,s);
		return mapping.findForward("success");
	}
	//	员工权限修改
	public ActionForward staffqx(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		staff.staffqx(staff,s);
		return mapping.findForward("success");
	} 
	//	员工密码设置
	public ActionForward pwdreset(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		staff.pwdreset(staff,s);
		return mapping.findForward("success");
	} 		
	//	员工离司
	public ActionForward quit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		StaffForm staffForm = (StaffForm) form;  	
		Staff staff=staffForm.getStaff();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		staff.quit(staff,s);
		return mapping.findForward("success");
	}
}
