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
						工具查询
					</div>
				</td>
			</tr> 			
			<tr  >
				<td  align="center" width="50%">
				 	文件名
				</td>	
				<td  align="center" width="50%">
				 	上挂时间  
				</td>				 										
			</tr>			
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_file 
				where c_sys=2 and c_catalogid='${param.c_catalogid }' and c_flag='0' "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			 	<tr  >
				<td  align="center" width="50%">
				 	<A href="../../../upload/tool/${row.c_save }">${row.c_name }</A>
				</td>	
				<td  align="center" width="50%">
				 	${row.c_datime }
				</td>		
			</tr>	
			</c:forEach> 	
		</table>	 
	</body> 
</html:html>
