<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>Ӷ��������</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
	<script type="text/javascript">
	function js_select(all)
	{ 
		var c_no=document.getElementsByName("sxdz.c_no");
		for (var i=0;i<c_no.length;i++) 
		{   var e=c_no[i]; 
			e.checked=all.checked; 
		}
	}
	</script>
</head>
<body> 
	<logic:equal value="1" parameter="c_sjlx">
	<sql:query var="q1" dataSource="${db_mssql }" 
	sql="select * from t_sxjs where c_orgid=${param.c_orgid } and c_year=${param.c_year } and c_month=${param.c_month } and c_companyid=${param.c_companyid } and c_bdnd=1 "></sql:query>
	 <table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="8" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						���ڽ����ѯ
				</td>
			</tr> 
		<tr> 
		<tr>
		<td width="30%">����</td>
		<td width="10%">����</td>
		<td width="10%">���շ�</td> 
		<td width="10%">��������</td>
		<td width="10%">������</td>
		<td width="10%">Ӷ����</td>
		<td width="10%">Ӷ��</td> 
		</tr>		 
		<c:forEach items="${q1.rows }" var="row">
		<tr>
		<td>${row.c_bd }</td>
		<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query>
		<td>${q2.rows[0].c_fullname }[${q2.rows[0].c_code }]</td>
		<td>${row.c_bxf }</td>
		<td>${row.c_bxfr1 }</td>
		<td>${row.c_bxfy1 }</td>
		<td>${row.c_bxfr2 }</td>
		<td>${row.c_bxfy2 }</td>	 
		</tr>
		</c:forEach>		 
		</table>   
		</logic:equal>
	<logic:equal value="2" parameter="c_sjlx">
	<sql:query var="q1" dataSource="${db_mssql }" 
	sql="select * from t_sxjs where c_orgid=${param.c_orgid } and c_year=${param.c_year } and c_month=${param.c_month } and c_companyid=${param.c_companyid } and c_bdnd>1 "></sql:query>
	 <table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="8" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						���ڽ����ѯ
				</td>
			</tr> 
		<tr> 
		<tr>
		<td width="25%">����</td>
		<td width="5%">�������</td>
		<td width="10%">����</td>
		<td width="10%">���շ�</td> 
		<td width="10%">��������</td>
		<td width="10%">������</td>
		<td width="10%">Ӷ����</td>
		<td width="10%">Ӷ��</td> 
		</tr>		 
		<c:forEach items="${q1.rows }" var="row">
		<tr>
		<td>${row.c_bd }</td>
		<td>${row.c_bdnd }</td>
		<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query>
		<td>${q2.rows[0].c_fullname }[${q2.rows[0].c_code }]</td>
		<td>${row.c_bxf }</td>
		<td>${row.c_bxfr1 }</td>
		<td>${row.c_bxfy1 }</td>
		<td>${row.c_bxfr2 }</td>
		<td>${row.c_bxfy2 }</td>	 
		</tr>
		</c:forEach>		 
		</table>   
		</logic:equal>
</body>
</html:html>
