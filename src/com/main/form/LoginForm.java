package com.main.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class LoginForm extends ActionForm {
	private static final long serialVersionUID = 1L;

	private String c_jobnumber;

	private String c_pwd;

	private String c_random;	
	
	public String getC_pwd() {
		return c_pwd;
	}

	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}

	public String getC_random() {
		return c_random;
	}

	public void setC_random(String c_random) {
		this.c_random = c_random;
	} 

	public String getC_jobnumber() {
		return c_jobnumber;
	}

	public void setC_jobnumber(String c_jobnumber) {
		this.c_jobnumber = c_jobnumber;
	} 

	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		//ÑéÖ¤Âë´íÎó
		if (!this.c_random.equalsIgnoreCase((String) request.getSession()
				.getAttribute("c_random"))) { 
			errors.add("c_random.error", new ActionMessage("login.c_random.error"));
			
			return errors;
		}		 
		return errors;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.c_pwd = "";
		this.c_random = "";
	}

	 
}