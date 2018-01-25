package com.life.action; 
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction; 
import com.life.form.CustomerForm; 
import com.object.*; 
public class CustomerAction extends DispatchAction {

	// 客户添加，修改
	public ActionForward add_update(ActionMapping mapping,ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		
		CustomerForm customerForm = (CustomerForm) form;
		Customer customer = customerForm.getCustomer();
		Staff s=(Staff)request.getSession().getAttribute("Staff"); 
		customer.add_update(customer, s);
		return mapping.findForward("success");
	} 
	 
}
