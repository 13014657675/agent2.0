package com.wealth.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.Staff;;
public class AgentForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L;

	private Staff agent;	
		 
	public Staff getAgent() {
		return agent;
	}

	public void setAgent(Staff agent) {
		this.agent = agent;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{
		this.agent=new Staff(); 
	} 
}