<%@ page language="java"  pageEncoding="gbk" %>
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
					<td height="33" colspan="30" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							Ӷ���ѯ
						</div>
					</td>
				</tr>	
			<tr>
		 	 <td >��</td>
		  	 <td >${param.c_year }</td>
		   	 <td >��</td>
		     <td >${param.c_month }</td>
			 </tr>
			 <tr style="color: red">
			 <td width="10%">�ϼ�����</td>
			 <td width="10%">��������</td>
			 <td width="10%">����</td>
			 <td width="10%">����</td>
			 <td width="10%">ҵ������</td>
			 <td width="50%">Ӷ����ϸ</td>			
			 <td width="10%">Ӧ��Ӷ��</td>	 
			</tr>  
			
			 <sql:query var="q1" dataSource="${db_mssql}" sql="select * from t_agentcommission where 
			 	c_year=${param.c_year } and c_month=${param.c_month } order by c_no"></sql:query>
			 <c:forEach items="${q1.rows}" var="row">
			  <tr>
			 <sql:query var="q10" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.c_orgid }"></sql:query>
			 <sql:query var="q11" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q10.rows[0].c_parent }"></sql:query>		
			 <td>${q11.rows[0].c_name }</td>
			 <td>${q10.rows[0].c_name }</td>	 
			 <td width="10%"> ${row.c_jobnumber }</td>	
			 <sql:query var="q3" dataSource="${db_mssql}" sql="select * from v_sxagent where c_jobnumber='${row.c_jobnumber }'"></sql:query>	 
			 <td width="10%">
			 ${q3.rows[0].c_name }
			 </td>
			 <td>
				 <sql:query var="q3" dataSource="${db_mssql}" sql=" select * from t_policy where c_system=${row.c_system}"></sql:query>
				 ${q3.rows[0].c_name }
			</td> 
			<td width="50%">${row.c_str }</td>			
			<td width="10%">${row.c_strv }</td>	 
			 </tr>			 
			 </c:forEach>				 	
		</table>   		
</body>
</html:html>