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
		<html:form  action="/shop" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="goodsprice"/>
		<nested:nest property="goodsrecord">	
		<nested:hidden property="c_jobnm" value="dj"></nested:hidden> 	
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>	
		<nested:hidden property="c_libraryid" value="${param.c_libraryid }"></nested:hidden>
		  <table width="100%" border="1" cellspacing="0" id="dy">
			<tr>
				<td height="33" colspan="10" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						价格打印
					</div>
				</td>
			</tr> 
			<tr>
				<td width="20%" align="center">入库单号</td> 
				<td width="80%" align="left" colspan="4">
					 ${param.c_recordid }		
					 <nested:hidden property="c_recordid" value="${param.c_recordid }"></nested:hidden>							
				</td>
			</tr> 		
			<tr>
				<td width="20%" align="center"><b>分类名</b></td>
				<td width="20%" align="center"><b>物品名</b></td> 
				<td width="20%" align="center"><b>数量</b></td>
				<td width="20%" align="center"><b>入库价</b></td>
				<td width="20%" align="center"><b>出库价</b></td>
			</tr> 				 
			<c:set var="sum1" value="0"></c:set>
			<c:set var="sum2" value="0"></c:set>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_goodsbatch  
					where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_recordid=${param.c_recordid } and c_flag='0' and c_jobnm in ('dj')"></sql:query>
			<c:forEach items="${q2.rows }" var="row" varStatus="x">
			<tr>
				<td width="20%" align="center">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_goodstype 
					where c_no in (select c_goodstypeid from t_goods where c_no=${row.c_goodsid })"></sql:query>		
				${q3.rows[0].c_name }			 
				</td>
				<td width="20%" align="center">
				<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_goods where c_no=${row.c_goodsid }"></sql:query>
				 ${q4.rows[0].c_name }
				 <nested:hidden property="c_goodsid" value="${row.c_goodsid }"></nested:hidden>
				</td> 
				<td width="20%" align="center"> 
				<nested:hidden property="c_number"   value="${row.c_number }"></nested:hidden>
				${row.c_number }
				</td>
				<td width="20%" align="center">
				<nested:hidden property="c_inprice"   value="${row.c_inprice }"></nested:hidden>
				${row.c_inprice }
				<c:set var="sum1" value="${sum1+row.c_inprice * row.c_number }"></c:set>
				</td>
				<td width="20%" align="center">
				<nested:hidden property="c_outprice"   value="${row.c_outprice }"></nested:hidden>
				${row.c_outprice }
				<c:set var="sum2" value="${sum2+row.c_outprice * row.c_number }"></c:set>
				</td>				
			</tr> 		
			</c:forEach>
			<tr>
				<td width="20%" align="center"></td>
				<td width="20%" align="center"></td>
				<td width="20%" align="center"> 合计：</td> 
				<td width="20%" align="center">${sum1 } </td>
				<td width="20%" align="center">${sum2 } </td>
			</tr>  	
			<tr>
				<td width="20%" align="center"></td>
				<td width="20%" align="center"></td>
				<td width="20%" align="center"></td> 
				<td width="20%" align="center">时间：</td>
				<td width="20%" align="center">${q2.rows[0].c_datime}</td> 
			</tr>
			</nested:nest>
			<tr>
				<td colspan="5"  align="center"> 
				<input type="button" value=" 打 印 " onclick="PrintTable(dy) ">
				</td>			 
			</tr>    		
		</table>	 
		</html:form>
	</body> 
</html:html> 
