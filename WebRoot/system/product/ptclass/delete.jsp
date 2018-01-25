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
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						产品分类删除
					</div>
				</td>
			</tr>
			<tr>  
			<td width="33%"><div align="center">性质</div></td>
			<td width="33%"><div align="center">分类</div></td>
			<td width="33%"><div align="center">删除</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select a.*,b.c_name ptnature  from t_ptclass a,t_namecode b 
				where a.c_ptnature=b.c_code order by c_ptnature"></sql:query>
			<c:forEach items="${q2.rows }" var="row">
			<tr>  
			<td><div align="center">${row.ptnature }</div></td>
			<td><div align="center">${row.c_name }</div></td>
			<td width="33%" valign="middle" align="center"> 		
			<html:form  action="/product" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="ptclass"/>
			<nested:nest property="product">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden>
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<html:submit value="删 除"/>
			</nested:nest>			 
			</html:form> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
