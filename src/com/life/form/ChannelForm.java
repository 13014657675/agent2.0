package com.life.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class ChannelForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L; 
	
	private Bankoutlets bankoutlets; 
	
	private Staff agent;	
	
	public Bankoutlets getBankoutlets() {
		return bankoutlets;
	}

	public void setBankoutlets(Bankoutlets bankoutlets) {
		this.bankoutlets = bankoutlets;
	}

	public Staff getAgent() {
		return agent;
	}

	public void setAgent(Staff agent) {
		this.agent = agent;
	} 
	
	public void reset(ActionMapping mapping, HttpServletRequest request)
	{ 
		this.bankoutlets = new Bankoutlets();
		this.agent=new Staff();
	}
	
}