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
						供应商业绩表						 
					</div>
				</td>
			</tr> 				 
		</table>	  
		<sql:update dataSource="${db_mssql }" sql="p_2002 ${param.c_time },${param.c_orgid },${param.c_year },'${param.c_ksrq }','${param.c_jsrq }'"></sql:update>
		<jsp:include flush="true" page="../../out.jsp">
		<jsp:param name="c_time" value="${param.c_time}"/>
		<jsp:param name="c_code" value="${param.c_code}"/>
		</jsp:include>
		
		<ul>
		<li>当月（预收）中不含撤单的保费数据</li>
		<li>当年（实收）表示已承包的保费数据</li>
		</ul>
		<br>
	</body> 
</html:html>
