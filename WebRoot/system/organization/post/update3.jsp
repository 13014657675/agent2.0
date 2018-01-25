<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">		 
</head>		
	<body><sql:query var="q" dataSource="${db_mssql }" sql="select a.*,b.c_name dept from t_post a,t_dept b where a.c_deptid=b.c_no 
		and a.c_orgid=${param.c_orgid } order by a.c_deptid,a.c_type"></sql:query> 		
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="4" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						职位和岗位修改
					</div>
				</td>
			</tr> 					 
			<tr>
				<td width="25%"><div align="center">部门</div></td>
				<td width="25%"><div align="center">类型</div></td>
				<td width="25%"><div align="center">名称</div></td>
				<td width="25%" align="center">修改</td>
			</tr> 
			<c:forEach items="${q.rows }" var="row">			 
			<tr>
				<html:form  action="/organization" onsubmit="return check_form(this)">
				<html:hidden property="jobname" value="post"/>
				<nested:nest property="organization">	
				<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>
				<nested:hidden property="c_jobnm" value="update"></nested:hidden>   
				<td width="25%"><div align="center">${row.dept }  </div></td>
				<td width="25%"><div align="center">
				<nested:select property="c_type" value="${row.c_type }">
				<html:option value="1">职位</html:option>
				<html:option value="2">岗位</html:option>
				</nested:select>   </div></td>
				<td width="25%"><div align="center"><nested:text property="c_name" value="${row.c_name }"></nested:text>   </div></td>
				<td width="25%" align="center">								
				<html:submit value="修 改"/>				
				</td>
				</nested:nest>					
				</html:form> 	
			</tr>  
			</c:forEach>				 
			</table>					
	</body> 
</html:html>
