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
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_orgid_sq in (select c_no from t_organization where c_path like '${p2.rows[0].c_path }' and c_flag='0'  )
			and c_tbrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'b' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_orgid_sq in (select c_no from t_organization where c_path like '${p2.rows[0].c_path }' and c_flag='0'  )
			and c_bd in (select c_bd from t_sxbdzt 
				where c_companyid=v_sxbdxx.c_companyid and c_type=1 and c_date between '${param.c_ksrq }' and '${param.c_jsrq }')
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'c' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_orgid_sq in (select c_no from t_organization where c_path like '${p2.rows[0].c_path }' and c_flag='0'  )
			and c_bd in (select c_bd from t_sxbdzt 
				where c_companyid=v_sxbdxx.c_companyid and c_type=2 and convert(char(8),c_datime,112) between '${param.c_ksrq }' and '${param.c_jsrq }')
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'd' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_orgid_sq in (select c_no from t_organization where c_path like '${p2.rows[0].c_path }' and c_flag='0'  )
			and c_bd in (select c_bd from t_sxbdzt 
				where c_companyid=v_sxbdxx.c_companyid and c_type=3 and convert(char(8),c_datime,112) between '${param.c_ksrq }' and '${param.c_jsrq }')
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		</c:choose>
	   </logic:equal>
	   
	   <logic:equal value="2" parameter="c_type">
	   <c:choose>
		<c:when test="${param.c_jobnm eq 'a' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_companyid = ${param.c_companyid }
			and c_tbrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'b' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_companyid = ${param.c_companyid }
			and c_bd in (select c_bd from t_sxbdzt 
				where c_companyid=v_sxbdxx.c_companyid and c_type=1 and c_date between '${param.c_ksrq }' and '${param.c_jsrq }')
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'c' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_companyid = ${param.c_companyid }
			and c_bd in (select c_bd from t_sxbdzt 
				where c_companyid=v_sxbdxx.c_companyid and c_type=2 and convert(char(8),c_datime,112) between '${param.c_ksrq }' and '${param.c_jsrq }')
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'd' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_companyid = ${param.c_companyid }
			and c_bd in (select c_bd from t_sxbdzt 
				where c_companyid=v_sxbdxx.c_companyid and c_type=3 and convert(char(8),c_datime,112) between '${param.c_ksrq }' and '${param.c_jsrq }')
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		</c:choose>
	   </logic:equal>	
	   
	   <logic:equal value="3" parameter="c_type">
	   <c:choose>
		<c:when test="${param.c_jobnm eq 'a' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_jobnumber ='${param.c_jobnumber }'
			and c_tbrq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'b' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_jobnumber ='${param.c_jobnumber }'
			and c_bd in (select c_bd from t_sxbdzt 
				where c_companyid=v_sxbdxx.c_companyid and c_type=1 and c_date between '${param.c_ksrq }' and '${param.c_jsrq }')
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'c' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_jobnumber ='${param.c_jobnumber }'
			and c_bd in (select c_bd from t_sxbdzt 
				where c_companyid=v_sxbdxx.c_companyid and c_type=2 and convert(char(8),c_datime,112) between '${param.c_ksrq }' and '${param.c_jsrq }')
			order by c_companyid,c_tbrq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'd' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from v_sxbdxx 
			where c_jobnumber ='${param.c_jobnumber }'
			and c_bd in (select c_bd from t_sxbdzt 
				where c_companyid=v_sxbdxx.c_companyid and c_type=3 and convert(char(8),c_datime,112) between '${param.c_ksrq }' and '${param.c_jsrq }')
			order by c_companyid,c_tbrq"></sql:query>
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
			<td>投保单</td>
			<td>保单</td>
			<td>投保人姓名</td>			
			<td>投保人证件类型</td>
			<td>投保人证件号码</td>
			<td>投保人地址</td>
			<td>投保人联系电话</td>
			<td>被保人姓名</td>
			<td>代理人工号</td>
			<td>代理人姓名</td>
			<td>代理人所用政策</td>
			<td>险种代码</td>
			<td>险种名称</td>
			<td>交费期限</td>
			<td>保险金额</td>
			<td>保险费</td>
			<td>标准保费</td>
			<td>佣金率</td>
			<td>佣金</td>
			<sql:query var="x" dataSource="${db_mssql }" sql="select * from t_exptype where c_system=2 order by c_no"></sql:query>
			<c:forEach items="${x.rows }" var="xrow">
			<td colspan="2">${xrow.c_name }</td>		 
			</c:forEach>		 
			<td>录入日期</td>
			<td>投保日期</td>
			<td>承保日期</td>
			<td>回执日期</td>
			<td>结算月份</td>			
			<td>网点代码</td>
			<td>网点名称</td>			
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
			<td>'${row.c_tbd }</td>
			<td>'${row.c_bd }</td>
			<td>
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_tbrnum }"></sql:query>
			${q3.rows[0].c_name }
			</td>
			<td>
			<sql:query var="cardtype"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14 and c_code=${q3.rows[0].c_cardtype } "></sql:query> 
			${cardtype.rows[0].c_name }
			</td>
			<td>'${q3.rows[0].c_cardnum }</td>
			<td>${q3.rows[0].c_hddr }</td>
			<td>${q3.rows[0].c_phone }[${q3.rows[0].c_mobile }]</td>
			<td>
			<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_bbrnum }"></sql:query>
			${q4.rows[0].c_name }
			</td>
			<td>${row.c_jobnumber }</td>			
			<td>${q8.rows[0].c_name }</td>
			<c:if test="${not empty row.c_system_sq }">
		  		<sql:query var="zc" dataSource="${db_mssql }" sql="select * from t_policy where c_system=${row.c_system_sq } "></sql:query>
		 	</c:if>
			<td>${zc.rows[0].c_name }</td>			
			<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query>			
			<td>${q5.rows[0].c_code }</td>
			<td>${q5.rows[0].c_name }</td>
			<td>
			<c:choose>
			<c:when test="${row.c_jfqx eq 1 }">趸交</c:when>
			<c:otherwise>${row.c_jfqx }</c:otherwise>
			</c:choose>			
			</td>
			<td>${row.c_bxje }</td>
			<td>${row.c_bxf }</td>
			<td>${row.c_bxfbz }</td>
			<td>${row.c_bxfr2 }</td>
			<td>${row.c_bxfy2 }</td>
			<sql:query var="x" dataSource="${db_mssql }" sql="select * from t_exptype where c_system=2 order by c_no"></sql:query>
			 <c:forEach items="${x.rows }" var="xrow">
			 <sql:query var="x1" dataSource="${db_mssql }" sql="select c_srate from t_expsrate	where c_companyid=${row.c_companyid }
			 	 and c_productid=${row.c_productid } and c_jfqx=${row.c_jfqx } and c_bdnd=1 and c_system=${row.c_system_sq } and c_exptypeid=${xrow.c_no } "></sql:query>
			 <td>${x1.rows[0].c_srate }</td>
			 <td>${x1.rows[0].c_srate * row.c_bxf }</td>
			 </c:forEach>
			<td>${row.c_lrrq }</td>
			<td>${row.c_tbrq }</td>
			<sql:query var="q6" dataSource="${db_mssql }" sql="select c_date c_cbrq from t_sxbdzt 
				where c_companyid=${row.c_companyid } and c_bd='${row.c_bd }' and c_type=1 "></sql:query>		
			<td>${q6.rows[0].c_cbrq }</td>
			<sql:query var="q7" dataSource="${db_mssql }" sql="select convert(char(8),c_datime,112) c_hzrq from t_sxbdzt 
				where c_companyid=${row.c_companyid } and c_bd='${row.c_bd }' and c_type=3 "></sql:query>
			<td>${q7.rows[0].c_hzrq }</td>
			<td>${row.c_solve }</td>			
			<sql:query var="q9" dataSource="${db_mssql }" sql="select * from t_bankoutlets where c_no=${row.c_outletsid }"></sql:query>		
			<td>${q9.rows[0].c_code }</td>		
			<td>${q9.rows[0].c_name }</td>	 			
			<td>
				<c:choose> 
				<c:when test="${fn:trim(row.c_jobnm) eq '0' }">正常状态</c:when>
				<c:when test="${fn:trim(row.c_jobnm) eq '4' }">犹豫期退保（撤单）</c:when>
				<c:when test="${fn:trim(row.c_jobnm) eq '5' }">正常退保</c:when> 					
				<c:when test="${fn:trim(row.c_jobnm) eq 'zz' }">保单终止</c:when>
				</c:choose>
			</td>
			</tr>
			</c:forEach>			 
		</table> 
</body>
</html:html>
