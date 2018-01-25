<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>				 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="4" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						设置
					</div>
				</td>
			</tr> 		
			<tr>
			<td width="25%"><div align="center">角色</div></td>
			<td width="25%"><div align="center">工号</div></td> 
			<td width="25%"><div align="center">姓名</div></td>			
			<td width="25%"><div align="center">设置</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql=" select a.*,b.c_name from t_role a,t_staff b where a.c_sys=3 and c_role=303
				and  a.c_jobnumber=b.c_jobnumber "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td width="25%"><div align="center">
			<c:choose>
			<c:when test="${row.c_role eq 301 }">审批人</c:when>
			<c:when test="${row.c_role eq 302 }">财务负责人</c:when>
			<c:when test="${row.c_role eq 303 }">分管总</c:when>
			</c:choose>			
			</div></td>
			<td width="25%"><div align="center">${row.c_jobnumber }</div></td> 
			<td width="25%"><div align="center">${row.c_name }</div></td>			
			<td width="25%"><div align="center">
			<a href="../../../toModule.do?prefix=/oa&page=/signed/role/set2.jsp?c_jobnumber=${row.c_jobnumber }">设置</a>
			</div></td>
			</tr>
			</c:forEach>
			
		</table>	 
	</body> 
</html:html>
