<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>   
	 <sql:query var="q1" dataSource="${db_mssql }" 
	 	sql="p_sjjdcx ${param.c_orgtypeid },${param.c_orgid },${param.c_year },${param.c_month }"></sql:query>		 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="30" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						收缴进度查询 
					</div>
				</td>
			</tr>					
			<tr>
			<td>上级机构</td>		
			<td>机构名称</td>			 
			<td>保险公司</td> 
			<td>保单</td>
			<td>投保人姓名</td> 
			<td>投保人联系电话</td> 
			<td>投保人地址</td> 
			<td>被保人姓名</td> 			
			<td>银行名称</td> 
			<td>银行帐号</td> 
			<td>险种代码</td>
			<td>险种名称</td>  
			<td>交费期限</td>
			<td>首期保费</td>
			<td>承保日期</td>
			<td>收款日期</td>			
			<td>保单年度</td>
			<td>续期保费</td>
			<td>代理人工号</td>
			<td>代理人姓名</td>
			<td>代理人状态</td>
			<td>网点代码</td>
			<td>网点名称</td>		
			<td>保单状态</td>		
			</tr> 
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<sql:query var="a1"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid_sq }"></sql:query>
			<sql:query var="parent" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${a1.rows[0].c_parent } "></sql:query>
			<td>${parent.rows[0].c_name }</td>	
			<td>${a1.rows[0].c_name }</td>
			<td>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			${q2.rows[0].c_name }
			</td> 
			<td>${row.c_bd }</td>
			<td>
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_tbrnum }"></sql:query>
			${q3.rows[0].c_name }
			</td> 
			<td>${q3.rows[0].c_phone }[${q3.rows[0].c_mobile }]</td>			
			<td>${q3.rows[0].c_hddr }</td>
			<td>
			<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_bbrnum }"></sql:query>
			${q4.rows[0].c_name }
			</td>
			<td>
			<sql:query var="bank"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=15 and c_code=${row.c_bank } "></sql:query> 
			${bank.rows[0].c_name }
			</td>
			<td>'${row.c_bankcode }</td>
			<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query>			
			<td>${q5.rows[0].c_code }</td>
			<td>${q5.rows[0].c_name }</td>
		 	<td>${row.c_jfqx }</td>
		 	<td>${row.c_bxf }</td>
		 	<sql:query var="q6" dataSource="${db_mssql }" sql="select * from t_sxtb_xq 
		 		where c_companyid=${row.c_companyid } and c_bd ='${row.c_bd }' and c_productid=${row.c_productid } and c_bdnd=${row.c_bdnd }"></sql:query>
		 	<td>${row.c_cbrq }</td>
		 	<td>
		 	<c:choose>
		 	<c:when test="${not empty q6.rows[0] }">
		 	${q6.rows[0].c_fprq }
		 	</c:when>
		 	<c:otherwise>
		 	未缴费
		 	</c:otherwise>
		 	</c:choose>		 		 	
		 	</td>
		 	<td>${row.c_bdnd }</td>
		 	<td>		 				
		 	<c:choose>
		 	<c:when test="${not empty q6.rows[0] }">
		 	${q6.rows[0].c_bxf }
		 	</c:when>
		 	<c:otherwise>
		 	0
		 	</c:otherwise>
		 	</c:choose>		 	
		 	</td>
		 	<td>${row.c_jobnumber }</td>
			<sql:query var="q8" dataSource="${db_mssql }" sql="select c_orgid,c_jobnumber,c_name from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>	
			<td>${q8.rows[0].c_name }</td>
			<sql:query var="q9" dataSource="${db_mssql }" sql="select * from t_agentset where c_jobnumber='${row.c_jobnumber }' and c_flag='0'"></sql:query>	
			<td>
			<c:choose>
			<c:when test="${not empty q9.rows }">在职</c:when>
			<c:otherwise>离职</c:otherwise>
			</c:choose>
			</td>
			<sql:query var="q10" dataSource="${db_mssql }" sql="select * from t_bankoutlets where c_no=${row.c_outletsid }"></sql:query>		
			<td>${q10.rows[0].c_code }</td>		
			<td>${q10.rows[0].c_name }</td>	 	
			<td> 
			<c:choose>
			<c:when test="${fn:trim(row.c_jobnm) eq '0' }">正常</c:when>
			<c:when test="${fn:trim(row.c_jobnm) eq '5' }">退保</c:when>
			</c:choose>
			</td>	 
			</tr>
			</c:forEach>			 
		</table> 
</body>
</html:html>
