package com.person.action;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.read.biff.BiffException;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction; 
import com.object.*;
import com.person.form.CheckForm; 
public class CheckAction extends DispatchAction
{
	
	//	考勤类型
	public ActionForward ontype(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		CheckForm checkForm = (CheckForm) form;  	
		Check check=checkForm.getCheck();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		check.ontype(check,s);
		return mapping.findForward("success");
	}
	//	机构考勤类型
	public ActionForward ontype2(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		CheckForm checkForm = (CheckForm) form;  	
		Check check=checkForm.getCheck();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		check.ontype2(check,s);
		return mapping.findForward("success");
	}
	//	关联工号
	public ActionForward onrelate(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException 
	{
		CheckForm checkForm = (CheckForm) form;  	
		Check check=checkForm.getCheck();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		check.onrelate(check,s);
		return mapping.findForward("success");
	} 
	//	值勤表导入
	public ActionForward onimport(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, BiffException, FileNotFoundException, IOException
	{
		CheckForm checkForm = (CheckForm) form;  	
		Check check=checkForm.getCheck();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		check.onimport(check,s);		
		return mapping.findForward("success");
	} 
	//	值勤登记
	public ActionForward onduty(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		CheckForm checkForm = (CheckForm) form;  	
		Check check=checkForm.getCheck();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		check.onduty(check,s);
		return mapping.findForward("success");
	} 
	//	考勤汇总
	public ActionForward onsummary(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException
	{
		CheckForm checkForm = (CheckForm) form;  	
		Check check=checkForm.getCheck();
		Staff s=(Staff)request.getSession().getAttribute("Staff");
		check.onsummary(check,s);
		return mapping.findForward("success");
	} 
}
