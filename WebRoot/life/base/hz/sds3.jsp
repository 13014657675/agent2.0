<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script type="text/javascript">
	function PrintTable(id)
	{
		var str1= window.document.body.innerHTML;
		id.deleteRow(0)
		id.deleteRow(id.rows.length-1)		
		var str2='<table width="100%" >'+id.innerHTML+'</table>';
	    window.document.body.innerHTML =str2;
	  	window.print();
	   	window.document.body.innerHTML = str1;
	}
	</script>
</head>
<body>
 		<table width="100%" border="1" cellspacing="0" id="tb">
			<tr>
				<td height="33" colspan="5" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						��ִ�ʹ����ӡ
					</div>
				</td>
			</tr>					
			<tr>
			 	<td colspan="5" align="center">��ִ�ʹ����ӡ</td>
			</tr>
			<tr>
				<td align="center">���չ�˾����:</td>
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_company where c_no=${param.c_companyid }"></sql:query>
				<td align="center" colspan="2">${q1.rows[0].c_fullname}</td>
				<td align="center">���ڣ�</td>
				<td align="center">${param.c_date}</td>
			</tr>
			<tr>
				<td  align="center" width="20%">���</td>
				<td  align="center" width="20%">������</td>
				<td  align="center" width="15%">Ͷ����</td> 
				<td  align="center" width="15%">�ͻ�ǩ������</td>
				<td  align="center" width="30%">��ע</td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_sxhzsds 
				where c_orgid=${param.c_orgid } and c_date='${param.c_date }' and c_companyid=${param.c_companyid } and c_times=${param.c_times }"></sql:query>
			<c:set var="js" value="0"></c:set> 
			<c:forEach items="${q2.rows }" var="row" varStatus="x">
			<tr>
				<td  align="center" width="20%">${x.index+1 }</td>
				<td  align="center" width="20%">${row.c_bd }</td>
				<td  align="center" width="15%">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_sxbd where c_companyid=${row.c_companyid } and c_bd='${row.c_bd }'"></sql:query>
				<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${q3.rows[0].c_tbrnum }"></sql:query>
				${q4.rows[0].c_name }
				</td> 
				<td  align="center" width="15%">
				<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_sxbdzt where c_companyid=${row.c_companyid } and c_bd='${row.c_bd }' and c_type=3"></sql:query>
				${q5.rows[0].c_date }
				</td>
				<td  align="center" width="30%"></td>
			</tr>
			<c:set var="js" value="${js+1 }"></c:set> 
			</c:forEach>
			<tr>
				<td  align="center" width="20%">��</td>
				<td  align="center" width="20%">��</td>
				<td  align="center" width="15%">��</td> 
				<td  align="center" width="15%">��</td>
				<td  align="center" width="30%">��</td>
			</tr>
			<tr>
				<td  align="center" width="20%">�����ϼƣ�</td>
				<td  align="center" width="20%">${js }</td>  
			</tr>
			<tr>				
				<td align="center" colspan="7">
				<input type="submit" value=" �� ӡ " onclick="PrintTable(tb)">
				</td>	 		 
			</tr>
		</table> 
</body>
</html:html>
