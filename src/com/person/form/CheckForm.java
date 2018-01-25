package com.person.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class CheckForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L; 
	
	private Check check;	  	 
	 
	public Check getCheck() {
		return check;
	}

	public void setCheck(Check check) {
		this.check = check;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{ 
		this.check=new Check();  		
	} 
}