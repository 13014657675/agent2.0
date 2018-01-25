<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">		 
</head>		
	<body><sql:query var="q" dataSource="${db_mssql }" sql="select a.*,b.c_name dept from t_post a,t_dept b where a.c_deptid=b.c_no 
		and a.c_orgid=${param.c_orgid } order by a.c_deptid,a.c_type,c_ishead"></sql:query> 		
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="5" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						部门长设置
					</div>
				</td>
			</tr> 					 
			<tr>
				<td width="20%"><div align="center">部门</div></td>
				<td width="20%"><div align="center">类型</div></td>
				<td width="20%"><div align="center">名称</div></td>
				<td width="20%" align="center">是否为部门长</td>
				<td width="20%" align="center">设置</td>
			</tr> 
			<c:forEach items="${q.rows }" var="row">			 
			<tr>
				<html:form  action="/organization" onsubmit="return check_form(this)">
				<html:hidden property="jobname" value="sethead"/>
				<nested:nest property="organization">	
				<nested:hidden property="c_orgid" value="${row.c_orgid }"></nested:hidden>
				<nested:hidden property="c_deptid" value="${row.c_deptid }"></nested:hidden>
				<nested:hidden property="c_postid" value="${row.c_no }"></nested:hidden>
				<nested:hidden property="c_jobnm" value="sethead"></nested:hidden>   
				<td width="20%"><div align="center">${row.dept }  </div></td>
				<td width="20%"><div align="center">
				<c:choose>
				<c:when test="${row.c_type eq 1 }">职位</c:when>
				<c:when test="${row.c_type eq 2 }">岗位</c:when>
				</c:choose>		
				</div></td>
				<td width="20%"><div align="center">${row.c_name }</div></td>
				<td width="20%"><div align="center">
				<c:choose>
				<c:when test="${row.c_ishead eq '0'}">是部门长</c:when>
				<c:when test="${row.c_ishead eq '1'}">否</c:when>
				</c:choose>
				</div></td>
				<td width="20%" align="center">								
				<html:submit value="设置为部门长"/>				
				</td>
				</nested:nest>					
				</html:form> 	
			</tr>  
			</c:forEach>				 
			</table>					
	</body> 
</html:html>
