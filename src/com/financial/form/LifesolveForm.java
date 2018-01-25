package com.financial.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class LifesolveForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L; 
	
	private Product product;	 	  
	
	private Sxdz sxdz;	

	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}

	public Sxdz getSxdz() {
		return sxdz;
	}

	public void setSxdz(Sxdz sxdz) {
		this.sxdz = sxdz;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{ 
		this.product=new Product(); 
		this.sxdz=new Sxdz();
	} 
}