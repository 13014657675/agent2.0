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
<sql:update dataSource="${db_mssql }" sql="exec p_sxsxrjd  ${param.c_orgid },'${param.c_date }','${sessionScope.Staff.c_jobnumber }','${sessionScope.Staff.c_ip }'"></sql:update>
 		<table width="100%" border="1" cellspacing="0" id="tb">
			<tr>
				<td height="33" colspan="5" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						生效日结单打印
					</div>
				</td>
			</tr>					
			<tr>
			 	<td colspan="5" align="center">生效日结单打印</td>
			</tr>
			<tr> 
				<td align="center">日期：</td>
				<td align="center">${param.c_date}</td>
			</tr>
			<tr>
				<td  align="center" width="10%">序号</td>
				<td  align="center" width="10%">保险公司</td>
				<td  align="center" width="30%">投保单号</td>
				<td  align="center" width="30%">保单号</td> 
				<td  align="center" width="20%">备注</td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_sxsxrjd 
				where c_orgid=${param.c_orgid } and c_date='${param.c_date }' order by c_companyid"></sql:query>
			<c:set var="js" value="0"></c:set> 
			<c:forEach items="${q2.rows }" var="row" varStatus="x">
			<tr>
				<td  align="center" width="10%">${x.index+1 }</td>
				<td  align="center" width="10%">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
				${q3.rows[0].c_name }
				</td>
				<td  align="center" width="30%">${row.c_tbd }</td>
				<td  align="center" width="30%">${row.c_bd }</td>				 
				<td  align="center" width="20%"></td>
			</tr>
			<c:set var="js" value="${js+1 }"></c:set> 
			</c:forEach>
			<tr>
				<td  align="center" width="10%">　</td>
				<td  align="center" width="10%">　</td>
				<td  align="center" width="30%">　</td>
				<td  align="center" width="30%">　</td> 
				<td  align="center" width="20%">　</td> 
			</tr>
			<tr>
				<td  align="center" width="10%">件数合计：</td>
				<td  align="center" width="10%">${js }</td> 
			</tr>
			<tr>				
				<td align="center" colspan="5">
				<input type="submit" value=" 打 印 " onclick="PrintTable(tb)">
				</td>	 		 
			</tr>
		</table> 
</body>
</html:html>
