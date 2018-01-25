<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true"> 
<head>
	<html:base/>
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
	<body>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="5" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						物品查询
					</div>
				</td>
			</tr>
			<tr>  
			<td width="40%"><div align="center">分类名</div></td>
			<td width="40%"><div align="center">物品名</div></td> 
			<td width="20%"><div align="center">查询</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql=" select *  from t_goods 
				where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } order by c_goodstypeid  "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr> 			 
				<sql:query var="q2" dataSource="${db_mssql }" sql=" select *  from t_goodstype 
				where c_no=${row.c_goodstypeid }  "></sql:query>
			<td><div align="center">
			${q2.rows[0].c_name }
			</div></td>  	
			<td><div align="center">${row.c_name }</div></td>  	 
			<td   valign="middle" align="center"> 				
			<A href="../../../toModule.do?prefix=/oa&page=/shop/goods/query3.jsp?c_no=${row.c_no }">查询</A> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
