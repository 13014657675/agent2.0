<%@ page language="java" pageEncoding="gbk"%>
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
						�ļ�ǩ��
					</div>
				</td>
			</tr> 			
			<tr>
				<td align="center" width="5%">ǩ����</td>
				<td align="center" width="15%">���Ĳ���</td>
				<td align="center" width="15%">�����ֺ�</td>
				<td align="center" width="50%">�ļ���</td>
				<td align="center" width="15%">����</td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select a.*,c.c_no c_fileid ,c.c_name from t_filesigned a ,t_sprocess b ,t_file c
			where a.c_jobnm ='add' and b.c_sys=1 and a.c_no=b.c_sid and b.c_flag='0' and b.c_receive='${sessionScope.c_jobnumber }' and a.c_fileid=c.c_no "></sql:query>	
			<c:forEach items="${q1.rows }" var="row">
			<tr>
				<td align="center" width="5%">${row.c_no }</td>
				<td align="center" width="15%">${row.c_dname }</td>
				<td align="center" width="15%">${row.c_dcode }</td>
				<td align="center" width="50%">${row.c_name }</td>
				<td align="center" width="15%"><a  href="../../../toModule.do?prefix=/oa&page=/file/process/return2.jsp?c_no=${row.c_no }&c_fileid=${row.c_fileid }">ǩ��</a></td>
			</tr>
			</c:forEach>					
		</table>		
	</body> 
</html:html>
