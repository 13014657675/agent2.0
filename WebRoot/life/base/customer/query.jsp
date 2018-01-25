<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
<form action="../../../toModule.do?prefix=/life&page=/base/customer/query2.jsp"  method="post" >  
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						客户查询
					</div>
				</td>
			</tr>					
			<tr>
			<td align="right" width="50%">证件类型</td>
			<td  align="left">
			 <sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
			 	<select name="c_cardtype">
			 	<c:forEach var="row" items="${query1.rows}" >		
					<option value="${row.c_code }">${row.c_name }</option>
				</c:forEach>
			 	</select>
			</td>
			</tr>
			<tr>
			<td align="right" width="50%">证件号码</td>
			<td colspan="2">
				<input name="c_cardnum" value="" size="40" id="req" title="证件号码必须填写"> 
			 </td>
			</tr>	
			<tr>				
				<td align="right">
				<input type="submit" value="确 定">
				</td>			
				<td>
				<input type="reset" value="取 消">
				</td>			
			</tr>
		</table>
</form> 
</body>
</html:html>
