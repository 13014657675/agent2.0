package com.publics;
import java.io.FileOutputStream;
import java.io.IOException; 
import java.util.*;
import org.apache.struts.upload.FormFile;
public class Tool {

	public Tool() {
		// TODO Auto-generated constructor stub
	}

	public boolean addFile(FormFile file, String spath) throws IOException {
		boolean f = false;	 
		FileOutputStream fileOutput;
		fileOutput = new FileOutputStream(spath);
		fileOutput.write(file.getFileData());
		fileOutput.flush();
		fileOutput.close();
		f = true; 
		return f;
	}

	public boolean deleteFile(String spath) {
		boolean f = false;
		java.io.File s_file = new java.io.File(spath);
		if (s_file.isFile() && s_file.exists()) {
			s_file.delete();
			f = true;
		}
		return f;
	}
	
	public String getDATE(int year,int month,int day) {
		String r,y="",m="",d="";
		y=String.valueOf(year); 
		if (month<10){
			m="0"+String.valueOf(month);
		}
		else{
			m=String.valueOf(month);
		}	
		if (day<10){
			d="0"+String.valueOf(day);
		}
		else{
			d=String.valueOf(day);
		}
		r=y+m+d;
		return r;
	}
	
	public String getCDATE() { 
		String r=null; 
		int y=Calendar.getInstance().get(Calendar.YEAR);
		int m=1+Calendar.getInstance().get(Calendar.MONTH);
		int d=Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
		r=getDATE(y,m,d);  
		return r;
	}
	
	public static void main(String[] args) {
	//	String s=new Tool().getCDATE();
	//	System.out.println(s);
		System.out.println("ÄãºÃ À²À²À²".replaceAll(" ", ""));
	}
}
