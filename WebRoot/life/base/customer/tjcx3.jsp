<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>  		 
	   <sql:query var="p1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${param.c_orgtypeid }"></sql:query> 
	   <sql:query var="p2" dataSource="${db_mssql }" sql="select left(c_path,${p1.rows[0].c_order } * 2)+'%' c_path from t_organization where c_no=${param.c_orgid }"></sql:query> 
	  
	   	<c:choose>
		<c:when test="${param.c_jobnm eq 'a' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select distinct c_companyid,c_tbd,c_bd,c_tbrnum,c_bbrnum,c_jobnumber,c_orgid_sq from v_sxbdxx  
			where c_orgid_sq in (select c_no from t_organization where c_path like '${p2.rows[0].c_path }' )
			and c_tbrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_orgid_sq,c_jobnumber"></sql:query>
		</c:when>		
		</c:choose> 
	  	
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="80" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						统计数据查询
					</div>
				</td>
			</tr>					
			<tr>			
			<td>上级机构</td>
			<td>代理人所属机构</td>
			<td>保险公司</td>
			<td>投保单号</td>
			<td>保单号</td>			
			<td>代理人工号</td>
			<td>代理人姓名</td>
						
			<td>投保人姓名</td>
			<td>投保人证件类型</td>
			<td>投保人证件号码</td>				 
			<td>出现次数</td>			 
			
			<td>被保人姓名</td>
			<td>被保人证件类型</td>
			<td>被保人证件号码</td>				 
			<td>出现次数</td>			 
			</tr>
			<c:forEach items="${q1.rows }" var="row">
			<tr>			
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.c_orgid_sq }"></sql:query>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q1.rows[0].c_parent }"></sql:query>			
			<td>${q2.rows[0].c_name }</td>
			<td>${q1.rows[0].c_name }</td>		
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			<td>${q3.rows[0].c_name }</td>	
			<td>${row.c_tbd }</td>
			<td>${row.c_bd }</td>
			<sql:query var="q4" dataSource="${db_mssql }" sql="select c_orgid,c_jobnumber,c_name from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>	
			<td>${q4.rows[0].c_jobnumber }</td>
			<td>${q4.rows[0].c_name }</td>
			<sql:query var="qa1" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_tbrnum }"></sql:query>
			<td>${qa1.rows[0].c_name }</td>
			<td>
			<sql:query var="cardtype1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14 and c_code=${qa1.rows[0].c_cardtype } "></sql:query> 
			${cardtype1.rows[0].c_name }
			</td>
			<td>${qa1.rows[0].c_cardnum }</td>
			<td>
			<sql:query var="qb1" dataSource="${db_mssql }" sql="select count(*) c_count from t_sxbd where c_tbrnum in (
				select c_no from t_customer where c_cardtype='${qa1.rows[0].c_cardtype }' and c_cardnum='${qa1.rows[0].c_cardnum }' )
				or c_bbrnum in (
				select c_no from t_customer where c_cardtype='${qa1.rows[0].c_cardtype }' and c_cardnum='${qa1.rows[0].c_cardnum }' ) 
				and c_tbrq <= '${param.c_jsrq }' "></sql:query>
			${qb1.rows[0].c_count }
			</td> 
			
			<sql:query var="qa2" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_bbrnum }"></sql:query>
			<td>${qa2.rows[0].c_name }</td>
			<td>
			<sql:query var="cardtype2"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14 and c_code=${qa2.rows[0].c_cardtype } "></sql:query> 
			${cardtype2.rows[0].c_name }
			</td>
			<td>${qa2.rows[0].c_cardnum }</td>
			<td>
			<sql:query var="qb2" dataSource="${db_mssql }" sql="select count(*) c_count from t_sxbd where c_tbrnum in (
				select c_no from t_customer where c_cardtype='${qa2.rows[0].c_cardtype }' and c_cardnum='${qa2.rows[0].c_cardnum }' )
				or c_bbrnum in (
				select c_no from t_customer where c_cardtype='${qa2.rows[0].c_cardtype }' and c_cardnum='${qa2.rows[0].c_cardnum }' ) 
				and c_tbrq <= '${param.c_jsrq }' "></sql:query>
			${qb2.rows[0].c_count }
			</td> 
			</tr>
			</c:forEach>		
					 
		</table> 
</body>
</html:html>
