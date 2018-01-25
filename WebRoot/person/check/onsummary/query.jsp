<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
		<body >		
		<form action="../../../toModule.do?prefix=/person&page=/check/onsummary/query2.jsp" method="post"> 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							考勤汇总查询
						</div>
					</td>
				</tr>			
				<tr>
				<td align="right" width="50%">机构名称</td>
				<td> 
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization 
					where c_no in (select c_orgid from t_postset where c_jobnumber = '${sessionScope.c_jobnumber }' )"></sql:query>
				<select name="c_orgid" id="c_orgid" >
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name } </option>
					</c:forEach>
				</select>
				</td>				
				</tr>	
				<tr>
				<td align="right" width="50%">年</td>
				<td> 
				<input name="c_year" value="2012" id="req" title="年必须填写" maxlength="4">				
				</td>				
				</tr>	
				<tr>
				<td align="right" width="50%">月</td>
				<td> 
				<select name="c_month">
				<c:forEach begin="1" end="12" var="x">
				<option value="${x }">${x }</option>
				</c:forEach> 
				</select>
				</td>				
				</tr>				 		 
				<tr>
				<td align="right"><input type="submit" value=" 确 定 "></td>
				<td><input type="reset" value=" 取 消 "></td>				
				</tr>
				</table>		
		 	</form>
			</body>  
</html:html>
