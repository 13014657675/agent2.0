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
<sql:update dataSource="${db_mssql }" sql="exec p_cxbdrjd  ${param.c_orgid },'${param.c_date }','${sessionScope.Staff.c_jobnumber }','${sessionScope.Staff.c_ip }'"></sql:update>
 		<table width="100%" border="1" cellspacing="0" id="tb">
			<tr>
				<td height="33" colspan="8" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						保单日结单打印
					</div>
				</td>
			</tr>					
			<tr>
			 	<td colspan="8" align="center">保单日结单</td>
			</tr>
			<tr> 
				<td align="center">日期：</td>
				<td align="center">${param.c_date}</td>
			</tr>
			<tr>
				<td  align="center" width="10%">序号</td>
				<td  align="center" width="20%">保险公司</td>
				<td  align="center" width="20%">保单号</td>
				<td  align="center" width="10%">客户姓名</td> 
				<td  align="center" width="10%">保险费</td>
				<td  align="center" width="10%">代理人工号</td>
				<td  align="center" width="10%">代理人姓名</td>
				<td  align="center" width="10%">备注</td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_cxbdrjd 
				where c_orgid=${param.c_orgid } and c_date='${param.c_date }'"></sql:query>
			<c:set var="js" value="0"></c:set>
			<c:set var="bxf" value="0"></c:set>
			<c:forEach items="${q2.rows }" var="row" varStatus="x">
			<tr>
				<td  align="center" width="10%">${x.index+1 }</td>
				<td  align="center" width="20%">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
				${q3.rows[0].c_name }
				</td>
				<td  align="center" width="20%">${row.c_bd }</td>
				<td  align="center" width="10%">
				${row.c_customer }
				</td> 
				<td  align="center" width="10%">
				${row.c_bxf }
				</td>
				<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>
				<td  align="center" width="10%">${q5.rows[0].c_jobnumber }</td>
				<td  align="center" width="10%">${q5.rows[0].c_name }</td>
				<td  align="center" width="10%"></td>
			</tr>
			<c:set var="js" value="${js+1 }"></c:set>
			<c:set var="bxf" value="${bxf+row.c_bxf }"></c:set>
			</c:forEach>
			<tr>
				<td  align="center" width="10%">　</td>
				<td  align="center" width="20%">　</td>
				<td  align="center" width="20%">　</td>
				<td  align="center" width="10%">　</td> 
				<td  align="center" width="10%">　</td>
				<td  align="center" width="10%">　</td>
				<td  align="center" width="10%">　</td>
				<td  align="center" width="10%">　</td>
			</tr>
			<tr>
				<td  align="center" width="10%">件数合计：</td>
				<td  align="center" width="20%">${js }</td>
				<td  align="center" width="20%">保险费合计：</td> 
				<td  align="center" width="10%">${bxf }</td> 
			</tr>
			<tr>				
				<td align="center" colspan="8">
				<input type="submit" value=" 打 印 " onclick="PrintTable(tb)">
				</td>	 		 
			</tr>
		</table> 
</body>
</html:html>
