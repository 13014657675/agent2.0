<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">  
</head> 
		<body >	
			 <table width="100%" border="1" cellspacing="0">
					<tr>
						<td height="33" colspan="${q1.rows[0].count*2+2 }" background="../../../tool/images/113.gif">
							<div align="left">
								<img src="../../../tool/images/112.gif" width="16" height="15" />
								考勤汇总查询
							</div>
						</td>
					</tr>	
					<tr>
						<td align="center" width="50%">姓名</td> 	
						<td align="center" width="50%">总扣款金额</td>
					</tr> 
					<html:form  action="/check" onsubmit="return check_form(this)">
					<html:hidden property="jobname" value="onsummary"/>
					<nested:nest property="check">	
					<nested:hidden property="c_jobnm" value="del"></nested:hidden> 							
					<sql:query var="q2" dataSource="${db_mssql }" sql="select c_no, c_jobnumber,c_deducted  from t_onsummary 
						where c_orgid=${param.c_orgid } and c_year=${param.c_year } and c_month=${param.c_month } order by c_jobnumber"></sql:query>
					<c:forEach items="${q2.rows }" var="row2"> 
					<tr>
						<sql:query var="q3" dataSource="${db_mssql }" sql=" select * from t_staff where c_jobnumber='${row2.c_jobnumber }' "></sql:query>
						<td align="center">
						${q3.rows[0].c_name }
						<nested:hidden property="c_id" value="${row2.c_no }"></nested:hidden> 
						<nested:hidden property="c_jobnumber" value="${row2.c_jobnumber }"></nested:hidden>
						</td> 								
						<td align="center"> 
						${row2.c_deducted }
						<nested:hidden property="c_deducted_temp" value="${row2.c_deducted }"></nested:hidden>
						</td> 						
					</tr>
					</c:forEach>	
					</nested:nest>					 	
					</html:form>		 
			</table> 		
		</body>  
</html:html>
