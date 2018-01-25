<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
<form action="../../../toModule.do?prefix=/wealth&page=/base/update/cxbd2.jsp"  method="post" onsubmit="return check_form(this)">  
		<input type="hidden" name="c_orgid" value="${sessionScope.Staff.c_orgid }">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						保单数据修改
					</div>
				</td>
			</tr>					
			<tr>
			<td align="right" width="50%">保险公司</td>
			<td  align="left">
			<select name="c_companyid">
			<sql:query var="query"  sql="select * from t_company where c_type=3002" dataSource="${db_mssql}"></sql:query>
			<c:forEach var="row" items="${query.rows}" >					
				<option  value="${row.c_no}"  >${row.c_fullname}</option>					
			</c:forEach>
			</select>
			</td>
			</tr>
			<tr>
			<td align="right" width="50%">保单号</td>
			<td  align="left">
			<input name="c_bd" value="" id="req" title="保单号必须填写" size="40">
			</tr>	
			<tr>				
				<td align="right">
				<input type="submit" value=" 确 定  ">
				</td>			
				<td> 
				<input type="reset" value=" 重 置  ">
				</td>			
			</tr>
		</table>
</form> 
<ul>
<li> <font color="red">只能修改“核销状态”的保单数据</font> </li>
</ul>
</body>
</html:html>
