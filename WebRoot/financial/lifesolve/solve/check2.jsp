<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>佣金率设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>
<body> 
	<logic:equal value="1" parameter="c_sjlx">
	<sql:query var="q1" dataSource="${db_mssql }" 
	sql="select * from t_sxdz where c_orgid=${param.c_orgid } and c_year=${param.c_year } and c_month=${param.c_month } and c_companyid=${param.c_companyid }"></sql:query>
	<table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						 首期对账
				</td>
			</tr> 
		<tr> 
		<tr>
		<td width="25%">保单</td>
		<td width="15%">投保人姓名</td>
		<td width="15%">被保人姓名</td>
		<td width="15%">承保日期</td>
		<td width="15%">保险费</td>
		<td width="15%">手续费</td>
		</tr>
		<c:forEach items="${q1.rows }" var="row">
		<tr>
		<td>${row.c_bd }</td>
		<td>${row.c_tbrname }</td>
		<td>${row.c_bbrname }</td>
		<td>${row.c_cbrq }</td>
		<td>${row.c_bxf }</td>
		<td>${row.c_sxf }</td>
		</tr>
		</c:forEach>
		<tr>
		<td colspan="6" align="center">
		<html:form action="/lifesolve"  onsubmit="return check_form(this)" >
		<html:hidden property="jobname" value="sxdz_dz"/>
		<nested:nest property="sxdz"> 
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>
		<nested:hidden property="c_sjlx" value="1"></nested:hidden>  
		<nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>  
		<nested:hidden property="c_year" value="${param.c_year }"></nested:hidden>  
		<nested:hidden property="c_month" value="${param.c_month }"></nested:hidden>  
		<input type="submit" value=" 对 账 ">
		</nested:nest></html:form>
		</td>
		</tr>
		</table>   
		</logic:equal>
	<logic:equal value="2" parameter="c_sjlx">
	<sql:query var="q1" dataSource="${db_mssql }" 
	sql="select * from t_sxdz_xq where c_orgid=${param.c_orgid } and c_year=${param.c_year } and c_month=${param.c_month } and c_companyid=${param.c_companyid }"></sql:query>
	<table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						 续期对账
				</td>
			</tr> 
		<tr> 
		<tr>
		<td width="25%">保单</td>
		<td width="25%">保单年度</td> 
		<td width="25%">保险费</td>
		<td width="25%">手续费</td>
		</tr>
		<c:forEach items="${q1.rows }" var="row">
		<tr>
		<td>${row.c_bd }</td>
		<td>${row.c_bdnd }</td> 
		<td>${row.c_bxf }</td>
		<td>${row.c_sxf }</td>
		</tr>
		</c:forEach>
		<tr>
		<td colspan="6" align="center">
		<html:form action="/lifesolve"  onsubmit="return check_form(this)" >
		<html:hidden property="jobname" value="sxdz_dz"/>
		<nested:nest property="sxdz"> 
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>
		<nested:hidden property="c_sjlx" value="2"></nested:hidden>  
		<nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>  
		<nested:hidden property="c_year" value="${param.c_year }"></nested:hidden>  
		<nested:hidden property="c_month" value="${param.c_month }"></nested:hidden>  
		<input type="submit" value=" 对 账 ">
		</nested:nest></html:form>
		</td>
		</tr>
		</table>   
		</logic:equal>
</body>
</html:html>
