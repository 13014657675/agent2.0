<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
</head>		
	<body>  
		<!-- ʱ������ -->
		<logic:equal value="1" parameter="type" scope="request">
			<sql:query var="q1" dataSource="${db_mssql }" sql="select distinct a.c_no   from t_signed a ,t_sprocess b  
			where  b.c_sys=3 and a.c_no=b.c_sid and b.c_send='${sessionScope.c_jobnumber }'  
				and a.c_datime between '${param.date1 }' and '${param.date2 }'   "></sql:query>		
		</logic:equal>
		<!-- ǩ���� -->
		<logic:equal value="2" parameter="type" scope="request">	
			<sql:query var="q1" dataSource="${db_mssql }" sql="select distinct a.c_no   from t_signed a ,t_sprocess b  
			where  b.c_sys=3 and a.c_no=b.c_sid and b.c_send='${sessionScope.c_jobnumber }' 
				and a.c_no=${param.c_sid }  "></sql:query>		
		</logic:equal>
		<!-- ǩ���������� -->
		<logic:equal value="3" parameter="type" scope="request">	
			<sql:query var="q1" dataSource="${db_mssql }" sql="select distinct a.c_no from t_signed a ,t_sprocess b 
			where  b.c_sys=3 and a.c_no=b.c_sid and b.c_send='${sessionScope.c_jobnumber }'
				and a.c_no in ( select c_sid from  t_sprompt where c_sys=3 and c_jobnumber = '${sessionScope.c_jobnumber }' and c_flag='0' )  "></sql:query>		
		</logic:equal>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						ǩ����ѯ
					</div>
				</td>
			</tr> 				
			<tr>
				<td align="center" width="16%">ǩ����</td>
				<td align="center" width="16%">����</td>	
				<td align="center" width="16%">��������</td>					 
				<td align="center" width="16%">������</td>  
				<td align="center" width="16%">״̬</td>
				<td align="center" width="16%">��ѯ</td>
			</tr>						
			<c:forEach items="${q1.rows }" var="row">
			<sql:query var="q2" dataSource="${db_mssql }" sql="select  a.c_no,a.c_type,a.c_apply,a.c_jobnm  from t_signed a 
				where a.c_no=${row.c_no }   "></sql:query>	
			<tr>
			 	<td align="center" width="16%">${row.c_no }</td>
				<td align="center" width="16%">
				<c:choose>
				<c:when test="${q2.rows[0].c_type eq 31 }">��Ŀǩ��</c:when>
				<c:when test="${q2.rows[0].c_type eq 32 }">����ǩ��</c:when>
				</c:choose>		
				</td>	
				<td align="center" width="16%">${q2.rows[0].c_apply }</td>					 
				<sql:query var="q3" dataSource="${db_mssql }" sql="select b.c_name from t_sprocess a,t_staff b where a.c_send=b.c_jobnumber 
					and  a.c_sys=3 and a.c_sid=${row.c_no } order by a.c_no"></sql:query>
				<td align="center" width="20%">${q3.rows[0].c_name }</td>  
				<td align="center" width="16%">
				<c:choose>
				<c:when test="${fn:trim(q2.rows[0].c_jobnm) eq 'add' }">��ת��</c:when>
				<c:when test="${fn:trim(q2.rows[0].c_jobnm) eq 'zz' }">
				<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_sprocess where c_sys=3 and c_sid=${row.c_no } and c_return=2"></sql:query>
				<c:choose>
				<c:when test="${ empty q4.rows[0] }">��ͨ��</c:when>
				<c:when test="${ not empty q4.rows[0] }">δͨ��</c:when>
				</c:choose>
				</c:when>
				</c:choose>	
				</td> 
				<td align="center" width="16%"><a  href="../../../toModule.do?prefix=/oa&page=/signed/process/query3.jsp?c_no=${row.c_no }" >��ѯ</a></td>
			</tr>
			</c:forEach>					
		</table>		
	</body> 
</html:html>
