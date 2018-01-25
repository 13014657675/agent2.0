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
						角色删除
					</div>
				</td>
			</tr>
			<tr>
			<td width="25%"><div align="center">角色</div></td>
			<td width="25%"><div align="center">工号</div></td> 
			<td width="25%"><div align="center">姓名</div></td>			
			<td width="25%"><div align="center">删除</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql=" select a.*,b.c_name from t_role a,t_staff b where a.c_sys=3 
				and  a.c_jobnumber=b.c_jobnumber and a.c_role=301 order by c_role"></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td><div align="center">
			<c:choose>
			<c:when test="${row.c_role eq 301 }">审批人</c:when>
			<%-- 
			<c:when test="${row.c_role eq 302 }">财务负责人</c:when>
			<c:when test="${row.c_role eq 303 }">分管总</c:when>
			--%>
			</c:choose>
			</div></td>	
			<td><div align="center">${row.c_jobnumber }</div></td> 
			<td><div align="center">${row.c_name }</div></td>				
			<td   valign="middle" align="center"> 		
			<html:form  action="/file" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="role_add_delete"/>
			<nested:nest property="role">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden> 			 
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>
			<nested:hidden property="c_sys" value="${row.c_sys }"></nested:hidden>
			<nested:hidden property="c_jobnumber" value="${row.c_jobnumber }"></nested:hidden>   
			<html:submit value="删 除"/>
			</nested:nest>			 
			</html:form> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
