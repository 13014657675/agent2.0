package com.wealth.form;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class WealthForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	
	private Cxbd cxbd; 	 	

	public Cxbd getCxbd() {
		return cxbd;
	}

	public void setCxbd(Cxbd cxbd) {
		this.cxbd = cxbd;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.cxbd = new Cxbd();   
	}
}