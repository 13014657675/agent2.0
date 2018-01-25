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
				<td height="33" colspan="3" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						报废查询
					</div>
				</td>
			</tr> 			 
			<tr>
			<td width="33%" align="center">报废单号</td>
			<td width="33%" align="center">报废日期</td>
			<td width="33%" align="center">查询</td>
			</tr>
			<c:choose>
			<c:when test="${param.type eq 1 }">
			<sql:query var="q1" dataSource="${db_mssql }" sql="select distinct c_recordid,convert(char(8),c_datime,112) c_date from t_goodsrecord 
				where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_jobnm='bf' and c_flag='0' and c_datime between '${param.date1 }' and '${param.date2 }' "></sql:query>
			</c:when>
			<c:when test="${param.type eq 2 }">
			<sql:query var="q1" dataSource="${db_mssql }" sql="select distinct c_recordid,convert(char(8),c_datime,112) c_date from t_goodsrecord 
				where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_jobnm='bf' and c_flag='0' and c_recordid=${param.c_recordid }"></sql:query>		
			</c:when>
			</c:choose>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td width="33%" align="center">${row.c_recordid }</td> 
			<td width="33%" align="center">${row.c_date }</td>
			<td width="33%" align="center">
			<a href="../../../../toModule.do?prefix=/oa&page=/shop/record/bf/query4.jsp?c_orgid=${param.c_orgid }&c_libraryid=${param.c_libraryid }&c_recordid=${row.c_recordid }">查询</a>
			</td>
			</tr>
			</c:forEach>			
		</table>	 
	</body> 
</html:html>
