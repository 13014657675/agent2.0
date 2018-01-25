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
</head>		
	<body>	
		<html:form  action="/shop" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="goodsbatch"/>
		<nested:nest property="goodsrecord">	
		<nested:hidden property="c_jobnm" value="rk-del"></nested:hidden> 	
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>	
		<nested:hidden property="c_libraryid" value="${param.c_libraryid }"></nested:hidden>
		  <table width="100%" border="1" cellspacing="0" id="tb1">
			<tr>
				<td height="33" colspan="10" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						入库删除
					</div>
				</td>
			</tr> 
			<tr>
				<td width="25%" align="center">入库单号</td> 
				<td width="75%" align="left" colspan="3">
					 ${param.c_recordid }		
					 <nested:hidden property="c_recordid" value="${param.c_recordid }"></nested:hidden>							
				</td>
			</tr> 		
			<tr>
				<td width="25%" align="center"><b>分类名</b></td>
				<td width="25%" align="center"><b>物品名</b></td> 
				<td width="25%" align="center"><b>数量</b></td>
				<td width="25%" align="center">					 				
				</td>
			</tr> 				 
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_goodsbatch  
					where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_recordid=${param.c_recordid } and c_jobnm='rk'"></sql:query>
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
				 <nested:hidden property="c_goodsid" value="${row.c_goodsid }"></nested:hidden>
				</td> 
				<td width="25%" align="center"> 
				<nested:hidden property="c_number"   value="${row.c_number }"></nested:hidden>
				${row.c_number }
				</td>
				<td width="25%" align="center"></td>
			</tr> 		
			</c:forEach>
			<tr>
				<td width="25%" align="center">入库人：</td>
				<td width="25%" align="center">
				<nested:hidden property="c_p" styleId="req" title="入库人必须填写" value="${q2.rows[0].c_p }"></nested:hidden>
				${q2.rows[0].c_p }
				</td>
				<td width="25%" align="center">时间：</td> 
				<td width="25%" align="center">${q2.rows[0].c_datime} </td>
			</tr>  
			</nested:nest>
			<tr>
				<td width="100%" align="center" colspan="4" > 
				<input type="submit" value="   确 定   "></td> 
				
			</tr>		
		</table>	 
		</html:form>
	</body> 
</html:html> 
