package com.life.form;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class CustomerForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	
	private Customer customer; 
		 
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.customer = new Customer();  
	}
}