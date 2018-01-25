package com.person.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class StaffForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L; 
	
	private Staff staff;	  	  

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{ 
		this.staff=new Staff();  
		
	} 
}