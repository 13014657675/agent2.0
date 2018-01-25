<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">			 
</head>		
	<body>	
		<sql:query var="q" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${param.c_orgtypeid } "></sql:query> 
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构删除
					</div>
				</td>
			</tr>
			<tr>
			<td width="33%"><div align="center">机构类型</div></td>
			<td width="33%"><div align="center">名称</div></td>
			<td width="33%"><div align="center">删除</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization  where c_flag='0' and c_parent=${param.c_jigou } 
				and c_deptid=${param.c_deptid } "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td><div align="center">${q.rows[0].c_name }</div></td>
			<td><div align="center">${row.c_name }</div></td>
			<td width="50%"><div align="center">			
			 <html:form  action="/organization" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="add_update_delete"/>
			<nested:nest property="organization">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden> 
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden> 	
			<nested:hidden property="c_orgtypeid" value="${row.c_orgtypeid }"></nested:hidden> 			 
			</nested:nest>		
			<html:submit value="删 除"/>	
			</html:form>
			</div></td></tr></c:forEach></table>			 				
	</body> 
</html:html>
