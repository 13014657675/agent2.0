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
						���ڷ�Ʊ�սᵥ��ӡ
					</div>
				</td>
			</tr>					
			<tr>
			 	<td colspan="5" align="center">���ڷ�Ʊ�սᵥ��ӡ</td>
			</tr>
			<tr> 
				<td align="center">���ڣ�</td>
				<td align="center">${param.c_date}</td>
			</tr>
			<tr>
				<td  align="center" width="10%">���</td>
				<td  align="center" width="20%">���չ�˾</td>
				<td  align="center" width="30%">������</td> 
				<td  align="center" width="20%">�������</td>  
				<td  align="center" width="20%">���շ�</td>  
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select c_companyid,c_bd,c_bdnd,sum(c_bxf) c_bxf from t_sxtb_xq 
				where c_orgid=${param.c_orgid } and convert(char(8),c_datime,112)='${param.c_date }'
				group by c_companyid,c_bd,c_bdnd
				order by c_companyid,c_bdnd"></sql:query>  
			<c:set var="bxf" value="0"></c:set>	
			<c:forEach items="${q2.rows }" var="row" varStatus="x">
			<tr>
				<td  align="center" width="10%">${x.index+1 }</td>
				<td  align="center" width="20%">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
				${q3.rows[0].c_name }
				</td>
				<td  align="center" width="30%">${row.c_bd }</td> 
				<td  align="center" width="20%">
				${row.c_bdnd }
				</td> 				 
				<td  align="center" width="20%">${row.c_bxf }</td>
			</tr>  
			<c:set var="bxf" value="${bxf+row.c_bxf }"></c:set>
			</c:forEach>
			<tr>
				<td  align="center" width="10%">��</td> 
				<td  align="center" width="20%"> </td>
				<td  align="center" width="30%"> </td> 
				<td  align="center" width="20%" > </td>
				<td  align="center" width="20%"> </td> 
			</tr>  
			<tr> 
				<td  align="center" width="10%">���շѺϼƣ�</td> 
				<td  align="center" width="20%">${bxf }</td> 
			</tr>
			<tr>				
				<td align="center" colspan="5">
				<input type="submit" value=" �� ӡ " onclick="PrintTable(tb)">
				</td>	 		 
			</tr>
		</table> 
</body>
</html:html>
