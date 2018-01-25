<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>����������</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>
<body>  
	<logic:equal value="1" parameter="c_sjlx"> 
	<table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="50" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
					 ���������Ѳ�ѯ
				</td>
			</tr> 
		 <tr>
		 <td>Ͷ������</td>
		 <td>������</td>
		 <td>Ͷ��������</td>
		 <td>����������</td>
		 <td>Ͷ������</td>
		 <td>�б�����</td>
		 <td>��ִ����</td>
		 <td>���ִ���</td>
		 <td>��������</td>
		 <td>��������</td>
		 <td>����</td>
		 <td>���շ�</td>
		 <td>�걣</td>
		 <td>��������</td>
		 <td>������</td>
		 <td>Ӷ����</td>
		 <td>Ӷ��</td>
		 <sql:query var="x" dataSource="${db_mssql }" sql="select * from t_exptype where c_system=2 order by c_no"></sql:query>
		 <c:forEach items="${x.rows }" var="xrow">
		 <td colspan="2">${xrow.c_name }</td>		 
		 </c:forEach>		 
		 <td>��������������</td>
		 <td>��������������</td>
		 <td>�����˹���</td>
		 <td>����������</td>
		 <td>�������ʸ�֤��</td>
		 </tr>
		 <sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxjs a,t_sxbd b,t_sxtb c
		 	where  a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_companyid=c.c_companyid and a.c_bd=c.c_bd and a.c_productid=c.c_productid
		 		and a.c_orgid=${param.c_orgid } and a.c_companyid=${param.c_companyid } 
		 		and a.c_year=${param.c_year } and a.c_month=${param.c_month } and a.c_bdnd=1 
		 		order by a.c_companyid,a.c_bd"></sql:query>
		 <c:forEach items="${q1.rows }" var="row">
		 <tr>
		 <td>${row.c_tbd }</td>
		 <td>${row.c_bd }</td>
		 <sql:query var="a1" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_tbrnum }"></sql:query>
		 <td>${a1.rows[0].c_name }</td>
		 <sql:query var="a2" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_bbrnum }"></sql:query>
		 <td>${a2.rows[0].c_name }</td>
		 <td>${row.c_tbrq }</td>
		 <sql:query var="a3" dataSource="${db_mssql }" sql="select * from t_sxbdzt where c_companyid=${row.c_companyid } and c_bd='${row.c_bd }' and c_type=1 "></sql:query>
		 <td>${a3.rows[0].c_date }</td>
		 <sql:query var="a4" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_date  from t_sxbdzt where c_companyid=${row.c_companyid } and c_bd='${row.c_bd }' and c_type=3 "></sql:query>
		 <td>${a4.rows[0].c_date }</td>
		 <sql:query var="a5" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid } "></sql:query>
		 <td>${a5.rows[0].c_code }</td>
		 <td>${a5.rows[0].c_fullname }</td>
		 <td>${row.c_jfqx }</td>
		 <td>${row.c_bxje }</td>
		 <td>${row.c_bxf }</td>
		 <td>${row.c_bxfbz }</td>
		 <td>${row.c_bxfr1 }</td>
		 <td>${row.c_bxfy1 }</td>
		 <td>${row.c_bxfr2 }</td>
		 <td>${row.c_bxfy2 }</td>
		 <sql:query var="x" dataSource="${db_mssql }" sql="select * from t_exptype where c_system=2 order by c_no"></sql:query>
		 <c:forEach items="${x.rows }" var="xrow">
		 <sql:query var="x1" dataSource="${db_mssql }" sql="select c_srate from t_expsrate	where c_companyid=${row.c_companyid }
		 	 and c_productid=${row.c_productid } and c_jfqx=${row.c_jfqx } and c_bdnd=1 and c_system=${row.c_system_sq } and c_exptypeid=${xrow.c_no } "></sql:query>
		 <td>${x1.rows[0].c_srate }</td>
		 <td>${x1.rows[0].c_srate * row.c_bxf }</td>
		 </c:forEach>
		 <c:if test="${not empty row.c_orgid_sq }">
		  	<sql:query var="a6" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.c_orgid_sq } "></sql:query>
		  	<sql:query var="a7" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${a6.rows[0].c_parent } "></sql:query>
		 </c:if>		
		 <td>${a6.rows[0].c_name }[${a7.rows[0].c_name }]</td>
		 <c:if test="${not empty row.c_system_sq }">
		  	<sql:query var="a8" dataSource="${db_mssql }" sql="select * from t_policy where c_system=${row.c_system_sq } "></sql:query>
		 </c:if>
		 <td>${a8.rows[0].c_name }</td>
		 <td>${row.c_jobnumber }</td> 
		 <sql:query var="a9" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${row.c_jobnumber }' "></sql:query> 
		 <td>${a9.rows[0].c_name }</td>
		 <td>'${a9.rows[0].c_qualificate }</td>
		 </tr>
		 </c:forEach>		 
		</table>   
	</logic:equal>	
	<logic:equal value="2" parameter="c_sjlx"> 
	<table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="50" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
					 ���������Ѳ�ѯ
				</td>
			</tr> 
		 <tr>
		 <td>Ͷ������</td>
		 <td>������</td>
		 <td>�������</td> 
		 <td>��Ʊ����</td> 
		 <td>���ִ���</td>
		 <td>��������</td>
		 <td>��������</td>
		 <td>����</td>
		 <td>���շ�</td> 
		 <td>��������</td>
		 <td>������</td>
		 <td>Ӷ����</td>
		 <td>Ӷ��</td>
		 <sql:query var="x" dataSource="${db_mssql }" sql="select * from t_exptype where c_system=2 order by c_no"></sql:query>
		 <c:forEach items="${x.rows }" var="xrow">
		 <td colspan="2">${xrow.c_name }</td>		 
		 </c:forEach>		 
		 <td>��������������</td>
		 <td>��������������</td>
		 <td>�����˹���</td>
		 <td>����������</td>
		 <td>�������ʸ�֤��</td>
		 </tr>
		 <sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxjs a,t_sxbd b,t_sxtb_xq c
		 	where  a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_companyid=c.c_companyid and a.c_bd=c.c_bd and a.c_productid=c.c_productid and a.c_bdnd=c.c_bdnd
		 		and a.c_orgid=${param.c_orgid } and a.c_companyid=${param.c_companyid } 
		 		and a.c_year=${param.c_year } and a.c_month=${param.c_month } and a.c_bdnd>1 
		 		order by a.c_companyid,a.c_bd"></sql:query>
		 <c:forEach items="${q1.rows }" var="row">
		 <tr>
		 <td>${row.c_tbd }</td>
		 <td>${row.c_bd }</td>
		 <td>${row.c_bdnd }</td>		
		 <td>${row.c_fprq }</td>	 
		 <sql:query var="a5" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid } "></sql:query>
		 <td>${a5.rows[0].c_code }</td>
		 <td>${a5.rows[0].c_fullname }</td>
		 <sql:query var="a6" dataSource="${db_mssql }" sql="select * from t_sxtb where c_companyid=${row.c_companyid } 
		 	and c_bd='${row.c_bd }' and c_productid=${row.c_productid }"></sql:query>
		 <td>${a6.rows[0].c_jfqx }</td>
		 <td>${a6.rows[0].c_bxje }</td> 
		 <td>${row.c_bxf }</td> 
		 <td>${row.c_bxfr1 }</td>
		 <td>${row.c_bxfy1 }</td>
		 <td>${row.c_bxfr2 }</td>
		 <td>${row.c_bxfy2 }</td>
		 <sql:query var="x" dataSource="${db_mssql }" sql="select * from t_exptype where c_system=2 order by c_no"></sql:query>
		 <c:forEach items="${x.rows }" var="xrow">
		 <sql:query var="x1" dataSource="${db_mssql }" sql="select c_srate from t_expsrate	where c_companyid=${row.c_companyid }
		 	 and c_productid=${row.c_productid } and c_jfqx=${a6.rows[0].c_jfqx } and c_bdnd=1 and c_system=${row.c_system_sq } and c_exptypeid=${xrow.c_no } "></sql:query>
		 <td>${x1.rows[0].c_srate }</td>
		 <td>${x1.rows[0].c_srate * row.c_bxf }</td>
		 </c:forEach>
		 <c:if test="${not empty row.c_orgid_sq }">
		  	<sql:query var="a6" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.c_orgid_sq } "></sql:query>
		  	<sql:query var="a7" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${a6.rows[0].c_parent } "></sql:query>
		 </c:if>		
		 <td>${a6.rows[0].c_name }[${a7.rows[0].c_name }]</td>
		 <c:if test="${not empty row.c_system_sq }">
		  	<sql:query var="a8" dataSource="${db_mssql }" sql="select * from t_policy where c_system=${row.c_system_sq } "></sql:query>
		 </c:if>
		 <td>${a8.rows[0].c_name }</td>
		 <td>${row.c_jobnumber }</td> 
		 <sql:query var="a9" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${row.c_jobnumber }' "></sql:query> 
		 <td>${a9.rows[0].c_name }</td>
		 <td>'${a9.rows[0].c_qualificate }</td>
		 </tr>
		 </c:forEach>		 
		</table>   
	</logic:equal>	
</body>
</html:html>
