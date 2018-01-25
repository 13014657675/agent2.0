<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../../tool/styles/main.css">		
</head>		
	<body >		 		
		<form action="../../../../toModule.do?prefix=/oa&page=/shop/record/ck/add2.jsp" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						出库添加
					</div>
				</td>
			</tr> 			 
			<tr>
				<td width="48%"><div align="right">机构 </div></td>
				<td width="52%" >
				<div align="left">
					<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization where c_no in 
						( select c_orgid from t_postset where c_jobnumber='${sessionScope.c_jobnumber }' ) "></sql:query>
					<select name="c_orgid" id="c_orgid">
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach> 
				</div>
				</td>
			</tr> 	
			<tr>
				<td width="50%"><div align="right">库房名</div></td>
				<td width="50%" >
				 	 <select name="c_libraryid" id="c_libraryid" > 
				 	 	<option value="1">资产管理</option>
						<option value="2">办公用品</option>
						<option value="3">普通单证</option>
				 	 </select>
				</td>
			</tr>	 
			<tr>
				<td width="48%" align="right"><html:submit value=" 下一步 "/></td>
				<td width="52%" colspan="2"> 
				</td> 
			</tr>		
		</table>	
	</form>
	</body> 
</html:html>
