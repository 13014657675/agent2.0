<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>  		
	   <logic:equal value="1" parameter="c_type">
	   <sql:query var="p1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${param.c_orgtypeid }"></sql:query> 
	   <sql:query var="p2" dataSource="${db_mssql }" sql="select left(c_path,${p1.rows[0].c_order } * 2)+'%' c_path from t_organization where c_no=${param.c_orgid } and c_flag='0' "></sql:query> 
	  
	   	<c:choose>
		<c:when test="${param.c_jobnm eq 'a' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_cxbd 
			where c_orgid_sq in (select c_no from t_organization where c_path like '${p2.rows[0].c_path }' and c_flag='0'  )
			and c_lrrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_lrrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'b' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_cxbd 
			where c_orgid_sq in (select c_no from t_organization where c_path like '${p2.rows[0].c_path }' and c_flag='0'  )
			and c_cbrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_cbrq"></sql:query>
		</c:when>		
		</c:choose>
	   </logic:equal>
	   
	   <logic:equal value="2" parameter="c_type">
	   <c:choose>
		<c:when test="${param.c_jobnm eq 'a' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_cxbd 
			where c_companyid = ${param.c_companyid }
			and c_lrrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_lrrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'b' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_cxbd 
			where c_companyid = ${param.c_companyid }
			and c_cbrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_cbrq"></sql:query>
		</c:when>
		</c:choose>
	   </logic:equal>	
	   
	   <logic:equal value="3" parameter="c_type">
	   <c:choose>
		<c:when test="${param.c_jobnm eq 'a' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_cxbd 
			where c_jobnumber ='${param.c_jobnumber }'
			and c_lrrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_lrrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'b' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_cxbd 
			where c_jobnumber ='${param.c_jobnumber }'
			and c_cbrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_cbrq"></sql:query>
		</c:when>
		</c:choose>
	   </logic:equal>		
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
			<td>序号</td>		
			<td>上级机构</td>
			<td>代理人所属机构</td>
			<td>保险公司</td> 
			<td>保单号</td>
			<td>险种名称</td>
			<td>保险费</td>			
			<td>车牌号</td>
			<td>使用性质</td>
			<td>被保险人姓名</td>			
			<td>证件类型</td>
			<td>证件号码</td>	 
			<td>签单日期</td>
			<td>起保日期</td>			
			<td>代理人工号</td>
			<td>代理人姓名</td>			
			<td>代理人所用政策</td> 
			<td>手续费率</td>
			<td>手续费</td>	
			<td>收入税率</td>
			<td>收入税</td>		
			<td>佣金率</td>
			<td>佣金</td>	
			<td>支出税率</td>
			<td>支出税</td>			
			<td>结算月份</td>				
			<td>保单状态</td>
			</tr> 
			<c:forEach items="${q1.rows }" var="row" varStatus="x">
			<tr>
			<td>${x.index+1 }</td>
			<sql:query var="q8" dataSource="${db_mssql }" sql="select c_orgid,c_jobnumber,c_name from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>	
			<c:if test="${not empty q8.rows[0].c_orgid }">			
			<sql:query var="q10" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q8.rows[0].c_orgid }"></sql:query>
			<sql:query var="q11" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${q10.rows[0].c_parent }"></sql:query>		
			</c:if>			
			<td>${q11.rows[0].c_name }</td>
			<td>${q10.rows[0].c_name }</td>			
			<td>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			${q2.rows[0].c_name }
			</td> 
			<td>${row.c_bd }</td>
			<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query>	
			<td>${q5.rows[0].c_name }</td>
			<td>${row.c_bxf }</td>			
			<td>${row.c_platenumber }</td>
			<td>
				<sql:query var="c_usageid"	sql="select * from t_usage where c_system=11 and c_no=${row.c_usageid }"	dataSource="${db_mssql}"></sql:query>
				${c_usageid.rows[0].c_name }
			</td>
			<td>${row.c_customer }</td>
			<td>
			<sql:query var="cardtype"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14 and c_code=${row.c_cardtype } "></sql:query> 
			${cardtype.rows[0].c_name }
			</td>
			<td>'${row.c_cardnum }</td> 
			<td>${row.c_lrrq }</td>
			<td>${row.c_cbrq }</td>
			<td>${row.c_jobnumber }</td>
			<td>${q8.rows[0].c_name }</td> 
			<c:if test="${not empty row.c_system_sq }">
		  		<sql:query var="zc" dataSource="${db_mssql }" sql="select * from t_policy where c_system=${row.c_system_sq } "></sql:query>
		 	</c:if>
			<td>${zc.rows[0].c_name }</td>	
			<td>${row.c_bxfr1 }</td>
			<td>${row.c_bxfy1 }</td> 
			<td>${row.c_ccsr1 }</td>
			<td>${row.c_ccsy1 }</td> 		
			<td>${row.c_bxfr2 }</td>
			<td>${row.c_bxfy2 }</td> 
			<td>${row.c_ccsr2 }</td>
			<td>${row.c_ccsy2 }</td> 
			<td>${row.c_solve }</td>			 			
			<td>
				<c:choose> 
				<c:when test="${fn:trim(row.c_jobnm) eq '0' }">正常状态</c:when>
				</c:choose>
			</td>
			</tr>
			</c:forEach>			 
		</table> 
</body>
</html:html>
