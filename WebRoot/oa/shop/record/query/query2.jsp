<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%>  
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../../tool/styles/main.css">		
	<script type='text/javascript' src='../../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../../dwr/interface/Library.js'></script> 		
	<script type='text/javascript' src='../../../../dwr/interface/Organization.js'></script> 
	<script type="text/javascript">
	function PrintTable(id) {
		var str1 = window.document.body.innerHTML;
		id.deleteRow(0)
		id.deleteRow(id.rows.length - 1)

		var str2 = '<table width="100%" >' + id.innerHTML + '</table>';
		window.document.body.innerHTML = str2;
		window.print();
		window.document.body.innerHTML = str1;
	}
	</script>	
</head>		
	<body>		
	<c:choose>
	<c:when test="${param.c_libraryid eq 1}">		 	
		  <table width="100%" border="1" cellspacing="0" id="dy">
			<tr>
				<td height="33" colspan="10" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						库房查询
					</div>
				</td>
			</tr>  
			<tr>
				<td width="25%" align="center"><b>分类</b></td>
				<td width="25%" align="center"><b>物品</b></td> 
				<td width="25%" align="center"><b>编号</b></td>
				<td width="25%" align="center"><b>备注</b></td> 
			</tr> 				 
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_goodsstate  
					where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_flag='0' order by c_jobnm,c_p,c_o"></sql:query>
			<c:forEach items="${q2.rows }" var="row" varStatus="x">
				<tr>
				<td width="25%" align="center">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_goodstype 
					where c_no in (select c_goodstypeid from t_goods where c_no=${row.c_goodsid })"></sql:query>		
				${q3.rows[0].c_name }	
				</td>
				<td width="25%" align="center">
				<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_goods where c_no=${row.c_goodsid }"></sql:query>
				${q4.rows[0].c_name } 
				</td> 
				<td width="25%" align="center"> 
				${row.c_code }
				</td> 
				<td width="25%" align="center"> 
				<c:set var="c_jobnm" value="${fn:trim(row.c_jobnm )}"></c:set> 
				<c:choose>
				<c:when test="${c_jobnm eq 'rk2' or c_jobnm eq 'dj' or c_jobnm eq 'hk'}">
				<font color="blue">在库房	</font>
				</c:when>
				<c:when test="${c_jobnm eq 'ck' }">
					<c:choose>
					<c:when test="${empty row.c_o }">
						 领用人：${row.c_p }
					</c:when>
					<c:when test="${not empty row.c_o }">
						<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.c_o }"></sql:query>
						领用机构：${q5.rows[0].c_name }						 
					</c:when>
					</c:choose>		
				</c:when>
				<c:when test="${c_jobnm eq 'bf' }">
				<font color="red">已报废</font>
				</c:when>
				</c:choose>				
				</td>
			</tr> 			
			</c:forEach>		 
		</table>		
		<br>
	</c:when>	
	
	<c:when test="${param.c_libraryid eq 2 or param.c_libraryid eq 3}">		 	
		  <table width="100%" border="1" cellspacing="0" id="dy">
			<tr>
				<td height="33" colspan="10" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						库房查询
					</div>
				</td>
			</tr>  		
			<tr>
				<td width="25%" align="center"><b>分类</b></td>
				<td width="25%" align="center"><b>物品</b></td> 
				<td width="25%" align="center"><b>数量</b></td> 
				<td width="25%" align="center"><b>备注</b></td>
			</tr> 	
			<sql:query var="q2" dataSource="${db_mssql }" sql="select c_goodsid,c_jobnm,c_p,c_o,count(*) c_number from t_goodsstate  
					where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_flag='0' and c_jobnm not in ('rk2','dj','hk')
					group by c_goodsid,c_jobnm,c_p,c_o order by c_jobnm,c_p,c_o"></sql:query>
			<c:forEach items="${q2.rows }" var="row" varStatus="x">						 
			<tr>
				<td width="25%" align="center">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_goodstype 
					where c_no in (select c_goodstypeid from t_goods where c_no=${row.c_goodsid })"></sql:query>		
				${q3.rows[0].c_name }	
				</td>
				<td width="25%" align="center"> 
				<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_goods where c_no=${row.c_goodsid }"></sql:query>
				${q4.rows[0].c_name }
				</td>  
				<td width="25%" align="center"> 
				${row.c_number }
				</td>
				<td width="25%" align="center">
				<c:set var="c_jobnm" value="${fn:trim(row.c_jobnm )}"></c:set> 
				<c:choose> 
				<c:when test="${c_jobnm eq 'ck' }">
					<c:choose>
					<c:when test="${empty row.c_o }">
						 领用人：${row.c_p }
					</c:when>
					<c:when test="${not empty row.c_o }">
						<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.c_o }"></sql:query>
						领用机构：${q5.rows[0].c_name }						 
					</c:when>
					</c:choose>		
				</c:when>
				<c:when test="${c_jobnm eq 'bf' }">
				<font color="red">已报废</font>
				</c:when>
				</c:choose>							
				</td>
			</tr> 
			</c:forEach>	 			
			<sql:query var="q2" dataSource="${db_mssql }" sql="select c_goodsid,c_p,c_o,count(*) c_number from t_goodsstate  
					where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_flag='0' and c_jobnm in ('rk2','dj','hk')
					group by c_goodsid,c_p,c_o order by c_p,c_o"></sql:query>
			<c:forEach items="${q2.rows }" var="row" varStatus="x">						 
			<tr>
				<td width="25%" align="center">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_goodstype 
					where c_no in (select c_goodstypeid from t_goods where c_no=${row.c_goodsid })"></sql:query>		
				${q3.rows[0].c_name }	
				</td>
				<td width="25%" align="center"> 
				<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_goods where c_no=${row.c_goodsid }"></sql:query>
				${q4.rows[0].c_name }
				</td>  
				<td width="25%" align="center"> 
				${row.c_number }
				</td>
				<td width="25%" align="center">
				 <font color="blue">在库房</font>				 				
				</td>
			</tr> 
			</c:forEach>	 
		</table>	  	 		
		<br>	
	</c:when>
	</c:choose>	
	</body> 
</html:html>

