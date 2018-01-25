package com.system.form;
import javax.servlet.http.HttpServletRequest; 
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class ProjectForm extends ActionForm
{
 
	private static final long serialVersionUID = 1L; 
	
	private Processor processor;	   	  
	
	public Processor getProcessor() {
		return processor;
	}

	public void setProcessor(Processor processor) {
		this.processor = processor;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request)
	{ 
		this.processor=new Processor();		 
	} 
}