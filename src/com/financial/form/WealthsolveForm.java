package com.financial.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class WealthsolveForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L; 
	
	private Product product;	 	  
	
	private Cxdz cxdz;	

	public Product getProduct() {
		return product;
	}
		
	public void setProduct(Product product) {
		this.product = product;
	}

	public Cxdz getCxdz() {
		return cxdz;
	}

	public void setCxdz(Cxdz cxdz) {
		this.cxdz = cxdz;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{ 
		this.product=new Product(); 
		this.cxdz=new Cxdz();
	} 
}