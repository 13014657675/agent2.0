<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head>
<body >  
		<html:form action="/sxbd" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="sxbdhz" />
		<nested:nest property="sxbd"> 				
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						保单回执
					</div>
				</td>
			</tr>					
			<tr>
			<td width="50%" align="right">保险公司</td>
			<td width="50%">
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_company where c_no=${param.c_companyid }"></sql:query>
			${q1.rows[0].c_name }
			</td> 
			</tr>
			<tr>
				<td width="50%" align="right">保单号</td>
				<td>
					 ${param.c_bd }
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">客户签字日期</td>
				<td>
					<nested:hidden property="c_companyid" value="${param.c_companyid }" ></nested:hidden>
					<nested:hidden property="c_tbd"  value="${param.c_tbd }" ></nested:hidden>
					<nested:hidden property="c_bd"  value="${param.c_bd }" ></nested:hidden>
					<nested:text property="c_date" value="" styleId="req" title="客户签字日期必须填写" maxlength="8"></nested:text>
				</td>
			</tr>  
			</nested:nest>
			<tr>
			<td align="right"><input type="submit" value=" 确 定 "></td>
			<td></td>
			</tr>					
		</table>
</html:form>
</body>
</html:html>
