<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>  		
	 	<sql:query var="q1" dataSource="${db_mssql }" sql="select a.* from t_cxbd a,t_cxytyj b 
			where a.c_companyid=b.c_companyid and a.c_bd=b.c_bd 
					and	b.c_orgid = ${param.c_orgid } and b.c_companyid=${param.c_companyid } 
					and b.c_ffrq='${param.c_ffrq }' order by b.c_bd " >
		</sql:query>	  
					 	
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="80" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						Ӷ��Ԥ�ᷢ��
					</div>
				</td>
			</tr>					
			<tr>	 
			<td>���</td>		
			<td>�ϼ�����</td>
			<td>��������������</td>
			<td>���չ�˾</td> 
			<td>������</td>
			<td>��������</td>
			<td>���շ�</td>	
			<td>ʹ������</td>
			<td>������������</td>					
			<td>ǩ������</td>
			<td>������</td>			
			<td>�����˹���</td>
			<td>����������</td>			
			<td>��������������</td> 
			<td>Ӷ����</td>
			<td>Ӷ��</td>	
			<td>֧��˰��</td>
			<td>֧��˰</td>					
			</tr> 		 
			<c:forEach items="${q1.rows }" var="row" varStatus="x">
			<tr>
			<td>${x.index+1 }</td>
			<sql:query var="q8" dataSource="${db_mssql }" sql="select c_orgid,c_jobnumber,c_name from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>	
			<c:if test="${not empty q8.rows[0].c_orgid }">			
			<sql:query var="q10" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q8.rows[0].c_orgid }"></sql:query>
			<sql:query var="q11" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q10.rows[0].c_parent }"></sql:query>		
			</c:if>			
			<td>${q11.rows[0].c_name }</td>
			<td>${q10.rows[0].c_name }</td>			
			<td>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			${q2.rows[0].c_name }
			</td> 
			<td>${row.c_bd }</td>
			<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query>	
			<td>${q5.rows[0].c_name }</td>
			<td>${row.c_bxf }</td>			 
			<td>
				<sql:query var="c_usageid"	sql="select * from t_usage where c_system=11 and c_no=${row.c_usageid }"	dataSource="${db_mssql}"></sql:query>
				${c_usageid.rows[0].c_name }
			</td>
			<td>${row.c_customer }</td>
			<td>${row.c_lrrq }</td>
			<td>${row.c_cbrq }</td>
			<td>${row.c_jobnumber }</td>
			<td>${q8.rows[0].c_name }</td> 
			<c:if test="${not empty row.c_system_sq }">
		  		<sql:query var="zc" dataSource="${db_mssql }" sql="select * from t_policy where c_system=${row.c_system_sq } "></sql:query>
		 	</c:if>
			<td>${zc.rows[0].c_name }</td>			
			<td>${row.c_bxfr2 }</td>
			<td>${row.c_bxfy2 }</td> 
			<td>${row.c_ccsr2 }</td>
			<td>${row.c_ccsy2 }</td>    
			</tr>
			</c:forEach>		 	 
		</table> 
</body>
</html:html>
 