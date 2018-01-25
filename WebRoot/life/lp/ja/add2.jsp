<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>
<body>	 
	<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxlp 
		where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_jobnm='ba'"></sql:query>
	<table width="100%" border="1" cellspacing="0" id="table">
			<tr >
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">						
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						结案添加
					</div>
				</td>
			</tr>
			<tr>
			<td width="25%" align="center">保险公司</td>
			<td width="40%">保单号</td>
			<td width="10%">报案日期</td>
			<td width="25%"></td>
			</tr>	 
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td width="25%" align="center">
			<sql:query var="q2"  sql="select * from t_company where c_no=${row.c_companyid }" dataSource="${db_mssql}"></sql:query>
			${q2.rows[0].c_name }
			</td>
			<td width="40%">${row.c_bd }</td>
			<td width="10%">${row.c_barq }</td>
			<td width="25%">
			<html:form action="/sxbd" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="sxlpba" />
			<nested:nest property="sxbd">
			<nested:hidden property="c_jobnm" value="del"/>
			<nested:hidden property="c_orgid" value="${row.c_orgid }"/>
			<nested:hidden property="c_companyid" value="${row.c_companyid }"></nested:hidden> 
			<nested:hidden property="c_bd" value="${row.c_bd }"></nested:hidden> 
			<nested:hidden property="c_barq" value="${row.c_barq }"></nested:hidden> 
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden> 
			</nested:nest>
			<A href="../../../toModule.do?prefix=/life&page=/lp/ja/add3.jsp?c_no=${row.c_no }">结案</A>
			<html:submit value="删除　"></html:submit>
			</html:form>					
			</td>
			</tr>
			</c:forEach>			 
		</table> 
</body>
</html:html>

