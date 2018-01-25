package com.oa.form;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import com.object.*;
public class FileForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private Role role;
	private File file;
	private Filesigned filesigned;
	private Sprocess sprocess;

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public Filesigned getFilesigned() {
		return filesigned;
	}

	public void setFilesigned(Filesigned filesigned) {
		this.filesigned = filesigned;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Sprocess getSprocess() {
		return sprocess;
	}

	public void setSprocess(Sprocess sprocess) {
		this.sprocess = sprocess;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.role = new Role(); 
		this.filesigned = new Filesigned();
		this.sprocess = new Sprocess();
		this.file = new File(); 
	}
}