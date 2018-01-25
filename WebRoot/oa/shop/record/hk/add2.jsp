<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<sql:query var="a1" dataSource="${db_mssql }" sql="select * from t_orgtype order by c_order "></sql:query>
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../../tool/styles/main.css">		
	<script type='text/javascript' src='../../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../../dwr/interface/Library.js'></script> 		
	<script type='text/javascript' src='../../../../dwr/interface/Organization.js'></script> 
</head>		
	<body>		
	<c:choose>
	<c:when test="${param.c_libraryid eq 1}">
		<html:form  action="/shop" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="goodssingle"/>
		<nested:nest property="goodsrecord">	
		<nested:hidden property="c_jobnm" value="hk"></nested:hidden> 	
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>	
		<nested:hidden property="c_libraryid" value="${param.c_libraryid }"></nested:hidden>	
		  <table width="100%" border="1" cellspacing="0" id="tb1">
			<tr>
				<td height="33" colspan="10" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						 回库添加
					</div>
				</td>
			</tr> 
			<tr>
				<td width="20%" align="center">回库单号</td> 
				<td width="80%" align="left" colspan="3">
					<sql:query var="q1" dataSource="${db_mssql }" sql="select max(c_recordid) c_recordid  from t_goodsrecord 
						where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid }"></sql:query>
					<c:choose>
						<c:when test="${empty q1.rows[0].c_recordid }"> 
						 ${param.c_orgid }${param.c_libraryid }0000001
						 <nested:hidden property="c_recordid" value="${param.c_orgid }${param.c_libraryid }0000001"></nested:hidden>							 	
						</c:when>
						<c:when test="${not empty q1.rows[0].c_recordid }"> 
						 ${q1.rows[0].c_recordid+1 }
						 <nested:hidden property="c_recordid" value="${q1.rows[0].c_recordid+1 }"></nested:hidden>		
						</c:when>
					</c:choose>											
				</td>
			</tr> 		
			<tr>
				<td width="20%" align="center"><b>分类</b></td>
				<td width="20%" align="center"><b>物品</b></td> 
				<td width="20%" align="center"><b>编号</b></td>
				<td width="20%" align="center"><b>领用备注</b></td>
				<td width="20%" align="center"><b>选择回库编号</b></td> 
			</tr> 				 
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_goodsstate 
				where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_o is null and c_jobnm in ('ck','db') and c_flag='0' order by c_goodsid,c_code "></sql:query>
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
				${row.c_code }
				</td> 
				<td width="20%" align="center"> 
				 领用人：${row.c_p }
				</td>
				<td width="20%" align="center">
				<nested:hidden property="c_code" value="${row.c_code }"></nested:hidden>
				<nested:checkbox property="c_id" value="${x.index }"></nested:checkbox>
				</td>
			</tr> 			
			</c:forEach> 
			<nested:hidden property="c_o" value="${sessionScope.Staff.c_orgid }"></nested:hidden>
			</nested:nest>
			<tr>
				<td width="100%" align="center" colspan="5" > 
				<input type="submit" value="   确 定   "></td> 
				
			</tr>		
		</table>	 
		</html:form>		
	</c:when>	
	
	<c:when test="${param.c_libraryid eq 2 or param.c_libraryid eq 3}">
		<html:form  action="/shop" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="goodsbatch"/>
		<nested:nest property="goodsrecord">	
		<nested:hidden property="c_jobnm" value="hk"></nested:hidden> 	
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>	
		<nested:hidden property="c_libraryid" value="${param.c_libraryid }"></nested:hidden>	
		  <table width="100%" border="1" cellspacing="0" id="tb1">
			<tr>
				<td height="33" colspan="10" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						回库添加
					</div>
				</td>
			</tr> 
			<tr>
				<td width="20%" align="center">回库单号</td> 
				<td width="80%" align="left" colspan="4">
					<sql:query var="q1" dataSource="${db_mssql }" sql="select max(c_recordid) c_recordid  from t_goodsrecord 
						where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid }"></sql:query>
					<c:choose>
						<c:when test="${empty q1.rows[0].c_recordid }"> 
						 ${param.c_orgid }${param.c_libraryid }0000001
						 <nested:hidden property="c_recordid" value="${param.c_orgid }${param.c_libraryid }0000001"></nested:hidden>							 	
						</c:when>
						<c:when test="${not empty q1.rows[0].c_recordid }"> 
						 ${q1.rows[0].c_recordid+1 }
						 <nested:hidden property="c_recordid" value="${q1.rows[0].c_recordid+1 }"></nested:hidden>		
						</c:when>
					</c:choose>											
				</td>
			</tr> 		
			<tr>
				<td width="20%" align="center"><b>分类</b></td>
				<td width="20%" align="center"><b>物品</b></td> 
				<td width="20%" align="center"><b>数量</b></td>
				<td width="20%" align="center"><b>领用备注</b></td>
				<td width="20%" align="center"><b>输入回库数量</b>					 				
				</td>
			</tr> 
			<sql:query var="q2" dataSource="${db_mssql }" sql="select c_goodsid, c_p, count(*) c_number from t_goodsstate 
				where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } and c_o is null and c_jobnm in ('ck','db') and c_flag='0' 
				group by c_goodsid,c_p
				order by c_goodsid,c_p  "></sql:query>
			<c:forEach items="${q2.rows }" var="row">						 
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
				<td width="20%" align="center">${row.c_number }</td>
				<td width="20%" align="center"> 
				<nested:hidden property="c_p" value="${row.c_p }"></nested:hidden>
				领用人：${row.c_p }
				</td>
				<td width="20%" align="center">
				<nested:text property="c_number" value="" onchange="reg_num(this)"></nested:text>
				</td>
			</tr> 			 
			</c:forEach>
			<nested:hidden property="c_o" value="${sessionScope.Staff.c_orgid }"></nested:hidden>
			</nested:nest>
			<tr>
				<td width="100%" align="center" colspan="5" > 
				<input type="submit" value="   确 定   "> 
				</td> 
			</tr>		
		</table>	 
		</html:form>		
	</c:when>
	</c:choose>	
	</body> 
</html:html>

