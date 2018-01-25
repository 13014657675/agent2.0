<%@ page language="java" pageEncoding="gbk"%>
<jsp:directive.page import="java.util.Date"/>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
</head>		
	<body>		 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构业绩表					 
					</div>
				</td>
			</tr> 				 
		</table>	  
		<sql:update dataSource="${db_mssql }" sql="p_3001 ${param.c_time },${param.c_orgid },${param.c_system },'${param.c_ksrq }','${param.c_jsrq }'"></sql:update>
		<jsp:include flush="true" page="../../out.jsp">
		<jsp:param name="c_time" value="${param.c_time}"/>
		<jsp:param name="c_code" value="${param.c_code}"/>
		</jsp:include>
		 
		<br>
	</body> 
</html:html>
