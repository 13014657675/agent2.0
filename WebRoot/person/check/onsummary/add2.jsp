<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
	<sql:query var="q0" dataSource="${db_mssql }" sql=" select * from t_ontype where c_state=1 order by c_no "></sql:query>
	<sql:query var="q1" dataSource="${db_mssql }" sql=" select count(*) count from t_ontype where c_state=1 "></sql:query>
</head> 
		<body >	
			 <table width="100%" border="1" cellspacing="0">
					<tr>
						<td height="33" colspan="${q1.rows[0].count*2+2 }" background="../../../tool/images/113.gif">
							<div align="left">
								<img src="../../../tool/images/112.gif" width="16" height="15" />
								考勤汇总生成
							</div>
						</td>
					</tr>	
					<tr>
						<td align="center">姓名</td>
						<c:forEach items="${q0.rows }" var="row">
						<td align="center">${row.c_name }</td>
						<td align="center">${fn:trim(row.c_name) }扣款金额</td>
						</c:forEach>						
						<td align="center">总扣款金额</td>
					</tr> 
					<html:form  action="/check" onsubmit="return check_form(this)">
					<html:hidden property="jobname" value="onsummary"/>
					<nested:nest property="check">		
					<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden> 		
					<nested:hidden property="c_year" value="${param.c_year }"></nested:hidden> 		
					<nested:hidden property="c_month" value="${param.c_month }"></nested:hidden> 						
					<nested:hidden property="c_jobnm" value="add"></nested:hidden> 							
					<sql:query var="q2" dataSource="${db_mssql }" sql="select distinct c_jobnumber  from t_onduty 
						where c_orgid=${param.c_orgid } and datepart(year,c_date)=${param.c_year } and datepart(month,c_date)=${param.c_month }"></sql:query>
					<c:forEach items="${q2.rows }" var="row2">
					<c:set var="s" value="0"></c:set>					
					<tr>
						<sql:query var="q3" dataSource="${db_mssql }" sql=" select * from t_staff where c_jobnumber='${row2.c_jobnumber }' "></sql:query>
						<td align="center">
						${q3.rows[0].c_name }
						<nested:hidden property="c_id" value="1"></nested:hidden> 
						<nested:hidden property="c_jobnumber" value="${row2.c_jobnumber }"></nested:hidden>
						</td> 
						<c:forEach items="${q0.rows }" var="row0">												
						<sql:query var="q41" dataSource="${db_mssql }" sql=" select count(*) count from t_onduty where c_jobnumber='${row2.c_jobnumber }'
						and c_orgid=${param.c_orgid } and datepart(year,c_date)=${param.c_year } and datepart(month,c_date)=${param.c_month }
						and c_morning=${row0.c_no }"></sql:query>
						<sql:query var="q42" dataSource="${db_mssql }" sql=" select count(*) count from t_onduty where c_jobnumber='${row2.c_jobnumber }'
						and c_orgid=${param.c_orgid } and datepart(year,c_date)=${param.c_year } and datepart(month,c_date)=${param.c_month }
						and c_afternoon=${row0.c_no }"></sql:query>		 
						<sql:query var="q5" dataSource="${db_mssql }" sql=" select * from t_ontype2 where c_ontype=${row0.c_no } "></sql:query>
						<c:choose>
							<c:when test="${q5.rows[0].c_type eq 1}">							
							<td align="center">${q41.rows[0].count+q42.rows[0].count} 次 </td>		
							<td align="center">${(q41.rows[0].count+q42.rows[0].count)*q5.rows[0].c_deducted}</td>
							<c:set var="s" value="${s+(q41.rows[0].count+q42.rows[0].count)*q5.rows[0].c_deducted }"></c:set>
							</c:when>
							<c:when test="${q5.rows[0].c_type eq 2}">
							<td align="center">${(q41.rows[0].count+q42.rows[0].count)/2} 天 </td>	
							<td align="center">${(q41.rows[0].count+q42.rows[0].count)/2*q5.rows[0].c_deducted}</td>
							<c:set var="s" value="${s+(q41.rows[0].count+q42.rows[0].count)/2*q5.rows[0].c_deducted}"></c:set>
							</c:when>												
						</c:choose> 								
						</c:forEach>		
						<td align="center">
						${s }
						<nested:hidden property="c_deducted_temp" value="${s }"></nested:hidden>
						</td> 						
					</tr>
					</c:forEach>	
					</nested:nest>
					<tr>
						<td align="center">
						<input type="submit" value=" 确 定 ">
						</td>						 					
						<td colspan="${q1.rows[0].count*2+1 }"></td>
					</tr> 		
					</html:form>		 
			</table> 		
		</body>  
</html:html>
