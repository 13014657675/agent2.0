<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../../tool/styles/main.css">		 
</head>		
	<body >		 		  
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="4" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						添加价格
					</div>
				</td>
			</tr> 			 
			<tr>
			<td width="25%" align="center">库房名</td>
			<td width="25%" align="center">入库单号</td>
			<td width="25%" align="center">入库日期</td>
			<td width="25%" align="center">定价</td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select distinct c_orgid,c_libraryid,c_recordid,convert(char(8),c_datime,112) c_date from t_goodsrecord 
				where c_orgid=${sessionScope.Staff.c_orgid } and c_jobnm = 'rk' and c_flag='0' order by c_libraryid,c_recordid "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td width="25%" align="center"> 
			<c:choose>
			<c:when test="${row.c_libraryid eq 1 }">资产管理</c:when>
			<c:when test="${row.c_libraryid eq 2 }">办公用品</c:when>
			<c:when test="${row.c_libraryid eq 3 }">普通单证</c:when>
			</c:choose>
			</td> 
			<td width="25%" align="center">${row.c_recordid }</td> 
			<td width="25%" align="center">${row.c_date }</td>
			<td width="25%" align="center">
			<a href="../../../../toModule.do?prefix=/oa&page=/shop/record/dj/add2.jsp?c_orgid=${row.c_orgid }&c_libraryid=${row.c_libraryid }&c_recordid=${row.c_recordid }">定价</a>
			</td>
			</tr>
			</c:forEach>			
		</table>	 
	</body> 
</html:html>
