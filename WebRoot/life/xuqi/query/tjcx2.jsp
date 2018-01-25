<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>  
		<c:choose>
		<c:when test="${param.c_jobnm eq 'a' }">
		 	<sql:query var="q1" dataSource="${db_mssql }" sql="select *,convert(char(8),c_datime,112) c_lrrq from t_sxtb_xq 
				where c_orgid=${param.c_orgid } and convert(char(8),c_datime,112) between '${param.c_ksrq }' and '${param.c_jsrq }'
				order by c_companyid,c_bdnd"></sql:query>  
		</c:when>
		<c:when test="${param.c_jobnm eq 'b' }">
		 	<sql:query var="q1" dataSource="${db_mssql }" sql="select *,convert(char(8),c_datime,112) c_lrrq from t_sxtb_xq 
				where c_orgid=${param.c_orgid } and c_fprq between '${param.c_ksrq }' and '${param.c_jsrq }'
				order by c_companyid,c_bdnd"></sql:query>
		</c:when> 
		</c:choose>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="20" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						统计数据查询
					</div>
				</td>
			</tr>					
			<tr>
			<td>保险公司</td> 
			<td>保单</td>
			<td>投保人姓名</td> 
			<td>保单年度</td>
			<td>险种代码</td>
			<td>险种名称</td>  
			<td>保险费</td> 
			<td>佣金率</td> 
			<td>佣金</td> 
			<td>录入日期</td>					
			<td>发票号码</td>	
			<td>实缴日期</td>
			<td>结算月份</td>
			</tr> 
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			${q2.rows[0].c_name }
			</td> 
			<td>${row.c_bd }</td>
			<td>${row.c_tbrname }</td>
			<td>${row.c_bdnd }</td>
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query>			
			<td>${q3.rows[0].c_code }</td>
			<td>${q3.rows[0].c_fullname }</td>			 
			<td>${row.c_bxf }</td>			
			<td>${row.c_bxfr2 }</td>	
			<td>${row.c_bxfy2 }</td>			
			<td>${row.c_lrrq }</td>			
			<td>${row.c_code }</td>
			<td>${row.c_fprq }</td> 
			<td>${row.c_solve }</td>	 
			</tr>
			</c:forEach>			 
		</table> 
</body>
</html:html>
