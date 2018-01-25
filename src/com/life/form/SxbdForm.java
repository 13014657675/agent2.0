package com.life.form;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class SxbdForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	
	private Sxbd sxbd; 	
	private Customer tbr; 	
	private Customer bbr; 
		
	public Sxbd getSxbd() {
		return sxbd;
	}

	public void setSxbd(Sxbd sxbd) {
		this.sxbd = sxbd;
	}	

	public Customer getBbr() {
		return bbr;
	}

	public void setBbr(Customer bbr) {
		this.bbr = bbr;
	}

	public Customer getTbr() {
		return tbr;
	}

	public void setTbr(Customer tbr) {
		this.tbr = tbr;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.sxbd = new Sxbd();  
		this.tbr=new Customer();
		this.bbr=new Customer();
	}
}