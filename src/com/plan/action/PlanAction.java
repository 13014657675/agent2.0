package com.plan.action; 
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;  
import org.apache.struts.actions.DispatchAction;
import com.object.*; 
import com.plan.form.PlanForm;
public class PlanAction extends DispatchAction{
	
	//	 计划书生成
	public ActionForward plan_book(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {		 
		PlanForm planForm = (PlanForm) form;
		Planbook planbook = planForm.getPlanbook();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 	
		int c_plan_bookid=planbook.plan_book(planbook, s);
		ActionForward af=new ActionForward();
		af.setPath("/book/add/add3.jsp?c_plan_bookid="+c_plan_bookid);
		return af;
	} 
}