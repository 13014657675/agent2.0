<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
<form action="../../../toModule.do?prefix=/wealth&page=/base/cxbd/query3.jsp"  method="post" onsubmit="return check_form(this)"> 
		<input type="hidden" name="c_type" value="1">
		<input type="hidden" name="c_orgid" value="${sessionScope.Staff.c_orgid }">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						������ѯ
					</div>
				</td>
			</tr>					
			<tr>
			<td align="right" width="50%">���չ�˾</td>
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
			<td align="right" width="50%">������</td>
			<td  align="left">
			<input name="c_bd" value="" size="40" id="req" title="�����ű�����д">
			</td>
			</tr>
			<tr>				
				<td align="right">
				<input type="submit" value="ȷ ��">
				</td>			
				<td>
				<input type="reset" value="ȡ ��">
				</td>			
			</tr>
		</table>
</form> 
<form action="../../../toModule.do?prefix=/wealth&page=/base/cxbd/query2.jsp"  method="post" onsubmit="return check_form(this)"> 
		<input type="hidden" name="c_type" value="2">
		<input type="hidden" name="c_orgid" value="${sessionScope.Staff.c_orgid }">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						������ѯ
					</div>
				</td>
			</tr>				 
			<tr>
			<td align="right" width="50%">�ͻ�����</td>
			<td  align="left">
			<input name="c_name" value="" id="req" title="�ͻ�����������д">
			</td>
			</tr>
			<tr>				
				<td align="right">
				<input type="submit" value="ȷ ��">
				</td>			
				<td>
				<input type="reset" value="ȡ ��">
				</td>			
			</tr>
		</table>
</form> 
</body>
</html:html>
