package com.system.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class ProductForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L; 
	
	private Product product;	 
	
	private Rate rate;
	
	public Rate getRate() {
		return rate;
	}

	public void setRate(Rate rate) {
		this.rate = rate;
	}

	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{ 
		this.product=new Product();
		this.rate=new Rate();
	} 
}