<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">		 
</head>		
	<body><sql:query var="q1" dataSource="${db_mssql }" sql="select a.*,b.c_name dept from t_post a,t_dept b where a.c_deptid=b.c_no 
		and a.c_orgid=${param.c_orgid } order by a.c_deptid"></sql:query> 		
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="4" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						权限设置
					</div>
				</td>
			</tr> 					 
			<tr> 
				<td width="33%"><div align="center">部门</div></td>  
				<td width="33%"><div align="center">职位或岗位名称</div></td>
				<td width="33%"><div align="center">权限设置</div></td> 
			</tr> 
			<c:forEach items="${q1.rows }" var="row" varStatus="x">			 
			<tr>		
				<td width="33%"><div align="center">${row.dept }</div></td>							 
				<td width="33%"><div align="center">${row.c_name }</div></td>	
				<td width="33%"><div align="center">
				<a href="../../../toModule.do?prefix=/system&page=/organization/post/menu4.jsp?c_postid=${row.c_no }">权限设置</a>
				</div></td>				 
			</tr>  
			</c:forEach>				 
			</table>					
	</body> 
</html:html>
