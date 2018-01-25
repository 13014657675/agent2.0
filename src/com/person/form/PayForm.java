package com.person.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class PayForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L; 
	
	private Pay pay;	  	 

	public Pay getPay() {
		return pay;
	}

	public void setPay(Pay pay) {
		this.pay = pay;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{ 
		this.pay=new Pay();  		
	} 
}