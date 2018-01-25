package com.plan.form; 
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping; 
import com.object.Planbook;
public class PlanForm extends ActionForm {
	
	private static final long serialVersionUID = 1L;

	private Planbook planbook;	
	 
	public Planbook getPlanbook() {
		return planbook;
	}

	public void setPlanbook(Planbook planbook) {
		this.planbook = planbook;
	} 

	public void reset(ActionMapping mapping, HttpServletRequest request) {		
		this.planbook=new Planbook();
	}	 
}