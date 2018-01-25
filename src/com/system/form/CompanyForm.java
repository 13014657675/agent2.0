package com.system.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class CompanyForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L; 
	
	private Company company;	  	 

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{ 
		this.company=new Company();		 
	} 
}