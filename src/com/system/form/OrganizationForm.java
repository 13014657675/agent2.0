package com.system.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class OrganizationForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L; 
	
	private Organization organization;	   
	
	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{ 
		this.organization=new Organization();		 
	} 
}