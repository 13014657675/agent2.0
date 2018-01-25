<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>		
		<html:form  action="/pay" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="pstandard"/>
		<nested:nest property="pay">	 
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="30" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						薪酬标准添加
					</div>
				</td>
			</tr> 	
			<tr> 
				<td align="center">薪酬等级</td>
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_pproject where c_type=1 order by c_no"></sql:query>
				<c:forEach items="${q1.rows }" var="row">
				<td align="center">${row.c_name }</td>
				</c:forEach>
			</tr>  
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_pclass order by c_pcategory,c_name"></sql:query>
			<c:forEach items="${q3.rows }" var="row3">
			<tr> 
				<td align="center">${row3.c_name }</td> 
				<c:forEach items="${q1.rows }" var="row4">
				<td align="center">
				<nested:hidden property="c_no" value="1"></nested:hidden>
				<nested:hidden property="c_pclass" value="${row3.c_no }"></nested:hidden>
				<nested:hidden property="c_pproject" value="${row4.c_no }"></nested:hidden>
				<nested:text property="c_base" value="0" size="6"></nested:text>
				</td>
				</c:forEach>
			</tr> 
			</c:forEach>  		
			</nested:nest>		
			<tr>
				<td colspan="30" align="center"><html:submit value=" 确 定 "/></td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 	 
</html:html>
