<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
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
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						文件设置
					</div>
				</td>
			</tr> 			
			<tr  >
				<td  align="center" width="50%" >
				 	序号
				</td>
				<td  align="center" >
				 	目录名
				</td>					 										
			</tr>			
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_catalog  where c_sys=1 "></sql:query>
			<c:forEach items="${q1.rows }" var="row" varStatus="x">
			 	<tr  >
			 	<td  align="center" width="50%" >
			 	${x.index+1 }
			 	</td>
				<td  align="center" >
				 	 <A href="../../../toModule.do?prefix=/oa&page=/file/state/setfile2.jsp?c_catalogid=${row.c_no }">${row.c_name }</A>
				</td>					 										
			</tr>	
			</c:forEach> 	
		</table>	 
	</body> 
</html:html>
