package com.oa.form;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class SignedForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private Role role;
	private File file;
	private Signed signed;
	private Sprocess sprocess;

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Signed getSigned() {
		return signed;
	}

	public void setSigned(Signed signed) {
		this.signed = signed;
	}

	public Sprocess getSprocess() {
		return sprocess;
	}

	public void setSprocess(Sprocess sprocess) {
		this.sprocess = sprocess;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.role = new Role(); 
		this.file = new File();
		this.signed = new Signed();
		this.sprocess = new Sprocess();
	}

}