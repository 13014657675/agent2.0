<%@ page language="java"  pageEncoding="gbk"%>
<jsp:directive.page import="com.publics.Tool"/>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">  	
	<sql:query var="q1" dataSource="${db_mssql }" sql="select datediff(day, min(c_date), max(c_date))+1 as c_count ,min(c_date) c_ksrq from t_onduty 
		where c_orgid=${param.c_orgid } and datepart(year,c_date)=${param.c_year } and datepart(month,c_date)=${param.c_month }"></sql:query> 
	<c:set var="c_ksrq" value="${q1.rows[0].c_ksrq }"></c:set>	
</head> 
		<body >		 
			<c:if test="${not empty q1.rows[0].c_count }">
			<html:form  action="/check" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="onduty"/>
			<nested:nest property="check">
			<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>
			<nested:hidden property="c_jobnm" value="update"></nested:hidden>		
			<table width="100%" border="1" cellspacing="0">
					<tr>
						<td height="33" colspan="${(q1.rows[0].c_count + 1 ) * 2 + 1 }" background="../../../tool/images/113.gif">
							<div align="left">
								<img src="../../../tool/images/112.gif" width="16" height="15" />
							考勤记录修改
							</div>
						</td>
					</tr>			
					<tr>
					<td align="center" rowspan="2"></td>			
					<c:forEach begin="0" end="${q1.rows[0].c_count-1  }" var="s" >
					<sql:query var="q2" dataSource="${db_mssql }" sql="select  convert(char(8),dateadd(day,${s },'${c_ksrq }'),112) c_date"></sql:query>
				 	<td align="center" colspan="2">${q2.rows[0].c_date }</td>
					</c:forEach>
					</tr>
					<tr> 		
					<c:forEach begin="0" end="${q1.rows[0].c_count-1  }" var="s" >
					<td align="center" >上午</td>
				 	<td align="center" >下午</td>
					</c:forEach>
					</tr>
					<sql:query var="q3" dataSource="${db_mssql }" sql="select distinct c_jobnumber  from t_onduty 
						where c_orgid=${param.c_orgid } and datepart(year,c_date)=${param.c_year } and datepart(month,c_date)=${param.c_month }"></sql:query>  
					<c:forEach items="${q3.rows }" var="row3" varStatus="x3">
					<tr>
						<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${row3.c_jobnumber }' "></sql:query>  
						<td align="center" >${q4.rows[0].c_name }</td>
						<c:forEach begin="0" end="${q1.rows[0].c_count-1 }" var="s" >
						<sql:query var="q5" dataSource="${db_mssql }" sql="select  convert(char(8),dateadd(day,${s },'${c_ksrq }'),112) c_date"></sql:query>
						<sql:query var="q6" dataSource="${db_mssql }" sql="select * from t_onduty where c_orgid=${param.c_orgid } 
							and c_jobnumber='${row3.c_jobnumber }' and c_date='${q5.rows[0].c_date }'"></sql:query>
						<td align="center">
					 		<nested:hidden property="c_id" value="${q6.rows[0].c_no }"></nested:hidden>
					 		<nested:hidden property="c_jobnumber" value="${row3.c_jobnumber }"></nested:hidden>
					 		<nested:hidden property="c_date" value="${q5.rows[0].c_date }"></nested:hidden>
					 		<sql:query var="q7" dataSource="${db_mssql }" sql="select * from t_ontype order by c_code desc"></sql:query>
					 		<nested:select property="c_morning" value="${q6.rows[0].c_morning }">					 		
					 		<c:forEach items="${q7.rows }" var="row7">
					 		<html:option value="${row7.c_no }">${row7.c_name }</html:option>
					 		</c:forEach>				 		
					 		</nested:select>
					 	</td>
					 	<td align="center">
					 		<nested:select property="c_afternoon" value="${q6.rows[0].c_afternoon }">					 		
					 		<c:forEach items="${q7.rows }" var="row7">
					 		<html:option value="${row7.c_no }">${row7.c_name }</html:option>
					 		</c:forEach>				 		
					 		</nested:select> 
					 	</td>
						</c:forEach>
					</tr>
					</c:forEach> 
					<tr>
					<td align="center"><input type="submit" value=" 确 定 "></td>			 			
					</tr>
					</table>		
			 	</nested:nest></html:form>	 
			 	</c:if>
		</body>  
</html:html>
