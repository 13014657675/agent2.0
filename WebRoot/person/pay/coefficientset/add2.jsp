<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head> 
		<body>	 		
		<form action="../../../toModule.do?prefix=/person&page=/pay/coefficientset/add3.jsp" method="post">
		<input type="hidden" name="c_orgid" value="${param.c_orgid }">
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							薪酬系数值添加
						</div>
					</td>
				</tr>	
				<tr>
				<td align="right" width="50%">薪酬相关系数</td>
				<td> 
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_pcoefficient where c_input < 20 order by c_input "></sql:query>
				<select name="c_pcoefficient" id="c_pcoefficient" >
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name } </option>
					</c:forEach>
				</select>
				</td>				
				</tr>					 	
				<tr>
				<td align="right" width="50%">
					<input type="submit" value=" 下一步 "/>
				</td>	<td align="center" width="50%"> 				
				</tr> 
				</table>
			</form>	 
			</body>			 
</html:html>
