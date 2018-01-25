<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">		
</head> 
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_staff where c_orgid=${param.c_orgid } and c_quitdate is null order by c_jobnumber"></sql:query>
		<body >	 		 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="4" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							薪酬计算
						</div>
					</td>
				</tr>	
				<tr>
				<td align="center" width="10%">工号</td>
				<td align="center" width="10%">姓名</td>
				<td align="center" width="70%">公式</td>
				<td align="center" width="10%">结果值</td>
				</tr> 
				 <c:forEach items="${q1.rows }" var="row">
				 <tr>
					<td align="center" width="10%">${row.c_jobnumber }</td>
					<td align="center" width="10%">${row.c_name }</td>
					<td align="center" width="70%">公式</td>
					<td align="center" width="10%">结果值</td>
				</tr>
				 </c:forEach>
				<tr> 
				<td align="center"  colspan="4">
					<input type="submit" value=" 确 定 "/>
				</td>	 		
				</tr> 
				</table> 
			</body>			 
</html:html>
