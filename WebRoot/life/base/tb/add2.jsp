<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>  
		<html:form action="/sxbd" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="sxbdtb" />
		<nested:nest property="sxbd">  	
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						保单退保
					</div>
				</td>
			</tr>					
			<tr>
				<td width="50%" align="right">保险公司</td>
				<td>
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
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_sxbd 
				where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_jobnm='0' and c_flag='0'"></sql:query>
			<tr>
				<td width="50%" align="right">投保人</td>
				<td>
					<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${q2.rows[0].c_tbrnum }"></sql:query>
					 ${q3.rows[0].c_name }
				</td>
			</tr>  
			<tr>
				<td width="50%" align="right">退保类型</td>
				<td>
					<nested:hidden property="c_companyid" value="${q2.rows[0].c_companyid }"></nested:hidden>
					<nested:hidden property="c_tbd" value="${q2.rows[0].c_tbd }"></nested:hidden>
					<nested:hidden property="c_bd" value="${q2.rows[0].c_bd }"></nested:hidden>
					<nested:select property="c_type">
					<html:option value="4">犹豫期退保（撤单）</html:option>
					<html:option value="5">正常退保</html:option>
					</nested:select>
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">日期</td>
				<td>
					 <nested:text property="c_date" maxlength="8" value="" styleId="req" title="日期必须填写！"></nested:text>
				</td>
			</tr>  			 
			</nested:nest>
			<tr>
				<td width="50%" align="right">
				<input type="submit" value=" 确 定 ">
				</td>
				<td width="50%" >
				<input type="reset" value=" 重 置 ">
				</td>
			</tr> 
		</table>
</html:form> 
</body>
</html:html>
