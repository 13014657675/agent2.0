<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>  
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						保单复核
					</div>
				</td>
			</tr>					
			<tr>
			<td width="20%">保险公司</td>
			<td width="30%">保单号</td>
			<td width="15%">被保险人姓名</td> 
			<td width="15%">操作人</td>			
			<td width="20%"></td>	
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_cxbd 
				where c_orgid=${sessionScope.Staff.c_orgid } and c_jobnm='add' and c_flag='0' order by c_companyid "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td width="20%">
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			${q2.rows[0].c_name }
			</td>
			<td width="30%">${row.c_bd }</td>
			<td width="15%"> 	
			${row.c_customer }
			</td> 
			<td width="15%">
			<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${row.c_operator }'"></sql:query>		
			${q4.rows[0].c_name }
			</td>			
			<td width="20%" nowrap="nowrap">			
			<html:form action="/wealth" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="cxbddel" />
			<nested:nest property="cxbd">
			<nested:hidden property="c_companyid" value="${row.c_companyid }"></nested:hidden> 
			<nested:hidden property="c_bd" value="${row.c_bd }"></nested:hidden> 
			</nested:nest>
			<a href="../../../toModule.do?prefix=/wealth&page=/base/cxbd/check2.jsp?c_companyid=${row.c_companyid }&c_bd=${row.c_bd }">复核</a>　
			<html:submit value="删除　"></html:submit>
			</html:form>			
			</td>	
			</c:forEach>			
		</table> 
</body>
</html:html>
