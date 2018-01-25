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
						文件查阅
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
				where c_no in ( select c_fileid from t_fileRD where c_jobnumber = '${sessionScope.c_jobnumber }'  and c_times=0 )
				and c_sys=1 and c_flag='0' order by c_datime desc"></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			 <tr>
				<td  align="center" width="50%">
					 <A href="open.jsp?c_no=${row.c_no }"><font color="red">${row.c_name }</font></A>		 
				</td>	
				<td  align="center" width="50%">
				 	${row.c_datime }
				</td>		
			</tr>	
			</c:forEach> 	
		</table>	 
	</body> 
</html:html>
