package com.oa.form;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class ShopForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	
	private Library library;	
	
	private Goodsrecord goodsrecord;	
	 
	public Library getLibrary() {
		return library;
	}

	public void setLibrary(Library library) {
		this.library = library;
	}   

	public Goodsrecord getGoodsrecord() {
		return goodsrecord;
	}

	public void setGoodsrecord(Goodsrecord goodsrecord) {
		this.goodsrecord = goodsrecord;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) { 
		this.library = new Library();
		this.goodsrecord=new Goodsrecord();		
	}
}