<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">			 
</head>		
	<body>	<sql:query var="q" dataSource="${db_mssql }" sql="select a.*,b.c_name dept from t_post a,t_dept b where a.c_deptid=b.c_no 
		and a.c_orgid=${param.c_orgid } order by a.c_deptid,a.c_type"></sql:query> 			
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="4" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						职位和岗位删除
					</div>
				</td>
			</tr> 					 
			<tr>
				<td width="25%"><div align="center">部门</div></td>
				<td width="25%"><div align="center">类型</div></td>
				<td width="25%"><div align="center">名称</div></td>
				<td width="25%" align="center">删除</td>
			</tr> 
			<c:forEach items="${q.rows }" var="row">			 
			<tr>
				<td width="25%"><div align="center">${row.dept }</div></td>
				<td width="25%"><div align="center">
				<c:choose>
				<c:when test="${row.c_type eq 1 }">职位</c:when>
				<c:when test="${row.c_type eq 2 }">岗位</c:when>
				</c:choose>				
				</div></td>
				<td width="25%"><div align="center">${row.c_name }</div></td>
				<td width="25%" align="center">
				<html:form  action="/organization" onsubmit="return check_form(this)">
				<html:hidden property="jobname" value="post"/>
				<nested:nest property="organization">	
				<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>
				<nested:hidden property="c_jobnm" value="del"></nested:hidden>   
				<html:submit value="删 除"/>
				</nested:nest>					
				</html:form> 	
				</td>
			</tr>  
			</c:forEach>				 
			</table>					
	</body> 
</html:html>
