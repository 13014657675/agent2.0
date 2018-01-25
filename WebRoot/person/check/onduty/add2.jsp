<%@ page language="java"  pageEncoding="gbk"%>
<jsp:directive.page import="com.publics.Tool"/>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
	<% 
	int c_year=Integer.parseInt(request.getParameter("c_year"));
	int c_month=Integer.parseInt(request.getParameter("c_month"));
	String c_date=new Tool().getDATE(c_year,c_month+1,1);
	request.setAttribute("c_date",c_date);	
	%>
	<sql:query var="q1" dataSource="${db_mssql }" sql="select  datepart(day, dateadd(day, -1, '${requestScope.c_date }') )  as c_count"></sql:query>
	<sql:query var="k1" dataSource="${db_mssql }" sql="select  dateadd(month, -1, '${requestScope.c_date }') as c_ksrq"></sql:query>
	<c:set var="c_ksrq" value="${k1.rows[0].c_ksrq }"></c:set>
</head> 
		<body >		 
			<html:form  action="/check" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="onduty"/>
			<nested:nest property="check">
			<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>
			<nested:hidden property="c_jobnm" value="add"></nested:hidden>		
			<table width="100%" border="1" cellspacing="0">
					<tr>
						<td height="33" colspan="${(q1.rows[0].c_count + 1 ) * 2 + 1 }" background="../../../tool/images/113.gif">
							<div align="left">
								<img src="../../../tool/images/112.gif" width="16" height="15" />
							考勤记录添加 
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
					<sql:query var="q3" dataSource="${db_mssql }" sql="select distinct c_jobnumber  from t_postset where c_orgid= ${param.c_orgid }"></sql:query>  
					<c:forEach items="${q3.rows }" var="row3" varStatus="x3">
					<tr>
						<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${row3.c_jobnumber }' "></sql:query>  
						<td align="center" >${q4.rows[0].c_name }</td>
						<c:forEach begin="0" end="${q1.rows[0].c_count-1 }" var="s" >
						<sql:query var="q5" dataSource="${db_mssql }" sql="select  convert(char(8),dateadd(day,${s },'${c_ksrq }'),112) c_date"></sql:query>
						<td align="center">
					 		<nested:hidden property="c_id" value="1"></nested:hidden>
					 		<nested:hidden property="c_jobnumber" value="${row3.c_jobnumber }"></nested:hidden>
					 		<nested:hidden property="c_date" value="${q5.rows[0].c_date }"></nested:hidden>
					 		<sql:query var="q6" dataSource="${db_mssql }" sql="select * from t_ontype order by c_code desc"></sql:query>
					 		<nested:select property="c_morning" value="">					 		
					 		<c:forEach items="${q6.rows }" var="row6">
					 		<html:option value="${row6.c_no }">${row6.c_name }</html:option>
					 		</c:forEach>				 		
					 		</nested:select>
					 	</td>
					 	<td align="center">
					 		<nested:select property="c_afternoon" value="">					 		
					 		<c:forEach items="${q6.rows }" var="row6">
					 		<html:option value="${row6.c_no }">${row6.c_name }</html:option>
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
		</body>  
</html:html>
