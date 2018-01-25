package com.oa.form;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class ToolForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private File file;

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) { 
		this.file = new File();
	}
}