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
						回库打印
					</div>
				</td>
			</tr> 
			<tr>
				<td width="25%" align="center">回库单号</td> 
				<td width="75%" align="left" colspan="3">
					 ${param.c_recordid }								
				</td>
			</tr> 		
			<tr>
				<td width="25%" align="center"><b>分类</b></td>
				<td width="25%" align="center"><b>物品</b></td> 
				<td width="25%" align="center"><b>编号</b></td>
				<td width="25%" align="center"></td> 
			</tr> 				 
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_goodsstate  
					where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_recordid=${param.c_recordid } and c_jobnm='hk' "></sql:query>
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
				</td>
			</tr> 			
			</c:forEach>			 
			<tr>
				<td width="25%" align="center"></td>
				<td width="25%" align="center"></td>
				<td width="25%" align="center">时间：</td> 
				<td width="25%" align="center">${q2.rows[0].c_datime} </td>
			</tr>  	
			<tr>
				<td colspan="4"  align="center"> 
				<input type="button" value=" 打 印 " onclick="PrintTable(dy) ">
				</td>			 
			</tr>    	 
		</table>			
	</c:when>	
	
	<c:when test="${param.c_libraryid eq 2 or param.c_libraryid eq 3}">		 	
		  <table width="100%" border="1" cellspacing="0" id="dy">
			<tr>
				<td height="33" colspan="10" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						回库打印
					</div>
				</td>
			</tr> 
			<tr>
				<td width="25%" align="center">回库单号</td> 
				<td width="75%" align="left" colspan="4">
					  ${param.c_recordid }									
				</td>
			</tr> 		
			<tr>
				<td width="25%" align="center"><b>分类</b></td>
				<td width="25%" align="center"><b>物品</b></td> 
				<td width="25%" align="center"><b>数量</b></td> 
				<td width="25%" align="center">					 				
				</td>
			</tr> 	
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_goodsbatch  
					where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_recordid=${param.c_recordid } and c_jobnm in ('hk')"></sql:query>
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
				<td width="25%" align="center"></td>
			</tr> 
			</c:forEach>			 
			<tr>
				<td width="25%" align="center"></td>
				<td width="25%" align="center"></td>
				<td width="25%" align="center">时间：</td> 
				<td width="25%" align="center">${q2.rows[0].c_datime} </td>
			</tr>  	
			<tr>
				<td colspan="4"  align="center"> 
				<input type="button" value=" 打 印 " onclick="PrintTable(dy) ">
				</td>			 
			</tr>    	
		</table>	  	 
	</c:when>
	</c:choose>	
	</body> 
</html:html>

